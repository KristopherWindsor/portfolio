<?php

namespace Portfolio\Data;

Use Portfolio\Db;

class Investments {
  public function __construct($mysqli, $report, $data = null){
    header('Content-Type: application/javascript');
    if ($report == 'year')
      $this->year($mysqli, $data[1], (int) $data[0]);
  }

  private function year($mysqli, $el, $year){
    $categories = Db\InvestmentsApi::getCategories($mysqli);
    $data = Db\InvestmentsApi::getInvestments($mysqli, $year, $year);

    $cdata = [
      'labels' => ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec', ],
      'series' => [],
    ];
    for ($i = 0; $i < 12; $i++){
      foreach ($categories as $j => $category){
        if (isset($data[$year][$i + 1][$category->key]))
          $value = $data[$year][$i + 1][$category->key];
        else
          $value = null;
        $cdata['series'][$j][$i] = $value;
      }
      while ($j--)
        if ($cdata['series'][$j][$i] !== null)
          $cdata['series'][$j][$i] += $cdata['series'][$j + 1][$i];
    }
    $settings = [
      "showArea" => true,
      "fullWidth" => true,
      "axisX" => ["showLabel" => true, "showGrid" => true, ],
    ];
    printf('new Chartist.Pie( %s, %s );', $el, json_encode($cdata));
    printf('new Chartist.Line( %s, %s, %s );', $el, json_encode($cdata), json_encode($settings));
  }

}
