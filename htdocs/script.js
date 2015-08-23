$(function (){
  $('.datasection').each(function () {
    var datasection = this;
    var url = $(datasection).data('src');

    $.get(url, null, function (response){
      var type = response[0], data = response[1], options = response[2], extra = response[3];

      if (type == "Pie"){
        renderDatasectionPie(datasection, data, options, extra);
      } else if (type == "Line"){
        renderDatasectionLine(datasection, data, options, extra);
      } else if (type == "Table"){
        renderDatasectionTable(datasection, data);
      }
    });
  });
});

function renderDatasectionPie(datasection, data, options, extra){
  var header = $("<h3/>", {html : extra.headerText});
  var canvas = $("<canvas/>", {width : "10px", height : "10px"});

  $(datasection).append(header);
  $(datasection).append(canvas);

  var ctx = $(canvas).get(0).getContext("2d");
  var chart = new Chart(ctx).Pie(data, options);

  $(datasection).prepend( chart.generateLegend() );
}

function renderDatasectionLine(datasection, data, options, extra){
  var colorHistory = {};

  var canvas = $("<canvas/>");

  $(datasection).append(canvas);

  var ctx = $(canvas).get(0).getContext("2d");
  var chart = new Chart(ctx).Line(data, options);

  $(datasection).prepend( chart.generateLegend() );

  $(datasection).find('.line-legend li').hover( function () {
    var text = $(this).text();
    var index = extra.categoryMap[text];
    colorHistory[index] = chart.datasets[index].fillColor;
    chart.datasets[index].fillColor = '#cc4444';
    chart.update();
  }, function () {
    var text = $(this).text();
    var index = extra.categoryMap[text];
    chart.datasets[index].fillColor = colorHistory[index];
  });
}

function renderDatasectionTable(datasection, data){
  if (!data) return;

  var table = $("<table/>"), tr;

  tr = $("<tr/>");
  for (var i in data.headers)
    $("<th/>", {text : data.headers[i]}).appendTo(tr);
  tr.appendTo(table);

  for (var i in data.rows){
    tr = $("<tr/>");
    for (var j in data.rows[i])
      $("<td/>", {text : data.rows[i][j]}).appendTo(tr);
    tr.appendTo(table);
  }

  $(datasection).append(table);
}
