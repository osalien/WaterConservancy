<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script type="text/javascript" src="../../js/jquery-1.10.2.js"></script>
	<script src="../../js/imgplayer/jquery-ui.min.js"></script>
	<script src="../../js/imgplayer/jquery.timers-1.2.js"></script>
	<script src="../../js/imgplayer/jquery.easing.1.3.js"></script>
	<script src="../../js/imgplayer/jquery.galleryview-3.0-dev.js"></script>
	<link type="text/css" rel="stylesheet" href="../../css/imgplayer/jquery.galleryview-3.0-dev.css" />

</head>
<style>
    @media screen and (min-width: 1360px){
        .gv_panel {left: 262px;}
        
    }
     @media screen and (min-width: 1600px){
        .gv_panel {left: 320px;}
        
    }

    @media screen and (min-width: 1900px){
        .gv_panel {left: 380px;}
    }
</style>
<script>

/* $(function(){
	left:(jd_w-562)/2+'px'
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
         var jd_w =  $(window).width() -82;                
         var tbbody_ht=win_ht-20; 
         //监控盒子动态加载宽度与高度
        // $(".jd_div").css({"height":win_ht + 'px'})
        // $(".jd_r").css("width",jd_w+'px');
         //$(".gv_galleryWrap").css({"height":tbbody_ht+'px',"width":jd_w+'px'});
        // $(".gv_gallery").css({"height":tbbody_ht+'px',"width":jd_w+'px'});
         //$(".gv_panelWrap").css({"height":tbbody_ht+'px',"width":jd_w+'px'});
        
         //$(".gv_panel").css({"height":tbbody_ht-82+'px',"width":jd_w+'px'});
         //$(".gv_panel img").css({"height":tbbody_ht-50+'px',"width":jd_w+'px'});
        // $(".gv_panelWrap").css({"height":tbbody_ht+'px',"width":jd_w+'px'});
         //4个监控块时动态加载高度与宽度
        // $(".jd4").css({"height":tbbody_ht/2+'px',"width":jd_w/2+'px'});
        
     }
     
     
    
     
})*/
</script>
<body style="margin-top:2px;">
<div>
	<ul id="myGallery">
		<li><img src="../../img/radar-img/1.png" alt="" /></li>
		<li><img src="../../img/radar-img/2.png" alt="" /></li>
		<li><img src="../../img/radar-img/3.png" alt="" /></li>
		<li><img src="../../img/radar-img/4.png" alt="" /></li>
		<li><img src="../../img/radar-img/5.png" alt="" /></li>
		<li><img src="../../img/radar-img/6.png" alt="" /></li>
		<li><img src="../../img/radar-img/7.png" alt="" /></li>
		<li><img src="../../img/radar-img/8.png" alt="" /></li>
		<li><img src="../../img/radar-img/9.png" alt="" /></li>
		<li><img src="../../img/radar-img/10.png" alt="" /></li>
		<li><img src="../../img/radar-img/11.png" alt="" /></li>
		<li><img src="../../img/radar-img/12.png" alt="" /></li>
		<li><img src="../../img/radar-img/13.png" alt="" /></li>
		<li><img src="../../img/radar-img/14.png" alt="" /></li>
	</ul>
</div>
<script>
$(function(){

	$('#myGallery').galleryView();
	

});

</script>

<!-- 代码 结束 -->

</body>
</html>