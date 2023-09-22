var m=120; // 分钟
var s=0;  // 秒

var myTimmer = setInterval(function(){
  if(s<10){
   //如果秒数少于10在前面加上0
      $('#timespan').html('剩余时间：'+m+' 分 0'+s+' 秒');
  }else{
      $('#timespan').html('剩余时间：'+m+' 分 '+s+' 秒');
  }
  s--;
  if(s<0){
   //如果秒数少于0就变成59秒
      s=59;
      m--;
      if(m<0){
        $('#timespan').html('剩余时间：0 分 00 秒');
        $('#sub-test').attr("disabled",true);
        clearInterval(myTimmer);
      }
  }
},1000);

myTimmer();

