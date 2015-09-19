<?php

namespace Portfolio\Db;

class AnnualApi {
  const SCALE_DOWN_FACTOR = .32;

  public static function getYear($mysqli, $year){
    $stmt = $mysqli->prepare("
      SELECT * FROM `annual_breakdown`
      WHERE `year` = ?
    ");
    $stmt->bind_param('i', $year);
    $stmt->execute();
    $result = $stmt->get_result();
    $res = array();
    while ($row = self::scaleDown($result->fetch_object()))
      $res[ $row->category ] = $row->value;
    return $res;
  }

  public static function getMultiYear($mysqli, $start_year, $end_year){
    $stmt = $mysqli->prepare("
      SELECT * FROM `annual_breakdown`
      WHERE `year` >= ? AND `year` <= ?
    ");
    $stmt->bind_param('ii', $start_year, $end_year);
    $stmt->execute();
    $result = $stmt->get_result();
    $res = array();
    while ($row = self::scaleDown($result->fetch_object()))
      $res[ $row->year ][ $row->category ] = $row->value;
    return $res;
  }

  private static function scaleDown($row){
    if (is_object($row))
      $row->value *= self::SCALE_DOWN_FACTOR;
    return $row;
  }
}
