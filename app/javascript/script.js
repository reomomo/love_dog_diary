$(document).ready(function() {
  $('#tab-contents .tab[id != "tab1"]').hide();
})

$(document).ready(function() {
  $('#tab-menu a').on('click', function(event){
    $("#tab-contents .tab").hide();
    $("#tab-menu .active").removeClass("active");
    $(this).addClass("active");
    $($(this).attr("href")).show();
    event.preventDefault();
  });
})

$(document).ready(function() {
  $('#tab-contents1 .tab[id != "tab1"]').hide();
})

$(document).ready(function() {
  $('#tab-menu1 a').on('click', function(event){
    $("#tab-contents1 .tab").hide();
    $("#tab-menu1 .active").removeClass("active");
    $(this).addClass("active");
    $($(this).attr("href")).show();
    event.preventDefault();
  });
})
