<?php

namespace Portfolio\Data;

Use Portfolio\Db;

class Annual {
  public function __construct($mysqli, $report, $data = null){
    header('Content-Type: application/json');
    if ($report == 'pie')
      $this->pie($mysqli, (int) $data[0]);
    else if ($report == 'income-vs-savings')
      $this->incomeVsSavings($mysqli, (int) $data[0], (int) $data[1]);
    else if ($report == 'summary')
      $this->summary($mysqli, (int) $data[0], (int) $data[1]);
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

  private function incomeVsSavings($mysqli, $start_year, $end_year){
    $data = Db\AnnualApi::getMultiYear($mysqli, $start_year, $end_year);

    $cdata = array(
      'labels' => array(),
      'datasets' => array(
        array(
          'label' => 'Gross Income',
          'fillColor' => '#BCA',
          'data' => array(),
        ),
        array(
          'label' => 'Savings',
          'fillColor' => '#ABC',
          'data' => array(),
        ),
      ),
    );
    $current_year = date("Y");
    for ($i = $start_year; $i <= $end_year; $i++){
      $cdata['labels'][] = $i . ($i >= $current_year ? ' (est)' : '');
      $cdata['datasets'][0]['data'][] = isset($data[$i]['GROSS_INCOME']) ? $data[$i]['GROSS_INCOME'] : 0;
      $cdata['datasets'][1]['data'][] = isset($data[$i]['INVESTMENTS']) || isset($data[$i]['CASH_GROWTH']) ?
        @$data[$i]['INVESTMENTS'] + @$data[$i]['CASH_GROWTH']: 0;
    }

    $options = array(
      'multiTooltipTemplate' => "<%= ' \$' + value.toFixed(2).replace(/(\\d)(?=(\\d{3})+\\.)/g, '\$1,') %>",
      'responsive' => true,
    );

    echo json_encode(["Bar", $cdata, $options, null]);
  }

  private function summary($mysqli, $start_year, $end_year){
    $data = Db\AnnualApi::getMultiYear($mysqli, $start_year, $end_year);

    $year_income = @$data[$end_year]['GROSS_INCOME'];
    $last_year_income = @$data[$end_year - 1]['GROSS_INCOME'];

    if ($end_year - $start_year >= 2){
      @$three_year_income = $data[$end_year - 2]['GROSS_INCOME'] + $last_year_income + $year_income;
      $col1 = '$' . number_format($three_year_income / 3, 2);
    } else {
      $col1 = '--';
    }

    $col2 = '$' . number_format($year_income, 2);
    if ($year_income && $last_year_income)
      $col2 .= sprintf(' (+%s%% yoy)', number_format(100 * ($year_income - $last_year_income) / $last_year_income, 0));

    $investments = @$data[$end_year]['INVESTMENTS'];
    $col3 = '$' . number_format($investments, 2);
    if ($investments && $year_income)
      $col3 .= sprintf(' (%s%% of income)', number_format(100 * $investments / $year_income, 0));

    $tdata = array(
      'headers' => array('Average income (3-year trend)', 'Income for ' . $end_year, 'Total investments for ' . $end_year),
      'rows' => array(
        array(
          $col1,
          $col2,
          $col3,
        ),
      ),
    );

    echo json_encode(array("Table", $tdata));
  }
}
