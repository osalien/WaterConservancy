var data1;
var data2;
var data3;
//防汛仓库
function getAllFlood(){
	var options=$("#exampleInputName2 option:selected"); 
	$.ajax({       
		type:"POST",//请求方式  
		url: "../../json/flood.json",//请求路径  
		dataType: "json",//数据格式  
		success: function(data){ 
			data1=data;
			if(options.val()==0){
				showinfoAll(data,"all","ck");
			}else{
				showinfo(data,"flood");
			}
			showflood(data);
			if(options.val()==0){
				getAllOrganize();
			}
		}  
	}); 
}
function showflood(data){
	var options=$("#exampleInputName2 option:selected"); 
	var optionxz=$("#exampleInputName1 option:selected"); 
	var strbt="<tr class='tit'><td>名称</td><td>所属乡镇</td></tr>";
	var str="";
	if(options.val()==0&optionxz.val()==0){
		for(var i=0;i<data.length;i++){
			str +="<tr><td>"+data[i].name+"</td><td>"+data[i].qy+"</td></tr>";
		}
	}else if(options.val()==0&optionxz.val()!=0){
		for(var i=0;i<data.length;i++){
			if(optionxz.val()==data[i].qyid){
				str +="<tr><td>"+data[i].name+"</td><td>"+data[i].qy+"</td></tr>";
			}
		}
	}else if(options.val()!=0&optionxz.val()==0){
		for(var i=0;i<data.length;i++){
			str +="<tr><td>"+data[i].name+"</td><td>"+data[i].qy+"</td></tr>";
		}
	}else if(options.val()!=0&optionxz.val()!=0){
		for(var i=0;i<data.length;i++){
			if(optionxz.val()==data[i].qyid){
				str +="<tr><td>"+data[i].name+"</td><td>"+data[i].qy+"</td></tr>";
			}
		}
	}
	$("#floodbt").append(strbt);
	$("#floodlist").append(str);
}
//防汛队伍
function getAllOrganize(){
	var options=$("#exampleInputName2 option:selected"); 
	$.ajax({       
		type:"POST",//请求方式  
		url: "../../json/organize.json",//请求路径  
		dataType: "json",//数据格式  
		success: function(data){ 
			data2=data;
			if(options.val()==0){
				showinfoAll(data,"all","dw");
			}else{
				showinfo(data,"organize");
			}
			showorganize(data);
			if(options.val()==0){
				getAllYuan();
			}
		}  
	}); 
}
function showorganize(data){
	var strbt="";
	var str="";
	var options=$("#exampleInputName2 option:selected"); 
	var optionxz=$("#exampleInputName1 option:selected");
	if(options.val()==0&optionxz.val()==0){
		for(var i=0;i<data.length;i++){
			str +="<tr><td>"+data[i].name+"</td><td>"+data[i].qy+"</td></tr>";
		}
}else if(options.val()==0&optionxz.val()!=0){
	for(var i=0;i<data.length;i++){
		if(optionxz.val()==data[i].qyid){
			str +="<tr><td>"+data[i].name+"</td><td>"+data[i].qy+"</td></tr>";
		}
	}
}else if(options.val()!=0&optionxz.val()==0){
	if(options.val()!=0){
		 strbt="<tr class='tit'><td>名称</td><td>所属乡镇</td></tr>";
	}
	for(var i=0;i<data.length;i++){
		str +="<tr><td>"+data[i].name+"</td><td>"+data[i].qy+"</td></tr>";
	}
}else if(options.val()!=0&optionxz.val()!=0){
	if(options.val()!=0){
		 strbt="<tr class='tit'><td>名称</td><td>所属乡镇</td></tr>";
	}
	for(var i=0;i<data.length;i++){
		if(optionxz.val()==data[i].qyid){
			str +="<tr><td>"+data[i].name+"</td><td>"+data[i].qy+"</td></tr>";
		}
	}
}
	$("#floodbt").append(strbt);
	$("#floodlist").append(str);
}
//防汛预案
function getAllYuan(){
	var options=$("#exampleInputName2 option:selected"); 
	$.ajax({       
		type:"POST",//请求方式  
		url: "../../json/yuan.json",//请求路径  
		dataType: "json",//数据格式  
		success: function(data){
			data3=data;
			if(options.val()==0){
				showinfoAll(data,"all","ya");
			}else{
				showinfo(data,"yuan");
			}
			showoyuan(data);
		}  
	}); 
}
function showoyuan(data){
	var strbt="";
	var str="";
	var options=$("#exampleInputName2 option:selected"); 
	var optionxz=$("#exampleInputName1 option:selected");
	if(options.val()==0&optionxz.val()==0){
		for(var i=0;i<data.length;i++){
			str +="<tr><td>"+data[i].name+"</td><td>"+data[i].qy+"</td></tr>";
		}
}else if(options.val()==0&optionxz.val()!=0){
	for(var i=0;i<data.length;i++){
		if(optionxz.val()==data[i].qyid){
			str +="<tr><td>"+data[i].name+"</td><td>"+data[i].qy+"</td></tr>";
		}
	}
}else if(options.val()!=0&optionxz.val()==0){
	if(options.val()!=0){
		 strbt="<tr class='tit'><td>名称</td><td>所属乡镇</td></tr>";
	}
	for(var i=0;i<data.length;i++){
		str +="<tr><td>"+data[i].name+"</td><td>"+data[i].qy+"</td></tr>";
	}
}else if(options.val()!=0&optionxz.val()!=0){
	if(options.val()!=0){
		strbt="<tr class='tit'><td>名称</td><td>所属乡镇</td></tr>";
	}
	for(var i=0;i<data.length;i++){
		if(optionxz.val()==data[i].qyid){
			str +="<tr><td>"+data[i].name+"</td><td>"+data[i].qy+"</td></tr>";
		}
	}
}
	$("#floodbt").append(strbt);
	$("#floodlist").append(str);
}
	

function flood(){
	map.graphics.clear();
	$("#floodbt").empty();
	$("#floodlist").empty();
	var options=$("#exampleInputName2 option:selected"); 
	var optionxz=$("#exampleInputName1 option:selected"); 
	if(options.val()==0&optionxz.val()==0){
		getAllFlood();
	}else if(options.val()==1){
		getAllFlood();
	}else if(options.val()==2){
		getAllOrganize();
	}else if(options.val()==3){
		getAllYuan();
	}else{
		getAllFlood();
	}
}


function showCircle(type,type2,obj){
	var aa=[];
	var bb=[];
	var cc=[];
	$("#floodbt").empty();
	$("#floodlist").empty();
	var options=$("#exampleInputName2 option:selected");
	if(options.val()==0){
		for (var i = 0; i < data1.length; i++) {
			if(GetDistance(obj.y, obj.x,data1[i].latitude,data1[i].longtitude) <= 5){
				aa.push(data1[i]);
			}
		}
		showinfoAll(aa,"all","ck");
		showflood(aa);
		for (var i = 0; i < data2.length; i++) {
			if(GetDistance(obj.y, obj.x,data2[i].latitude,data2[i].longtitude) <= 5){
				bb.push(data2[i]);
			}
		}
		showinfoAll(bb,"all","dw");
		showorganize(bb);
		for (var i = 0; i < data3.length; i++) {
			if(GetDistance(obj.y, obj.x,data3[i].latitude,data3[i].longtitude) <= 5){
				cc.push(data3[i]);
			}
		}
		showinfoAll(cc,"all","ya");
		showoyuan(cc);
	}else{
		if(type=="yuan"){
			for (var i = 0; i < data3.length; i++) {
				if(GetDistance(obj.y, obj.x,data3[i].latitude,data3[i].longtitude) <= 5){
					aa.push(data3[i]);
				}
			}
			showinfo(aa,"yuan");
			showoyuan(aa);
		}else if(type=="organize"){
			for (var i = 0; i < data2.length; i++) {
				if(GetDistance(obj.y, obj.x,data2[i].latitude,data2[i].longtitude) <= 5){
					bb.push(data2[i]);
				}
			}
			showinfo(bb,"organize");
			showorganize(bb);
		}else if(type=="flood"){
			for (var i = 0; i < data1.length; i++) {
				if(GetDistance(obj.y, obj.x,data1[i].latitude,data1[i].longtitude) <= 5){
					cc.push(data1[i]);
				}
			}
			showinfo(cc,"flood");
			showflood(cc);
		}
	}
}

