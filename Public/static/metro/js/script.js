//JSHint Validated Custom JS Code by Designova

/*global $:false */
/*global window: false */

(function(){
  "use strict";
$(function ($) {

     //Detecting viewpot dimension and calculating the adjustments of components   
     var vW = $(window).width();
     var vH = $(window).height();
     var vHperc25 = vH*25/100;
     var vHperc20 = vH*20/100;
     if(vW > 1400){
     $('#home').css('height', vH);
     $('#home').css('padding-top', vHperc20);
     }
    $('#welcome').css('min-height', vH);
    $('#welcome h1').css('margin-top', vHperc25);
     //Counting number of nav-items and adjusting the height accordingly
    var navCount = $('#sidebar-nav ul li').size();
    var navHeight = vH/navCount;
    //alert(navHeight);
    $('#sidebar-nav ul li').css('height',navHeight);

     

$('.carousel').carousel({
  interval: 2000
});


 
    
    //Nav highlight
    
    $('#mast-nav li > a').click(function(){
        $('#mast-nav li > a').removeClass('active');
        $(this).addClass('active');
    });

    $('.page-section').mouseenter(function(){
        var sectionId = $(this).attr('id');
        $('#mast-nav li > a').removeClass('active');
        $('#'+sectionId+'-linker').addClass('active');
    });

    //Parallax Init
    if($(window).width() > 480){

      $(window).stellar({
          responsive: true,
          horizontalScrolling: false,
          parallaxBackgrounds: true,
          parallaxElements: true,
          hideDistantElements: true
      });




    //WAYPOINTS - INTERACTION
    //=======================

    //Triggering Navigation as Sticky when scrolled to second section:
    $('.navigation-fadeIn').waypoint(function (event, direction) {
        if (direction === 'down') {
            $('#sidebar-nav').addClass('show-nav');
        }
    }, { offset: 10 });

    //Triggering Navigation as Sticky when scrolled to second section:
    $('#metro-panel').waypoint(function (event, direction) {
        if (direction === 'down') {
          var nully ;
          nully = 1;
        } else {
            $('#sidebar-nav').removeClass('show-nav');
        }
    }, { offset: 10 });


    $('#about .welcome-text').waypoint(function (event, direction) {
        if (direction === 'down') {
     
        } 
    }, { offset: 10 });

    }//> 480px

//Slidebar Menu - State Changes
$('.sq-side-menu ul li a').click(function(){
  $('.sq-side-menu ul li a').removeClass(' sq-active');
  $(this).addClass(' sq-active');
});

$('.page-section, #home').mouseenter(function(){
  var activePageId = $(this).attr('id');
  $('.sq-side-menu ul li a').removeClass(' sq-active');
  $('#'+activePageId+'-link').addClass(' sq-active');
});


    
//Metro Panel - Rotating Tiles
  $('#metro-panel .thumb').on('rotate',function(){
    var thisOne = $(this);
    thisOne.addClass('active');
    var time =getRandomInt(3,10)*1000;
    setTimeout(function(){
      thisOne.removeClass('active');
    },time);
  });
  setInterval(function(){
    var thumbs = $('#metro-panel .thumb:not(.active)');
    $(thumbs[getRandomInt(0,thumbs.length)]).trigger('rotate');
  },3000);

  

//Custom functions 

/**
 * Returns a random integer between min and max
 * Using Math.round() will give you a non-uniform distribution!
 */
function getRandomInt (min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}



    
	
});


})();








	

