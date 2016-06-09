<?php

namespace Portfolio\Data;

Use Portfolio\Db;
Use Portfolio\Util;

class Annual {
  public function __construct($mysqli, $report, $data = null){
    header('Content-Type: application/json');
    if ($report == 'pie')
      $this->pie($mysqli, (int) $data[0]);
    else if ($report == 'income-vs-savings')
      $this->incomeVsSavings($mysqli, (int) $data[0], (int) $data[1], (bool) @$data[2]);
    else if ($report == 'summary')
      $this->summary($mysqli, (int) $data[0], (int) $data[1]);
  }

  private function pie($mysqli, $year){
    $data = Db\AnnualApi::getYear($mysqli, $year);
    $sum = array_sum($data);

    $colors = new Util\Colors(6);
    $cdata = array(
      array("label" => 'Federal taxes',        "color" => $colors->getNext(), "value" => $data['FEDERAL_TAXES'], ),
      array("label" => 'State taxes',          "color" => $colors->getNext(), "value" => $data['STATE_TAXES'], ),
      array("label" => 'Other government fees (est)', "color" => $colors->getNext(), "value" => $data['SOCIAL_SEC'], ),
      array("label" => 'Donations',            "color" => $colors->getNext(), "value" => $data['DONATIONS'], ),
      array("label" => 'Savings',              "color" => $colors->getNext(), "value" => $data['SAVINGS'], ),
      array("label" => 'Remainder (expenses)', "color" => $colors->getNext(), "value" => $data['GROSS_INCOME'] * 2 - $sum , ),
    );
    $options = array(
      'tooltipTemplate' => "<%if (label){%><%=label%>: <%}%>$<%= value.toFixed(2).replace(/(\\d)(?=(\\d{3})+\\.)/g, '\$1,') %>",
      'legendTemplate' => "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<segments.length; i++){%><li><span style=\"border-color:<%=segments[i].fillColor%>\"></span><%if(segments[i].label){%><%=segments[i].label%><%}%></li><%}%></ul>",
      'responsive' => true,
    );

    $current_year = date("Y");
    $extra = array(
      'headerText' => $year . ' &mdash; $' . number_format($data['GROSS_INCOME'], 2) . ($year >= $current_year ? ' (est)' : ''),
    );

    echo json_encode(array("Pie", $cdata, $options, $extra));
  }

  private function incomeVsSavings($mysqli, $start_year, $end_year, $show_expenses = false){
    $data = Db\AnnualApi::getMultiYear($mysqli, $start_year, $end_year);

    $colors = new Util\Colors(3);
    $color1 = $colors->getNext();
    $color2 = $colors->getNext();
    $color3 = $colors->getNext();

    $cdata = array(
      'labels' => array(),
      'datasets' => array(
        array(
          'label' => ($show_expenses ? 'Expenses' : 'Gross Income'),
          'fillColor' => ($show_expenses ? $color3 : $color1),
          'data' => array(),
        ),
        array(
          'label' => 'Savings',
          'fillColor' => $color2,
          'data' => array(),
        ),
      ),
    );
    $current_year = date("Y");
    for ($i = $start_year; $i <= $end_year; $i++){
      $gross_income = isset($data[$i]['GROSS_INCOME']) ? $data[$i]['GROSS_INCOME'] : 0;
      $investments  = isset($data[$i]['SAVINGS']) ? $data[$i]['SAVINGS'] : 0;
      $expenses = $gross_income * 2 - array_sum($data[$i]);

      $cdata['labels'][] = $i . ($i >= $current_year ? ' (est)' : '');
      $cdata['datasets'][0]['data'][] = $show_expenses ? $expenses : $gross_income;
      $cdata['datasets'][1]['data'][] = $investments;
    }

    $options = array(
      'multiTooltipTemplate' => "<%= ' \$' + value.toFixed(2).replace(/(\\d)(?=(\\d{3})+\\.)/g, '\$1,') %>",
      'legendTemplate' => "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"border-color:<%=datasets[i].fillColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>",
      'responsive' => true,
    );

    echo json_encode(array("Bar", $cdata, $options, null));
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

    $investments = @$data[$end_year]['SAVINGS'];
    $col3 = '$' . number_format($investments, 2);
    if ($investments && $year_income)
      $col3 .= sprintf(' (%s%% of income)', number_format(100 * $investments / $year_income, 0));

    $current_year = date("Y");
    $est = ($end_year >= $current_year ? ' (est)' : '');
    $tdata = array(
      'headers' => array('Average annual income (3-year trend)', 'Income for ' . $end_year . $est, 'Total savings for ' . $end_year . $est),
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
