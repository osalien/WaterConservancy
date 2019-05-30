            

			var map; 
            var graphicLayer;
            var tianditu;
            var annolayer;
            require(["esri/map", 
                     "tdlib/TDTLayer",  
                     "tdlib/TDTAnnoLayer",
                     "tdlib/TDTImage",  
                     "tdlib/TDTAnnoImage",
                     "esri/dijit/Basemap",
                    "esri/SpatialReference",  
                    "esri/geometry/Point",  
                    "esri/geometry/Polygon",  
                    "esri/geometry/Polyline",  
                    "esri/geometry/Extent",  
                    "esri/geometry/ScreenPoint",  
                    "esri/layers/GraphicsLayer",  
                    "esri/symbols/SimpleLineSymbol",  
                    "esri/symbols/SimpleFillSymbol",  
                    "esri/symbols/TextSymbol",  
                    "esri/renderers/ClassBreaksRenderer",  
                    "esri/graphic",  
                    "esri/Color",  
                    "esri/toolbars/draw",  
                    "dojo/_base/connect",
                    "esri/layers/ArcGISDynamicMapServiceLayer",
                    "esri/dijit/Measurement", "esri/units", "dojo/dom", 
                    "dojo/domReady!"  
                ],  
                function(Map,TDTLayer,TDTAnnoLayer,
                		TDTImage,TDTAnnoImage,
                		Basemap,SpatialReference, Point, 
                        Polygon, Polyline, Extent, ScreenPoint, 
                        GraphicsLayer, SimpleLineSymbol, SimpleFillSymbol, 
                        TextSymbol, ClassBreaksRenderer, Graphic, Color, DrawTool, 
                        connect,ArcGISDynamicMapServiceLayer, Measurement, Units, dom) {  
            		//定义底图图层
            		var basemap = new esri.layers.ArcGISTiledMapServiceLayer("http://218.94.6.92:6080/arcgis/rest/services/jssl_vector_L3_L17/MapServer",{"id":"vec"});
            		//var basemap = new esri.layers.ArcGISTiledMapServiceLayer("http://218.94.6.92:6080/arcgis/rest/services/jssl_raster_L3_L17/MapServer",{"id":"ras"});
            		//创建一个map
            		map = new Map("mapDiv",{
            			zoom:8,
            			logo : false
            		}); 
            		
            		//设置地图坐标系类型  
                    var spatialReference = new SpatialReference(4490);  
                    map.spatialReference = spatialReference;  
                    //中心基于地图位置  (设置坐标类型)
                    map.centerAt(new Point(118.887863,31.34349, new SpatialReference(4490))); 
            		//将底图添加到map中
                    map.addLayer(basemap);
                    
                    map.infoWindow.resize(480,380);
                    
                    tianditu = new TDTLayer();
                    
                    annolayer = new TDTAnnoLayer(); 
                    
                    tiandituimage = new TDTImage();
                    
                    annoimage = new TDTAnnoImage();
                    
                    //创建图层  
                    graphicLayer = new GraphicsLayer();  
                    //显示级数控件
                    map.showZoomSlider();  
                }); 
  
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
            function hideInfoWindow(){
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
            function showPointInfo(title,content,longtitude,latitude,url){
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
        		var infoTemplate = new esri.InfoTemplate(title,content);  
        		//创建图像  
        		graphic = new esri.Graphic(pt, symbol1, null, infoTemplate);  
        		//把图像添加到刚才创建的图层上  
        		graphicLayer.add(graphic); 
            }

            /**
             * 展示点到图层上
             */
            function showinfo(data,type) { 
                //把图层添加到地图上  
                map.addLayer(graphicLayer);
               
                var graphic;
                //清空图层
                //graphicLayer.clear();
                
                if(type=="water"){
                	
                	for(var i=0;i<data.length;i++){
                		
                		//设置标注的经纬度  
                		var pt = new esri.geometry.Point(data[i].longtitude, data[i].latitude, map.spatialReference); 
                		if(data[i].shuiwei>data[i].alertz){
                			
                			var symbol1 = new esri.symbol.PictureMarkerSymbol("../../img/chao2.gif", 15, 15);  
                		}else{
                			
                			var symbol1 = new esri.symbol.PictureMarkerSymbol("../../img/site.png", 15, 15);  
                		}
                		
                		//通过src控制调用的页面
                		var connect="<div style='width:420px;height:240px; background:#fff; border:1px solid #ccc; margin-top:15px;position:relative;'>"+
                						"<iframe name='mainFrame' id='mainFrame' frameborder='0' src='waterGCX.jsp' style='margin:0 auto;width:105%;height:105%;'></iframe>"+
                						"</div>";
                		
                		//创建模版  (参数1:标题;参数2:内容)
                		var infoTemplate = new esri.InfoTemplate(data[i].name,connect);  
                		//创建图像  
                		graphic = new esri.Graphic(pt, symbol1, null, infoTemplate);  
                		//把图像添加到刚才创建的图层上  
                		graphicLayer.add(graphic); 
                		//setMapCenter(data[i].longtitude, data[i].latitude, map.getLevel());  
                	}
                }else if(type=="rain"){
                	for(var i=0;i<data.length;i++){
                		//设置标注的经纬度  
                		var pt = new esri.geometry.Point(data[i].longtitude, data[i].latitude, map.spatialReference);
                		//设置展示点的图片
                		if(data[i].yuliang>10){
                			
                			var symbol1 = new esri.symbol.PictureMarkerSymbol("../../img/chao.gif", 15, 15);  
                		}else{
                			
                			var symbol1 = new esri.symbol.PictureMarkerSymbol("../../img/site1.png", 15, 15);  
                		}  
                		//创建模版  (参数1:标题;参数2:内容)
                		var infoTemplate = new esri.InfoTemplate(data[i].name, data[i].alertz);  
                		//创建图像  
                		graphic = new esri.Graphic(pt, symbol1, null, infoTemplate);  
                		//把图像添加到刚才创建的图层上  
                		graphicLayer.add(graphic); 
                		//setMapCenter(data[i].longtitude, data[i].latitude, map.getLevel());  
                	}
                }else if(type=="warn"){
                	for(var i=0;i<data.length;i++){
                		//设置标注的经纬度  
                		var pt = new esri.geometry.Point(data[i].longtitude, data[i].latitude, map.spatialReference);
                		//设置展示点的图片
                		var symbol1 = new esri.symbol.PictureMarkerSymbol("../../img/site.png", 15, 15);  
                		//创建模版  (参数1:标题;参数2:内容)
                		var infoTemplate = new esri.InfoTemplate(data[i].name, data[i].con);  
                		//创建图像  
                		graphic = new esri.Graphic(pt, symbol1, null, infoTemplate);  
                		//把图像添加到刚才创建的图层上  
                		graphicLayer.add(graphic); 
                		//setMapCenter(data[i].longtitude, data[i].latitude, map.getLevel());  
                	}
                }else if(type=="flood"){
                	for(var i=0;i<data.length;i++){
                		//设置标注的经纬度  
                		var pt = new esri.geometry.Point(data[i].longtitude, data[i].latitude, map.spatialReference);
                		var con= "<div class='bounce_box2'><ul class='nav nav-tabs'><li role='presentation' class='active'>"
							+ "<a href='#home' aria-controls='home' role='tab' data-toggle='tab'>防汛仓库</a></li></ul><div class='tab-content' style='padding-top: 10px;'>"
							+ "<div role='tabpanel' class='tab-pane active' id='home'><div class='box'><div class='map_tb'><table class='maptable_body'><tbody class=''><tr>"
							+ "<td>避雷器(组):</td><td>"
							+ data[i].blq
							+ "</td><td>彩布条(条):</td><td>"
							+ data[i].cbt
							+ "</td></tr><tr><td>草包(件):</td><td>"
							+ data[i].cb
							+ "</td><td>发电机(台):</td><td>"
							+ data[i].fdj
							+ "</td></tr>" 
							+"<tr><td>电缆(米):</td><td>"
							+ data[i].dl
							+ "</td><td>电缆保护管(米):</td><td>"
							+ data[i].bhg
							+ "</td></tr>"
							+"<tr><td>斧子(把):</td><td>"
							+ data[i].fz
							+ "</td><td>钢桩基及附件(根):</td><td>"
							+ data[i].gz
							+ "</td></tr>"
							+"<tr><td>所属乡镇:</td><td>"
							+ data[i].qy
							+ "</td></tr></tbody></table></div></div></div>"
                		
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
                	for(var i=0;i<data.length;i++){
                		//设置标注的经纬度  
                		var pt = new esri.geometry.Point(data[i].longtitude, data[i].latitude, map.spatialReference);
                		//设置展示点的图片
                		var symbol1 = new esri.symbol.PictureMarkerSymbol("../../img/cangku.png", 15, 15);  
                		var con= "<div class='bounce_box2'><ul class='nav nav-tabs'><li role='presentation' class='active'>"
							+ "<a href='#home' aria-controls='home' role='tab' data-toggle='tab'>防汛队伍</a></li></ul><div class='tab-content' style='padding-top: 10px;'>"
							+ "<div role='tabpanel' class='tab-pane active' id='home'><div class='box'><div class='map_tb'><table class='maptable_body'><tbody class=''><tr>"
							+ "<td>负责人:</td><td>"
							+ data[i].fzr
							+ "</td><td>联系方式:</td><td>"
							+ data[i].phone
							+ "</td></tr><tr><td>所属乡镇:</td><td>"
							+ data[i].qy
							+ "</td><td>组织描述:</td><td>"
							+ data[i].zzms
							+ "</td></tr></tbody></table></div></div></div>"
                		//创建模版  (参数1:标题;参数2:内容)
                		var infoTemplate = new esri.InfoTemplate(data[i].name, con);  
                		//创建图像  
                		graphic = new esri.Graphic(pt, symbol1, null, infoTemplate);  
                		//把图像添加到刚才创建的图层上  
                		graphicLayer.add(graphic); 
                		//setMapCenter(data[i].longtitude, data[i].latitude, map.getLevel());  
                	}
                }else if(type=="yuan"){
                	for(var i=0;i<data.length;i++){
                		//设置标注的经纬度  
                		var pt = new esri.geometry.Point(data[i].longtitude, data[i].latitude, map.spatialReference);
                		//设置展示点的图片
                		var symbol1 = new esri.symbol.PictureMarkerSymbol("../../img/fxya.png", 15, 15); 
                		var con= "<div class='bounce_box2'><ul class='nav nav-tabs'><li role='presentation' class='active'>"
							+ "<a href='#home' aria-controls='home' role='tab' data-toggle='tab'>防汛预案</a></li></ul><div class='tab-content' style='padding-top: 10px;'>"
							+ "<div role='tabpanel' class='tab-pane active' id='home'><div class='box'><div class='map_tb'><table class='maptable_body'><tbody class=''><tr>"
							+ "<td>文件类型:</td><td>"
							+ data[i].wjlx
							+ "</td><td>文件类别:</td><td>"
							+ data[i].wjlb
							+ "</td></tr><tr><td>所属乡镇:</td><td>"
							+ data[i].qy
							+ "</td><td>文件描述:</td><td>"
							+ data[i].wjms
							+ "</td></tr></tbody></table></div></div></div>"
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
//function switchMapType(flag){
//	if(flag==1){
//		map.removeLayer(map.getLayer("vec"));
//		map.addLayer(new esri.layers.ArcGISTiledMapServiceLayer("http://218.94.6.92:6080/arcgis/rest/services/jssl_raster_L3_L17/MapServer",{"id":"ras"}));
//	}else{
//		map.removeLayer(map.getLayer("ras"));
//		map.addLayer(new esri.layers.ArcGISTiledMapServiceLayer("http://218.94.6.92:6080/arcgis/rest/services/jssl_vector_L3_L17/MapServer",{"id":"vec"}));
//	}
//}
function switchMapSource(flag){
	if(flag==0){
//		map.removeLayer(map.getLayer("vec"));
//		map.removeLayer(map.getLayer("ras"));
//		map.removeLayer(tiandituimage);  
//		map.removeLayer(annoimage);
		map.addLayer(tianditu);  
		map.addLayer(annolayer); 
	}else{
//		map.removeLayer(map.getLayer("vec"));
//		map.removeLayer(map.getLayer("ras"));
//		map.removeLayer(tiandituimage);  
//		map.removeLayer(annoimage);
		map.removeLayer(tianditu);  
		map.removeLayer(annolayer);
		map.addLayer(new esri.layers.ArcGISTiledMapServiceLayer("http://218.94.6.92:6080/arcgis/rest/services/jssl_vector_L3_L17/MapServer",{"id":"vec"}));
	}
}

function switchMapTypeTDT(){
		if(document.getElementById("switchMapTDT").checked){
//			map.removeLayer(map.getLayer("vec"));
//			map.removeLayer(map.getLayer("ras"));
			map.removeLayer(tianditu);  
			map.removeLayer(annolayer);
			map.addLayer(tiandituimage);  
			map.addLayer(annoimage);
			
		}else{
//			map.removeLayer(map.getLayer("vec"));
//			map.removeLayer(map.getLayer("ras"));
			map.removeLayer(tiandituimage);  
			map.removeLayer(annoimage);
			map.addLayer(tianditu);  
			map.addLayer(annolayer);
		}
}
function switchMapType(){
		if(document.getElementById("switchMap").checked){
			map.removeLayer(map.getLayer("vec"));
//			map.removeLayer(tiandituimage);  
//			map.removeLayer(annoimage);
//			map.removeLayer(tianditu);  
//			map.removeLayer(annolayer);
			map.addLayer(new esri.layers.ArcGISTiledMapServiceLayer("http://218.94.6.92:6080/arcgis/rest/services/jssl_raster_L3_L17/MapServer",{"id":"ras"}));
		}else{
			map.removeLayer(map.getLayer("ras"));
//			map.removeLayer(tiandituimage);  
//			map.removeLayer(annoimage);
//			map.removeLayer(tianditu);  
//			map.removeLayer(annolayer);
			map.addLayer(new esri.layers.ArcGISTiledMapServiceLayer("http://218.94.6.92:6080/arcgis/rest/services/jssl_vector_L3_L17/MapServer",{"id":"vec"}));
			
			
		}
}