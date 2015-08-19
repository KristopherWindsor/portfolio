$(function (){
  $('canvas').each(function () {
    var el = this;
    var url = $(el).data('src');
    $.get(url, null, function (response){
      var type = response[0], data = response[1], options = response[2], extra = response[3];
      var ctx = $(el).get(0).getContext("2d");
      if (type == "Pie"){
        var chart = new Chart(ctx).Pie(data, options);
        $(el).parent().prepend( chart.generateLegend() );
        $(el).parent().find('h3').html( extra.headerText );
      } else if (type == "Line"){
        var chart = new Chart(ctx).Line(data, options);
        var colorHistory = {};
        $(el).parent().prepend( chart.generateLegend() );

        $(el).parent().find('.line-legend li').hover( function () {
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
    });
  });
});
