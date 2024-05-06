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
    $data = Db\InvestmentsApi::getInvestmentsSegmented($mysqli, 0, 3000);
    if (!$data){
      echo json_encode("Table", null);
      return;
    }

    $tmp = array_keys($data);
    $newest_year = $tmp[count($tmp) - 1];
    $tmp = array_keys($data[$newest_year]);
    $newest_month = $tmp[count($tmp) - 1];

    // TODO: handle if there's less than a year of data
    $newest_data = $data[$newest_year][$newest_month];
    if ($newest_month > 3)
      $back_three_data = $data[$newest_year][$newest_month - 3];
    else
      $back_three_data = $data[$newest_year - 1][$newest_month + 9];
    $last_year_data = $data[$newest_year - 1][$newest_month];

    $nw_cur = $nw_bt = $nw_ly = 0;
    $inv_cur = $inv_bt = $inv_ly = 0;
    $pt_cur = $pt_bt = $pt_ly = 0;
    foreach ($newest_data as $i) {
      $nw_cur += $i->value;
      if ($i->category_key == 'CASH') { // TODO: use right categories
        $inv_cur += $i->value;
        $pt_cur += $i->value_no_ret;
      }
    }
    foreach ($back_three_data as $i) {
      $nw_bt += $i->value;
      if ($i->category_key == 'CASH') { // TODO: use right categories
        $inv_bt += $i->value;
        $pt_bt += $i->value_no_ret;
      }
    }
    foreach ($back_three_data as $i) {
      $nw_ly += $i->value;
      if ($i->category_key == 'CASH') { // TODO: use right categories
        $inv_ly += $i->value;
        $pt_ly += $i->value_no_ret;
      }
    }

    $tdata = array(
      'headers' => array('', '3-month Growth', '1-year growth', 'Total'),
      'rows' => array(
        array(
          'Net worth',
          '$' . number_format($nw_cur - $nw_bt, 2),
          '$' . number_format($nw_cur - $nw_ly, 2),
          '$' . number_format($nw_cur, 2)),
        array(
          'Investments (per AA)',
          '$' . number_format($inv_cur - $inv_bt, 2),
          '$' . number_format($inv_cur - $inv_ly, 2),
          '$' . number_format($inv_cur, 2)),
        array(
          'Investments (per AA) excluding retirement accounts',
          '$' . number_format($pt_cur - $pt_bt, 2),
          '$' . number_format($pt_cur - $pt_ly, 2),
          '$' . number_format($pt_cur, 2)),
      ),
    );

    echo json_encode(array("Table", $tdata));
  }

}
