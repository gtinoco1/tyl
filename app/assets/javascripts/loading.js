$('#loader-div').hide();

$(window).on('load', function() {
  $('button').addClass('show-loader');
  $('a').addClass('show-loader');
  $('.remove-loader').removeClass('show-loader')

  $('.show-loader').on("click",function(){
    $('#loader-div').show();
  });

})
$(window).bind('load', function() {
 $('#loader-div').hide();
});
