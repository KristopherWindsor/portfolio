<?php

namespace Portfolio\Reports;

Use Portfolio\Db;

class Home {
  public function __construct($mysqli){
    $this->pageOpen();
    $this->completeReport(2014, 2016);
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

  public function completeReport($start_year, $end_year){
    echo '<h1>Complete Report</h1>';

    // echo '<h2>Income and savings per year</h2>';
    //

    echo '<h2>Allocation of income per year</h2>';
    echo '<div class="pie-grid">';
    for ($i = $start_year; $i <= $end_year; $i++)
      $this->renderAnnualPie($i);
    echo '</div><br style="clear:both">';

    echo '<h2>Investment growth</h2>';
    $this->renderGrowthSummary();
    $this->renderInvestmentsMultiyear($start_year, $end_year);
    echo '<p>Note: displayed values are cumulative.</p>';

    // echo '<h2>Investment descriptions</h2>';
    //

    // echo '<h2>Investment allocations</h2>';
    //
  }

  private function renderAnnualPie($year){
    echo '<div class="datasection pie" data-src="/data/annual/pie/' . $year . '"></div>';
  }

  private function renderInvestmentsMultiyear($start_year, $end_year){
    echo '<div class="datasection line" data-src="/data/investments/multiyear/' . $start_year . '/' . $end_year . '"></div>';
  }

  private function renderGrowthSummary(){
    echo '<div class="datasection table" data-src="/data/growthsummary/threecell"></div>';
  }

  public function yearReport($mysqli, $year){
    echo '<h1>' . $year . ' Annual Report</h1>';

    $data = Db\AnnualApi::getYear($mysqli, $year);

    echo '<h2>Income</h2>';
    echo '<table border=1 style="border-collapse: collapse;"><tr><th>Key</th><th>Value</th></tr>';
    foreach ($data as $key => $value)
      printf('<tr><td>%s</td><td>%s</td>', $key, $value);
    echo '</table>';

    $this->renderAnnualPie($year);

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

    $id = 'canvaschart' . uniqid();
    echo '<div class="canvascontainer line"><canvas data-src="/data/investments/year/' . $year . '" id="' . $id . '"></div>';
  }
}
