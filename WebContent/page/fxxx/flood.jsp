<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../base.jsp"%>
<%@ include file="../../map.jsp"%>
<%-- <%@ include file="./materials.jsp"%> --%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="../../js/flood.js"></script>
    <script type="text/javascript" src="../../js/floodlb.js"></script>
    <style type="text/css">
		.legend_ul li{width:110px;font-size: 12px;margin: 4px auto;}
		.legend_pos_flood{position: absolute;bottom: -90px;right:0px;}
		.caption_flood{line-height: 24px;text-align:center;display: inline-block;cursor: pointer;background-color:#2e739a;color: #fff;width:110px; }
	</style>
</head>
<script>
    $(function(){
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
  		$(".shirk").click(function(){
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
  				close = false;
  				$(".shirk img").attr("src","../../img/tb_icon2.png");
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
 	                "bottom":"-90px"
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
	    //地图收缩
	    var timer=null;
	    $(".map_tab ul").mouseenter(function(){
	        clearTimeout(timer);
	        $(".map_tab ul li:nth-child(2)").animate({"left":"-166px"});
	    });
	    $(".map_tab ul").mouseleave(function(){
	        timer=setTimeout(function(){
	            $(".map_tab ul li:nth-child(2)").animate({"left": "-86px"});
	            
	        },500)

	    });
 	 
 	 
     })
    
     window.onload=flood;
</script>
<body>
<div class="search_tab active">
    <div class="search_box clearfix">
        <div class="cx_r">
            <ul class="chaxun_tab clearfix">
                <li class="active"><a href="##">防汛仓库信息</a></li>
            </ul>
            <div class="cx_cont active">
                <div class="tabBox">
                    <form action="" class="form-inline">
                        <div class="cx">
                        <div class="form-group" style="margin-right:6px;">
                                <label for="exampleInputName2" class="">类型：</label>
                                <select class="form-control sel" id="exampleInputName2">
                                	<option value="0">全部</option>
                                    <option value="1">防汛仓库</option>
                                    <option value="2">防汛队伍</option>
                                    <option value="3">防汛预案</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputName1" class="">所属乡镇：</label>
                                <select class="form-control" id="exampleInputName1">
                                    <option value="0">全县</option>
                                    <option value="1">淳溪镇</option>
                                    <option value="2">桠溪镇</option>
                                    <option value="3">漆桥镇</option>
                                    <option value="4">固城镇</option>
                                    <option value="5">阳江镇</option>
                                    <option value="6">东坝镇</option>
                                    <option value="7">古柏镇</option>
                                </select>
                            </div>
                        </div>
                        <button type="button" class="btn btn-primary" onclick="flood();">查询</button>
                        <button type="reset" class="btn btn-default">重置</button>
                    </form>
                </div>
                 <div class="tb">
                    <table class="table table-bordered cxtb_hd" id="floodbt">
                    </table>
                  	<div class="tb_body">
                        <table class="table table-striped table-bordered table-hover" id="floodlist">
                          </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="shirk">
        <img src="../../img/tb_icon.png" alt=""/>
    </div>
</div>
<div class="map_tab" style="z-index: 10">
	<ul class="clearfix">
		<li>
			<span class="bg_img" onclick="switchMapSource(0);"><em>天地图</em></span>
			<div class="bg_map_pos clearfix">
				<span class="bg_map_chk"> <input type="checkbox" id="switchMapTDT" onclick="switchMapTypeTDT();"/></span><span>影像</span>
			</div>
		</li>
		<li>
			<span class="bg_img1" onclick="switchMapSource(1);"><em>一张图</em></span>
			<div class="bg_map_pos clearfix">
				<span class="bg_map_chk"> <input type="checkbox" id="switchMap" onclick="switchMapType();"/></span><span>影像</span>
			</div>
		</li>
	</ul>
</div>
<div class="tool_box clearfix" style="z-index: 10">
    <span class="tool_shirk fl"><b class="bg">工具</b></span>
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
                    <span><img src='../../img/warehouse.png' height="15" width="15"/></span>
                    <b>防汛仓库</b>
                </li>
                <li class="clearfix">
                    <span><img src='../../img/cangku.png' height="15" width="15"/></span>
                    <b>防汛队伍</b>
                </li>
                <li class="clearfix">
                    <span><img src='../../img/fxya.jpg' height="15" width="15"/></span>
                    <b>防汛预案</b>
                </li>
            </ul> 
        </div>
    </div>


</div>
<!-- 地图展示 -->
<div class="map_box" id="mapDiv" style="margin-left: 80px;z-index: 5;">
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
