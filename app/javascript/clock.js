function clock()
{
  var twoDigit =function(num){
    　     var digit
         if( num < 10 )
          { digit = "0" + num; }
         else { digit = num; }
         return digit;
   }
  var weeks = new Array("Sun","Mon","Thu","Wed","Thr","Fri","Sat");

  var now = new Date();

    var year = now.getFullYear();
    var month = twoDigit(now.getMonth() + 1)
    var day = twoDigit(now.getDate());
    var week = weeks[now.getDay()];
    var hour = twoDigit(now.getHours());
    var minute = twoDigit(now.getMinutes());
    var second = twoDigit(now.getSeconds());
    //var milliseconds = twoDigit(now.getMilliseconds());

document.getElementById("clock_date").textContent =  year + "." + month + "." + day + " (" + week + ")" + hour + ":" + minute + ":" + second ;
}

setInterval(clock, 1000);