<?php

namespace Portfolio\Db;

class AnnualApi {

  public static function getYear($mysqli, $year){
    $stmt = $mysqli->prepare("
      SELECT * FROM `annual_breakdown`
      WHERE `year` = ?
    ");
    $stmt->bind_param('i', $year);
    $stmt->execute();
    $result = $stmt->get_result();
    $res = array();
    while ($row = $result->fetch_object())
      $res[ $row->category ] = $row->value;
    return $res;
  }

}
