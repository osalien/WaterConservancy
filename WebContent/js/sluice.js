//function slus(name){
//	alert(location.search);
//}
function sluice(){
	name=(decodeURI(location.search)).substring((decodeURI(location.search)).indexOf("=")+1);
	getAllSluice(name);
}
function getAllSluice(name){
	$.ajax({        
		type:"POST",//请求方式  
		url: "../../json/sluice.json",//请求路径  
		dataType: "json",//数据格式  
		success: function(data){ 
			if(data!=''){
				var strtb="";
				for (var i = 0; i < data.length; i++) {
					if(data[i].name==name){
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
							+"<label>闸流量(m3/s)：</label>"
							+"<input type='text' class='form-control' placeholder='' style='width: 100px' value="
							+data[i].zll
							+"></div><div class='form-group'style='float: left;margin-left:20px;'>"
							+"<label>开启孔数：</label>"
							+"<input type='text' class='form-control' placeholder='' style='width: 100px' value="
							+data[i].kqks
							+"></div>";
					}
				}
				$("#sluicetb").append(strtb);
			}
			showsluice(data,name);
		}  
	}); 
}

function showsluice(data,name){
	$.ajax({        
		type:"POST",//请求方式  
		url: "../../json/sluices.json",//请求路径  
		dataType: "json",//数据格式  
		success: function(msc){ 
			//showpump(msc);
			/*if(msc!=''){
				var str="";
				for (var i = 0; i < msc.length; i++) {
					if(msc[i].zzname==name){
						str +="<td style='position:relative;'><div class='gq_a'><div class='gq_b'>"
							+msc[i].name
							+"</div></div>"
							+"<div class='gq_c'><div class='gq_d'>"
							+"<input class='gq_input' type='text' readonly='readonly' value="
							+msc[i].qbzt
							+" /><input class='gq_input' type='text' readonly='readonly' value="
							+msc[i].kg
							+" /><input class='gq_input' type='text' readonly='readonly' value="
							+msc[i].ll
							+" /></div></div>"
							+"<div class='gq_e' style='top:"+(-240-230*(msc[i].kg/10))+"px;'></div></td>"//-240px为关闭状态   -470px为全开状态  230*(msc[i].kg/10)
					}
				}
			}*/
			if(msc!=''){
				var str="";
				console.info(msc);
				for (var i = 0; i < msc.length; i++) {
					if(msc[i].zzname==name){
						str +="<td style='position:relative;'>"
						+"<div class='gq_a'><div class='gq_b'>"+msc[i].name+"</div></div>"
							+"<div class='gq_c'>"
								+"<div class='gq_d'>"
									+"<input class='gq_input' type='text' readonly='readonly' value="
									+msc[i].qbzt
									+" /><input class='gq_input' type='text' readonly='readonly' value="
									+msc[i].kg
									+" /><input class='gq_input' type='text' readonly='readonly' value="
									+msc[i].ll + " /></div>" 
									+ "</div>"
									+"<div class='gq_e' style='bottom:-2px;'></div>"
							+"</td>"
							//-240px为关闭状态   -470px为全开状态  230*(msc[i].kg/10)
					}
				}
			}
			$("#sluicelist").append(str);
		}  
	}); 
}