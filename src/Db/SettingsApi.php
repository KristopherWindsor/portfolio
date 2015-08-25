<?php

namespace Portfolio\Db;

class SettingsApi {
  const REPORT_START_YEAR_LOOSE  = 'REPORT_START_YEAR_LOOSE';
  const REPORT_START_YEAR_STRICT = 'REPORT_START_YEAR_STRICT';
  const REPORT_END_YEAR          = 'REPORT_END_YEAR';
  const REPORT_TITLE             = 'REPORT_TITLE';

  public static function getAll($mysqli){
    $stmt = $mysqli->prepare("
      SELECT * FROM `settings`
    ");
    $stmt->execute();
    $result = $stmt->get_result();
    $res = array();
    while ($row = $result->fetch_object())
      $res[ $row->key ] = $row->value;
    return $res;
  }

}
