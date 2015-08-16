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
      SELECT * FROM `investments`
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

  /*
  public static function addProduct($mysqli, $name, $dimensions, $weight){
    $stmt = $mysqli->prepare("INSERT INTO `product` (`name`, `dimensions`, `weight`) VALUES (?, ?, ?)");
    $stmt->bind_param('sss', $name, $dimensions, $weight);
    $stmt->execute();
    if ($stmt->affected_rows <= 0)
      throw new \Exception('Cannot add product, it probably already exists');
    $stmt->close();
  }

  public static function getProduct($mysqli, $name){
    $stmt = $mysqli->prepare("SELECT * FROM `product` WHERE `name` = ?");
    $stmt->bind_param('s', $name);
    $stmt->execute();
    $result = $stmt->get_result();
    while ($row = $result->fetch_object())
      return $row;
    throw new \Exception('Product not found');
  }*/
}
