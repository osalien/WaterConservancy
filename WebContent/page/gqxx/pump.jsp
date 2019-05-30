<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../base.jsp"%>
<%@ include file="../../map.jsp"%>
<%-- <%@ include file="./materials.jsp"%> --%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="../../js/pump.js"></script>
    <style type="text/css">
		.legend_ul li{width:110px;font-size: 12px;margin: 4px auto;}
		.legend_pos_flood{position: absolute;bottom: -70px;right:0px;}
		.caption_flood{line-height: 24px;text-align:center;display: inline-block;cursor: pointer;background-color:#2e739a;color: #fff;width:110px; }
	</style>
</head>
<script>
    $(function(){
        var bd_ht = $(document).height();
     	//var hd_ht = $(".hd").height();
     	var map_ht = bd_ht - 54;
     	$(".map_box").css("height", map_ht + 'px');
     	 $(".search_box").css("height",map_ht+'px');
//      二级菜单滚动表格动态加载高度

        var cxtab_ht=$(".chaxun_tab").outerHeight();
        var tabBox_ht=$(".tabBox").outerHeight();
        var tbbody_ht=map_ht-cxtab_ht-tabBox_ht-76;
        $(".tb_body").css("height",tbbody_ht+'px');

     	
     	//查询中加载高度
     	$(".search_box").css("height",(map_ht-4) + 'px')

         $(".menu li").click(function(){
             var index = $(this).index();
             $(this).addClass("active").siblings().removeClass('active');
             $(".search_tab").eq(index).addClass("active").siblings().removeClass('active');
             $(".search_box").css({
                 "left":"80px"
             },200);
             close = true;
             $(".shirk").css({
                 "right":"-422px"
             },200);

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
  				//$(".shirk").css("right","400px");
  				close = false;
  				$(".shirk img").attr("src","../../img/tb_icon.png");
  			} else {
  				$(".search_box").animate({
  					"left" : "80px"
  				}, 200);
  				close = true;
  				$(".shirk").animate({
  					"left" : "492px"
  				}, 200);
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
 	 //图例的收缩与弹出，根据图例的数量需要自己设置组件的定位
 		var falge = true;
 	    $(".caption_flood").click(function(){
 	        if (falge == true) {
 	            $(".legend_pos_flood").animate({
 	                "bottom":"0"
 	            },600);
 	            falge = false;
 	        } else {
 	            $(".legend_pos_flood").animate({
 	                "bottom":"-70px"
 	            },500);
 	            falge = true;
 	        }
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
    
     window.onload=pump;
</script>
<body>
    <div class="search_tab active">
        <div class="search_box clearfix">
            <div class="cx_r">
                <ul class="chaxun_tab clearfix">
                    <li class="active"><a href="##">工情信息</a></li>
                </ul>
                <div class="cx_cont active">
                    <div class="tabBox">
                        <form action="" class="form-inline">
                            <div class="cx">
                            <div class="form-group" style="margin-right:6px;">
                                    <label for="exampleInputName2" class="">枢纽类别：</label>
                                    <select class="form-control sel" id="exampleInputName1">
                                    	<option value="0">全部</option>
                                    	<option value="1">江都枢纽</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputName1" class="">工程类型：</label>
                                    <select class="form-control" id="exampleInputName2">
                                        <option value="0">全部</option>
                                        <option value="水闸">水闸</option>
                                        <option value="泵站">泵站</option>
                                        <option value="水库">水库</option>
                                        <option value="堤防">堤防(段)</option>
                                        <option value="蓄滞洪区">蓄滞洪区</option>
                                        <option value="治河工程">治河工程</option>
                                    </select>
                                </div>
                                 <div class="form-group">
                                    <label>工程名称：</label>
                    				<input type="text" class="form-control" id="gcmcStr" placeholder="">
                                </div>
                            </div>
                            <button type="button" class="btn btn-primary" onclick="pump();">查询</button>
                            <button type="reset" class="btn btn-default">重置</button>
                        </form>
                    </div>
                     <div class="tb">
                        <table class="table table-bordered cxtb_hd" id="pumpbt">
                        </table>
                      	<div class="tb_body">
                            <table class="table table-striped table-bordered table-hover" id="pumplist">
                              </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="shirk">
            <img src="../../img/tb_icon2.png" alt=""/>
        </div>
    </div>



<div class="tool_box clearfix" style="z-index: 10">
    <span class="tool_shirk fl">工具</span>
    <div class="tool clearfix fr">
        <span class="map_icon1"></span>
        <span class="map_icon2"></span>
        <span class="map_icon3"></span>
        <span class="map_icon4"></span>
    </div>

</div>
<div class="legend_box" style="z-index: 10">
    <div id="legend_pos_flood" class="legend_pos_flood" style="display:block">
        <span class="caption_flood" id="caption_flood">图例</span>
        <div class="legend">
            <ul class="legend_ul">
                <li class="clearfix">
                    <span><img src='../../img/project-pumping-green.png' height="15" width="15"/></span>
                    <b>泵站</b>
                </li>
                <li class="clearfix">
                    <span><img src='../../img/project-sluice.png' height="15" width="15"/></span>
                    <b>水闸</b>
                </li>
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
<!-- 地图展示 -->
<div class="map_box" id="mapDiv" style="margin-left: 6%;z-index: 5;">
	<span id="info" style="position:absolute; left:750px; bottom:5px; color:#000; z-index:50;"></span> 
</div>

<!--地图弹出定位位框-->
<div class="bounce_box"  style="display: none;">
    <ul class="nav nav-tabs">
        <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">机构列表</a></li>
        <li role="presentation"><a href="#form" aria-controls="form" role="tab" data-toggle="tab">信息填写</a></li>
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
</body>
</html>
