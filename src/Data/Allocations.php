<?php

namespace Portfolio\Data;

Use Portfolio\Db;
Use Portfolio\Util;

class Allocations {
  public function __construct($mysqli, $report, $data = null){
    header('Content-Type: application/json');
    if ($report == 'target')
      $this->target($mysqli);
    else if ($report == 'actual')
      $this->actual($mysqli, (int) $data[0]);
  }

  private function noDataChart(){
    $colors = new Util\Colors( 1 );
    echo json_encode(array(
      'Pie',
      array(
        $cdata[] = array('label' => 'No data', 'color' => $colors->getNext(), 'value' => 100, ),
      ),
      array(
        'tooltipTemplate' => "<%=label%>",
        'responsive' => true,
      ),
      array(
        'headerText' => 'No data',
        'nodata' => true,
      ),
    ));
  }

  private function target($mysqli){
    $allocations = Db\TargetApi::getTargets($mysqli);
    if (!$allocations){
      $this->noDataChart();
      return;
    }

    $cdata = array();
    $colors = new Util\Colors( count($allocations) );
    foreach ($allocations as $i)
      $cdata[] = array('label' => $i->name, 'color' => $colors->getNext(), 'value' => $i->percent);

    $options = array(
      'tooltipTemplate' => "<%if (label){%><%=label%>: <%}%><%= value %>%",
      'responsive' => true,
    );

    $extra = array(
      'headerText' => 'Target allocations',
    );
    echo json_encode(array("Pie", $cdata, $options, $extra));
  }

  /**
   * @param int $year the year for which to get investment allocations.
   *                  Reports data from the latest month in [$year - 1, $year] that has data.
   */
  private function actual($mysqli, $year){
    $allocations = Db\TargetApi::getTargets($mysqli);
    $data = Db\InvestmentsApi::getInvestments($mysqli, $year - 1, $year);
    if (!$allocations || !$data){
      $this->noDataChart();
      return;
    }

    $year_index = isset($data[$year]) ? $year : $year - 1;
    $month_index = max(array_keys($data[$year_index]));

    $total = 0;
    foreach ($allocations as $i)
      if (isset($data[$year_index][$month_index][$i->key]))
        $total += $data[$year_index][$month_index][$i->key];
    $total = (int) $total;
    if (!$total){
      $this->noDataChart();
      return;
    }

    $colors = new Util\Colors( count($allocations) );
    $cdata = array();

    foreach ($allocations as $i)
      $cdata[] = array(
        'label' => $i->name,
        'color' => $colors->getNext(),
        'value' => round(100 * @$data[$year_index][$month_index][$i->key] / $total, 1),
      );
    $options = array(
      'tooltipTemplate' => "<%if (label){%><%=label%>: <%}%><%= value %>% ($<%= Math.round(value * $total / 100000) %>k)",
      'responsive' => true,
    );
    $extra = array(
      'headerText' => 'Actual allocations',
    );

    echo json_encode(array("Pie", $cdata, $options, $extra));
  }
}
