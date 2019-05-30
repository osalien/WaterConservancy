var date = new Date();
$(function() {
	$(".date-picker").datetimepicker({
		language : "zh-CN",
		autoclose : true,
		minView : "month",
		todayBtn : true,
		// startDate : "2017-09-01",
		endDate : date,
		format : "yyyy-mm-dd",
		todayHighlight : true
	});
	setToday();
	showDisasterFlood();
})
function setToday() {
	var dateStr = '';
	var year = date.getFullYear();
	var month = date.getMonth() + 1;
	var day = date.getDate();
	dateStr += year + '-';
	if (month < 10) {
		dateStr += '0' + month + '-';
	} else {
		dateStr += month + '-';
	}
	if (day < 10) {
		dateStr += '0' + day;
	} else {
		dateStr += day;
	}
	$("#endTime").val(dateStr);
	// $("#date").val(date.getFullYear()+'/'+(date.getMonth()+1)+'/'+date.getDate());
}
function showDisasterFlood() {
	var startTime = $("#startTime").val();
	var endTime = $("#endTime").val();
	if (startTime > endTime) {
		$('#error-info').modal('show');
		return;
	} else {
		getDisasterFlood(startTime, endTime);
	}
}
function getDisasterFlood(startTime, endTime) {
	$.ajax({
		type : "POST",
		url : "../../json/disaster-flood.json",
		dataType : "json",
		success : function(data) {
			$("#showTime").empty();
			$("#disasterList").empty();
			if (data.length > 0) {
				appendDisasterFlood(startTime, endTime, data);
			}
		}
	})
}
function appendDisasterFlood(startTime, endTime, data) {
	var timeStr = startTime + '~' + endTime;
	var str = "";
	// 数据累加的变量
	var xian=0, xz=0, cun=0, jd=0, jwh=0, shouzrk=0.0, hswkrk=0.0, jjzyrk=0.0, syczxj=0, xjys=0, cz=0.0, nc=0.0, shfw=0.0, dtfw=0.0, dljszdss=0.0, swrk=0, shizrk=0, ssrkxj=0, zs=0, zjjjzss=0.0;
	for (var i = 0; i < data.length; i++) {
		if (data[i].fssj >= startTime && data[i].fssj <= endTime) {
			xian += parseInt(data[i].xian);
			xz += parseInt(data[i].xz);
			cun += parseInt(data[i].cun);
			jd += parseInt(data[i].jd);
			jwh += parseInt(data[i].jwh);
			shouzrk += parseFloat(data[i].shouzrk);
			hswkrk += parseFloat(data[i].hswkrk);
			jjzyrk += parseFloat(data[i].jjzyrk);
			syczxj += parseInt(data[i].syczxj);
			xjys += parseInt(data[i].xjys);
			cz += parseFloat(data[i].cz);
			nc += parseFloat(data[i].nc);
			shfw += parseFloat(data[i].shfw);
			dtfw += parseFloat(data[i].dtfw);
			dljszdss += parseFloat(data[i].dljszdss);
			swrk += parseInt(data[i].swrk);
			shizrk += parseInt(data[i].shizrk);
			ssrkxj += parseInt(data[i].ssrkxj);
			zs += parseInt(data[i].zs);
			zjjjzss += parseFloat(data[i].zjjjzss);
			str += "<tr><td colspan='2'>"
					+ data[i].dq
					+ "</td><td>"
					+ data[i].xian
					+ "</td><td>"
					+ data[i].xz
					+ "</td><td>"
					+ data[i].cun
					+ "</td><td>"
					+ data[i].jd
					+ "</td><td>"
					+ data[i].jwh
					+ "</td><td>"
					+ data[i].shouzrk
					+ "</td><td>"
					+ data[i].hswkrk
					+ "</td><td>"
					+ data[i].jjzyrk
					+ "</td><td>"
					+ data[i].syczxj
					+ "</td><td>"
					+ data[i].xjys
					+ "</td><td>"
					+ data[i].cz
					+ "</td><td>"
					+ data[i].nc
					+ "</td><td>"
					+ data[i].shfw
					+ "</td><td>"
					+ data[i].dtfw
					+ "</td><td>"
					+ data[i].dljszdss
					+ "</td><td>"
					+ data[i].swrk
					+ "</td><td>"
					+ data[i].shizrk
					+ "</td><td>"
					+ data[i].ssrkxj
					+ "</td><td>"
					+ data[i].zs
					+ "</td><td>"
					+ data[i].zjjjzss + "</td></tr>";
		}
	}
	if (str == '') {
		str += "<tr><td colspan='22'>无相关数据</td></tr>"
	} else {
		var strSum = "<tr><td colspan='2'>合计</td><td>" + xian + "</td><td>"
				+ xz + "</td><td>" + cun + "</td><td>" + jd + "</td><td>" + jwh
				+ "</td><td>" + shouzrk.toFixed(3) + "</td><td>" + hswkrk.toFixed(3) + "</td><td>"
				+ jjzyrk.toFixed(3) + "</td><td>" + syczxj + "</td><td>" + xjys
				+ "</td><td>" + cz.toFixed(3) + "</td><td>" + nc.toFixed(3) + "</td><td>" + shfw.toFixed(3)
				+ "</td><td>" + dtfw.toFixed(3) + "</td><td>" + dljszdss.toFixed(2) + "</td><td>"
				+ swrk + "</td><td>" + shizrk + "</td><td>" + ssrkxj
				+ "</td><td>" + zs + "</td><td>" + zjjjzss.toFixed(3) + "</td></tr>";
		$("#disasterList").append(strSum);
	}
	$("#showTime").html(timeStr);
	$("#disasterList").append(str);
}
