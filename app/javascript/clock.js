function clock()
{
  const twoDigit =function(num){
    　     var digit
         if( num < 10 )
          { digit = "0" + num; }
         else { digit = num; }
         return digit;
   }
  const weeks = new Array("Sun","Mon","Thu","Wed","Thr","Fri","Sat");

  const now = new Date();

  const year = now.getFullYear();
  const month = twoDigit(now.getMonth() + 1)
  const day = twoDigit(now.getDate());
  const week = weeks[now.getDay()];
  const hour = twoDigit(now.getHours());
  const minute = twoDigit(now.getMinutes());
  const second = twoDigit(now.getSeconds());

document.getElementById("clock_date").textContent =  year + "." + month + "." + day + " (" + week + ")" + hour + ":" + minute + ":" + second ;
}

setInterval(clock, 1000);