<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap-datetimepicker.min.css">
	<link rel="stylesheet" type="text/css" href="fonts/glyphicons-halflings-regular.eot">
    <link rel="stylesheet" type="text/css" href="fonts/glyphicons-halflings-regular.ttf">
    <link rel="stylesheet" type="text/css" href="fonts/glyphicons-halflings-regular.woff">
    <link rel="stylesheet" type="text/css" href="fonts/glyphicons-halflings-regular.woff2">
    <script type="text/javascript" src="js/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/mapShow.js"></script>
    <script type="text/javascript" src="js/jquery.nicescroll.min.js"></script>
	<script type="text/javascript" src="./js/menu.js"></script>
</head>
<script>

    $(function(){
    	getMenu('1');
    	resizeDiv();
 	    $(document).ready(function(){
             resizeDiv();
        });
        window.onresize = function (e) {
            resizeDiv();
          
        };
        function resizeDiv(){
        	var win_ht=$(window).height();
            var hd_ht=$(".hd").outerHeight();
            var map_ht=win_ht - hd_ht;
            $("#frameId").css("height",map_ht + 'px');
            $(".menu").css("height",map_ht + 'px');
          //查询中加载高度
    		$(".search_box").css("height", win_ht + 'px');
        }
        

    })
</script>
<body style="overflow:hidden;">


<div class="navbar navbar-default hd" role="navigation" style="border:none;border-radius:0;">
    <div class="navbar-header fl">
　     	  <a href="##" class="navbar-brand hd_tit" style="padding-top: 10px;"><img src="img/logo2.png" alt="" style="height: 30px;"/></a>
    </div>
    <div class="yj fl">
        <span class="yjmsg_tit"><img src="img/yj.gif" alt=""/>预警信息</span>
        <!--显示信息-->
        <div class="yj_pos" style="display: none;">
            <span class="tit">提示信息<b class="yj_close">X</b></span>
            <div class="yj_list">
                <ul>
                    <li>
                        <span class="yj_tit fl">
                            <b>预警信息:</b>
                            <b class="yj_cont">内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容</b>
                            <a href="javascript:;" class="yj_btn">[清除]</a>
                            <a href="javascript:;" class="yj_btn">[处理]</a>
                        </span>
                    </li>
                    <li>
                        <span class="yj_tit fl">
                            <b>预警信息:</b>
                            <b class="yj_cont">内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容</b>
                            <a href="javascript:;" class="yj_btn">[清除]</a>
                            <a href="javascript:;" class="yj_btn">[处理]</a>
                        </span>
                    </li>
                    <li>
                        <span class="yj_tit fl">
                            <b>预警信息:</b>
                            <b class="yj_cont">内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容</b>
                            <a href="javascript:;" class="yj_btn">[清除]</a>
                            <a href="javascript:;" class="yj_btn">[处理]</a>
                        </span>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div class="hdimg fr clearfix">
        <span>欢迎您，王小川</span>
        <span class="out_box">
            <!--<img src="img/out.png" alt=""/>-->
            <span class="out_btn">退出</span>
        </span>
    </div>
    <ul class="nav navbar-nav fr hd_nav">
        <li><a href="##">首页</a></li>
        <li class="active_new"><a href="javascript:void(0);" onclick="getMenu('1');">汛情信息</a></li>
        <li><a href="javascript:void(0);" onclick="getMenu('2');">图层一览</a></li>
        <li><a href="javascript:void(0);" onclick="getMenu('4');">气象信息</a></li>
        <li><a href="javascript:void(0);" onclick="getMenu('5');">灾情统计</a></li>
        <li><a href="javascript:void(0);" onclick="getMenu('6');">工情信息</a></li>
        <li><a href="javascript:void(0);" onclick="getMenu('3');">防汛信息</a></li>
        <li><a href="javascript:void(0);" onclick="getMenu('7');">视频展示</a></li>
    </ul>
</div> 

<div class="left_area" style="z-index: 55">
    <ul class="menu" id="menu">
    </ul>
</div>
<iframe id="frameId" name="frameName" scrolling="no"  style="width:100%;border-width: 0px;margin:0;padding:0;" src="page/qxxx/cloud.jsp"></iframe>
</body>
</html>
