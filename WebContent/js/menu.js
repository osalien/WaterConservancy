/**
 * 得到所有菜单选项
 * @param fatherId
 * @returns
 */
function getMenu(fatherId){
	$.ajax({
		type : "POST",// 请求方式
		url : "./json/menu.json",
		dataType : "json",
		success : function(data) {
			$("#menu").empty();
			if (data.length > 0) {
				appendMenu(data,fatherId);
			}
		}
	});
}
/**
 * 在侧边菜单栏中填充菜单选项
 * @param data
 * @param fatherId
 * @returns
 */
/*function appendMenu(data,fatherId){
	var str = "";
	//根据fatherId得到有父菜单相关的所有子菜单
	for (var i = 0; i < data.length; i++) {
		if(fatherId == data[i].fatherId){
			if(data[i].sort == 1){
				str +="<li class='active'><a href='"+data[i].url+"' target='frameName'><img src='"+data[i].pic+"' alt=''/><span>"+data[i].name+"</span></a></li>";
			}else{
				str +="<li><a href='"+data[i].url+"' target='frameName'><img src='"+data[i].pic+"' alt=''/><span>"+data[i].name+"</span></a></li>";
			}
			
		}
	}
	$("#menu").append(str);
	//二级菜单点击 加颜色
	$(".menu li").click(function(){
	    $(this).addClass("active").siblings().removeClass('active');
	});
	//页面切换时，页面显示父菜单下的第一个子菜单
	for(var i = 0; i < data.length; i++){
		if(fatherId == data[i].fatherId && data[i].sort == 1){
			$("#frameId").attr('src',data[i].url);
		}
	}
}*/


function appendMenu(data,fatherId){
	var str = "";
	//根据fatherId得到有父菜单相关的所有子菜单
	for (var i = 0; i < data.length; i++) {
		if(fatherId == data[i].fatherId){
			if(data[i].sort == 1){
				str +="<li class='active'><a href='"+data[i].url+"' target='frameName'><strong class='"+data[i].pic+"'/></strong><span>"+data[i].name+"</span></a></li>";
			}else{
				str +="<li><a href='"+data[i].url+"' target='frameName'><strong class='"+data[i].pic+"'/></strong><span>"+data[i].name+"</span></a></li>";
			}
			
		}
	}
	$("#menu").append(str);
	//二级菜单点击 加颜色
	$(".menu li").click(function(){
	    $(this).addClass("active").siblings().removeClass('active');
	});
	//页面切换时，页面显示父菜单下的第一个子菜单
	for(var i = 0; i < data.length; i++){
		if(fatherId == data[i].fatherId && data[i].sort == 1){
			$("#frameId").attr('src',data[i].url);
		}
	}
}






















