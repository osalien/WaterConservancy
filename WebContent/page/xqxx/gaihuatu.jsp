<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../../css/map.css">
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" type="text/css" href="../../fonts/glyphicons-halflings-regular.ttf">
    <link rel="stylesheet" type="text/css" href="../../fonts/glyphicons-halflings-regular.woff">

    <script type="text/javascript" src="../../js/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="../../js/bootstrap.js"></script>
    <script type="text/javascript" src="../../js/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript" src="../../js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script type="text/javascript" src="../../js/mapShow.js"></script>
    <script type="text/javascript" src="../../js/jquery.nicescroll.min.js"></script>
    <link rel="stylesheet" type="text/css" href="http://192.168.0.139:8888/arcgis_js_api/library/3.9/3.9/js/dojo/dijit/themes/tundra/tundra.css">
    <script type="text/javascript" src="http://192.168.0.139:8888/arcgis_js_api/library/3.9/3.9/init.js"></script>
    <link rel="stylesheet" type="text/css" href="http://192.168.0.139:8888/arcgis_js_api/library/3.9/3.9/js/esri/css/esri.css" />
    <script type="text/javascript" src="../../js/gaihuatu.js"></script>

</head>
<script>
	$(function() {
		resizeDiv();
	       $(document).ready(function(){
	            resizeDiv();
	       });
	       window.onresize = function (e) {
	           resizeDiv();        
	       };
	       //概化图动态加载高度
	       function resizeDiv(){
	    	   	var win_ht = $(window).height();
	   			$(".map_box").css("height", win_ht + 'px');
	   	  		var cxtab_ht=$(".chaxun_tab").outerHeight();
	       }

	})
</script>
<body>
	<!-- 地图展示 -->
	<div class="map_box" id="mapGaiHuaTu" style="margin-left:80px; z-index: 5;">
	</div>
</body>
</html>