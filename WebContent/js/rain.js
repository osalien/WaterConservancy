//setTimeout("getAllRain()","500");
function getAllRain(){
	$.ajax({       
		type:"POST",//请求方式  
		url: "../../json/rain.json",//请求路径  
		dataType: "json",//数据格式  
		success: function(data){ 
			showinfo(data,"rain");
			showtableRain(data);
		}  
	}); 
}
function showtableRain(data){
	$("#rainbt").empty();
	$("#rainlist").empty();
	var strbt="<tr class='tit'><td>站点</td><td>实时雨量</td><td>24h雨量</td></tr>";
	var str="";
	for(var i=0;i<data.length;i++){
		str +="<tr><td>"+data[i].name+"</td><td>"+data[i].yuliang+"</td><td>"+data[i].leiji+"</td></tr>";
	}
	$("#rainbt").append(strbt);
	$("#rainlist").append(str);
}
