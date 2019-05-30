<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../base.jsp"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <link rel="stylesheet" type="text/css" href="../../css/zTreeStyle.css">
    <script type="text/javascript" src="../../js/jquery.ztree.core-3.5.js"></script>
    <script type="text/javascript" src="../../js/jquery.ztree.excheck-3.5.js"></script>
    <script type="text/javascript" src="../../js/jquery.ztree.exedit-3.5.js"></script>
 
</head>
<script>
    var zTreeObj;
    var zNodes = [
        {name:"淳溪镇", open:true, children:[
            {name:"淳溪水闸",checked:true}, 
            {name:"淳溪水库",checked:true}]},
        {name:"古柏镇", open:true, children:[
            {name:"古柏闸东",checked:true},
            {name:"古柏闸西",checked:true}]}

    ];
    $(document).ready(function(){
        zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);

    });
    var setting={
        check: {
            enable: true,
            chkStyle: "checkbox",
            chkboxType: { "Y": "ps", "N": "ps" }

        }
    }
</script>
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
             //var ztr_wid =$(".search_box").outWidth();
            
             var jd_w =  $(window).width() - 240;
             //查询中加载高度
             $(".search_box").css("height", win_ht + 'px');
//     二级菜单滚动表格动态加载高度
             var setPic_ht=$(".set_pic").outerHeight();
             var tbbody_ht=win_ht-setPic_ht-28;
             //监控盒子动态加载宽度与高度
             $(".jd_div").css({"height":win_ht+ 'px'})
             $(".jd_r").css("width",jd_w +'px');
             //$(".jd").css({"height":tbbody_ht+'px',"width":jd_w+'px'});
             //4个监控块时动态加载高度与宽度
             //$(".jd4").css({"height":tbbody_ht/2+'px',"width":jd_w/2+'px'});
             $(".jd4").css({"height":tbbody_ht/2-20+'px',"width":jd_w/2 +'px'});
             //$(".jd4 video").css({"height":tbbody_ht/2+'px',"width":jd_w/2+'px'});
         }
         //收缩时，重新计算视频宽度
         function w(){
        	 var win_wid = $(window).width();
        	 var jd_w =  $(window).width() - 102;
        	 $(".jd_r").css("width",jd_w +'px');
        	 $(".jd4").css({"width":jd_w/2 +'px'});
         }

 		//查询块收缩
 		var close = true;
 		$(".shirk").click(function() {
 			if (close == true) {
 				$(".search_box").animate({
 					"left" : "-340px"/* ,
 					"width":0 */
 				}, 200);
 				$(".shirk").animate({
 					"left" : "80px"
 				}, 200);
 				 $(".jd_r").animate({
 	                   "marginLeft":"96px",
 	               },200);
 				$(".shirk img").attr("src","../../img/tb_icon.png");
 				close = false;				
 				w();
 			} else {
 				$(".search_box").animate({
 					"left" : "80px",
 					"width":"148px" 
 				}, 200);
 				close = true;
 				$(".shirk").animate({
 					"left" : "228px"
 				}, 200);
 				 $(".jd_r").animate({
 					"marginLeft":"234px"
 	               },200);
 				resizeDiv();
 				$(".shirk img").attr("src","../../img/tb_icon2.png");
 				
 			}
 		});
 		
     })
</script>
<body>
<div class="search_tab active">
     <div class="search_box search_jk clearfix" style="">
         <div class="cx_r"  style="padding-top:40px;">
             <div style="width: 168px;margin: 0 auto;">
                 <ul id="treeDemo" class="ztree"></ul>
             </div>
         </div>
     </div>
     <div class="shirk" style="left:228px;">
			<img src="../../img/tb_icon2.png" alt="" />
	 </div>
</div>
<!--监控块-->
<div class="jd_div">
    <div class="jd_r">
        <div class="jd clearfix">
            <div class="jd4">
            	<video src="Video1.mp4" autoplay="autoplay" loop="loop">
				</video>
            </div>
            <div class="jd4">
           		 <video src="Video2.mp4" autoplay="autoplay" loop="loop">
				</video>
            </div>
            <div class="jd4">
            	<video src="Video3.mp4" autoplay="autoplay" loop="loop">
				</video>
            </div>
            <div class="jd4">
            	<video src="Video3.mp4" autoplay="autoplay" loop="loop">
				</video>
            </div>
        </div>
        <div class="set_pic">
            <span>屏数: </span>
            <select name="" id="" class="sel" onchange="">
                <option value="">1</option>
                <option value="" selected="selected">4</option>
                <option value="">9</option>
                <option value="">16</option>
            </select>
        </div>
    </div>
</div>
</body>
</html>
