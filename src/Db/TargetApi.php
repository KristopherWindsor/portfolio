<?php

namespace Portfolio\Db;

class TargetApi {

  public static function getTargets($mysqli){
    $stmt = $mysqli->prepare("
      SELECT * FROM `investment_target` LEFT JOIN investment_category ON `category_key` = `key` ORDER BY `percent` desc
    ");
    return Connection::fetchAll($stmt);
  }

}
