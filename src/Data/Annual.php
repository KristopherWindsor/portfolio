<?php

namespace Portfolio\Data;

Use Portfolio\Db;

class Annual {
  public function __construct($mysqli, $report, $data = null){
    header('Content-Type: application/javascript');
    if ($report == 'pie')
      $this->pie($mysqli, $data[1], (int) $data[0]);
  }

  private function pie($mysqli, $el, $year){
    $data = Db\AnnualApi::getYear($mysqli, $year);////var_dump($_SERVER);
    $sum = array_sum($data);
    $cdata = [
      'labels' => ['Federal Taxes', 'State Taxes', 'Donations', 'Investments', 'Remainder (expenses)'],
      'series' => [$data['FEDERAL_TAXES'], $data['STATE_TAXES'], $data['DONATIONS'], $data['INVESTMENTS'], $data['GROSS_INCOME'] * 2 - $sum],
    ];
    printf('new Chartist.Pie( %s, %s );', $el, json_encode($cdata));
  }

}
