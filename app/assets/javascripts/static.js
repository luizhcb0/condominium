$updateRate = 1000;

$(document).ready(function() {
  startTime();
  getLevels();
  $allTimer = setInterval(
    function() {
      getLevels();
    },
    $updateRate
  );
});

function startTime() {
    var tday = new Array("Domingo","Segunda","Terça","Quarta","Quinta","Sexta","Sábado");
    var today = new Date();
    var y = today.getFullYear();
    var month = today.getMonth() + 1;
    var monthDay = today.getDate();
    var weekDay = today.getDay();
    var h = today.getHours();
    var m = today.getMinutes();
    var s = today.getSeconds();

    if (m <= 9) {
      m = "0" + m;
    }
	  if (s <= 9) {
      s = "0" + s;
    }
    if (h ==  0) {
      ap = " AM";
      h = 12;
    }
    else if (h <= 11) {
      ap = " AM";
    }
	  else if(h == 12) {
      ap = " PM";
    }
	  else if(h >= 13) {
      ap = " PM";
      h -= 12;
    }

	append(tday, weekDay, month, monthDay, y, h, m, s, ap);
  setTimeout("startTime()", 0000);
}

function append(tday, weekDay, month, monthDay, y, h, m, s, ap) {
	$('#week').html(tday[weekDay]);
  $('#date').html(monthDay+"/"+month+"/"+y);
  $('#hour').html(h+":"+m+":"+s+ap);
}

function updateBox($level) {
  switch ($level) {
    case 0:
    $('.water').animate({
          height: '5%'
      }, 1000);  
      $('#level_container').html("<div class='col-xs-3 bar_label'>Nível Crítico</div>"+
      "<div class='col-xs-2 bar' id='level'></div>"+
      "<div class='col-xs-2 bar' id='level'></div>"+
      "<div class='col-xs-2 bar' id='level'></div>");
      break;
    
    case 1:
    $('.water').animate({
          height: '30%'
      }, 1000);
      $('#level_container').html("<div class='col-xs-3 bar_label'>Nível Baixo</div>"+
      "<div class='col-xs-2 bar' id='low_level'></div>"+
      "<div class='col-xs-2 bar' id='level'></div>"+
      "<div class='col-xs-2 bar' id='level'></div>");
      break;
    
    case 2:
    $('.water').animate({
          height: '65%'
      }, 1000);
      $('#level_container').html("<div class='col-xs-3 bar_label'>Nível Médio</div>"+
      "<div class='col-xs-2 bar' id='medium_level'></div>"+
      "<div class='col-xs-2 bar' id='medium_level'></div>"+
      "<div class='col-xs-2 bar' id='level'></div>");
      break;
    
    case 3:
    $('.water').animate({
          height: '95%'
      }, 1000);
      $('#level_container').html("<div class='col-xs-3 bar_label'>Nível Cheio</div>"+
      "<div class='col-xs-2 bar' id='high_level'></div>"+
      "<div class='col-xs-2 bar' id='high_level'></div>"+
      "<div class='col-xs-2 bar' id='high_level'></div>");
      break;    
  }
}

function call($element) {
  if ($element.className.split(' ')[0] == 'water_house') {
    $box_id = $element.id.substr($element.id.length - 1);
    $('.building_canvas').css('display','none');
    $('.waterBox_canvas').css('display','block');
    $('.go_back').css('display','block');
    clearInterval($allTimer);
    $oneTimer = setInterval(
      function() {
        getLevel($box_id);
      },
      $updateRate
    );
  }
  else {
    clearInterval($oneTimer);
    $allTimer = setInterval(
      function() {
        getLevels();
      },
      $updateRate
    );
    $('.waterBox_canvas').css('display','none');
    $('.building_canvas').css('display','block');
    $('.go_back').css('display','none');
  }
}

function getLevel() {
  $.ajax({    //create an ajax request to load_page.php
    type: "GET",
    url: "/render_current_level/"+$box_id,
    dataType: "json",   //expect html to be returned
    success: function(response){
      updateBox(response.level);
    }
  });
}

function updateBoxes($level) {
  switch($level.level) {
    case 0:
      $('#box_'+$level.box_id).removeClass( "low medium full" ).addClass('empty');
      break;
    case 1:
      $('#box_'+$level.box_id).removeClass( "empty medium full" ).addClass('low');
      break;
    case 2:
      $('#box_'+$level.box_id).removeClass( "empty low full" ).addClass('medium');
      break;
    case 3:
      $('#box_'+$level.box_id).removeClass( "empty low medium" ).addClass('full');
      break;  
  }
}

function getLevels() {
  $.ajax({    //create an ajax request to load_page.php
    type: "GET",
    url: "/render_all_current_levels",
    dataType: "json",   //expect html to be returned
    success: function(response){
      response.forEach(updateBoxes);
      response.forEach(updateBoxes);
    }
  });
}


// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
// 
// $(document).on "turbolinks:load", ->
//   $('.time-container').load('/get_time')
// 
//   setInterval ->
//     $('.time-container').load('/get_time')
//     1000
//   
// return