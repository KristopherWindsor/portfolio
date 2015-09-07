<?php

namespace Portfolio\Data;

Use Portfolio\Db;

class Allocations {
  public function __construct($mysqli, $report, $data = null){
    header('Content-Type: application/json');
    if ($report == 'target')
      $this->target($mysqli);
    else if ($report == 'actual')
      $this->actual($mysqli);
  }

  private function getColors(){
    return array('#ABC', '#BCA', '#CAB', '#ACB', '#BAC', '#CBA');
  }

  private function target($mysqli){
    $allocations = Db\TargetApi::getTargets($mysqli);

    $cdata = array();
    $colors = $this->getColors();
    foreach ($allocations as $name => $percent)
      $cdata[] = array('label' => $name, 'color' => array_shift($colors), 'value' => $percent);

    $options = array(
      'tooltipTemplate' => "<%if (label){%><%=label%>: <%}%><%= value %>%",
      'responsive' => true,
    );

    $extra = array(
      'headerText' => 'Target allocations',
    );
    echo json_encode(array("Pie", $cdata, $options, $extra));
  }

  private function actual($mysqli){
    $this->target($mysqli);
  }
}
