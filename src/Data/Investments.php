<?php

namespace Portfolio\Data;

Use Portfolio\Db;

class Investments {
  public function __construct($mysqli, $report, $data = null){
    header('Content-Type: application/json');
    if ($report == 'year')
      $this->year($mysqli, $data[0]);
  }

  private function year($mysqli, $year){
    $categories = Db\InvestmentsApi::getCategories($mysqli);
    $data = Db\InvestmentsApi::getInvestments($mysqli, $year, $year);

    $colors = [];
    for ($r = 255 - 16 * 5; $r <= 255 - 16 * 2; $r += 16)
      for ($g = 255 - 16 * 5; $g <= 255 - 16 * 2; $g += 16)
        for ($b = 255 - 16 * 5; $b <= 255 - 16 * 2; $b += 16)
          if ($r != $g && $r != $b && $g != $b)
            $colors[] = sprintf('rgba(%s, %s, %s, %s', $r, $g, $b, '%s');

    $cdata = [
      'labels' => ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec', ],
      'datasets' => [],
    ];
    foreach ($categories as $i => $category)
      $cdata['datasets'][$i] = array(
        'label' => $category->name,
        'fillColor' => sprintf($colors[$i], 1),
        'strokeColor' => 'black',
        'pointColor' => sprintf($colors[$i], 1),
        'pointStrokeColor' => 'black',
        'data' => [],
      );
    for (; $i >= 0; $i--){
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

    $options = [
      'legendTemplate' => "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].fillColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>",
      'multiTooltipTemplate' => "<%= ' \$' + value.toFixed(2).replace(/(\\d)(?=(\\d{3})+\\.)/g, '\$1,') %>",
      'responsive' => true,
    ];

    echo json_encode(["Line", $cdata, $options]);
  }

}
