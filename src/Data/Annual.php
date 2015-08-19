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
      ["label" => 'Cash surplus',         "color" => "#CBA", "value" => $data['CASH_GROWTH'], ],
      ["label" => 'Remainder (expenses)', "color" => "#BAC", "value" => $data['GROSS_INCOME'] * 2 - $sum , ],
    ];
    $options = [
      'tooltipTemplate' => "<%if (label){%><%=label%>: <%}%>$<%= value.toFixed(2).replace(/(\\d)(?=(\\d{3})+\\.)/g, '\$1,') %>",
      'responsive' => true,
    ];

    $current_year = date("Y");
    $extra = [
      'headerText' => $year . ' &mdash; $' . number_format($data['GROSS_INCOME'], 2) . ($year >= $current_year ? ' (est)' : ''),
    ];

    echo json_encode(["Pie", $cdata, $options, $extra]);
  }

}
