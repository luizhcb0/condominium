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

function updateTank($level) {
  switch ($level) {
    case 0:
    $('.water').animate({
          height: '5%'
      }, 1000);  
      break;
    
    case 1:
    $('.water').animate({
          height: '30%'
      }, 1000);
      break;
    
    case 2:
    $('.water').animate({
          height: '65%'
      }, 1000);
      break;
    
    case 3:
    $('.water').animate({
          height: '95%'
      }, 1000);
      break;    
  }
}

function tankInfo($element) {
  if ($element.className.split(' ')[0] == 'water-tank') {
    $tank_id = $element.id.substr($element.id.length - 1);
    $('.building-canvas').css('display','none');
    $('.waterTank-canvas').css('display','block');
    $('.go-back').css('display','block');
    clearInterval($allTimer);
    $oneTimer = setInterval(
      function() {
        getLevel($tank_id);
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
    $('.waterTank-canvas').css('display','none');
    $('.building-canvas').css('display','block');
    $('.go-back').css('display','none');
  }
}

function getLevel() {
  $.ajax({    //create an ajax request to load_page.php
    type: "GET",
    url: "/render_current_level/"+$tank_id,
    dataType: "json",   //expect html to be returned
    success: function(response){
      updateTank(response.level);
    }
  });
}

function updateTanks($level) {
  switch($level.level) {
    case 0:
      $('#tank-'+$level.tank_id).removeClass( "low medium full" ).addClass('empty');
      break;
    case 1:
      $('#tank-'+$level.tank_id).removeClass( "empty medium full" ).addClass('low');
      break;
    case 2:
      $('#tank-'+$level.tank_id).removeClass( "empty low full" ).addClass('medium');
      break;
    case 3:
      $('#tank-'+$level.tank_id).removeClass( "empty low medium" ).addClass('full');
      break;  
  }
}

function getLevels() {
  $.ajax({    //create an ajax request to load_page.php
    type: "GET",
    url: "/render_all_current_levels",
    dataType: "json",   //expect html to be returned
    success: function(response){
      response.forEach(updateTanks);
    }
  });
}
