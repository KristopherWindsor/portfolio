<?php

namespace Portfolio\Data;

Use Portfolio\Db;

class Investments {
  public function __construct($mysqli, $report, $data = null){
    header('Content-Type: application/json');
    if ($report == 'year')
      $this->year($mysqli, (int) $data[0]);
    else if ($report == 'multiyear')
      $this->multiYear($mysqli, (int) $data[0], (int) $data[1]);
  }

  private function getColors(){
    $colors = [];
    for ($r = 255 - 16 * 5; $r <= 255 - 16 * 2; $r += 16)
      for ($g = 255 - 16 * 5; $g <= 255 - 16 * 2; $g += 16)
        for ($b = 255 - 16 * 5; $b <= 255 - 16 * 2; $b += 16)
          if ($r != $g && $r != $b && $g != $b)
            $colors[ md5("$r.$g.$b") ] = [$r, $g, $b];
    unset($colors[md5('223.207.175')]);
    unset($colors[md5('223.207.191')]);
    ksort($colors);
    return array_values($colors);
  }

  private function getBaseData($categories, $colors){
    $cdata = [
      'labels' => ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec', ],
      'datasets' => [],
    ];
    foreach ($categories as $i => $category)
      $cdata['datasets'][$i] = array(
        'label' => $category->name,
        'fillColor' => sprintf('rgba(%s, %s, %s, %s)', $colors[$i][0], $colors[$i][1], $colors[$i][2], 1),
        'pointColor' => sprintf('rgba(%s, %s, %s, %s)', $colors[$i][0], $colors[$i][1], $colors[$i][2], 1),
        'strokeColor' => 'black',
        'data' => [],
      );
    return $cdata;
  }

  private function getOptions(){
    return [
      'legendTemplate' => "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].fillColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>",
      'multiTooltipTemplate' => "<%= ' \$' + value.toFixed(2).replace(/(\\d)(?=(\\d{3})+\\.)/g, '\$1,') %>",
      'responsive' => true,
      'pointDot' => false,
    ];
  }

  private function getExtra($categories, $colors){
    $category_map = array();
    foreach ($categories as $i => $category){
      $category_map[$category->name] = $i;
    }

    return [
      'categoryMap' => $category_map,
    ];
  }

  private function year($mysqli, $year){
    $data = Db\InvestmentsApi::getInvestments($mysqli, $year, $year);
    $categories = Db\InvestmentsApi::getCategories($mysqli);

    $colors = $this->getColors();
    $cdata = $this->getBaseData($categories, $colors);

    for ($i = count($categories) - 1; $i >= 0; $i--){
      $category = $categories[$i];
      for ($j = 0; $j < 12; $j++){
        if (isset($data[$year][$j + 1][$category->key]))
          $value = $data[$year][$j + 1][$category->key];
        else
          $value = null;
        if ($value !== null && isset( $cdata['datasets'][$i + 1]['data'][$j] ))
          $value += $cdata['datasets'][$i + 1]['data'][$j];
        $cdata['datasets'][$i]['data'][$j] = $value;
      }
    }

    echo json_encode(["Line", $cdata, $this->getOptions(), $this->getExtra($categories, $colors), ]);
  }

  private function multiYear($mysqli, $start_year, $end_year){
    $data = Db\InvestmentsApi::getInvestments($mysqli, $start_year, $end_year);
    if (!$data){
      // year() is better at showing empty data
      $this->year($mysqli, $start_year);
      return;
    }
    $categories = Db\InvestmentsApi::getCategories($mysqli);

    $colors = $this->getColors();
    $cdata = $this->getBaseData($categories, $colors);

    // compute date range
    $start_month = $end_month = null;
    for ($year = $start_year; $year <= $end_year; $year++)
      for ($i = 1; $i <= 12; $i++){
        if (isset($data[$year][$i])){
          if (!$start_month)
            $start_month = $year * 12 + $i - 1;
          $end_month = $year * 12 + $i - 1;
        }
      }

    // redo labels
    $labels = [];
    for ($i = $start_month; $i <= $end_month; $i++)
      $labels[] = $cdata['labels'][$i % 12] . ' ' . intval($i / 12);
    $cdata['labels'] = $labels;

    for ($i = count($categories) - 1; $i >= 0; $i--){
      $category = $categories[$i];
      for ($j = $start_month; $j <= $end_month; $j++){
        if (isset($data[intval($j / 12)][($j % 12) + 1][$category->key]))
          $value = $data[intval($j / 12)][($j % 12) + 1][$category->key];
        else
          $value = null;
        if ($value !== null && isset( $cdata['datasets'][$i + 1]['data'][$j - $start_month] ))
          $value += $cdata['datasets'][$i + 1]['data'][$j - $start_month];
        $cdata['datasets'][$i]['data'][$j - $start_month] = $value;
      }
    }

    echo json_encode(["Line", $cdata, $this->getOptions(), $this->getExtra($categories, $colors), ]);
  }

}
