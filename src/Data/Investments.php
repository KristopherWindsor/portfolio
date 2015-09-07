<?php

namespace Portfolio\Data;

Use Portfolio\Db;
Use Portfolio\Util;

class Investments {
  const MODE_CATEGORIES = 'categories';
  const MODE_TAX        = 'tax';
  const MODE_RETIREMENT = 'retirement';
  const MODE_TAX_RET    = 'tax_ret';

  public function __construct($mysqli, $report, $data = null){
    header('Content-Type: application/json');
    if ($report == 'year')
      $this->year($mysqli, (int) $data[0]);
    else if ($report == 'multiyear' && in_array($data[0], array(self::MODE_TAX, self::MODE_RETIREMENT, self::MODE_TAX_RET, self::MODE_CATEGORIES)))
      $this->multiYear($mysqli, $data[0], (int) $data[1], (int) $data[2]);
  }

  private function getBaseData($categories){
    $colors = new Util\Colors( count($categories) );
    $cdata = array(
      'labels' => array('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec', ),
      'datasets' => array(),
    );
    foreach ($categories as $i => $category)
      $cdata['datasets'][$i] = array(
        'label' => $category->name,
        'fillColor' => $colors->getNext(),
        'pointColor' => $colors->getCurrent(),
        'strokeColor' => 'black',
        'data' => array(),
        'itemData' => array(),
      );
    return $cdata;
  }

  private function getOptions($max_value){
    if ($max_value <= 40000)
      $width = 1000;
    else if ($max_value <= 200000)
      $width = 5000;
    else if ($max_value <= 400000)
      $width = 10000;
    else if ($max_value <= 1000000)
      $width = 50000;
    else
      $width = 100000;
    $steps = ceil(1.02 * $max_value / $width);

    return array(
      'legendTemplate' => "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].fillColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>",
      'responsive' => true,
      'pointDot' => false,
      'scaleOverride'=> true,
      'scaleSteps'=> $steps,
      'scaleStepWidth'=> $width,
      'scaleStartValue'=> 0,
    );
  }

  private function getExtra($categories){
    $category_map = array();
    foreach ($categories as $i => $category){
      $category_map[$category->name] = $i;
    }

    return array(
      'categoryMap' => $category_map,
    );
  }

  private function year($mysqli, $year){
    $data = Db\InvestmentsApi::getInvestments($mysqli, $year, $year);
    $categories = Db\InvestmentsApi::getCategories($mysqli);

    $cdata = $this->getBaseData($categories);
    $max_value = 0;

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
        $max_value = max($max_value, $value);
      }
    }

    echo json_encode(array("Line", $cdata, $this->getOptions($max_value), $this->getExtra($categories), ));
  }

  private function multiYear($mysqli, $mode, $start_year, $end_year){
    $segmented = Db\InvestmentsApi::getInvestmentsSegmented($mysqli, $start_year, $end_year);
    if (!$segmented){
      // year() is better at showing empty data
      $this->year($mysqli, $start_year);
      return;
    }

    if ($mode == self::MODE_RETIREMENT)
      $categories = array(
        (object) array('name' => 'Non-retirement', 'key' => 'NO_RET'),
        (object) array('name' => 'Retirement',     'key' => 'RET'),
      );
    else if ($mode == self::MODE_TAX)
      $categories = array(
        (object) array('name' => 'Post-tax', 'key' => 'POST_TAX'),
        (object) array('name' => 'Pre-tax',  'key' => 'PRE_TAX'),
      );
    else if ($mode == self::MODE_TAX_RET)
      $categories = array(
        (object) array('name' => 'Non-retirement funds',      'key' => 'NO_RET'),
        (object) array('name' => 'Pre-tax retirement funds',  'key' => 'PRE_TAX'),
        (object) array('name' => 'Post-tax retirement funds', 'key' => 'POST_TAX'),
      );
    else
      $categories = Db\InvestmentsApi::getCategories($mysqli);
    $cdata = $this->getBaseData($categories);

    // compute date range
    $start_month = $end_month = null;
    for ($year = $start_year; $year <= $end_year; $year++)
      for ($i = 1; $i <= 12; $i++){
        if (isset($segmented[$year][$i])){
          if (!$start_month)
            $start_month = $year * 12 + $i - 1;
          $end_month = $year * 12 + $i - 1;
        }
      }

    // transform $segmented to $data depending on $mode
    $data = array();
    foreach ($segmented as $year => $i)
      foreach ($i as $month => $j)
        foreach ($j as $key => $k)
          if ($mode == self::MODE_RETIREMENT){
            if (empty($data[$year][$month]))
              $data[$year][$month] = array('RET' => 0, 'NO_RET' => 0);
            $data[$year][$month]['RET']      += $k->value_ret;
            $data[$year][$month]['NO_RET']   += $k->value_no_ret;
          } else if ($mode == self::MODE_TAX){
            if (empty($data[$year][$month]))
              $data[$year][$month] = array('PRE_TAX' => 0, 'POST_TAX' => 0);
            $data[$year][$month]['PRE_TAX']  += $k->value_ret_pretax;
            $data[$year][$month]['POST_TAX'] += $k->value_posttax;
          } else if ($mode == self::MODE_TAX_RET){
            if (empty($data[$year][$month]))
              $data[$year][$month] = array('NO_RET' => 0, 'PRE_TAX' => 0, 'POST_TAX' => 0);
            $data[$year][$month]['NO_RET']   += $k->value_no_ret;
            $data[$year][$month]['PRE_TAX']  += $k->value_ret_pretax;
            $data[$year][$month]['POST_TAX'] += $k->value_ret_posttax;
          } else {
            $data[$year][$month][$key] = $k->value;
          }

    // redo labels
    $labels = array();
    for ($i = $start_month; $i <= $end_month; $i++)
      $labels[] = $cdata['labels'][$i % 12] . ' ' . intval($i / 12);
    $cdata['labels'] = $labels;

    // format data for chart
    $max_value = 0;
    for ($i = count($categories) - 1; $i >= 0; $i--){
      $category = $categories[$i];
      for ($j = $start_month; $j <= $end_month; $j++){
        if (isset($data[intval($j / 12)][($j % 12) + 1][$category->key]))
          $value = $data[intval($j / 12)][($j % 12) + 1][$category->key];
        else
          $value = null;
        $cdata['datasets'][$i]['itemData'][$j - $start_month] = $value;
        if ($value !== null && isset( $cdata['datasets'][$i + 1]['data'][$j - $start_month] ))
          $value += $cdata['datasets'][$i + 1]['data'][$j - $start_month];
        $cdata['datasets'][$i]['data'][$j - $start_month] = $value;
        $max_value = max($max_value, $value);
      }
    }

    echo json_encode(array("Line", $cdata, $this->getOptions($max_value), $this->getExtra($categories), ));
  }

}
