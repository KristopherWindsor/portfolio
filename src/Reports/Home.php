<?php

namespace Portfolio\Reports;

Use Portfolio\Db;

class Home {
  public function __construct($mysqli){
    $this->pageOpen();
    $this->completeReport($mysqli);
    $this->pageClose();
  }

  private function pageOpen(){
    ?><!DOCTYPE html>
<html>
  <head>
    <title>Portfolio</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">

    <?php /* <link rel="stylesheet" href="/style.css"> */ ?>
    <style><?php readfile( dirname(dirname(__DIR__)) . '/htdocs/style.css' ) ?></style>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.min.js"></script>
    <script src="/tablesort.min.js"></script>
    <script src="/tablesort.number.js"></script>
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

  public function completeReport($mysqli){
    $settings = Db\SettingsApi::getAll($mysqli);
    $rough_start_year = $settings[Db\SettingsApi::REPORT_START_YEAR_LOOSE];
    $start_year       = $settings[Db\SettingsApi::REPORT_START_YEAR_STRICT];
    $end_year         = $settings[Db\SettingsApi::REPORT_END_YEAR];

    printf('<h1>%s</h1>', $settings[Db\SettingsApi::REPORT_TITLE]);

    echo '<h2>Income and expenses per year vs. savings</h2>';
    $this->renderAnnualSummary($rough_start_year, $end_year);
    $this->renderIncomeVsSavings($rough_start_year, $end_year);

    echo '<h2>Allocation of income per year</h2>';
    echo '<div class="pie-grid three">';
    for ($i = $start_year; $i <= $end_year; $i++)
      $this->renderAnnualPie($i);
    echo '</div>';
    echo '<div class="pie-grid-legend"></div>';

    echo '<h2>Savings &amp; investments</h2>';
    $this->renderInvestmentDescriptions();

    echo '<h2>Savings &amp; investments growth</h2>';
    $this->renderGrowthSummary();
    $this->renderInvestmentsMultiyear($start_year, $end_year);

    echo '<h2>Investment allocations</h2>';
    echo '<div class="pie-grid two">';
    $this->renderAllocationRealVsTarget($end_year);
    echo '</div>';
    echo '<div class="pie-grid-legend"></div>';

    echo '<br>';
    $this->renderRebalanceTable($end_year);
  }

  private function renderAnnualPie($year){
    echo '<div class="datasection pie" data-src="/data/annual/pie/' . $year . '"></div>';
  }

  private function renderInvestmentsMultiyear($start_year, $end_year){
    echo '<div>';
    echo '<form>';
    echo '<label>Simplified view<input type="checkbox" onChange="datasectionToggleHandler(this)" autocomplete="off"></label>';
    echo '</form>';
    echo '<div class="datasection line" data-src="/data/investments/multiyear/categories/' . $start_year . '/' . $end_year . '"></div>';
    echo '<div class="datasection line noload" data-src="/data/investments/multiyear/tax_ret/' . $start_year . '/' . $end_year . '" style="display: none"></div>';
    echo '</div>';
  }

  private function renderGrowthSummary(){
    echo '<div class="datasection table" data-src="/data/growthsummary/threecell"></div>';
  }

  private function renderIncomeVsSavings($start_year, $end_year){
    echo '<div>';
    echo '<form>';
    echo '<label>Show expenses instead of income<input type="checkbox" onChange="datasectionToggleHandler(this)" autocomplete="off"></label>';
    echo '</form>';
    echo '<div class="datasection bar" data-src="/data/annual/income-vs-savings/' . $start_year . '/' . $end_year . '"></div>';
    echo '<div class="datasection bar noload" data-src="/data/annual/income-vs-savings/' . $start_year . '/' . $end_year . '/1" style="display: none"></div>';
    echo '</div>';
  }

  private function renderAnnualSummary($start_year, $end_year){
    echo '<div class="datasection table" data-src="/data/annual/summary/' . $start_year . '/' . $end_year . '"></div>';
  }

  private function renderInvestmentDescriptions(){
    echo '<div class="datasection deflist" data-src="/data/categories/show"></div>';
  }

  private function renderAllocationRealVsTarget($end_year){
    echo '<div class="datasection pie" data-src="/data/allocations/target"></div>';
    echo '<div class="datasection pie" data-src="/data/allocations/actual/' . $end_year . '"></div>';
  }

  private function renderRebalanceTable($year){
    echo '<div class="datasection table" data-src="/data/allocations/rebalancetable/' . $year . '"></div>';
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
