<?php

namespace Portfolio\Db;

class TargetApi {

  public static function getTargets($mysqli){
    $stmt = $mysqli->prepare("
      SELECT * FROM `investment_target` LEFT JOIN investment_category ON `category_key` = `key`
    ");
    $stmt->execute();
    $result = $stmt->get_result();
    $res = array();
    while ($row = $result->fetch_object())
      $res[ $row->name ] = $row->percent;
    return $res;
  }

}
