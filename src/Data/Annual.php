<?php

namespace Portfolio\Data;

Use Portfolio\Db;

class Annual {
  public function __construct($mysqli, $report, $data = null){
    header('Content-Type: application/json');
    if ($report == 'pie')
      $this->pie($mysqli, (int) $data[0]);
  }

  private function pie($mysqli, $year){
    $data = Db\AnnualApi::getYear($mysqli, $year);
    $sum = array_sum($data);
    $cdata = [
      ["label" => 'Federal Taxes',        "color" => "#ABC", "value" => $data['FEDERAL_TAXES'], ],
      ["label" => 'State Taxes',          "color" => "#BCA", "value" => $data['STATE_TAXES'], ],
      ["label" => 'Donations',            "color" => "#CAB", "value" => $data['DONATIONS'], ],
      ["label" => 'Investments',          "color" => "#ACB", "value" => $data['INVESTMENTS'], ],
      ["label" => 'Remainder (expenses)', "color" => "#BAC", "value" => $data['GROSS_INCOME'] * 2 - $sum , ],
    ];
    echo json_encode(["Pie", $cdata, null]);
  }

}
