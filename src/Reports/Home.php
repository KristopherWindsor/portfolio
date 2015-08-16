<?php

namespace Portfolio\Reports;

Use Portfolio\Db;

class Home {
  public function __construct($mysqli){
    $this->pageOpen();
  //  echo '<html><body>';

    $this->yearReport($mysqli, 2014);
    $this->yearReport($mysqli, 2015);
    //var_dump($x);


    $this->pageClose();
  }

  private function pageOpen(){
    ?><!DOCTYPE html>
<html>
  <head>
    <title>Portfolio</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">

    <link rel="stylesheet" href="/style.css">
    <link rel="stylesheet" href="//cdn.jsdelivr.net/chartist.js/latest/chartist.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="//cdn.jsdelivr.net/chartist.js/latest/chartist.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.min.js"></script>
    <script src="/script.js"></script>
  </head>
  <body>
<?php
  }

  private function pageClose(){
    ?>
  </body>
</html><?php
  }

  public function yearReport($mysqli, $year){
    echo '<h1>' . $year . ' Annual Report</h1>';

    $data = Db\AnnualApi::getYear($mysqli, $year);

    echo '<h2>Income</h2>';
    echo '<table border=1 style="border-collapse: collapse;"><tr><th>Key</th><th>Value</th></tr>';
    foreach ($data as $key => $value)
      printf('<tr><td>%s</td><td>%s</td>', $key, $value);
    echo '</table>';

    $id = 'canvaschart' . uniqid();
    echo '<div class="canvascontainer"><canvas width="400px" height="400px" data-src="/data/annual/pie/' . $year . '" id="' . $id . '"></div>';

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

   // $id = 'canvaschart' . uniqid();
   // echo '<div class="ct-chart ct-double-octave" data-src="/data/investments/year/' . $year . '/' . $id . '" id="' . $id . '"></div>';
    //echo '<canvas data-src="/reports/investments/' . $year . '"></canvas>';
  }
}
