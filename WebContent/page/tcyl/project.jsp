<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../base.jsp"%>
<%@ include file="../../map.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../../js/water-regime.js"></script>
<style type="text/css">
.legend_pos2 {
	position: absolute;
	bottom: -118px;
	right: 0px;
}
</style>
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
	       function resizeDiv(){
	    	   	var win_ht = $(window).height();
	    	   	var win_wid = $(window).width();
	       	 //查询中加载高度
	       	 	$(".map_box").css({"height":win_ht + 'px',"width":win_wid - 80 + 'px'});
	   			$(".search_box").css("height", win_ht + 'px');
	   	  		var cxtab_ht=$(".chaxun_tab").outerHeight();
//	    二级菜单滚动表格动态加载高度
	     	 	var tabBox_ht=$(".tabBox").outerHeight();
	      		var tbbody_ht=win_ht-cxtab_ht-tabBox_ht-54;
	      		$(".tb_body").css("height",tbbody_ht+'px');
	       }
		//二级菜单查询块
		$(".tb_body").niceScroll({
			touchbehavior : false,
			railoffset : "left",
			railpadding : {
				top : "0",
				right : "0",
				left : "",
				bottom : "0"
			},
			cursorcolor : "#dee1e2",
			cursoropacitymax : 0.7,
			cursorwidth : 5,
			background : "#ccc",
			cursorborderradius : "5px",//以像素为光标边界半径
			autohidemode : "leave"
		//railpadding:(5,0,5)
		});

		//查询块收缩
		var close = true;
		$(".shirk").click(function() {
			if (close == true) {
				$(".search_box").animate({
					"left" : "-340px"
				}, 200);
				$(".shirk").animate({
					"left" : "80px"
				}, 200);
				 $(".legend_box").animate({
	                   "left":"70px"
	               },200);
				 $(".shirk img").attr("src","../../img/tb_icon.png");
				//$(".shirk").css("right","400px");
				close = false;
			} else {
				$(".search_box").animate({
					"left" : "80px"
				}, 200);
				close = true;
				$(".shirk").animate({
					"left" : "450px"
				}, 200);
				$(".legend_box").animate({
                   "left":"440px"
               	},200);
				$(".shirk img").attr("src","../../img/tb_icon2.png");
			}
		});
		$(".map_tb").niceScroll({

			touchbehavior : false,
			railoffset : "left",
			railpadding : {
				top : "0",
				right : "0",
				left : "0",
				bottom : "0"
			},
			cursorcolor : "#dee1e2",
			cursoropacitymax : 0.7,
			cursorwidth : 5,
			background : "#ccc",
			cursorborderradius : "5px",//以像素为光标边界半径
			autohidemode : "leave"
		//railpadding:(5,0,5)
		});
		//图例的收缩与弹出，根据图例的数量需要自己设置组件的定位
		var falge = true;
		$(".caption").click(function() {
			if (falge == true) {
				$(".legend_pos2").animate({
					"bottom" : "0"
				}, 600);
				falge = false;
			} else {
				$(".legend_pos2").animate({
					"bottom" : "-118px"
				}, 500);
				falge = true;
			}
		});
		//地图收缩
	    var timer=null;
	    $(".map_tab ul").mouseenter(function(){
	        clearTimeout(timer);
	        $(".map_tab ul li:nth-child(2)").animate({"left":"-166px"});
	       // $(".map_tab").css("width","0");
	    });
	    $(".map_tab ul").mouseleave(function(){
	        timer=setTimeout(function(){
	            $(".map_tab ul li:nth-child(2)").animate({"left": "-86px"});
	            
	        },500)

	    });
	})
</script>
<body>
	<div class="search_tab">
		<div class="search_box clearfix">
			<div class="cx_r">
				<ul class="chaxun_tab clearfix">
					<li class="active"><a href="##">工程信息</a></li>
				</ul>
				<div class="cx_cont active">
					<div class="tabBox">
						<form action="" class="form-inline">
							<div class="cx">
								<div class="form-group">

									<label for="exampleInputName1" class="">工程类型：</label> 
									<select class="form-control" id="projectType" style="width: 110px">
									</select>
								</div>
								<div class="form-group">
									<label for="exampleInputName2" class=""
										style="margin-left: 5px">乡镇名称：</label> <select
										class="form-control sel" id="towns" style="width: 110px">
									</select>
								</div>
							</div>
							<div class="cx clearfix">
								<div class="form-group fl" style="margin-right: 32px;">
									<label for="exampleInputEmail2" class="">关键字：&nbsp;&nbsp;&nbsp;</label>
									<input type="text" class="form-control" id="projectKeyWords"
										placeholder="" style="width: 110px">
									<button type="button" class="btn btn-primary"
										onclick="showProjects();" style="margin-left: 20px">查询</button>
									<button type="reset" class="btn btn-default"
										style="margin-left: 6px">重置</button>
								</div>
							</div>
						</form>
					</div>
					<div class="tb">
						<table class="table table-bordered cxtb_hd" id="projects_head"></table>
						<div class="tb_body">
							<table class="table table-bordered" id="projects"></table>
						</div>
					</div>
				</div>
				<div class="cx_cont">12</div>
				<div class="cx_cont">13</div>
			</div>
		</div>
		<div class="shirk">
			<img src="../../img/tb_icon2.png" alt="" />
		</div>
	</div>
	<div class="legend_box" style="z-index: 10">
		<div class="legend_pos2">
			<span class="caption">图例</span>
			<div class="legend">
				<ul class="legend_ul">
					<li class="clearfix"><span style="background: url('')"><img
							src='../../img/project-reservoir.png' height="15" width="15" /></span><b>水库</b></li>
					<li class="clearfix"><span style="background: url('')"><img
							src='../../img/project-sluice.png' height="15" width="15" /></span><b>水闸</b></li>
					<li class="clearfix"><span style="background: url('')"><img
							src='../../img/project-pumping-green.png' height="15" width="15" /></span>
						<b>泵站：正常</b></li>
					<li class="clearfix"><span style="background: url('')"><img
							src='../../img/project-pumping-red.png' height="15" width="15" /></span>
						<b>泵站：异常</b></li>
				</ul>
			</div>
		</div>


	</div>
	<!-- 天地图图标  -->
	<div class="map_tab" style="z-index: 10">
		<ul class="clearfix">
			<li><span class="bg_img" onclick="switchMapSource(0);"><em>天地图</em></span>
				<div class="bg_map_pos clearfix">
					<span class="bg_map_chk"> <input type="checkbox"
						id="switchMapTDT" onclick="switchMapTypeTDT();" /></span><span>影像</span>
				</div>
			</li>
			<li><span class="bg_img1" onclick="switchMapSource(1);"><em>一张图</em></span>
				<div class="bg_map_pos clearfix">
					<span class="bg_map_chk"><input type="checkbox"
						id="switchMap" onclick="switchMapType();" /></span> <span>影像</span>
				</div>
			</li>
		</ul>
	</div>
	<!-- 地图展示 -->
	<div class="map_box" id="mapDiv" style="margin-left: 80px; z-index: 5;">
		<span id="info"
			style="position: absolute; left: 750px; bottom: 5px; color: #000; z-index: 50;"></span>
	</div>
	<div class="tool_box clearfix" style="z-index: 10">
		<span class="tool_shirk fl"><b class="bg">工具</b></span>
		<div class="tool clearfix fr">
			<span class="map_icon1"></span> <span class="map_icon2"></span> <span
				class="map_icon3"></span> <span class="map_icon4"></span>
		</div>

	</div>
	<!-- 天地图图标  -->
	<div class="map_tab" style="z-index: 10">
		<ul class="clearfix">
			<li><span class="bg_img" onclick="switchMapSource(0);"><em>天地图</em></span>
				<div class="bg_map_pos clearfix">
					<span class="bg_map_chk"> <input type="checkbox"
						id="switchMapTDT" onclick="switchMapTypeTDT();" /></span><span>影像</span>
				</div>
			</li>
			<li><span class="bg_img1" onclick="switchMapSource(1);"><em>一张图</em></span>
				<div class="bg_map_pos clearfix">
					<span class="bg_map_chk"><input type="checkbox"
						id="switchMap" onclick="switchMapType();" /></span> <span>影像</span>
				</div>
			</li>
		</ul>
	</div>

</body>