$(function (){
  $('.datasection:not(.noload)').each(renderDatasection);
});

function completeReportInvestmentsToggleHandler(checkbox){
  var $container = $(checkbox).parent().parent().parent();

  var fn = function (){
    $container.find(".datasection").toggle();
  }

  if ($container.find(".datasection.noload").length){
    $container.find(".datasection.noload").each(function (){
      $(this).removeClass('noload');
      renderDatasection.call(this, fn);
    });
  } else
    fn();
}

function renderDatasection(onPreLoad){
  var datasection = this;
  var url = $(datasection).data('src');

  $.get(url, null, function (response){
    var type = response[0], data = response[1], options = response[2], extra = response[3];

    if (onPreLoad && typeof onPreLoad === "function"){
      console.log(onPreLoad);
      onPreLoad.call(datasection);
    }

    if (type == "Pie"){
      renderDatasectionPie(datasection, data, options, extra);
    } else if (type == "Line"){
      renderDatasectionLine(datasection, data, options, extra);
    } else if (type == "Bar"){
      renderDatasectionBar(datasection, data, options, extra);
    } else if (type == "Table"){
      renderDatasectionTable(datasection, data);
    } else if (type == "DefList"){
      renderDatasectionDefList(datasection, data);
    }
  });
}

function renderDatasectionPie(datasection, data, options, extra){
  var header = $("<h3/>", {html : extra.headerText});
  var canvas = $("<canvas/>", {width : "10px", height : "10px"});

  $(datasection).append(header);
  $(datasection).append(canvas);

  var ctx = $(canvas).get(0).getContext("2d");
  var chart = new Chart(ctx).Pie(data, options);
  $(canvas).data('chart', chart);

  var colorHistory = {};
  var onHandler = function (){
    var index = $(this).index();
    colorHistory[index] = chart.segments[index].fillColor;
    $(this).parent().parent().prev(".pie-grid").find("canvas").each(function () {
      $(this).data("chart").segments[index].fillColor = '#cc4444';
      $(this).data("chart").update();
    });
  };
  var offHandler = function (){
    var index = $(this).index();
    $(this).parent().parent().prev(".pie-grid").find("canvas").each(function () {
      $(this).data("chart").segments[index].fillColor = colorHistory[index];
      $(this).data("chart").update();
    });
  };

  var isGrid = $(datasection).parent().is(".pie-grid");

  if (isGrid){
    $(datasection).parent().next(".pie-grid-legend").html( chart.generateLegend() );
    $(datasection).parent().next(".pie-grid-legend").find(".pie-legend li").hover(onHandler, offHandler);
  } else
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

function renderDatasectionBar(datasection, data, options, extra){
  var colorHistory = {};

  var canvas = $("<canvas/>");

  $(datasection).append(canvas);

  var ctx = $(canvas).get(0).getContext("2d");
  var chart = new Chart(ctx).Bar(data, options);

  $(datasection).prepend( chart.generateLegend() );
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

function renderDatasectionDefList(datasection, data){
  if (!data) return;

  var article;

  for (var i in data){
    article = $("<article/>");
    if (data[i].icon)
      $("<img/>", {src : data[i].icon, alt : ""}).appendTo(article);
    $("<h3/>", {text : data[i].term}).appendTo(article);
    $("<p/>", {text : data[i].definition}).appendTo(article);
    $(datasection).append(article);
  }
}
