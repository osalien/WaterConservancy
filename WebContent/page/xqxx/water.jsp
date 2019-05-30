<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../base.jsp"%>
<%@ include file="../../map.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../../js/water.js"></script>
<script type="text/javascript" src="../../js/rain.js"></script>
<script type="text/javascript" src="../../js/warn.js"></script>
<style type="text/css">
.legend_ul li{width:110px;font-size: 12px;margin: 4px auto;}
.legend_pos_water{position: absolute;bottom: -62px;right:0px;}
.legend_pos_rain{position: absolute;bottom: -170px;right:0px;}
.caption_water{line-height: 24px;text-align:center;display: inline-block;cursor: pointer;background-color:#2e739a;color: #fff;width:110px; }
.caption_rain{line-height: 24px;text-align:center;display: inline-block;cursor: pointer;background-color:#2e739a;color: #fff;width:110px; }
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
//    二级菜单滚动表格动态加载高度
     	 	var tabBox_ht=$(".tabBox").outerHeight();
      		var tbbody_ht=win_ht-cxtab_ht-tabBox_ht-54;
      		$(".tb_body").css("height",tbbody_ht+'px');
       }

		

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
				 $(".shirk img").attr("src","../../img/tb_icon2.png");
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
				 $(".shirk img").attr("src","../../img/tb_icon.png");
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
		//图例切换
		$("#liWater").click(function() {
				$("#legend_pos_water").css('display','block');
				$("#legend_pos_rain").css('display','none');
			}); 
		$("#liRain").click(function() {
			$("#legend_pos_water").css('display','none');
			$("#legend_pos_rain").css('display','block');
		}); 
		//水情图例的收缩与弹出
		var falge1 = true;
	    $(".caption_water").click(function(){
	        if (falge1 == true) {
	            $(".legend_pos_water").animate({
	                "bottom":"0"
	            },600);
	            falge1 = false;
	        } else {
	            $(".legend_pos_water").animate({
	                "bottom":"-62px"
	            },500);
	            falge1 = true;
	        }
	    });
	  //雨情图例的收缩与弹出
		var falge2 = true;
	    $(".caption_rain").click(function(){
	        if (falge2 == true) {
	            $(".legend_pos_rain").animate({
	                "bottom":"0"
	            },600);
	            falge2 = false;
	        } else {
	            $(".legend_pos_rain").animate({
	                "bottom":"-170px"
	            },500);
	            falge2 = true;
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
		 //二级菜单查询块
        $(".tb_body").niceScroll({
            touchbehavior:false,
            railoffset:"left",
            railpadding: { top: "0", right:"0", left:"", bottom: "0" },
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
	<div class="search_tab">
		<div class="search_box clearfix">
			<div class="cx_r">
				<ul class="chaxun_tab clearfix">
					<li id="liWater" class="active" onclick="getAllWater();"><a href="javascript:void(0)">水情信息</a></li>
					<li id="liRain" onclick="getAllRain();"><a href="javascript:void(0)">雨情信息</a></li>
				</ul>
				<div class="cx_cont active">
					<div class="tabBox">
						<form action="" class="form-inline">
                            <div class="cx">
                                <div class="form-group" style="margin-right: 32px;">
                                    <label class="">名称：</label>
                                    <input type="text" class="form-control" placeholder="">
                                </div>
                                <div class="form-group" style="margin-top:0;">
                                    
                                    <label class="checkbox-inline">
                                        <input type="checkbox" value="option1" id="Wwarn" onclick="getWwarn()" style="margin-top:2px;margin-left:-12px;"> 超警戒
                                    </label>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary">查询</button>
                            <button type="reset" class="btn btn-default">重置</button>
						</form>
					</div>
					<div class="tb">
                        <table class="table table-bordered cxtb_hd" id="waterbt">
                        </table>
                      	<div class="tb_body">
                            <table class="table table-striped table-bordered table-hover" id="waterlist">
                              </table>
                        </div>
                    </div>
				</div>
				<div class="cx_cont">
					<div class="tabBox">
						<form action="" class="form-inline">
							<div class="cx">
                                <div class="form-group" style="margin-right: 32px;">
                                    <label class="">名称：</label>
                                    <input type="text" class="form-control" placeholder="">
                                </div>
                                <div class="form-group" style="margin-top:0;">
                                    <label class="checkbox-inline">
                                        <input type="checkbox" value="option1" id="Rwarn"  onclick="getRwarn()" style="margin-top:2px;margin-left:-12px;"> 超警戒
                                    </label>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary">查询</button>
                            <button type="reset" class="btn btn-default">重置</button>
						</form>
					</div>
					<div class="tb">
                        <table class="table table-bordered cxtb_hd" id="rainbt">
                        </table>
                      	<div class="tb_body">
                            <table class="table table-striped table-bordered table-hover" id="rainlist">
                              </table>
                        </div>
                    </div>
					<div><p>备注:实时雨量为当日8时到当前时间的雨量</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;24h雨量为昨日8时到今日8时的雨量</p></div>
				</div>
			</div>
		</div>
		<div class="shirk">
			<img src="../../img/tb_icon.png" alt="" />
		</div>
	</div>
	<!-- 地图图例 -->
	<div class="legend_box" style="z-index: 10">
		<!-- 水情图例 -->
		<div id="legend_pos_water" class="legend_pos_water" style="display:block">
			<span class="caption_water" id="caption_water">图例</span>
			<div class="legend">
				<ul class="legend_ul">
					<li class="clearfix"><span style="background:url('')"><img src='../../img/site1.png' height="15" width="15"/></span> <b>水位正常</b></li>
					<li class="clearfix"><span style="background:url('')"><img src='../../img/chao.gif' height="15" width="15"/></span> <b>水位超警戒</b></li>
				</ul>
			</div>
		</div>
		<!-- 雨情图例 -->
		<div id="legend_pos_rain" class="legend_pos_rain" style="display:none">
			<span class="caption_rain" id="caption_rain">图例</span>
			<div class="legend">
				<ul class="legend_ul">
					<li class="clearfix"><span style="background:url('')"><img src='../../img/point-1.png' height="10" width="10"/></span> <b>0.1-9.9mm</b></li>
					<li class="clearfix"><span style="background:url('')"><img src='../../img/point-2.png' height="10" width="10"/></span> <b>10-24.9mm</b></li>
					<li class="clearfix"><span style="background:url('')"><img src='../../img/point-3.png' height="10" width="10"/></span> <b>25-49.9mm</b></li>
					<li class="clearfix"><span style="background:url('')"><img src='../../img/point-4.png' height="10" width="10"/></span> <b>50-99.9mm</b></li>
					<li class="clearfix"><span style="background:url('')"><img src='../../img/point-5.png' height="10" width="10"/></span> <b>100-249.9mm</b></li>
					<li class="clearfix"><span style="background:url('')"><img src='../../img/point-6.png' height="10" width="10"/></span> <b>250mm以上</b></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- 地图展示 -->
	<div class="map_box" id="mapDiv" style="margin-left: 80px; z-index: 5;">

	</div>
	<!-- 地图工具 -->
	<div class="tool_box clearfix" style="z-index: 10">
		<span class="tool_shirk fl"><b class="bg">工具</b></span>
		<div class="tool clearfix fr">
			<span class="map_icon1"></span> <span class="map_icon2"></span> <span
				class="map_icon3"></span> <span class="map_icon4"></span>
		</div>
	</div>
	<!-- 天地图/一张图  -->
	<div class="map_tab" style="z-index: 10">
		<ul class="clearfix">
			<li><span class="bg_img" onclick="switchMapSource(0);"><em>天地图</em>
			</span>
				<div class="bg_map_pos clearfix">
					<span class="bg_map_chk">
					<input type="checkbox" id="switchMapTDT" onclick="switchMapTypeTDT();"/></span><span class="fl">影像</span>
				</div></li>
			<li><span class="bg_img1" onclick="switchMapSource(1);"><em>一张图</em>
			</span>
				<div class="bg_map_pos clearfix">
					<span class="bg_map_chk">
					<input type="checkbox" id="switchMap" onclick="switchMapType();"/></span><span>影像</span>
				</div></li>
		</ul>
	</div>
	

</body>
</html>