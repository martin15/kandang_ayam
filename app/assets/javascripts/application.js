// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require jquery
//= require jquery_ujs
//= require popper
//= require bootstrap
//= require ckeditor/init


// document on ready functions
$(document).ready(function () {
  // my variables
  var nav = $('#nav'),
      bars = $('#bars'),
      menu = $('#menu'),
      up = $('#up'),
      prevOffset = 0,
      mainSection = $('.main-section'),
      mainSectionLength = mainSection.length,
      links = $('#menu li'),
      flag = 0,
      flag2 = 0,
      lastI = 100,
      body = $('body');
      myWindow = $(window);
  
  
  // menu bars on click
  function barsClicked() {
    bars.toggleClass('clicked');
    menu.slideToggle(300);
  }

  bars.on('click', barsClicked);

  // on scrolling functions
  myWindow.on('scroll', function () {
    /*  
      // navbar animations
      // when i scroll 150px
      if (myWindow.scrollTop() >= 100) {
          if (!nav.hasClass('scrolled')) {
              nav.addClass('scrolled');
            //   $('nav.navbar').addClass('sticky-nav');
          }
                      
      } else {
          if (nav.hasClass('scrolled')) {
              nav.removeClass('scrolled');
            //   $('nav.navbar').removeClass('sticky-nav');
          }
      }
      
      // hide or show navbar while scrolling
      if (myWindow.scrollTop() > 200) {
          if (myWindow.scrollTop() > prevOffset) {
              if (!nav.hasClass('hidden')) {
                  nav.addClass('hidden');
              }
          } else {
              if (nav.hasClass('hidden')) {
                  nav.removeClass('hidden');
              }
          }
      }
      // store the latest scrolled offset
      prevOffset = myWindow.scrollTop();
      */
  });

  // up icon on click
  $('#up').on('click', function () {
      $('html, body').animate({
          scrollTop: 0
      }, {
          duration: 1800,
          easing: 'easeInOutQuint'
      });
  });

  // on resize functions
  myWindow.on('resize', function () {
    if (bars.css('display') === 'block') {
        menu.css('display', 'none');
        bars.removeClass('clicked');
    } else {
        menu.css('display', 'block');
    }
  });

});
