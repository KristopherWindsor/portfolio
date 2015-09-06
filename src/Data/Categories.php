<?php

namespace Portfolio\Data;

Use Portfolio\Db;

class Categories {
  public function __construct($mysqli, $report, $data = null){
    header('Content-Type: application/json');
    if ($report == 'show')
      $this->show($mysqli);
  }

  private function show($mysqli){
    $categories = Db\InvestmentsApi::getCategories($mysqli);

    $res = array();
    foreach ($categories as $i)
      $res[$i->name] = $i->description;

    echo json_encode(array("DefList", $res));
  }

}
