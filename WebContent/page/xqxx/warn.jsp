<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../base.jsp"%>
<%@ include file="../../map.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../../js/warn.js"></script>
</head>
<script>
	$(function() {
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
	      		var tbbody_ht=win_ht-cxtab_ht-tabBox_ht-76;
	      		$(".tb_body").css("height",tbbody_ht+'px');
	       }
		
		
		
		
		

	 	//查询中加载高度
		$(".search_box").css("height", map_ht + 'px');
		//查询块收缩
        var close = true;
        $(".shirk").click(function(){
           if (close == true) {
                $(".search_box").animate({
                    "left":"-340px"
                },200);
               $(".shirk").animate({
                   "left":"80px"
               },200);
               //$(".shirk").css("right","400px");
               close = false;
               $(".shirk img").attr("src","../../img/tb_icon.png");
            } else {
                $(".search_box").animate({
                    "left":"80px"
                },200);
               close = true;
               $(".shirk").animate({
                   "left":"492px"
               },200);
               $(".shirk img").attr("src","../../img/tb_icon2.png");
            }
        });
	     $(".map_tb").niceScroll({
	
	            touchbehavior:false,
	            railoffset:"left",
	            railpadding: { top: "0", right:"0", left:"0", bottom: "0" },
	            cursorcolor:"#dee1e2",
	            cursoropacitymax:0.7,
	            cursorwidth:5,
	            background:"#ccc",
	            cursorborderradius: "5px",//以像素为光标边界半径
	            autohidemode:"leave"
	            //railpadding:(5,0,5)
	        });
	})
</script>
<body>
	<div class="search_tab active">
		<div class="search_box clearfix">
			<div class="cx_r">
				<ul class="chaxun_tab clearfix">
					<li class="active"><a href="javascript:void(0)" onclick="warnInfoW()">水情预警</a></li>
					<li><a href="javascript:void(0)" onclick="warnInfoR()">雨情预警</a></li>
                    <!--  <li><a href="##">防汛系统2</a></li> -->
				</ul>
				<!-- 水情预警 -->
				<div class="cx_cont active">
					<!-- <div class="tabBox">
						<form action="" class="form-inline">
							<div class="cx">
								<div class="form-group">
									<label class="">站点：</label> <select class="form-control">
										<option>不限</option>
									</select>
								</div>
								<div class="form-group">
									<label class="">类型：</label> <select class="form-control sel">
										<option>不限</option>
									</select>
								</div>
							</div>
							<div class="cx clearfix">
								<div class="form-group fl" style="margin-right: 32px;">
									<label class="">名称：</label> <input type="text"
										class="form-control" placeholder="">
								</div>
								<div class="form-group fl">
									<label>时间：</label> <input class="form-control" type="text"
										data-date-format="yyyy-mm-dd">
								</div>
							</div>
							<div class="cx_chk">
								<div class="form-group">
									<label class="control-label">类型：</label> <label
										class="checkbox-inline"> <input type="checkbox"
										value="option1"> 级别一
									</label> <label class="checkbox-inline"> <input type="checkbox"
										value="option2"> 级别二
									</label> <label class="checkbox-inline"> <input type="checkbox"
										value="option3"> 级别三
									</label>
								</div>
							</div>
							<button type="submit" class="btn btn-primary">查询</button>
							<button type="submit" class="btn btn-default">重置</button>

						</form>
					</div> -->
					<div class="tb">
						<table class="table table-bordered" id="warnlistW">
						</table>
					</div>
				</div>
				<!-- 雨情预警 -->
				<div class="cx_cont">
                	<!-- <div class="tabBox">
						<form action="" class="form-inline">
							<div class="cx">
								<div class="form-group">
									<label class="">站点：</label> <select class="form-control">
										<option>不限</option>
									</select>
								</div>
								<div class="form-group">
									<label class="">类型：</label> <select class="form-control sel">
										<option>不限</option>
									</select>
								</div>
							</div>
							<div class="cx clearfix">
								<div class="form-group fl" style="margin-right: 32px;">
									<label class="">名称：</label> <input type="text"
										class="form-control" placeholder="">
								</div>
								<div class="form-group fl">
									<label>时间：</label> <input class="form-control" type="text"
										data-date-format="yyyy-mm-dd">
								</div>
							</div>
							<div class="cx_chk">
								<div class="form-group">
									<label class="control-label">类型：</label> <label
										class="checkbox-inline"> <input type="checkbox"
										value="option1"> 级别一
									</label> <label class="checkbox-inline"> <input type="checkbox"
										value="option2"> 级别二
									</label> <label class="checkbox-inline"> <input type="checkbox"
										value="option3"> 级别三
									</label>
								</div>
							</div>
							<button type="submit" class="btn btn-primary">查询</button>
							<button type="submit" class="btn btn-default">重置</button>

						</form>
					</div> -->
					<div class="tb">
						<table class="table table-bordered" id="warnlistR">
						</table>
					</div>
            	</div>
			</div>
		</div>
		<div class="shirk">
			<img src="../../img/tb_icon2.png" alt="" />
		</div>
	</div>

	<!-- 地图展示 -->
	<div class="map_box" id="mapDiv" style="margin-left: 80px; z-index: 5;">
	</div>
	<!--地图弹出定位位框-->
	<div class="bounce_box" style="display: none;">
		<ul class="nav nav-tabs">
			<li role="presentation" class="active"><a href="#home"
				aria-controls="home" role="tab" data-toggle="tab">机构列表</a></li>
			<li role="presentation"><a href="#form" aria-controls="form"
				role="tab" data-toggle="tab">信息填写</a></li>
		</ul>
		<div class="tab-content" style="padding-top: 10px;">
			<div role="tabpanel" class="tab-pane active" id="home">
				<div class="box">
					<ul class="maptable_tit clearfix">
						<li>名称</li>
						<li>名称2</li>
						<li>名称3</li>
						<li>名称4</li>
					</ul>
					<div class="map_tb">
						<table class="maptable_body">
							<tbody class="">
								<tr>
									<td>表格单元格</td>
									<td>表格单元格</td>
									<td>表格单元格</td>
									<td>表格单元格</td>
								</tr>
								<tr>
									<td>表格单元格</td>
									<td>表格单元格</td>
									<td>表格单元格</td>
									<td>表格单元格</td>
								</tr>

								<tr>
									<td>表格单元格</td>
									<td>表格单元格</td>
									<td>表格单元格</td>
									<td>表格单元格</td>
								</tr>

								<tr>
									<td>表格单元格</td>
									<td>表格单元格</td>
									<td>表格单元格</td>
									<td>表格单元格</td>
								</tr>

								<tr>
									<td>表格单元格</td>
									<td>表格单元格</td>
									<td>表格单元格</td>
									<td>表格单元格</td>
								</tr>

								<tr>
									<td>表格单元格</td>
									<td>表格单元格</td>
									<td>表格单元格</td>
									<td>表格单元格</td>
								</tr>
								<tr>
									<td>表格单元格</td>
									<td>表格单元格</td>
									<td>表格单元格</td>
									<td>表格单元格</td>
								</tr>
								<tr>
									<td>表格单元格</td>
									<td>表格单元格</td>
									<td>表格单元格</td>
									<td>表格单元格</td>
								</tr>
								<tr>
									<td>表格单元格</td>
									<td>表格单元格</td>
									<td>表格单元格</td>
									<td>表格单元格</td>
								</tr>
								<tr>
									<td>表格单元格</td>
									<td>表格单元格</td>
									<td>表格单元格</td>
									<td>表格单元格</td>
								</tr>
								<tr>
									<td>表格单元格</td>
									<td>表格单元格</td>
									<td>表格单元格</td>
									<td>表格单元格</td>
								</tr>
								<tr>
									<td>表格单元格</td>
									<td>表格单元格</td>
									<td>表格单元格</td>
									<td>表格单元格</td>
								</tr>

								<tr>
									<td>表格单元格</td>
									<td>表格单元格</td>
									<td>表格单元格</td>
									<td>表格单元格</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div role="tabpanel" class="tab-pane" id="form">2</div>
		</div>
	</div>
	<!-- 地图工具 -->
	<div class="tool_box clearfix" style="z-index: 10">
		<span class="tool_shirk fl">工具</span>
		<div class="tool clearfix fr">
			<span class="map_icon1"></span> <span class="map_icon2"></span> <span
				class="map_icon3"></span> <span class="map_icon4"></span>
		</div>
	</div>
	<!-- 地图图例 -->
	<div class="legend_box" style="z-index: 10">
		<div class="legend_pos">
			<span class="caption">图例</span>
			<div class="legend">
				<ul class="legend_ul">
					<li class="clearfix"><span></span> <b>图例一图例一</b></li>
					<li class="clearfix"><span></span> <b>图例一图例一</b></li>
					<li class="clearfix"><span></span> <b>图例一图例一</b></li>
					<li class="clearfix"><span></span> <b>图例一图例一</b></li>
					<li class="clearfix"><span></span> <b>图例一图例一</b></li>
				</ul>
			</div>
		</div>
		<div class="map_tab" style="z-index: 10">
			<ul class="clearfix">
				<li><span class="bg_img" onclick="switchMapSource(0);"><em>天地图</em>
				</span>
					<div class="bg_map_pos clearfix">
						<span class="bg_map_chk"></span> <input type="checkbox" id="switchMapTDT" onclick="switchMapTypeTDT();"/><span>影像</span>
					</div></li>
				<li><span class="bg_img1" onclick="switchMapSource(1);"><em>一张图</em>
				</span>
					<div class="bg_map_pos clearfix">
						<span class="bg_map_chk"></span> <input type="checkbox" id="switchMap" onclick="switchMapType();"/><span>影像</span>
					</div></li>
			</ul>
		</div>

	</div>

</body>
</html>