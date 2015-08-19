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
        $(el).parent().prepend( chart.generateLegend() );
      }
    });
  });
});
