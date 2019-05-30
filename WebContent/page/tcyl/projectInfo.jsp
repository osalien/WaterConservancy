<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<title>信息框</title>
<link rel="stylesheet" type="text/css" href="../../css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="../../css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../../css/index.css">

<script type="text/javascript" src="../../js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../../js/bootstrap.js"></script>

<!-- 图片轮播 -->
<link rel='stylesheet' href='../../css/unite-gallery.css' type='text/css' />
<script type='text/javascript' src='../../js/unitegallery.min.js'></script>
<script type='text/javascript' src='../../js/ug-theme-slider.js'></script>
<style type="text/css">
#gallery {
	margin: 0 auto;
}
</style>
</head>
<script>
$(function() {	
	$("div").click(function() {
			jQuery("#gallery").unitegallery();
	});
})
</script>
<body>
	<div id="main"></div>
	<script type="text/javascript">
		//得到url中问号以及问号后面的字段，目的是得到url中的参数
		var url = location.search;
		var theRequest = new Object();
		if (url.indexOf("?") != -1) {
			var str = url.substr(1);
			strs = str.split("&");
			for (var i = 0; i < strs.length; i++) {
				theRequest[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);
			}
		}
		var dataId1 = theRequest.dataId1;
		var dataId2 = theRequest.dataId2;
		var str;
		$.ajax({
			type : "POST",//请求方式  
			url : "../../json/project.json",//请求路径  
			dataType : "json",//数据格式  
			success : function(data) {
				appendOneInfo(data, dataId1, dataId2);
			}
		});
		function appendOneInfo(data, dataId1, dataId2) {
			for (i = 0; i < data.length; i++) {
				if (data[i].id == dataId1) {
					for (j = 0; j < data[i].data.length; j++) {
						if (data[i].data[j].id == dataId2) {
							if (data[i].id == 1) {
								str = "<div class='bounce_box2'><ul class='nav nav-tabs'><li role='presentation' class='active'>"
										+ "<a href='#home' aria-controls='home' role='tab' data-toggle='tab'>基础信息</a></li><li role='presentation'>"
										+ "<a href='#form' aria-controls='form' role='tab' data-toggle='tab'>工情信息</a></li><li role='presentation'>"
										+ "<a href='#pic' aria-controls='home' role='tab' data-toggle='tab'>图片一览</a></li></ul><div class='tab-content' style='padding-top: 10px;'>"
										+ "<div role='tabpanel' class='tab-pane active' id='home'><div class='box'><div class='map_tb'><table class='maptable_body'><tbody class=''><tr>"
										+ "<td>所属乡镇</td><td>"
										+ data[i].data[j].GSXZ
										+ "</td><td>水库类型</td><td>"
										+ data[i].data[j].SKTYPE
										+ "</td></tr><tr><td>坝址流域面积</td><td>"
										+ data[i].data[j].BKZLYMJ
										+ "</td><td>主坝尺寸坝高</td><td>"
										+ data[i].data[j].BG
										+ "</td></tr><tr><td>最大泄洪流量</td><td>"
										+ data[i].data[j].ZDXHLL
										+ "</td><td>主坝尺寸坝长</td><td>"
										+ data[i].data[j].BC
										+ "</td></tr><tr><td>防洪限制水位</td><td>"
										+ data[i].data[j].FHXZSW
										+ "</td><td>正常蓄水位</td><td>"
										+ data[i].data[j].ZCXSW
										+ "</td></tr><tr><td>总库容</td><td>"
										+ data[i].data[j].ZKR
										+ "</td><td>死水位</td><td>"
										+ data[i].data[j].SSW
										+ "</td></tr><tr><td>高程系统</td><td>"
										+ data[i].data[j].GCXT
										+ "</td><td>坝顶高程</td><td>"
										+ data[i].data[j].BDGC
										+ "</td></tr><tr><td>工程级别</td><td>"
										+ data[i].data[j].GCDJ
										+ "</td></tr></tbody></table></div></div></div><div role='tabpanel' class='tab-pane' id='form'><div class='box'><div class='map_tb'><table class='maptable_body'><tbody class=''><tr>"
										+ "<td>坝体裂缝</td><td>"
										+ data[i].data[j].SKBTLF
										+ "</td><td>渗漏</td><td>"
										+ data[i].data[j].SKSL
										+ "</td></tr><tr><td>管涌</td><td>"
										+ data[i].data[j].SKGY
										+ "</td><td>塌坑</td><td>"
										+ data[i].data[j].SKTK
										+ "</td></tr><tr><td>滑坡</td><td>"
										+ data[i].data[j].SKHP
										+ "</td><td>坝坡冲刷</td><td>"
										+ data[i].data[j].SKBPCS
										+ "</td></tr><tr><td>决口</td><td>"
										+ data[i].data[j].SKJK
										+ "</td><td>漫顶</td><td>"
										+ data[i].data[j].SKMD
										+ "</td></tr><tr><td>漏洞</td><td>"
										+ data[i].data[j].SKLD
										+ "</td></tr></tbody></table></div></div></div><div role='tabpanel' class='tab-pane' id='pic'><div class='box'><div class='map_tb'>"
										+"<div class='htmleaf-container'><div id='gallery' style='display:none;'>"
										+"<img src='../../img/lunbo1.jpg' data-image='../../img/lunbo1.jpg'>"
										+"<img src='../../img/lunbo2.jpg' data-image='../../img/lunbo2.jpg'>"
										+"<img src='../../img/lunbo3.jpg' data-image='../../img/lunbo3.jpg'>"
										+"</div></div></div></div></div></div></div>";
							} else if (data[i].id == 2) {
								str = "<div class='bounce_box2'><ul class='nav nav-tabs'><li role='presentation' class='active'>"
										+ "<a href='#home' aria-controls='home' role='tab' data-toggle='tab'>基础信息</a></li><li role='presentation'>"
										+ "<a href='#form' aria-controls='form' role='tab' data-toggle='tab'>工情信息</a></li><li role='presentation'>"
										+ "<a href='#pic' aria-controls='home' role='tab' data-toggle='tab'>图片一览</a></li></ul><div class='tab-content' style='padding-top: 10px;'>"
										+ "<div role='tabpanel' class='tab-pane active' id='home'><div class='box'><div class='map_tb'><table class='maptable_body'><tbody class=''><tr>"
										+ "<td>所属乡镇</td><td>"
										+ data[i].data[j].GSXZ
										+ "</td><td>工程位置</td><td>"
										+ data[i].data[j].GCWZ
										+ "</td></tr><tr><td>所属河流</td><td>"
										+ data[i].data[j].RIVERNAME
										+ "</td><td>闸孔数量</td><td>"
										+ data[i].data[j].ZKSL
										+ "</td></tr><tr><td>所在灌区名称</td><td>"
										+ data[i].data[j].SZGQ
										+ "</td><td>水闸类型</td><td>"
										+ data[i].data[j].SZLX
										+ "</td></tr><tr><td>主要建筑物级别</td><td>"
										+ data[i].data[j].ZYJZDJ
										+ "</td><td>闸孔总净宽</td><td>"
										+ data[i].data[j].ZKZJK
										+ "</td></tr>"
										+ "<tr><td>水资源区名称</td><td>"
										+ data[i].data[j].SZYQMC
										+ "</td><td>工程建设情况 </td><td>"
										+ data[i].data[j].GCJSQK
										+ "</td></tr><tr><td>工程级别</td><td>"
										+ data[i].data[j].GCDJ
										+ "</td>"
										+ "</tr></tbody></table></div></div></div>"
										+ "<div role='tabpanel' class='tab-pane' id='form'><div class='box'><div class='map_tb'><table class='maptable_body'><tbody class=''><tr>"
										+ "<td>上游水位</td><td>"
										+ data[i].data[j].SZSYSW
										+ "米</td><td>下游水位</td><td>"
										+ data[i].data[j].SZXYSW
										+ "米</td></tr><tr><td>闸工况</td><td>"
										+ data[i].data[j].SZZGK
										+ "</td><td>闸流量</td><td>"
										+ data[i].data[j].SZZLL
										+ "立方米/秒</td></tr><tr><td>开启孔数</td><td>"
										+ data[i].data[j].SZKQKS
										+ "</td>"
										+ "</tr></tbody></table></div></div></div><div role='tabpanel' class='tab-pane' id='pic'><div class='box'><div class='map_tb'>"
										+"<div class='htmleaf-container'><div id='gallery' style='display:none;'>"
										+"<img src='../../img/lunbo1.jpg' data-image='../../img/lunbo1.jpg'>"
										+"<img src='../../img/lunbo2.jpg' data-image='../../img/lunbo2.jpg'>"
										+"<img src='../../img/lunbo3.jpg' data-image='../../img/lunbo3.jpg'>"
										+"</div></div></div></div></div></div></div>";
							} else if (data[i].id == 3) {
								str = "<div class='bounce_box2'><ul class='nav nav-tabs'><li role='presentation' class='active'>"
										+ "<a href='#home' aria-controls='home' role='tab' data-toggle='tab'>基础信息</a></li><li role='presentation'>"
										+ "<a href='#form' aria-controls='form' role='tab' data-toggle='tab'>工情信息</a></li><li role='presentation'>"
										+ "<a href='#pic' aria-controls='home' role='tab' data-toggle='tab'>图片一览</a></li></ul><div class='tab-content' style='padding-top: 10px;'>"
										+ "<div role='tabpanel' class='tab-pane active' id='home'><div class='box'><div class='map_tb'><table class='maptable_body'><tbody class=''><tr>"
										+ "<td>所属乡镇</td><td>"
										+ data[i].data[j].GSXZ
										+ "</td><td>泵站类型</td><td>"
										+ data[i].data[j].bzlx
										+ "</td></tr><tr><td>所属河流</td><td>"
										+ data[i].data[j].rivername
										+ "</td><td>工程任务</td><td>"
										+ data[i].data[j].gcrw
										+ "</td></tr><tr><td>所在灌区名称</td><td>"
										+ data[i].data[j].gqmc
										+ "</td><td>装机功率</td><td>"
										+ data[i].data[j].zjgl
										+ "</td></tr><tr><td>装机流量</td><td>"
										+ data[i].data[j].zjll
										+ "</td><td>主要建筑物级别</td><td>"
										+ data[i].data[j].jzwdj
										+ "</td></tr><tr><td>设计扬程</td><td>"
										+ data[i].data[j].sjyc
										+ "</td><td>是否为闸站工程</td><td>"
										+ data[i].data[j].sfwzzgc
										+ "</td></tr><tr><td>水泵数量</td><td>"
										+ data[i].data[j].sbsl
										+ "</td><td>是否为引泉工程</td><td>"
										+ data[i].data[j].sfwyqgc
										+ "</td></tr><tr><td>工程级别</td><td>"
										+ data[i].data[j].gcdj
										+ "</td></tr></tbody></table></div></div></div>"
										+ "<div role='tabpanel' class='tab-pane' id='form'><div class='box'><div class='map_tb'><table class='maptable_body'><tbody class=''><tr>"
										+ "<td>流量</td><td>"
										+ data[i].data[j].BZLL
										+ "立方米/秒</td><td>开机状态</td><td>"
										+ data[i].data[j].BZKJZT
										+ "</td></tr><tr><td>定子电流</td><td>"
										+ data[i].data[j].BZDZDL
										+ "安培</td><td>转子电压</td><td>"
										+ data[i].data[j].BZZZDY
										+ "伏</td></tr><tr><td>励磁电流</td><td>"
										+ data[i].data[j].BZLCDL
										+ "安培</td><td>励磁电压</td><td>"
										+ data[i].data[j].BZLCDY
										+ "伏</td></tr><tr><td>功率因素</td><td>"
										+ data[i].data[j].BZGLYS
										+ "</td><td>有功功率</td><td>"
										+ data[i].data[j].BZYGGL
										+ "瓦</td></tr><tr><td>无功功率</td><td>"
										+ data[i].data[j].BZWGGL
										+ "瓦</td><td>频率</td><td>"
										+ data[i].data[j].BZPL
										+ "赫兹</td></tr></tbody></table></div></div></div><div role='tabpanel' class='tab-pane' id='pic'><div class='box'><div class='map_tb'>"
										+"<div class='htmleaf-container'><div id='gallery' style='display:none;'>"
										+"<img src='../../img/lunbo1.jpg' data-image='../../img/lunbo1.jpg'>"
										+"<img src='../../img/lunbo2.jpg' data-image='../../img/lunbo2.jpg'>"
										+"<img src='../../img/lunbo3.jpg' data-image='../../img/lunbo3.jpg'>"
										+"</div></div></div></div></div></div></div>";
							}
							$("#main").html(str);
						}
					}
				}
			}
		}
	</script>
	<!-- <div class="htmleaf-container">
			<div id="gallery" style="display:none;">
				<img src="../../img/water1.jpg" data-image="../../img/water1.jpg">
				<img src="../../img/water1.jpg" data-image="../../img/water1.jpg">
				<img src="../../img/water1.jpg" data-image="../../img/water1.jpg">
			</div>
		</div>
	</div> -->
	<!-- <script type="text/javascript">

		jQuery(document).ready(function(){

			jQuery("#gallery").unitegallery();

		});
		
	</script> -->
</body>
</html>
