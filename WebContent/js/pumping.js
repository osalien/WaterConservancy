//var name;
//function pumps(names){
//	name=names;
//}

function pumping(){
	name=(decodeURI(location.search)).substring((decodeURI(location.search)).indexOf("=")+1);
	getAllPumping(name);
}
function getAllPumping(name){
	$.ajax({        
		type:"POST",//请求方式  
		url: "../../json/bengzhan.json",//请求路径  
		dataType: "json",//数据格式  
		success: function(data){
			if(data!=''){
				var strtb="";
				for (var i = 0; i < data.length; i++) {
					if(name==data[i].name){
						strtb +="<div class='form-group' style='float: left;'>"
							+"<label>时间：</label>"
							+"<input type='text' class='form-control'style='width: 100px' value="
							+data[i].time
							+"></div><div class='form-group'style='float: left;margin-left:20px;'>"
							+"<label>上游水位(m)：</label>"
							+"<input type='text' class='form-control' style='width: 100px' value="
							+data[i].sysw
							+"></div><div class='form-group'style='float: left;margin-left:20px;'>"
							+"<label>下游水位(m)：</label>"
							+"<input type='text' class='form-control' style='width: 100px' value="
							+data[i].xysw
							+"></div><div class='form-group'style='float: left;margin-left:20px;'>"
							+"<label>总流量(m3/s)：</label>"
							+"<input type='text' class='form-control' placeholder='' style='width: 100px' value="
							+data[i].zll
							+"></div><div class='form-group'style='float: left;margin-left:20px;'>"
							+"<label>开机台数：</label>"
							+"<input type='text' class='form-control' placeholder='' style='width: 100px' value="
							+data[i].kjts
							+"></div>"
					}
				}
				$("#pumingtb").append(strtb);
			}
			showpump(data,name);
		}  
	}); 
}

function showpump(data,name){
	$.ajax({        
		type:"POST",//请求方式  
		url: "../../json/bengzhans.json",//请求路径  
		dataType: "json",//数据格式  
		success: function(msc){ 
			if(msc!=''){
				var str="";
				for (var i = 0; i < msc.length; i++) {
					if(name==msc[i].bzname){
						str +="<td style='height:100%;'><div class='pum_a'>"
							+"<input class='pum_input' type='text' value="
							+msc[i].name
							+" readonly='readonly'/>"
							+"<input class='pum_input' type='text' value="
							+msc[i].ljll
							+" readonly='readonly'/>"
							+"<input class='pum_input' type='text' value="
							+msc[i].ypjd
							+" readonly='readonly'/>"
							+"</div><div class='pum_b'><div class='pum_c'>"	
							+msc[i].name
							+"</div>";
						if(msc[i].qbzt=="开启"){
							str+="<div class='pum_d'><img src='../../img/gongqingimg/shuibeng-dong.gif' width='70%' height='70%' /></div>"
						}else if(msc[i].qbzt=="关闭"){
							str+="<div class='pum_d'><img src='../../img/gongqingimg/shuibeng-ting.gif' width='70%' height='70%' /></div>"
						}
						+"</div></td>";
					}
				}
			}
			$("#pumpinglist").append(str);
		}  
	}); 
}