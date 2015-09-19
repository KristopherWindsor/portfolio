<?php

namespace Portfolio\Db;

class InvestmentsApi {
  const SCALE_DOWN_FACTOR = .12345;

  public static function getCategories($mysqli){
    $stmt = $mysqli->prepare("
      SELECT * FROM `investment_category`
      ORDER BY `rank` desc
    ");
    return Connection::fetchAll($stmt);
  }

  private static function getInvestmentsHelper($mysqli, $start_year, $end_year, $start_month = 1, $end_month = 12){
    $stmt = $mysqli->prepare("
      SELECT
        *,
        `value_ret_pretax` + `value_ret_posttax` AS `value_ret`,
        `value_no_ret`     + `value_ret_posttax` AS `value_posttax`,
        `value_ret_pretax` + `value_ret_posttax` + `value_no_ret` AS `value`
      FROM `investments`
      LEFT JOIN `investment_category` ON `category_key` = `key`
      WHERE
        (`year` > ? OR (`year` = ? AND `month` >= ?)) AND
        (`year` < ? OR (`year` = ? AND `month` <= ?))
      ORDER BY `year`, `month`, `rank` desc
    ");
    $stmt->bind_param('iiiiii', $start_year, $start_year, $start_month, $end_year, $end_year, $end_month);
    $res = Connection::fetchAll($stmt);
    foreach ($res as $key => $i)
      $res[$key] = self::scaleDown($i);
    return $res;
  }

  public static function getInvestments($mysqli, $start_year, $end_year, $start_month = 1, $end_month = 12){
    $res = array();
    foreach (self::getInvestmentsHelper($mysqli, $start_year, $end_year, $start_month, $end_month) as $i){
      $res[ $i->year ][ $i->month ][ $i->key ] = $i->value;
    }
    return $res;
  }

  public static function getInvestmentsSegmented($mysqli, $start_year, $end_year, $start_month = 1, $end_month = 12){
    $res = array();
    foreach (self::getInvestmentsHelper($mysqli, $start_year, $end_year, $start_month, $end_month) as $i){
      $res[ $i->year ][ $i->month ][ $i->key ] = $i;
    }
    return $res;
  }

  private static function scaleDown($row){
    if (is_object($row))
      foreach ($row as $key => $value)
        if (strpos($key, 'value') !== false)
          $row->{$key} *= self::SCALE_DOWN_FACTOR;
    return $row;
  }
}
