<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
	 dojoConfig = {  
            parseOnLoad: true,  
            packages: [{  
                name: 'tdlib',  
                location:"/ProDemo/js/tdlib"  
            }]  
        }; 
    </script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="http://192.168.0.139:8888/arcgis_js_api/library/3.9/3.9/js/dojo/dijit/themes/tundra/tundra.css">
<script type="text/javascript"
	src="http://192.168.0.139:8888/arcgis_js_api/library/3.9/3.9/init.js"></script>
<link rel="stylesheet" type="text/css"
	href="http://192.168.0.139:8888/arcgis_js_api/library/3.9/3.9/js/esri/css/esri.css" />
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript">
    var map;
    var graphicLayer;
    require(
    		[ "esri/map","tdlib/TDTLayer", "tdlib/TDTAnnoLayer", "tdlib/TDTImage",
				"tdlib/TDTAnnoImage", "esri/dijit/Basemap","esri/geometry/Circle","esri/tasks/PrintTask","esri/config",
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
    		
	function(Map, TDTLayer, TDTAnnoLayer, TDTImage, TDTAnnoImage,
					Basemap, Circle, PrintTask, esriConfig, SpatialReference,
					Point, Polygon, Polyline, Extent, ScreenPoint,
					GraphicsLayer, SimpleLineSymbol, SimpleFillSymbol,
					TextSymbol, ClassBreaksRenderer, Graphic, Color, DrawTool,
					connect, ArcGISDynamicMapServiceLayer, Measurement, Units,
					dom, SimpleLineSymbol, SimpleFillSymbol) {
				//定义底图图层
				/* var basemap = new esri.layers.ArcGISTiledMapServiceLayer(
						"http://218.94.6.92:6080/arcgis/rest/services/jssl_vector_L3_L17/MapServer",
						{
							"id" : "vec"
						}); */
				//定义天地图矢量图
				var tianditu = new TDTLayer();
				//标注
				var annolayer = new TDTAnnoLayer();
				//定义天地图影像图
				var tiandituimage = new TDTImage();
				//标注
				var annoimage = new TDTAnnoImage();
				//创建一个map
				map = new Map("mapDiv", {
					zoom : 3,
					logo : false
				});
				//设置地图坐标系类型  
				var spatialReference = new SpatialReference(4490);
				map.spatialReference = spatialReference;
				//中心基于地图位置  (设置坐标类型)
				map.centerAt(new Point(118.887863, 31.34349,
						new SpatialReference(4326)));
				//将底图添加到map中
				map.addLayer(tianditu);
				map.addLayer(annolayer);
				//定义天地图矢量图
				//创建图层  
				graphicLayer = new GraphicsLayer();
				//讲图层放入底图
				map.addLayer(graphicLayer);
				//显示级数控件
				map.showZoomSlider();
				var url = "http://typhoon.nmc.cn/weatherservice/diamond14/rainfall/24.json";
				ajaxCache(
						url,
						function(data) {
							if (data != null) {
								data = data.contours;
								for ( var item in data) {
									var latAndLong = data[item].latAndLong;
									for ( var e in latAndLong) {
										latAndLong[e].reverse();
									}
									color = data[item].color;//164,245,140,255
									var flag = data[item].symbol;
									if (flag >= 0 && flag < 10) {
										desc = "小雨";
									} else if (flag >= 10 && flag < 25) {
										desc = "中雨";
									} else if (flag >= 25 && flag < 50) {
										desc = "大雨";
									} else if (flag >= 50 && flag < 100) {
										desc = "暴雨";
									} else if (flag >= 100 && flag < 250) {
										desc = "大暴雨";
									} else if (flag >= 250) {
										desc = "特大暴雨";
									}
									var polygon = new Polygon(
											new SpatialReference({
												wkid : 4326
											}));
									polygon.addRing(latAndLong);
									var symbol = new SimpleFillSymbol(
											SimpleFillSymbol.STYLE_SOLID,
											new SimpleLineSymbol(
													SimpleLineSymbol.STYLE_SOLID,
													new Color("rgb("
															+ color.split(",",
																	3) + ")"),
													1), new Color("rgb("
													+ color.split(",", 3)
													+ ",0.6)"));
									graphicLayer.add(new Graphic(polygon,
											symbol, desc));
								}
							}
						});
			});

	function ajaxCache(url, callback) {
		$.ajax({
			type : "GET",
			url : url + "?t=" + new Date().getTime(),
			cache : true,
			dataType : "jsonp",
			success : function(data) {
				callback(data);
			},
			jsonpCallback : function() {
				var reg = /^[^a-zA-Z].*/g;
				var split = this.url.replace(/\?.*$/, "").split("/");
				var index = split.length - 1;
				var result = split[index - 1] + "_" + split[index];
				index--;
				do {
					var before = split[--index];
					var last = result;
					result = before + "_" + result;
				} while (before.match(reg) || last.match(reg));
				return result.replace(".", "_");
			}
		});
	};
</script>
</head>
<body>
	<div id="mapDiv" style="height: 650px;"></div>
</body>
</html>