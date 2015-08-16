<?php

namespace Portfolio\Reports;

Use Portfolio\Db;

class Home {
  public function __construct($mysqli){
    echo '<html><body>';

    $this->yearReport($mysqli, 2014);
    $this->yearReport($mysqli, 2015);
    //var_dump($x);



  }

  public function yearReport($mysqli, $year){
    echo '<h1>' . $year . ' Annual Report</h1>';

    $data = Db\AnnualApi::getYear($mysqli, $year);

    echo '<h2>Income</h2>';
    echo '<table border=1 style="border-collapse: collapse;"><tr><th>Key</th><th>Value</th></tr>';
    foreach ($data as $key => $value)
      printf('<tr><td>%s</td><td>%s</td>', $key, $value);
    echo '</table>';

    // echo '<canvas data-src="/reports/annual/' . $year . '"></canvas>';

    $categories = Db\InvestmentsApi::getCategories($mysqli);
    $data = Db\InvestmentsApi::getInvestments($mysqli, $year, $year);

    echo '<h2>Investments</h2>';
    echo '<table border=1 style="border-collapse: collapse;"><tr><th>Month</th>';
    foreach ($categories as $i)
      printf('<th>%s</th>', $i->name);
    echo '<th>Total</th></tr>';
    for ($i = 1; $i <= 12; $i++){
      if (empty($data[$year][$i]))
        continue;
      echo '<tr><td>' . date("F", mktime(0, 0, 0, $i, 1, $year)) . '</td>';
      foreach ($categories as $category){
        if (isset($data[$year][$i][$category->key]))
          $value = $data[$year][$i][$category->key];
        else
          $value = '';
        printf('<td>%s</td>', $value);
      }
      printf('<td>%s</td>', array_sum($data[$year][$i]));
      echo '</tr>';
    }
    echo '</table>';

    // echo '<canvas data-src="/reports/investments/' . $year . '"></canvas>';
  }
}
