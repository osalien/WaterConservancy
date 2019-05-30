var map;
var graphicLayer;
var g2;
var showtext;
var tianditu;
var annolayer;
var style;
var style2="";
require(
		[ "esri/map", "tdlib/TDTLayer", "tdlib/TDTAnnoLayer", "tdlib/TDTImage",
				"tdlib/TDTAnnoImage", "esri/dijit/Basemap","esri/geometry/Circle",
				"esri/SpatialReference", "esri/geometry/Point",
				"esri/geometry/Polygon", "esri/geometry/Polyline",
				"esri/geometry/Extent", "esri/geometry/ScreenPoint",
				"esri/layers/GraphicsLayer", "esri/symbols/SimpleLineSymbol",
				"esri/symbols/SimpleFillSymbol", "esri/symbols/TextSymbol",
				"esri/renderers/ClassBreaksRenderer", "esri/graphic",
				"esri/Color", "esri/toolbars/draw", "dojo/_base/connect",
				"esri/layers/ArcGISDynamicMapServiceLayer",
				"esri/dijit/Measurement", "esri/units", "dojo/dom", "esri/symbols/SimpleLineSymbol", "esri/symbols/SimpleFillSymbol",
				"dojo/domReady!" ],
		function(Map, TDTLayer, TDTAnnoLayer, TDTImage, TDTAnnoImage, Basemap,Circle,
				SpatialReference, Point, Polygon, Polyline, Extent,
				ScreenPoint, GraphicsLayer, SimpleLineSymbol, SimpleFillSymbol,
				TextSymbol, ClassBreaksRenderer, Graphic, Color, DrawTool,
				connect, ArcGISDynamicMapServiceLayer, Measurement, Units, dom,SimpleLineSymbol,SimpleFillSymbol) {
			//定义底图图层
			var basemap = new esri.layers.ArcGISTiledMapServiceLayer(
					"http://218.94.6.92:6080/arcgis/rest/services/jssl_vector_L3_L17/MapServer",
					{
						"id" : "vec"
					});
			//创建一个map
			map = new Map("mapDiv", {
				zoom : 8,
				logo : false
			});
			//设置地图坐标系类型  
			var spatialReference = new SpatialReference(4490);
			map.spatialReference = spatialReference;
			//中心基于地图位置  (设置坐标类型)
			map.centerAt(new Point(118.887863, 31.34349, new SpatialReference(
					4490)));
			//将底图添加到map中
			map.addLayer(basemap);
			//设置弹出框大小
			map.infoWindow.resize(480, 390);
			//定义天地图矢量图
			tianditu = new TDTLayer();
			//标注
			annolayer = new TDTAnnoLayer();
			//定义天地图影像图
			tiandituimage = new TDTImage();
			//标注
			annoimage = new TDTAnnoImage();
//			map.addLayer(tianditu);
//			map.addLayer(annolayer);
//			map.addLayer(tiandituimage);
//			map.addLayer(annoimage);
			//创建图层  
			graphicLayer = new GraphicsLayer();
			g2 = new GraphicsLayer();
			//创建显示站名图层
			showtext = new GraphicsLayer();
			//讲图层放入底图
			map.addLayer(showtext);
			//鼠标事件
			dojo.connect(graphicLayer, "onMouseMove", showName);
			dojo.connect(graphicLayer, "onMouseOut", mouseOutLayer);
			//显示级数控件
			map.showZoomSlider();
			//设置园的样式
	        var circleSymb = new SimpleFillSymbol(
	                SimpleFillSymbol.STYLE_NULL,
	                new SimpleLineSymbol(
	                  SimpleLineSymbol.STYLE_SHORTDASHDOTDOT,
	                  new Color([105, 105, 105]),
	                  2
	                ), new Color([255, 255, 0, 0.25])
	              );
			
			var circle;
			//防汛信息模块点击范围查询
			map.on("click",
					function(evt) {
						if (style == "all" || style == "flood"
								|| style == "yuan" || style == "organize") {
							graphicLayer.clear();
							//创建一个圆
							circle = new Circle({
								center : evt.mapPoint,//中心点
								geodesic : true,
								radius : 5000,// 设置圆的大小,单位米
							// radiusUnit: "esriMiles"//设置单位类型
							});
							map.graphics.clear();
							//将圆图案放入图层并添加到底图
							var graphic = new Graphic(circle, circleSymb);
							map.graphics.add(graphic);
							//计算范围内的数据并加载到地图上(flood.js)
							showCircle(style,style2,evt.mapPoint);
						}
					});
			
		});
/**
 * 鼠标移入事件:显示站名
 * 
 * @param e
 */
function showName(e) {
	//g2.clear();
	map.setMapCursor("pointer");//设置鼠标悬浮的样式
	var font = new esri.symbol.Font();//定义字体并设置样式
	font.setSize("10pt");
	font.setFamily("微软雅黑");
	var cpoint = event.graphic.geometry;//获取坐标
	var text = new esri.symbol.TextSymbol(event.graphic.infoTemplate.title);//设置现实的文字
	text.setFont(font);
	text.setColor(new dojo.Color([ 0, 0, 0, 100 ]));
	text.setOffset(20, -35);
	var bgGraphic = new esri.Graphic(cpoint, null);
	showtext.add(bgGraphic);
	var labelGraphic = new esri.Graphic(cpoint, text);
	showtext.add(labelGraphic);
}
/**
 * 鼠标移出事件:隐藏站名
 * @param e
 */
function mouseOutLayer(e) {
	showtext.clear();
	map.setMapCursor("default");
};
/**
 * 清空图层
 * 
 * @returns
 */
function clearLayer() {
	graphicLayer.clear();
}
/**
 * 隐藏信息框
 * @returns
 */
function hideInfoWindow() {
	//信息框在点击后弹出，在进行下一次查询后该信息框不隐藏
	//此方法在每次查询前调用一次，可以隐藏所有弹出的信息框
	map.infoWindow.hide();
}
/**
 * 展示地图上点的信息
 * @param title
 * @param content
 * @param longtitude
 * @param latitude
 * @param url
 * @returns
 */
function showPointInfo(title, content, longtitude, latitude, url) {
	//title对应data[i].name
	//把图层添加到地图上  
	//url对应"../../img/chao2.gif"
	map.addLayer(graphicLayer);
	var graphic;
	//点的经纬度
	var pt = new esri.geometry.Point(longtitude, latitude, map.spatialReference);
	//点的图像以及大小
	var symbol1 = new esri.symbol.PictureMarkerSymbol(url, 15, 15);
	//创建模版  (参数1:标题;参数2:内容)
	var infoTemplate = new esri.InfoTemplate(title, content);
	//创建图像  
	graphic = new esri.Graphic(pt, symbol1, null, infoTemplate);
	//把图像添加到刚才创建的图层上  
	graphicLayer.add(graphic);
}
/**
 * 展示点到图层上
 */
function showinfo(data, type) {
	//把图层添加到地图上  
	map.addLayer(graphicLayer);
	var graphic;
	//清空图层
	graphicLayer.clear();
	if (type == "water") {
		for (var i = 0; i < data.length; i++) {
			//设置标注的经纬度  
			var pt = new esri.geometry.Point(data[i].longtitude,
					data[i].latitude, map.spatialReference);
			if (data[i].shuiwei > data[i].alertz) {
				var symbol1 = new esri.symbol.PictureMarkerSymbol(
						"../../img/chao.gif", 15, 15);
			} else {
				var symbol1 = new esri.symbol.PictureMarkerSymbol(
						"../../img/site1.png", 15, 15);
			}
			//通过src控制调用的页面
			var connect = "<div style='width:420px;height:240px; background:#fff; border:1px solid #ccc; margin-top:15px;position:relative;'>"
					+ "<iframe name='mainFrame' id='mainFrame' frameborder='0' src='waterGCX.jsp' style='margin:0 auto;width:105%;height:100%;'></iframe>"
					+ "</div>";
			//创建模版  (参数1:标题;参数2:内容)
			var infoTemplate = new esri.InfoTemplate(data[i].name, connect);
			//创建图像  
			graphic = new esri.Graphic(pt, symbol1, null, infoTemplate);
			//把图像添加到刚才创建的图层上  
			graphicLayer.add(graphic);
			//setMapCenter(data[i].longtitude, data[i].latitude, map.getLevel());  
		}
	} else if (type == "rain") {
		for (var i = 0; i < data.length; i++) {
			//设置标注的经纬度  
			var pt = new esri.geometry.Point(data[i].longtitude,
					data[i].latitude, map.spatialReference);
			//设置展示点的图片
			if (data[i].leiji < 10) {
				var symbol1 = new esri.symbol.PictureMarkerSymbol(
						"../../img/point-1.png", 10, 10);
			} else if(data[i].leiji >= 10&&data[i].leiji < 25) {
				var symbol1 = new esri.symbol.PictureMarkerSymbol(
						"../../img/point-2.png", 10, 10);
			}else if(data[i].leiji >= 25&&data[i].leiji < 50) {
				var symbol1 = new esri.symbol.PictureMarkerSymbol(
						"../../img/point-3.png", 10, 10);
			}else if(data[i].leiji >= 50&&data[i].leiji < 100) {
				var symbol1 = new esri.symbol.PictureMarkerSymbol(
						"../../img/point-4.png", 10, 10);
			}else if(data[i].leiji >= 100&&data[i].leiji < 250) {
				var symbol1 = new esri.symbol.PictureMarkerSymbol(
						"../../img/point-5.png", 10, 10);
			}else if(data[i].leiji >= 250) {
				var symbol1 = new esri.symbol.PictureMarkerSymbol(
						"../../img/point-6.png", 10, 10);
			}
			//通过src控制调用的页面
			var connect = "<div style='width:420px;height:240px; background:#fff; border:1px solid #ccc; margin-top:15px;position:relative;'>"
					+ "<iframe name='mainFrame' id='mainFrame' frameborder='0' src='rainGCX.jsp' style='margin:0 auto;width:105%;height:100%;'></iframe>"
					+ "</div>";
			//创建模版  (参数1:标题;参数2:内容)
			var infoTemplate = new esri.InfoTemplate(data[i].name,
					connect);
			//创建图像  
			graphic = new esri.Graphic(pt, symbol1, null, infoTemplate);
			//把图像添加到刚才创建的图层上  
			graphicLayer.add(graphic);
			//setMapCenter(data[i].longtitude, data[i].latitude, map.getLevel());  
		}
	} else if (type == "warn") {
		for (var i = 0; i < data.length; i++) {
			//设置标注的经纬度  
			var pt = new esri.geometry.Point(data[i].longtitude,
					data[i].latitude, map.spatialReference);
			//设置展示点的图片
			var symbol1 = new esri.symbol.PictureMarkerSymbol(
					"../../img/site.png", 15, 15);
			//创建模版  (参数1:标题;参数2:内容)
			var infoTemplate = new esri.InfoTemplate(data[i].name, data[i].con);
			//创建图像  
			graphic = new esri.Graphic(pt, symbol1, null, infoTemplate);
			//把图像添加到刚才创建的图层上  
			graphicLayer.add(graphic);
			//setMapCenter(data[i].longtitude, data[i].latitude, map.getLevel());  
		}
	} else if(type=="flood"){
		style=type;
    	for(var i=0;i<data.length;i++){
    		//设置标注的经纬度  
    		var pt = new esri.geometry.Point(data[i].longtitude, data[i].latitude, map.spatialReference);
    		var con=flooda(data[i]);
//    		var con= "<div class='bounce_box2'><ul class='nav nav-tabs'><li role='presentation' class='active'>"
//				+ "<a href='#home' aria-controls='home' role='tab' data-toggle='tab'>防汛仓库</a></li></ul><div class='tab-content' style='padding-top: 10px;'>"
//				+ "<div role='tabpanel' class='tab-pane active' id='home'><div class='box'><div class='map_tb'><table class='maptable_body'><tbody class=''><tr>"
//				+ "<td>避雷器(组):</td><td>"
//				+ data[i].blq
//				+ "</td><td>彩布条(条):</td><td>"
//				+ data[i].cbt
//				+ "</td></tr><tr><td>草包(件):</td><td>"
//				+ data[i].cb
//				+ "</td><td>发电机(台):</td><td>"
//				+ data[i].fdj
//				+ "</td></tr>" 
//				+"<tr><td>电缆(米):</td><td>"
//				+ data[i].dl
//				+ "</td><td>电缆保护管(米):</td><td>"
//				+ data[i].bhg
//				+ "</td></tr>"
//				+"<tr><td>斧子(把):</td><td>"
//				+ data[i].fz
//				+ "</td><td>钢桩基及附件(根):</td><td>"
//				+ data[i].gz
//				+ "</td></tr>"
//				+"<tr><td>所属乡镇:</td><td>"
//				+ data[i].qy
//				+ "</td></tr></tbody></table></div></div></div>"
    		
    		//设置展示点的图片
    		var symbol1 = new esri.symbol.PictureMarkerSymbol("../../img/warehouse.png", 15, 15);  
    		//创建模版  (参数1:标题;参数2:内容)
    		var infoTemplate = new esri.InfoTemplate(data[i].name,con);  
    		//创建图像  
    		graphic = new esri.Graphic(pt, symbol1, null, infoTemplate);  
    		//把图像添加到刚才创建的图层上  
    		graphicLayer.add(graphic); 
    		//setMapCenter(data[i].longtitude, data[i].latitude, map.getLevel());  
    	}
    }else if(type=="organize"){
    	style=type;
    	for(var i=0;i<data.length;i++){
    		//设置标注的经纬度  
    		var pt = new esri.geometry.Point(data[i].longtitude, data[i].latitude, map.spatialReference);
    		//设置展示点的图片
    		var symbol1 = new esri.symbol.PictureMarkerSymbol("../../img/cangku.png", 15, 15); 
    		var con=organizea(data[i]);
//    		var con= "<div class='bounce_box2'><ul class='nav nav-tabs'><li role='presentation' class='active'>"
//				+ "<a href='#home' aria-controls='home' role='tab' data-toggle='tab'>防汛队伍</a></li></ul><div class='tab-content' style='padding-top: 10px;'>"
//				+ "<div role='tabpanel' class='tab-pane active' id='home'><div class='box'><div class='map_tb'><table class='maptable_body'><tbody class=''><tr>"
//				+ "<td>负责人:</td><td>"
//				+ data[i].fzr
//				+ "</td><td>联系方式:</td><td>"
//				+ data[i].phone
//				+ "</td></tr><tr><td>人员数(名):</td><td>"
//				+ data[i].ry
//				+ "</td><td>所属乡镇:</td><td>"
//				+ data[i].qy
//				+ "</td></tr>" 
//				+"<tr><td>组织描述:</td><td colspan='3'>"
//				+ data[i].zzms
//				+ "</td></tr></tbody></table></div></div></div>"
    		//创建模版  (参数1:标题;参数2:内容)
    		var infoTemplate = new esri.InfoTemplate(data[i].name, con);  
    		//创建图像  
    		graphic = new esri.Graphic(pt, symbol1, null, infoTemplate);  
    		//把图像添加到刚才创建的图层上  
    		graphicLayer.add(graphic); 
    		//setMapCenter(data[i].longtitude, data[i].latitude, map.getLevel());  
    	}
    }else if(type=="yuan"){
    	style=type;
    	for(var i=0;i<data.length;i++){
    		//设置标注的经纬度  
    		var pt = new esri.geometry.Point(data[i].longtitude, data[i].latitude, map.spatialReference);
    		//设置展示点的图片
    		var symbol1 = new esri.symbol.PictureMarkerSymbol("../../img/fxya.jpg", 15, 15); 
    		var con=yuana(data[i]);
//    		var con= "<div class='bounce_box2'><ul class='nav nav-tabs'><li role='presentation' class='active'>"
//				+ "<a href='#home' aria-controls='home' role='tab' data-toggle='tab'>防汛预案</a></li></ul><div class='tab-content' style='padding-top: 10px;'>"
//				+ "<div role='tabpanel' class='tab-pane active' id='home'><div class='box'><div class='map_tb'><table class='maptable_body'><tbody class=''><tr>"
//				+ "<td>文件类型:</td><td>"
//				+ data[i].wjlx
//				+ "</td><td>文件类别:</td><td>"
//				+ data[i].wjlb
//				+ "</td></tr><tr><td>创建人:</td><td>"
//				+ data[i].cjr
//				+ "</td><td>上传时间:</td><td>"
//				+ data[i].time
//				+ "</td></tr>"
//				+"<tr><td>实施时间:</td><td>"
//				+ data[i].sstime
//				+ "</td><td>所属乡镇:</td><td>"
//				+ data[i].qy
//				+ "</td></tr>" 
//				+"<tr><td>文件描述:</td><td colspan='3'>"
//				+ data[i].wjms
//				+ "</td></tr>" 
//				+"<tr><td><a href='../../upload/高淳预案.doc'>文件下载</a></td></tr></tbody></table></div></div></div>"
    		//创建模版  (参数1:标题;参数2:内容)
    		var infoTemplate = new esri.InfoTemplate(data[i].name,con);  
    		//创建图像  
    		graphic = new esri.Graphic(pt, symbol1, null, infoTemplate);  
    		//把图像添加到刚才创建的图层上  
    		graphicLayer.add(graphic); 
    		//setMapCenter(data[i].longtitude, data[i].latitude, map.getLevel());  
    	}
    }else if(type=="bengz"){
    	style=type;
    	var gcmcStr=document.getElementById('gcmcStr').value;
    	for(var i=0;i<data.length;i++){
    		var gcmc=data[i].gcmc;
    		if(data[i].gclx=='泵站'&gcmcStr!=''&gcmc.indexOf(gcmcStr)>-1){
    			//设置标注的经纬度  
        		var pt = new esri.geometry.Point(data[i].longtitude, data[i].latitude, map.spatialReference);
        		//设置展示点的图片
        		var symbol1 = new esri.symbol.PictureMarkerSymbol("../../img/project-pumping-green.png", 15, 15); 
        		var con=bengza(data[i]);
//        		var con= "<div class='bounce_box2'><ul class='nav nav-tabs'><li role='presentation' class='active'>"
//    				+ "<a href='#home' aria-controls='home' role='tab' data-toggle='tab'>泵站信息</a></li></ul><div class='tab-content' style='padding-top: 10px;'>"
//    				+ "<div role='tabpanel' class='tab-pane active' id='home'><div class='box'><div class='map_tb'><table class='maptable_body'><tbody class=''><tr>"
//    				+ "<td>时刻:</td><td>"
//    				+ data[i].time
//    				+ "</td><td>流量:</td><td>"
//    				+ data[i].zll
//    				+ "</td></tr><tr><td>上游水位:</td><td>"
//    				+ data[i].sysw
//    				+ "</td><td>下游水位:</td><td>"
//    				+ data[i].xysw
//    				+ "</td></tr>"
//    				+"<tr><td><a href='#'>详细信息</a></td>" 
//    				+"<td><a href='#'>实时监控</a></td>"
//    				+ "<td><a href='#'>视频监控</a></td>"
//    				+ "</tr></tbody></table></div></div></div>"
        		//创建模版  (参数1:标题;参数2:内容)
        		var infoTemplate = new esri.InfoTemplate(data[i].gcmc,con);  
        		//创建图像  
        		graphic = new esri.Graphic(pt, symbol1, null, infoTemplate);  
        		//把图像添加到刚才创建的图层上  
        		graphicLayer.add(graphic); 
        		//setMapCenter(data[i].longtitude, data[i].latitude, map.getLevel());
        	}else if(data[i].gclx=='泵站'&gcmcStr==''){
        		//设置标注的经纬度  
        		var pt = new esri.geometry.Point(data[i].longtitude, data[i].latitude, map.spatialReference);
        		//设置展示点的图片
        		var symbol1 = new esri.symbol.PictureMarkerSymbol("../../img/project-pumping-green.png", 15, 15); 
        		var con=bengza(data[i]);
//        		var con= "<div class='bounce_box2'><ul class='nav nav-tabs'><li role='presentation' class='active'>"
//    				+ "<a href='#home' aria-controls='home' role='tab' data-toggle='tab'>泵站信息</a></li></ul><div class='tab-content' style='padding-top: 10px;'>"
//    				+ "<div role='tabpanel' class='tab-pane active' id='home'><div class='box'><div class='map_tb'><table class='maptable_body'><tbody class=''><tr>"
//    				+ "<td>时刻:</td><td>"
//    				+ data[i].time
//    				+ "</td><td>流量:</td><td>"
//    				+ data[i].zll
//    				+ "</td></tr><tr><td>上游水位:</td><td>"
//    				+ data[i].sysw
//    				+ "</td><td>下游水位:</td><td>"
//    				+ data[i].xysw
//    				+ "</td></tr>"
//    				+"<tr><td><a href='#'>详细信息</a></td>" 
//    				+"<td><a href='#'>实时监控</a></td>"
//    				+ "<td><a href='#'>视频监控</a></td>"
//    				+ "</tr></tbody></table></div></div></div>"
        		//创建模版  (参数1:标题;参数2:内容)
        		var infoTemplate = new esri.InfoTemplate(data[i].gcmc,con);  
        		//创建图像  
        		graphic = new esri.Graphic(pt, symbol1, null, infoTemplate);  
        		//把图像添加到刚才创建的图层上  
        		graphicLayer.add(graphic); 
        		//setMapCenter(data[i].longtitude, data[i].latitude, map.getLevel());
        	}
    	}
    }else if(type=="shuiz"){
    	style=type;
    	var gcmcStr=document.getElementById('gcmcStr').value;
    	for(var i=0;i<data.length;i++){
    		var gcmc=data[i].gcmc;
    		if(data[i].gclx=='水闸'&gcmcStr!=''&gcmc.indexOf(gcmcStr)>-1){
    			//设置标注的经纬度  
        		var pt = new esri.geometry.Point(data[i].longtitude, data[i].latitude, map.spatialReference);
        		//设置展示点的图片
        		var symbol1 = new esri.symbol.PictureMarkerSymbol("../../img/project-sluice.png", 15, 15); 
        		var con=shuiza(data[i]);
//        		var con= "<div class='bounce_box2'><ul class='nav nav-tabs'><li role='presentation' class='active'>"
//    				+ "<a href='#home' aria-controls='home' role='tab' data-toggle='tab'>水闸信息</a></li></ul><div class='tab-content' style='padding-top: 10px;'>"
//    				+ "<div role='tabpanel' class='tab-pane active' id='home'><div class='box'><div class='map_tb'><table class='maptable_body'><tbody class=''><tr>"
//    				+ "<td>时刻:</td><td>"
//    				+ data[i].time
//    				+ "</td><td>流量:</td><td>"
//    				+ data[i].zll
//    				+ "</td></tr><tr><td>闸上水位:</td><td>"
//    				+ data[i].sysw
//    				+ "</td><td>闸下水位:</td><td>"
//    				+ data[i].xysw
//    				+ "</td></tr>"
//    				+"<tr><td><a href='#'>详细信息</a></td>" 
//    				+"<td><a href='#'>实时监控</a></td>"
//    				+ "<td><a href='#'>视频监控</a></td>"
//    				+ "</tr></tbody></table></div></div></div>"
        		//创建模版  (参数1:标题;参数2:内容)
        		var infoTemplate = new esri.InfoTemplate(data[i].gcmc,con);  
        		//创建图像  
        		graphic = new esri.Graphic(pt, symbol1, null, infoTemplate);  
        		//把图像添加到刚才创建的图层上  
        		graphicLayer.add(graphic); 
        		//setMapCenter(data[i].longtitude, data[i].latitude, map.getLevel()); 
    		}else if(data[i].gclx=='水闸'&gcmcStr==''){
    			//设置标注的经纬度  
        		var pt = new esri.geometry.Point(data[i].longtitude, data[i].latitude, map.spatialReference);
        		//设置展示点的图片
        		var symbol1 = new esri.symbol.PictureMarkerSymbol("../../img/project-sluice.png", 15, 15); 
        		var con=shuiza(data[i]);
//        		var con= "<div class='bounce_box2'><ul class='nav nav-tabs'><li role='presentation' class='active'>"
//    				+ "<a href='#home' aria-controls='home' role='tab' data-toggle='tab'>水闸信息</a></li></ul><div class='tab-content' style='padding-top: 10px;'>"
//    				+ "<div role='tabpanel' class='tab-pane active' id='home'><div class='box'><div class='map_tb'><table class='maptable_body'><tbody class=''><tr>"
//    				+ "<td>时刻:</td><td>"
//    				+ data[i].time
//    				+ "</td><td>流量:</td><td>"
//    				+ data[i].zll
//    				+ "</td></tr><tr><td>闸上水位:</td><td>"
//    				+ data[i].sysw
//    				+ "</td><td>闸下水位:</td><td>"
//    				+ data[i].xysw
//    				+ "</td></tr>"
//    				+"<tr><td><a href='#'>详细信息</a></td>" 
//    				+"<td><a href='#'>实时监控</a></td>"
//    				+ "<td><a href='#'>视频监控</a></td>"
//    				+ "</tr></tbody></table></div></div></div>"
        		//创建模版  (参数1:标题;参数2:内容)
        		var infoTemplate = new esri.InfoTemplate(data[i].gcmc,con);  
        		//创建图像  
        		graphic = new esri.Graphic(pt, symbol1, null, infoTemplate);  
        		//把图像添加到刚才创建的图层上  
        		graphicLayer.add(graphic); 
        		//setMapCenter(data[i].longtitude, data[i].latitude, map.getLevel()); 
    		}
    		 
    	}
    }
    else if(type=="gqall"){
    	style=type;
    	var gcmcStr=document.getElementById('gcmcStr').value;
    	for(var i=0;i<data.length;i++){
    		var gcmc=data[i].gcmc;
    		if(data[i].gclx=="泵站"){
    			if(gcmcStr!=''&gcmc.indexOf(gcmcStr)>-1){
    				//设置标注的经纬度  
            		var pt = new esri.geometry.Point(data[i].longtitude, data[i].latitude, map.spatialReference);
            		//设置展示点的图片
            		var symbol1 = new esri.symbol.PictureMarkerSymbol("../../img/project-pumping-green.png", 15, 15);
            		var con=bengza(data[i]);
//            		var con= "<div class='bounce_box2'><ul class='nav nav-tabs'><li role='presentation' class='active'>"
//        				+ "<a href='#home' aria-controls='home' role='tab' data-toggle='tab'>泵站信息</a></li></ul><div class='tab-content' style='padding-top: 10px;'>"
//        				+ "<div role='tabpanel' class='tab-pane active' id='home'><div class='box'><div class='map_tb'><table class='maptable_body'><tbody class=''><tr>"
//        				+ "<td>时刻:</td><td>"
//        				+ data[i].time
//        				+ "</td><td>流量:</td><td>"
//        				+ data[i].zll
//        				+ "</td></tr><tr><td>上游水位:</td><td>"
//        				+ data[i].sysw
//        				+ "</td><td>下游水位:</td><td>"
//        				+ data[i].xysw
//        				+ "</td></tr>"
//        				+"<tr><td>上游水位:</td><td>"
//        				+ data[i].sysw
//        				+ "</td><td>下游水位:</td><td>"
//        				+ data[i].xysw
//        				+ "</td></tr>"
//        				+"<tr><td><a href='#'>详细信息</a></td>" 
//        				+"<td><a href='#'>实时监控</a></td>"
//        				+ "<td><a href='#'>视频监控</a></td>"
//        				+ "</tr></tbody></table></div></div></div>"
            		//创建模版  (参数1:标题;参数2:内容)
            		var infoTemplate = new esri.InfoTemplate(data[i].gcmc,con);  
            		//创建图像  
            		graphic = new esri.Graphic(pt, symbol1, null, infoTemplate);  
            		//把图像添加到刚才创建的图层上  
            		graphicLayer.add(graphic);
    			}else if(gcmcStr==''){
    				//设置标注的经纬度  
            		var pt = new esri.geometry.Point(data[i].longtitude, data[i].latitude, map.spatialReference);
            		//设置展示点的图片
            		var symbol1 = new esri.symbol.PictureMarkerSymbol("../../img/project-pumping-green.png", 15, 15);
            		var con=bengza(data[i]);
//            		var con= "<div class='bounce_box2'><ul class='nav nav-tabs'><li role='presentation' class='active'>"
//        				+ "<a href='#home' aria-controls='home' role='tab' data-toggle='tab'>泵站信息</a></li></ul><div class='tab-content' style='padding-top: 10px;'>"
//        				+ "<div role='tabpanel' class='tab-pane active' id='home'><div class='box'><div class='map_tb'><table class='maptable_body'><tbody class=''><tr>"
//        				+ "<td>时刻:</td><td>"
//        				+ data[i].time
//        				+ "</td><td>流量:</td><td>"
//        				+ data[i].zll
//        				+ "</td></tr><tr><td>上游水位::</td><td>"
//        				+ data[i].sysw
//        				+ "</td><td>下游水位:</td><td>"
//        				+ data[i].xysw
//        				+ "</td></tr>"
//        				+"<tr><td><a href='#'>详细信息</a></td>" 
//        				+"<td><a href='#'>实时监控</a></td>"
//        				+ "<td><a href='#'>视频监控</a></td>"
//        				+ "</tr></tbody></table></div></div></div>"
            		//创建模版  (参数1:标题;参数2:内容)
            		var infoTemplate = new esri.InfoTemplate(data[i].gcmc,con);  
            		//创建图像  
            		graphic = new esri.Graphic(pt, symbol1, null, infoTemplate);  
            		//把图像添加到刚才创建的图层上  
            		graphicLayer.add(graphic);
    			}
    			
    		}else if(data[i].gclx=="水闸"){
    			if(gcmcStr!=''&gcmc.indexOf(gcmcStr)>-1){
    				//设置标注的经纬度  
            		var pt = new esri.geometry.Point(data[i].longtitude, data[i].latitude, map.spatialReference);
            		//设置展示点的图片
            		var symbol1 = new esri.symbol.PictureMarkerSymbol("../../img/project-sluice.png", 15, 15);
            		var con=shuiza(data[i]);
//            		var con= "<div class='bounce_box2'><ul class='nav nav-tabs'><li role='presentation' class='active'>"
//        				+ "<a href='#home' aria-controls='home' role='tab' data-toggle='tab'>水闸信息</a></li></ul><div class='tab-content' style='padding-top: 10px;'>"
//        				+ "<div role='tabpanel' class='tab-pane active' id='home'><div class='box'><div class='map_tb'><table class='maptable_body'><tbody class=''><tr>"
//        				+ "<td>时刻:</td><td>"
//        				+ data[i].time
//        				+ "</td><td>流量</td><td>"
//        				+ data[i].zll
//        				+ "</td></tr><tr><td>闸上水位:</td><td>"
//        				+ data[i].sysw
//        				+ "</td><td>闸下水位:</td><td>"
//        				+ data[i].xysw
//        				+ "</td></tr>"
//        				+"<tr><td><a href='#'>详细信息</a></td>" 
//        				+"<td><a href='#'>实时监控</a></td>"
//        				+ "<td><a href='#'>视频监控</a></td>"
//        				+ "</tr></tbody></table></div></div></div>"
            		//创建模版  (参数1:标题;参数2:内容)
            		var infoTemplate = new esri.InfoTemplate(data[i].gcmc,con);  
            		//创建图像  
            		graphic = new esri.Graphic(pt, symbol1, null, infoTemplate);  
            		//把图像添加到刚才创建的图层上  
            		graphicLayer.add(graphic); 
    				
    			}else if(gcmcStr==''){
    				//设置标注的经纬度  
            		var pt = new esri.geometry.Point(data[i].longtitude, data[i].latitude, map.spatialReference);
            		//设置展示点的图片
            		var symbol1 = new esri.symbol.PictureMarkerSymbol("../../img/project-sluice.png", 15, 15);
            		var con=shuiza(data[i]);
//            		var con= "<div class='bounce_box2'><ul class='nav nav-tabs'><li role='presentation' class='active'>"
//        				+ "<a href='#home' aria-controls='home' role='tab' data-toggle='tab'>水闸信息</a></li></ul><div class='tab-content' style='padding-top: 10px;'>"
//        				+ "<div role='tabpanel' class='tab-pane active' id='home'><div class='box'><div class='map_tb'><table class='maptable_body'><tbody class=''><tr>"
//        				+ "<td>时刻:</td><td>"
//        				+ data[i].time
//        				+ "</td><td>流量:</td><td>"
//        				+ data[i].zll
//        				+ "</td></tr><tr><td>闸上水位:</td><td>"
//        				+ data[i].sysw
//        				+ "</td><td>闸下水位:</td><td>"
//        				+ data[i].xysw
//        				+ "</td></tr>"
//        				+"<tr><td><a href='#'>详细信息</a></td>" 
//        				+"<td><a href='#'>实时监控</a></td>"
//        				+ "<td><a href='#'>视频监控</a></td>"
//        				+ "</tr></tbody></table></div></div></div>"
            		//创建模版  (参数1:标题;参数2:内容)
            		var infoTemplate = new esri.InfoTemplate(data[i].gcmc,con);  
            		//创建图像  
            		graphic = new esri.Graphic(pt, symbol1, null, infoTemplate);  
            		//把图像添加到刚才创建的图层上  
            		graphicLayer.add(graphic); 
    			}
    			
    		}
    	} 
    }
} 

/**
 * 展示点到图层上
 */
function showinfoAll(data, all,type2) {
	style=all;
	style2=type2;
	//把图层添加到地图上  
	map.addLayer(graphicLayer);
	var graphic;
	//清空图层
	//graphicLayer.clear();
	 if(type2=="ck"){
    	for(var i=0;i<data.length;i++){
    		//设置标注的经纬度  
    		var pt = new esri.geometry.Point(data[i].longtitude, data[i].latitude, map.spatialReference);
    		var con=flooda(data[i]);
//    		var con= "<div class='bounce_box2'><ul class='nav nav-tabs'><li role='presentation' class='active'>"
//				+ "<a href='#home' aria-controls='home' role='tab' data-toggle='tab'>防汛仓库</a></li></ul><div class='tab-content' style='padding-top: 10px;'>"
//				+ "<div role='tabpanel' class='tab-pane active' id='home'><div class='box'><div class='map_tb'><table class='maptable_body'><tbody class=''><tr>"
//				+ "<td>避雷器(组):</td><td>"
//				+ data[i].blq
//				+ "</td><td>彩布条(条):</td><td>"
//				+ data[i].cbt
//				+ "</td></tr><tr><td>草包(件):</td><td>"
//				+ data[i].cb
//				+ "</td><td>发电机(台):</td><td>"
//				+ data[i].fdj
//				+ "</td></tr>" 
//				+"<tr><td>电缆(米):</td><td>"
//				+ data[i].dl
//				+ "</td><td>电缆保护管(米):</td><td>"
//				+ data[i].bhg
//				+ "</td></tr>"
//				+"<tr><td>斧子(把):</td><td>"
//				+ data[i].fz
//				+ "</td><td>钢桩基及附件(根):</td><td>"
//				+ data[i].gz
//				+ "</td></tr>"
//				+"<tr><td>所属乡镇:</td><td>"
//				+ data[i].qy
//				+ "</td></tr></tbody></table></div></div></div>"
    		
    		//设置展示点的图片
    		var symbol1 = new esri.symbol.PictureMarkerSymbol("../../img/warehouse.png", 15, 15);  
    		//创建模版  (参数1:标题;参数2:内容)
    		var infoTemplate = new esri.InfoTemplate(data[i].name,con);  
    		//创建图像  
    		graphic = new esri.Graphic(pt, symbol1, null, infoTemplate);  
    		//把图像添加到刚才创建的图层上  
    		graphicLayer.add(graphic); 
    		//setMapCenter(data[i].longtitude, data[i].latitude, map.getLevel());  
    	}
    }else if(type2=="dw"){
    	for(var i=0;i<data.length;i++){
    		//设置标注的经纬度  
    		var pt = new esri.geometry.Point(data[i].longtitude, data[i].latitude, map.spatialReference);
    		//设置展示点的图片
    		var symbol1 = new esri.symbol.PictureMarkerSymbol("../../img/cangku.png", 15, 15);  
    		var con=organizea(data[i]);
//    		var con= "<div class='bounce_box2'><ul class='nav nav-tabs'><li role='presentation' class='active'>"
//				+ "<a href='#home' aria-controls='home' role='tab' data-toggle='tab'>防汛队伍</a></li></ul><div class='tab-content' style='padding-top: 10px;'>"
//				+ "<div role='tabpanel' class='tab-pane active' id='home'><div class='box'><div class='map_tb'><table class='maptable_body'><tbody class=''><tr>"
//				+ "<td>负责人:</td><td>"
//				+ data[i].fzr
//				+ "</td><td>联系方式:</td><td>"
//				+ data[i].phone
//				+ "</td></tr><tr><td>人员数(名):</td><td>"
//				+ data[i].ry
//				+ "</td><td>所属乡镇:</td><td>"
//				+ data[i].qy
//				+ "</td></tr>" 
//				+"<tr><td>组织描述:</td><td colspan='3'>"
//				+ data[i].zzms
//				+ "</td></tr></tbody></table></div></div></div>"
    		//创建模版  (参数1:标题;参数2:内容)
    		var infoTemplate = new esri.InfoTemplate(data[i].name, con);  
    		//创建图像  
    		graphic = new esri.Graphic(pt, symbol1, null, infoTemplate);  
    		//把图像添加到刚才创建的图层上  
    		graphicLayer.add(graphic); 
    		//setMapCenter(data[i].longtitude, data[i].latitude, map.getLevel());  
    	}
    }else if(type2=="ya"){
    	for(var i=0;i<data.length;i++){
    		//设置标注的经纬度  
    		var pt = new esri.geometry.Point(data[i].longtitude, data[i].latitude, map.spatialReference);
    		//设置展示点的图片
    		var symbol1 = new esri.symbol.PictureMarkerSymbol("../../img/fxya.jpg", 15, 15); 
    		var con=yuana(data[i]);
//    		var con= "<div class='bounce_box2'><ul class='nav nav-tabs'><li role='presentation' class='active'>"
//				+ "<a href='#home' aria-controls='home' role='tab' data-toggle='tab'>防汛预案</a></li></ul><div class='tab-content' style='padding-top: 10px;'>"
//				+ "<div role='tabpanel' class='tab-pane active' id='home'><div class='box'><div class='map_tb'><table class='maptable_body'><tbody class=''><tr>"
//				+ "<td>文件类型:</td><td>"
//				+ data[i].wjlx
//				+ "</td><td>文件类别:</td><td>"
//				+ data[i].wjlb
//				+ "</td></tr><tr><td>创建人:</td><td>"
//				+ data[i].cjr
//				+ "</td><td>上传时间:</td><td>"
//				+ data[i].time
//				+ "</td></tr>"
//				+"<tr><td>实施时间:</td><td>"
//				+ data[i].sstime
//				+ "</td><td>所属乡镇:</td><td>"
//				+ data[i].qy
//				+ "</td></tr>" 
//				+"<tr><td>文件描述:</td><td colspan='3'>"
//				+ data[i].wjms
//				+ "</td></tr>" 
//				+"<tr><td><a href='../../upload/高淳预案.doc'>文件下载</a></td></tr></tbody></table></div></div></div>"
    		//创建模版  (参数1:标题;参数2:内容)
    		var infoTemplate = new esri.InfoTemplate(data[i].name,con); 
    		//创建图像  
    		graphic = new esri.Graphic(pt, symbol1, null, infoTemplate);  
    		//把图像添加到刚才创建的图层上  
    		graphicLayer.add(graphic); 
    		//setMapCenter(data[i].longtitude, data[i].latitude, map.getLevel());  
    	}
    }
} 


function setMapCenter(xx, yy, level) {
	var point = new esri.geometry.Point(xx, yy, map.spatialReference);
	map.centerAndZoom(point, level);
}
/**
 * 地图切换
 * @param flag 1:影像  0:矢量
 */
function switchMapSource(flag) {
	if (flag == 0) {
		map.addLayer(tianditu);
		map.addLayer(annolayer);
	} else {
		map.removeLayer(tianditu);
		map.removeLayer(annolayer);
		map.addLayer(new esri.layers.ArcGISTiledMapServiceLayer(
						"http://218.94.6.92:6080/arcgis/rest/services/jssl_vector_L3_L17/MapServer",
						{
							"id" : "vec"
						}));
	}
}

function switchMapTypeTDT() {
	if (document.getElementById("switchMapTDT").checked) {
		map.removeLayer(tianditu);
		map.removeLayer(annolayer);
		map.addLayer(tiandituimage);
		map.addLayer(annoimage);

	} else {
		map.removeLayer(tiandituimage);
		map.removeLayer(annoimage);
		map.addLayer(tianditu);
		map.addLayer(annolayer);
	}
}
function switchMapType() {
	if (document.getElementById("switchMap").checked) {
		map.removeLayer(map.getLayer("vec"));
		map.addLayer(new esri.layers.ArcGISTiledMapServiceLayer(
						"http://218.94.6.92:6080/arcgis/rest/services/jssl_raster_L3_L17/MapServer",
						{
							"id" : "ras"
						}));
	} else {
		map.removeLayer(map.getLayer("ras"));
		map.addLayer(new esri.layers.ArcGISTiledMapServiceLayer(
						"http://218.94.6.92:6080/arcgis/rest/services/jssl_vector_L3_L17/MapServer",
						{
							"id" : "vec"
						}));

	}
}

function Rad(d){
    return d * Math.PI / 180.0;//经纬度转换成三角函数中度分表形式。
 }
/**
 * 计算两点之间的距离,返回公里数
 */
function GetDistance(lat1,lng1,lat2,lng2){
	  
    var radLat1 = Rad(lat1);
    var radLat2 = Rad(lat2);
    var a = radLat1 - radLat2;
    var  b = Rad(lng1) - Rad(lng2);
    var s = 2 * Math.asin(Math.sqrt(Math.pow(Math.sin(a/2),2) +
    Math.cos(radLat1)*Math.cos(radLat2)*Math.pow(Math.sin(b/2),2)));
    s = s *6378.137 ;// EARTH_RADIUS;
    s = Math.round(s * 10000) / 10000; //输出为公里
    //s=s.toFixed(4);
    return s;
}
/**
 * 点击列表高亮展示点坐标
 */
function showPoint(x,y){
	g2.clear();
	map.addLayer(g2);
	//设置标注的经纬度  
	var pt = new esri.geometry.Point(x,y, map.spatialReference);
	//设置展示点的图片
	var symbol1 = new esri.symbol.PictureMarkerSymbol(
			"../../img/chao2.gif", 15, 15);
	//创建图像  
	var graphic = new esri.Graphic(pt, symbol1, null, null);
	//把图像添加到刚才创建的图层上  
	g2.add(graphic);
	
	setTimeout("g2.clear()",2000);
}