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
      $res[] = array(
        'term'       => $i->name,
        'definition' => $i->description,
        'icon'       => $i->icon,
      );

    echo json_encode(array("DefList", $res));
  }

}
