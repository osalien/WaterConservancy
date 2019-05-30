/**
 * 地图加载完成时调用的方法
 * 
 * @returns
 */
$(function() {
	getProjectType();
	getTowns();
})
/**
 * 定时方法
 */
setTimeout("showProjects()", "500");
/**
 * 得到所有工程信息
 * @param projectType
 * @param town
 * @param keyword
 * @returns
 */
function getProjects(projectType, town, keyword) {
	$.ajax({
		type : "POST",// 请求方式
		url : "../../json/project.json",
		dataType : "json",
		success : function(data) {
			$("#projects").empty();
			$("#projects_head").empty();
			if (data.length > 0) {
				clearLayer();
				showPoints(data, projectType, town, keyword);
				appendProjects(data, projectType, town, keyword);
			}
		}
	});
}
/**
 * 根据条件，在地图上展示点
 * @param data
 * @param projectType
 * @param town
 * @param keyword
 * @returns
 */
function showPoints(data, projectType, town, keyword) {
	var title = '';
	var longtitude = '';
	var latitude = '';
	var url = '';
	var content = '';
	for (var i = 0; i < data.length; i++) {
		if (data[i].id == 1) {
			url = "../../img/project-reservoir.png";
		} else if (data[i].id == 2) {
			url = "../../img/project-sluice.png";
		} 
		if (projectType == '') {
			if (town == '' && keyword == '') {
				for (var j = 0; j < data[i].data.length; j++) {
					title = data[i].data[j].GCMC;
					longtitude = data[i].data[j].LONGTITUDE;
					latitude = data[i].data[j].LATITUDE;
					content ="<iframe width='460px' height='260px' name='mainFrame' id='mainFrame' frameborder='0' src='projectInfo.jsp?dataId1="+data[i].id+"&dataId2="+data[i].data[j].id+"'></iframe>";
					if(data[i].id == 3){
						if(data[i].data[j].state == 1){
							url = "../../img/project-pumping-green.png";
						}else{
							url = "../../img/project-pumping-red.png";
						}
					}
					showPointInfo(title, content, longtitude, latitude, url);
				}
			} else if (town != '' && keyword == '') {
				for (var j = 0; j < data[i].data.length; j++) {
					if (town == data[i].data[j].GSXZID) {
						title = data[i].data[j].GCMC;
						longtitude = data[i].data[j].LONGTITUDE;
						latitude = data[i].data[j].LATITUDE;
						content = "<iframe width='460px' height='260px' name='mainFrame' id='mainFrame' frameborder='0' src='projectInfo.jsp?dataId1="+data[i].id+"&dataId2="+data[i].data[j].id+"'></iframe>";
						if(data[i].id == 3){
							if(data[i].data[j].state == 1){
								url = "../../img/project-pumping-green.png";
							}else{
								url = "../../img/project-pumping-red.png";
							}
						}
						showPointInfo(title, content, longtitude, latitude, url);
					}
				}
			} else if (town == '' && keyword != '') {
				for (var j = 0; j < data[i].data.length; j++) {
					var name = data[i].data[j].GCMC;
					if (name.indexOf(keyword) != -1) {
						title = data[i].data[j].GCMC;
						longtitude = data[i].data[j].LONGTITUDE;
						latitude = data[i].data[j].LATITUDE;
						content = "<iframe width='460px' height='260px' name='mainFrame' id='mainFrame' frameborder='0' src='projectInfo.jsp?dataId1="+data[i].id+"&dataId2="+data[i].data[j].id+"'></iframe>";
						if(data[i].id == 3){
							if(data[i].data[j].state == 1){
								url = "../../img/project-pumping-green.png";
							}else{
								url = "../../img/project-pumping-red.png";
							}
						}
						showPointInfo(title,content,longtitude,latitude,url);
					}
				}
			} else if (town != '' && keyword != '') {
				for (var j = 0; j < data[i].data.length; j++) {
					var name = data[i].data[j].GCMC;
					if (name.indexOf(keyword) != -1
							&& town == data[i].data[j].GSXZID) {
						title = data[i].data[j].GCMC;
						longtitude = data[i].data[j].LONGTITUDE;
						latitude = data[i].data[j].LATITUDE;
						content = "<iframe width='460px' height='260px' name='mainFrame' id='mainFrame' frameborder='0' src='projectInfo.jsp?dataId1="+data[i].id+"&dataId2="+data[i].data[j].id+"'></iframe>";
						if(data[i].id == 3){
							if(data[i].data[j].state == 1){
								url = "../../img/project-pumping-green.png";
							}else{
								url = "../../img/project-pumping-red.png";
							}
						}
						showPointInfo(title,content,longtitude,latitude,url);
					}
				}
			}
		} else if (projectType != '') {
			if (town == '' && keyword == '') {
				for (var j = 0; j < data[i].data.length; j++) {
					if (projectType == data[i].id) {
						title = data[i].data[j].GCMC;
						longtitude = data[i].data[j].LONGTITUDE;
						latitude = data[i].data[j].LATITUDE;
						content ="<iframe width='460px' height='260px' name='mainFrame' id='mainFrame' frameborder='0' src='projectInfo.jsp?dataId1="+data[i].id+"&dataId2="+data[i].data[j].id+"'></iframe>";
						if(data[i].id == 3){
							if(data[i].data[j].state == 1){
								url = "../../img/project-pumping-green.png";
							}else{
								url = "../../img/project-pumping-red.png";
							}
						}
						showPointInfo(title,content,longtitude,latitude,url);
					}
				}
			} else if (town != '' && keyword == '') {
				for (var j = 0; j < data[i].data.length; j++) {
					if (projectType == data[i].id
							&& town == data[i].data[j].GSXZID) {
						title = data[i].data[j].GCMC;
						longtitude = data[i].data[j].LONGTITUDE;
						latitude = data[i].data[j].LATITUDE;
						content = "<iframe width='460px' height='260px' name='mainFrame' id='mainFrame' frameborder='0' src='projectInfo.jsp?dataId1="+data[i].id+"&dataId2="+data[i].data[j].id+"'></iframe>";
						if(data[i].id == 3){
							if(data[i].data[j].state == 1){
								url = "../../img/project-pumping-green.png";
							}else{
								url = "../../img/project-pumping-red.png";
							}
						}
						showPointInfo(title,content,longtitude,latitude,url);
					}
				}
			} else if (town == '' && keyword != '') {
				for (var j = 0; j < data[i].data.length; j++) {
					var name = data[i].data[j].GCMC;
					if (projectType == data[i].id
							&& name.indexOf(keyword) != -1) {
						title = data[i].data[j].GCMC;
						longtitude = data[i].data[j].LONGTITUDE;
						latitude = data[i].data[j].LATITUDE;
						content = "<iframe width='460px' height='260px' name='mainFrame' id='mainFrame' frameborder='0' src='projectInfo.jsp?dataId1="+data[i].id+"&dataId2="+data[i].data[j].id+"'></iframe>";
						if(data[i].id == 3){
							if(data[i].data[j].state == 1){
								url = "../../img/project-pumping-green.png";
							}else{
								url = "../../img/project-pumping-red.png";
							}
						}
						showPointInfo(title,content,longtitude,latitude,url);
					}
				}
			} else if (town != '' && keyword != '') {
				for (var j = 0; j < data[i].data.length; j++) {
					var name = data[i].data[j].GCMC;
					if (projectType == data[i].id
							&& name.indexOf(keyword) != -1
							&& town == data[i].data[j].GSXZID) {
						title = data[i].data[j].GCMC;
						longtitude = data[i].data[j].LONGTITUDE;
						latitude = data[i].data[j].LATITUDE;
						content = "<iframe width='460px' height='260px' name='mainFrame' id='mainFrame' frameborder='0' src='projectInfo.jsp?dataId1="+data[i].id+"&dataId2="+data[i].data[j].id+"'></iframe>";;
						if(data[i].id == 3){
							if(data[i].data[j].state == 1){
								url = "../../img/project-pumping-green.png";
							}else{
								url = "../../img/project-pumping-red.png";
							}
						}
						showPointInfo(title,content,longtitude,latitude,url);
					}
				}
			}
		}
	}
}
/**
 * 根据条件，将工程信息添加到table之中
 * @param data
 * @param projectType
 * @param town
 * @param keyword
 * @returns
 */
function appendProjects(data, projectType, town, keyword) {
	var str = "<tr class='tit'><td>工程类型</td><td>工程名称</td><td>归属乡镇</td></tr>";
	var str2 = '';
	for (var i = 0; i < data.length; i++) {
		if (projectType == '') {
			if (town == '' && keyword == '') {
				for (var j = 0; j < data[i].data.length; j++) {
					str2 += "<tr align='center'><td>" + data[i].projectType
							+ "</td><td>" + data[i].data[j].GCMC + "</td><td>"
							+ data[i].data[j].GSXZ + "</td></tr>";
				}
			} else if (town != '' && keyword == '') {
				for (var j = 0; j < data[i].data.length; j++) {
					if (town == data[i].data[j].GSXZID) {
						str2 += "<tr align='center'><td>" + data[i].projectType
								+ "</td><td>" + data[i].data[j].GCMC
								+ "</td><td>" + data[i].data[j].GSXZ
								+ "</td></tr>";
					}
				}
			} else if (town == '' && keyword != '') {
				for (var j = 0; j < data[i].data.length; j++) {
					var name = data[i].data[j].GCMC;
					if (name.indexOf(keyword) != -1) {
						str2 += "<tr align='center'><td>" + data[i].projectType
								+ "</td><td>" + data[i].data[j].GCMC
								+ "</td><td>" + data[i].data[j].GSXZ
								+ "</td></tr>";
					}
				}
			} else if (town != '' && keyword != '') {
				for (var j = 0; j < data[i].data.length; j++) {
					var name = data[i].data[j].GCMC;
					if (name.indexOf(keyword) != -1
							&& town == data[i].data[j].GSXZID) {
						str2 += "<tr align='center'><td>" + data[i].projectType
								+ "</td><td>" + data[i].data[j].GCMC
								+ "</td><td>" + data[i].data[j].GSXZ
								+ "</td></tr>";
					}
				}
			}
		} else if (projectType != '') {
			if (town == '' && keyword == '') {
				for (var j = 0; j < data[i].data.length; j++) {
					if (projectType == data[i].id) {
						str2 += "<tr align='center'><td>" + data[i].projectType
								+ "</td><td>" + data[i].data[j].GCMC
								+ "</td><td>" + data[i].data[j].GSXZ
								+ "</td></tr>";
					}
				}
			} else if (town != '' && keyword == '') {
				for (var j = 0; j < data[i].data.length; j++) {
					if (projectType == data[i].id
							&& town == data[i].data[j].GSXZID) {
						str2 += "<tr align='center'><td>" + data[i].projectType
								+ "</td><td>" + data[i].data[j].GCMC
								+ "</td><td>" + data[i].data[j].GSXZ
								+ "</td></tr>";
					}
				}
			} else if (town == '' && keyword != '') {
				for (var j = 0; j < data[i].data.length; j++) {
					var name = data[i].data[j].GCMC;
					if (projectType == data[i].id
							&& name.indexOf(keyword) != -1) {
						str2 += "<tr align='center'><td>" + data[i].projectType
								+ "</td><td>" + data[i].data[j].GCMC
								+ "</td><td>" + data[i].data[j].GSXZ
								+ "</td></tr>";
					}
				}
			} else if (town != '' && keyword != '') {
				for (var j = 0; j < data[i].data.length; j++) {
					var name = data[i].data[j].GCMC;
					if (projectType == data[i].id
							&& name.indexOf(keyword) != -1
							&& town == data[i].data[j].GSXZID) {
						str2 += "<tr align='center'><td>" + data[i].projectType
								+ "</td><td>" + data[i].data[j].GCMC
								+ "</td><td>" + data[i].data[j].GSXZ
								+ "</td></tr>";
					}
				}
			}
		}
	}
	if (str2 == '') {
		//str += "<tr><td colspan='3'>无相关数据！</td><tr>";
		$("#projects").append("<tr><td colspan='3'>无相关数据！</td><tr>");
	} else {
		//str += str2;
		$("#projects").append(str2);
	}
	$("#projects_head").append(str);
}
/**
 * 使用ajax从json文件中获取“工程类型”数据
 * 
 * @returns
 */
function getProjectType() {
	$.ajax({
		type : "POST",// 请求方式
		url : "../../json/projectType.json",
		dataType : "json",
		success : function(data) {
			$("#projectType").empty();
			if (data.length > 0) {
				appendProjectType(data);
			}
		}
	});
}
/**
 * 将得到的“工程类型”数据添加到下拉框中
 * 
 * @param data
 * @returns
 */
function appendProjectType(data) {
	var str = "";
	str += "<option value='' selected='selected'>不限</option>";
	for (var i = 0; i < data.length; i++) {
		str += "<option value='" + data[i].value + "'>" + data[i].name
				+ "</option>";
	}
	$("#projectType").append(str);
}
/**
 * 使用ajax从json文件中获取“乡镇”数据
 * 
 * @returns
 */
function getTowns() {
	$.ajax({
		type : "POST",// 请求方式
		url : "../../json/towns.json",
		dataType : "json",
		success : function(data) {
			$("#towns").empty();
			if (data.length > 0) {
				appendTowns(data);
			}
		}
	});
}
/**
 * 将得到的“乡镇”数据添加到下拉框中
 * 
 * @param data
 * @returns
 */
function appendTowns(data) {
	var str = "";
	str += "<option value='' selected='selected'>不限</option>";
	for (var i = 0; i < data.length; i++) {
		str += "<option value='" + data[i].value + "'>" + data[i].name
				+ "</option>";
	}
	$("#towns").append(str);
}
/**
 * 展示工程信息
 * 
 * @returns
 */
function showProjects() {
	//查询之前隐藏之前查询后弹出的信息框
	hideInfoWindow();
	var projectType = $("#projectType").val();
	var town = $("#towns").val();
	var keyword = $("#projectKeyWords").val();
	getProjects(projectType, town, keyword);
}