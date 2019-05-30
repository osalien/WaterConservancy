<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../base.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" type="text/css" href="../../css/zTreeStyle.css">
    <script type="text/javascript" src="../../js/jquery.ztree.core-3.5.js"></script>
    <script type="text/javascript" src="../../js/jquery.ztree.excheck-3.5.js"></script>
    <script type="text/javascript" src="../../js/jquery.ztree.exedit-3.5.js"></script>
    <script type="text/javascript" src="../../js/pumping.js"></script>
    <script type="text/javascript" src="../../js/sluice.js"></script>
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
    		var jd_w =  $(window).width() - 200;
    	 //查询中加载高度
   			$(".search_box").css("height", win_ht + 'px');  	  		
//    二级菜单滚动表格动态加载高度
      		
      		$(".ztr").css("height", win_ht + 'px');
      		$(".pic").css("width",jd_w +'px');
       }
       //收缩时，重新计算视频宽度
       function w(){
      	 var win_wid = $(window).width();
      	 var jd_w =  $(window).width() - 90;
      	 $(".pic").css("width",jd_w +'px');
      	
       }
		//查询块收缩
		var close = true;
		$(".shirk").click(function() {
			if (close == true) {
				$(".search_box").animate({
					"left" : "-32px"
				}, 200);
				$(".shirk").animate({
					"left" : "112px"
				}, 200);
				$(".pic").animate({
	                   "marginLeft":"84px",
	               },200);
				w();
				close = false;
				$(".shirk img").attr("src","../../img/tb_icon2.png");
			} else {
				$(".search_box").animate({
					"left" : "80px"
				}, 200);
				close = true;
				$(".shirk").animate({
					"left" : "112px"
				}, 200);
				$(".pic").animate({
	                   "marginLeft":"196px",
	               },200);
				resizeDiv();
				$(".shirk img").attr("src","../../img/tb_icon.png");
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
		
	})
</script>
<script>
    var name1;
    var zTreeObj;
    var zNodes = [
        {id:0,name:"淳溪镇", open:true, children:[
            {id:1,pid:0,name:"固城闸"}, 
            {id:2,pid:0,name:"固城站"}]},
        {id:10,name:"古柏镇", open:true, children:[
            {id:3,pid:10,name:"古柏闸"},
            {id:4,pid:10,name:"古柏站"}]},
        {id:8,name:"阳江镇", open:true, children:[
            {id:3,pid:8,name:"阳江闸"},
            {id:4,pid:8,name:"阳江站"}]},
        {id:9,name:"淳溪镇", open:true, children:[
            {id:3,pid:9,name:"淳溪闸"},
            {id:4,pid:9,name:"淳溪站"}]},

    ];
    $(document).ready(function(){
        zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
		name1=zNodes[0].children[0].name;
    $("#frameId").attr('src',"./Sluice.jsp?name="+name1);
    });
    var setting={
        check: {
            enable: false

        },
        callback: {
    		onClick: zTreeOnClick
    	}
    }
    function zTreeOnClick(event, treeId, treeNode){
    	var url='';
    	var name2=treeNode.name.substring(2);
    	if(name2=="闸"){
    		url="./Sluice.jsp?name="+treeNode.name;
    		$("#frameId").attr('src',url);
    	}else if(name2=="站"){
    		url="./pumping.jsp?name="+treeNode.name;
    		$("#frameId").attr('src',url);
    	}
    	
    }
</script>
<body>
<div class="search_box" style="width: 112px;">
	<div class="ztr" style="float: left;padding-top:40px;">
		<div style="width: 106px;">
	    	<ul id="treeDemo" class="ztree"></ul>
	    </div>
    </div>
	<div class="shirk" style="left:112px;">
			<img src="../../img/tb_icon.png" alt="" />
	 </div>
</div>
	
<div class="pic" style="margin-left:196px;">
	<iframe id="frameId" name="frameName" scrolling="no"  style="width:100%;height:610px;border-width: 0px;margin:0;padding:0;" ></iframe>
</div>
</body>
</html>