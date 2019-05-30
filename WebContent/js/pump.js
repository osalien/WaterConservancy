
function pump(){
	$("#pumpbt").empty();
	$("#pumplist").empty();
	getAllPump();
}
function getAllPump(){
	var gclx=$("#exampleInputName2 option:selected"); 
	$.ajax({       
		type:"POST",//请求方式  
		url: "../../json/pump.json",//请求路径  
		dataType: "json",//数据格式  
		success: function(data){ 
			showpump(data);
		}  
	}); 
}

function showpump(data){
	var gclx=$("#exampleInputName2 option:selected"); 
	var gcmcStr=document.getElementById('gcmcStr').value;
	var strbt="<tr class='tit'><td>工程名称</td><td>工程类型</td></tr>";
	var str="";
	for(var i=0;i<data.length;i++){
		var gcmc=data[i].gcmc;
	if(gclx.val()==0){
		showinfo(data,"gqall");
		if(gcmcStr==''){
			str +="<tr><td a href='javascript:void(0);' onclick='js_method()'>"+data[i].gcmc+"</td><td>"+data[i].gclx+"</td></tr>";
		}else if(gcmcStr!=''&gcmc.indexOf(gcmcStr)>-1){
			str +="<tr><td>"+data[i].gcmc+"</td><td>"+data[i].gclx+"</td></tr>";
		}
		
	}else if(gclx.val()!=0){
		if(gclx.val()=="泵站"){
			showinfo(data,"bengz");
		}else if(gclx.val()=="水闸"){
			showinfo(data,"shuiz");
		}
		if(gcmcStr==''){
			if(gclx.val()==data[i].gclx){
				str +="<tr><td>"+data[i].gcmc+"</td><td>"+data[i].gclx+"</td></tr>";
			}
			
		}else if(gcmcStr!=''&gcmc.indexOf(gcmcStr)>-1){
			if(gclx.val()==data[i].gclx){
				str +="<tr><td>"+data[i].gcmc+"</td><td>"+data[i].gclx+"</td></tr>";
			}
		}
	}
 }
	
	$("#pumpbt").append(strbt);
	$("#pumplist").append(str);
}