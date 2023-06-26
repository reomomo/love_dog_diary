$(document).on('turbolinks:load',function() {
  $('#tab-contents .tab[id != "tab0"]').hide();
});

$(document).on('turbolinks:load',function() {
  $('#tab-menu a').on('click', function(event){
    $("#tab-contents .tab").hide();
    $("#tab-menu .active").removeClass("active");
    $(this).addClass("active");
    $($(this).attr("href")).show();
    event.preventDefault();
  });
});

$(document).on('turbolinks:load',function() {
  $('#back a').on('click', function(event){
    $('body,html').animate({
      scrollTop:0
    }, 800);
  });
});
