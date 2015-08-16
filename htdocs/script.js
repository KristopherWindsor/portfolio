$(function (){
  $('.ct-chart').each(function () {
    var el = this;
    var url = $(el).data('src');
    $.getScript(url);
  });
});
