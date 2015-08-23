<?php

namespace Portfolio\Data;

Use Portfolio\Db;

class GrowthSummary {
  public function __construct($mysqli, $report, $data = null){
    header('Content-Type: application/json');
    if ($report == 'threecell')
      $this->threecell($mysqli);
  }

  private function threecell($mysqli){
    $data = Db\InvestmentsApi::getInvestments($mysqli, 0, 3000);
    if (!$data){
      echo json_encode("Table", null);
      return;
    }

    $tmp = array_keys($data);
    $newest_year = $tmp[count($tmp) - 1];
    $tmp = array_keys($data[$newest_year]);
    $newest_month = $tmp[count($tmp) - 1];

    $newest = $newest_year * 12 + $newest_month - 1;
    $back_three = $newest - 3;

    $newest_net = array_sum($data[$newest_year][$newest_month]);
    if ($newest_month > 3)
      $back_three = @array_sum($data[$newest_year][$newest_month - 3]);
    else
      $back_three = @array_sum($data[$newest_year - 1][$newest_month + 9]);
    $last_year = @array_sum($data[$newest_year - 1][$newest_month]);

    $tdata = array(
      'headers' => array('3-month Growth', '1-year growth', 'Total Investments'),
      'rows' => array(
        array(
          $back_three ? '$' . number_format($newest_net - $back_three, 2) : '--',
          $last_year  ? '$' . number_format($newest_net - $last_year, 2) : '--',
          '$' . number_format($newest_net, 2)),
      ),
    );

    echo json_encode(array("Table", $tdata));
  }

}
