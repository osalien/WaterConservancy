function floodlb(){
	$.ajax({       
		type:"POST",//请求方式  
		url: "../../json/flood.json",//请求路径  
		dataType: "json",//数据格式  
		success: function(data){ 
			showfloodlb(data);
		}  
	}); 
}

function showfloodlb(data){
	$("#floodlistlb").empty();
	var nameStr=document.getElementById('nameStr').value;
	var ssxzStr=$("#exampleInputName1 option:selected");
	var blqStr=document.getElementById('blqStr').value;
	var cbtStr=document.getElementById('cbtStr').value;
	var cbStr=document.getElementById('cbStr').value;
	var fdjStr=document.getElementById('fdjStr').value;
	var dlStr=document.getElementById('dlStr').value;
	var bhgStr=document.getElementById('bhgStr').value;
	var fzStr=document.getElementById('fzStr').value;
	var gzStr=document.getElementById('gzStr').value;
	var strlb="";
	for(var i=0;i<data.length;i++){
		var name=data[i].name;
		if(nameStr!=''&name.indexOf(nameStr)>-1){
			if(data[i].blq>=(blqStr=''?0 :blqStr)){
				if(data[i].cbt>=(cbtStr=''?0 :cbtStr)){
					if(data[i].cb>=(cbStr=''?0 :cbStr)){
						if(data[i].fdj>=(fdjStr=''?0 :fdjStr)){
							if(data[i].dl>=(dlStr=''?0 :dlStr)){
								if(data[i].bhg>=(bhgStr=''?0 :bhgStr)){
									if(data[i].fz>=(fzStr=''?0 :fzStr)){
										if(data[i].gz>=(gzStr=''?0 :gzStr)){
											if(ssxzStr.val()!=0&ssxzStr.val()==data[i].qyid){
												strlb +="<tr><td>"+data[i].name+"</td><td>"+data[i].blq+"</td><td>"+data[i].cbt+"</td><td>"+data[i].cb+"</td><td>"+data[i].fdj+"</td><td>"+data[i].dl+"</td><td>"+data[i].bhg+"</td><td>"+data[i].fz+"</td><td>"+data[i].gz+"</td><td>"+data[i].qy+"</td></tr>";
											}else if(ssxzStr.val()==0){
												strlb +="<tr><td>"+data[i].name+"</td><td>"+data[i].blq+"</td><td>"+data[i].cbt+"</td><td>"+data[i].cb+"</td><td>"+data[i].fdj+"</td><td>"+data[i].dl+"</td><td>"+data[i].bhg+"</td><td>"+data[i].fz+"</td><td>"+data[i].gz+"</td><td>"+data[i].qy+"</td></tr>";
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}else if(nameStr==''){
			if(data[i].blq>=(blqStr=''?0 :blqStr)){
				if(data[i].cbt>=(cbtStr=''?0 :cbtStr)){
					if(data[i].cb>=(cbStr=''?0 :cbStr)){
						if(data[i].fdj>=(fdjStr=''?0 :fdjStr)){
							if(data[i].dl>=(dlStr=''?0 :dlStr)){
								if(data[i].bhg>=(bhgStr=''?0 :bhgStr)){
									if(data[i].fz>=(fzStr=''?0 :fzStr)){
										if(data[i].gz>=(gzStr=''?0 :gzStr)){
											if(ssxzStr.val()==0){
												strlb +="<tr><td>"+data[i].name+"</td><td>"+data[i].blq+"</td><td>"+data[i].cbt+"</td><td>"+data[i].cb+"</td><td>"+data[i].fdj+"</td><td>"+data[i].dl+"</td><td>"+data[i].bhg+"</td><td>"+data[i].fz+"</td><td>"+data[i].gz+"</td><td>"+data[i].qy+"</td></tr>";
											}else if(ssxzStr.val()!=0&ssxzStr.val()==data[i].qyid){
												strlb +="<tr><td>"+data[i].name+"</td><td>"+data[i].blq+"</td><td>"+data[i].cbt+"</td><td>"+data[i].cb+"</td><td>"+data[i].fdj+"</td><td>"+data[i].dl+"</td><td>"+data[i].bhg+"</td><td>"+data[i].fz+"</td><td>"+data[i].gz+"</td><td>"+data[i].qy+"</td></tr>";
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
//		strlb +="<tr><td>"+data[i].name+"</td><td>"+data[i].blq+"</td><td>"+data[i].cbt+"</td><td>"+data[i].cb+"</td><td>"+data[i].fdj+"</td><td>"+data[i].dl+"</td><td>"+data[i].bhg+"</td><td>"+data[i].fz+"</td><td>"+data[i].gz+"</td><td>"+data[i].qy+"</td></tr>";
	}
	
	$("#floodlistlb").html(strlb);
}

