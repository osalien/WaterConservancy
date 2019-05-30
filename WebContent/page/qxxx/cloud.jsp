<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../base.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="http://192.168.0.139:8888/arcgis_js_api/library/3.9/3.9/js/dojo/dijit/themes/tundra/tundra.css">
<script type="text/javascript" src="http://192.168.0.139:8888/arcgis_js_api/library/3.9/3.9/init.js"></script>
<link rel="stylesheet" type="text/css" href="http://192.168.0.139:8888/arcgis_js_api/library/3.9/3.9/js/esri/css/esri.css" />
<script type="text/javascript" src="../../js/cloud.js"></script>
</head>
<script>
$(function(){
/*     var bd_ht=$(document).height();
    var hd_ht=$(".hd").height();
    var map_ht=bd_ht-hd_ht-12;
    $(".typhoon").css("height",map_ht+'px'); */
    
	resizeDiv();
	 $(document).ready(function(){
           resizeDiv();
      });
      window.onresize = function (e) {
          resizeDiv();        
      };
      //雷达图高宽动态获取
	function resizeDiv(){
		var bd_w = $(window).width();
		var win_ht=$(window).height();
		var win_wid = $(window).width();
      	 //查询中加载高度
   	 	$(".map_box").css({"height":win_ht + 'px',"width":win_wid - 80 + 'px'});
   	 	$(".typhoon").css({"height":win_ht + 'px',"width":win_wid - 80 + 'px'});
   	 	//$("#mapDiv_layer2").css({"height":win_ht + 'px',"width":win_wid - 80 + 'px'});		
		$(".typhoon_box").css("height",win_ht - 52 +"px");		
	}
	//播放条居中
	var r=$(window).width()-80-$(".pro_box").width();
    $(".pro_box").css("right",r/2+"px");
    


    //      台风点击事件
    $(".typhoon_btn").click(function(){
        hid();
       
        $(".typhoon_box").show();
    });
//  台风播放图
    clearInterval(timer);
    var i=0;
    var timer;
//  点击当时时间块，显示对应的台风图
    $(".pro_ul li").click(function(){
    	alert(1);
        $(".play b").removeClass().addClass("stop_ico");
        clearInterval(timer);
        var index=$(this).index();
        $(".pro_ul li").removeClass("active");
        for(var i=0;i<=index;i++){
            $(".pro_ul li").eq(i).addClass("active");
        }
        i=index;
        auto();
    });
    $(".play").click(function(){
        clearInterval(timer);
        auto();
    });
   
    


})
</script>
<body>
	<!-- 地图展示 -->
	 <div class="typhoon_box active">
    <div class="typhoon">
		<div class="map_box" id="mapDiv" style="z-index: 5;">
		</div>
    </div>
    <div class="pro_box clearfix">
        <div class="pro fl" style="width: 1000px;">
            <span class="typhoon_time" id="startTM"></span>
            <ul class="pro_ul clearfix" id="timeLi">
                <!-- <li value="201709011000"></li>
                <li value="201709011030"></li>
                <li value="201709011100"></li>
                <li value="201709011130"></li>
                <li value="201709011200"></li>
                <li value="201709011230"></li>
                <li value="201709011300"></li>
                <li value="201709011330"></li>
                <li value="201709011400"></li> -->
            </ul>
        </div>
        <span class="play fr">
            <b class="play_ico"></b>
            <!-- <img src="../../img/jk_play.png" alt=""/> -->
        </span>
        
    </div>
</div>
</body>
</html>