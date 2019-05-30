var date = new Date();
$(function() {
	$(".date-picker").datetimepicker({
		language : "zh-CN",
		autoclose : true,
		minView : "month",
		todayBtn : true,
		//startDate : "2017-09-01",
		endDate : date,
		format : "yyyy-mm-dd",
		todayHighlight : true
	});
	setToday();
	getDisasterType();
	getDisasterArea();
	showDisasterEvent();
})
function setToday(){
	var dateStr = '';
	var year = date.getFullYear();
	var month = date.getMonth()+1;
	var day = date.getDate();
	dateStr += year+'-';
	if(month<10){
		dateStr +='0'+month+'-';
	}else{
			dateStr +=month+'-';}
	if(day<10){
		dateStr += '0'+day;
	}else{
			dateStr += day;}
	$("#endTime").val(dateStr);
	//$("#date").val(date.getFullYear()+'/'+(date.getMonth()+1)+'/'+date.getDate());
}
function getDisasterType() {
	$.ajax({
		type : "POST",// 请求方式
		url : "../../json/disaster-type.json",
		dataType : "json",
		success : function(data) {
			$("#projectType").empty();
			if (data.length > 0) {
				appendDisasterType(data);
			}
		}
	})
}
function appendDisasterType(data) {
	var str = "<option selected='selected' value=''>全部</option>";
	for (var i = 0; i < data.length; i++) {
		str += "<option value='" + data[i].value + "'>" + data[i].name
				+ "</option>"
	}
	$("#disasterType").append(str);
}
function getDisasterArea() {
	$.ajax({
		type : "POST",// 请求方式
		url : "../../json/disaster-area.json",
		dataType : "json",
		success : function(data) {
			$("#projectArea").empty();
			if (data.length > 0) {
				appendDisasterArea(data);
			}
		}
	})
}
function appendDisasterArea(data) {
	var str = "<option selected='selected' value=''>全部</option>";
	for (var i = 0; i < data.length; i++) {
		str += "<option value='" + data[i].value + "'>" + data[i].name
				+ "</option>"
	}
	$("#disasterArea").append(str);
}
function showDisasterEvent() {
	var startTime = $("#startTime").val();
	var endTime = $("#endTime").val();
	var type = $("#disasterType").val();
	var area = $("#disasterArea").val();

	if (startTime > endTime) {
		$('#error-info').modal('show');
		return;
	} else {
		getDisasterEvent(startTime, endTime, type, area);
	}
}
function getDisasterEvent(startTime, endTime, type, area) {
	$.ajax({
		type : "POST",
		url : "../../json/disaster-event.json",
		dataType : "json",
		success : function(data) {
			$("#disasterList").empty();
			if (data.length > 0) {
				appendDisasterEvent(startTime, endTime, type, area, data);
			}
		}
	})
}
function appendDisasterEvent(startTime, endTime, type, area, data) {
	var str = '';
	for (i = 0; i < data.length; i++) {
		if (type == null || type == '') {
			if (area == null || area == '') {
				if (data[i].fssj >= startTime && data[i].fssj <= endTime) {
					str += "<tr><td colspan='2'>"
							+ data[i].fssj
							+ "</td><td>"
							+ data[i].szdq
							+ "</td><td>"
							+ data[i].zhlx
							+ "</td><td>"
							+ data[i].szrk
							+ "</td><td>"
							+ data[i].jjss
							+ "</td><td>"
							+ data[i].zhjs
							+ "</td></tr>";
					//<td><button type='button' class='btn btn-primary btn-sm' onclick='showDisasterInfo("+ data[i].id + ");'>详情</button></td>
				}
			} else {
				if (area == data[i].szdqid) {
					if (data[i].fssj >= startTime && data[i].fssj <= endTime) {
						str += "<tr><td colspan='2'>"
								+ data[i].fssj
								+ "</td><td>"
								+ data[i].szdq
								+ "</td><td>"
								+ data[i].zhlx
								+ "</td><td>"
								+ data[i].szrk
								+ "</td><td>"
								+ data[i].jjss
								+ "</td><td>"
								+ data[i].zhjs
								+ "</td></tr>";
					}
				}
			}
		} else {
			if (area == null || area == '') {
				if (type == data[i].zhlxid) {
					if (data[i].fssj >= startTime && data[i].fssj <= endTime) {
						str += "<tr><td colspan='2'>"
								+ data[i].fssj
								+ "</td><td>"
								+ data[i].szdq
								+ "</td><td>"
								+ data[i].zhlx
								+ "</td><td>"
								+ data[i].szrk
								+ "</td><td>"
								+ data[i].jjss
								+ "</td><td>"
								+ data[i].zhjs
								+ "</td></tr>";
					}
				}
			} else {
				if (area == data[i].szdqid && type == data[i].zhlxid) {
					if (data[i].fssj >= startTime && data[i].fssj <= endTime) {
						str += "<tr><td colspan='2'>"
								+ data[i].fssj
								+ "</td><td>"
								+ data[i].szdq
								+ "</td><td>"
								+ data[i].zhlx
								+ "</td><td>"
								+ data[i].szrk
								+ "</td><td>"
								+ data[i].jjss
								+ "</td><td>"
								+ data[i].zhjs
								+ "</td></tr>";
					}
				}
			}
		}
	}
	if (str == '') {
		str += "<tr><td colspan='7'>无相关数据</td></tr>"
	}
	$("#disasterList").append(str);
}
function showDisasterInfo(id) {
	$.ajax({
		type : "POST",
		url : "../../json/disaster-event.json",
		dataType : "json",
		success : function(data) {
			if (data.length > 0) {
				appendDisasterInfo(id, data);
			}
		}
	})
}