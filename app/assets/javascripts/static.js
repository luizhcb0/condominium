$(document).ready(function() {
  startTime();
});

function startTime() {

    var tday = new Array("Domingo","Segunda","Terça","Quarta","Quinta","Sexta","Sábado");

    var today=new Date();
    var y=today.getFullYear();
    var month=today.getMonth() + 1;
    var month_day=today.getDate();
    var week_day=today.getDay();
    var h=today.getHours();
    var m=today.getMinutes();
    var s=today.getSeconds();

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

	append(tday,week_day,month,month_day,y,h,m,s,ap);
  setTimeout("startTime()", 0000);
}

function append(tday,week_day,month,month_day,y,h,m,s,ap) {
	$('#week').html(tday[week_day]);
  $('#date').html(month_day+"/"+month+"/"+y);
  $('#hour').html(h+":"+m+":"+s+ap);
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