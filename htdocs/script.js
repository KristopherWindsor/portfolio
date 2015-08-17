$(function (){
  $('canvas').each(function () {
    var el = this;
    var url = $(el).data('src');
    $.get(url, null, function (response){
      var type = response[0], data = response[1], options = response[2];
      var ctx = $(el).get(0).getContext("2d");
      if (type == "Pie"){
        var chart = new Chart(ctx).Pie(data, options);
        $(el).parent().prepend( chart.generateLegend() );
      } else if (type == "Line"){
        var chart = new Chart(ctx).Line(data, options);
        $(el).parent().prepend( chart.generateLegend() );
      }
    });
  });
});
