<?php

namespace Portfolio\Db;

class InvestmentsApi {

  public static function getCategories($mysqli){
    $stmt = $mysqli->prepare("
      SELECT * FROM `investment_category`
      ORDER BY `rank` desc
    ");
    $stmt->execute();
    $result = $stmt->get_result();
    $res = array();
    while ($row = $result->fetch_object())
      $res[] = $row;
    return $res;
  }

  public static function getInvestments($mysqli, $start_year, $end_year, $start_month = 1, $end_month = 12){
    $stmt = $mysqli->prepare("
      SELECT
        *,
        `value_ret_pretax` + `value_ret_posttax` AS `value_ret`,
        `value_ret_pretax` + `value_ret_posttax` + `value_no_ret` AS `value`
      FROM `investments`
      LEFT JOIN `investment_category` ON `category_key` = `key`
      WHERE
        (`year` > ? OR (`year` = ? AND `month` >= ?)) AND
        (`year` < ? OR (`year` = ? AND `month` <= ?))
      ORDER BY `year`, `month`, `rank` desc
    ");
    $stmt->bind_param('iiiiii', $start_year, $start_year, $start_month, $end_year, $end_year, $end_month);
    $stmt->execute();
    $result = $stmt->get_result();
    $res = array();
    while ($row = $result->fetch_object())
      $res[ $row->year ][ $row->month ][ $row->key ] = $row->value;
    return $res;
  }

}
