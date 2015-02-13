// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require_tree .
//= jquery.sidr.min.js

$(document).ready(function(){
  $('.see_more').click(function(){
    $(this).toggleClass('open');
    if( $(this).hasClass('open') ){
      $(this).css("background-image", "url(/assets/less.png)")
    }else{
      $(this).css("background-image", "url(/assets/more.png)")
    }
    $(this).parent().find('.videoWrapper').slideToggle();

  });
});
