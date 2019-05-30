var map; 
	    var graphicLayer;
	    require(["esri/map", 
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
	        function(Map,Basemap,SpatialReference, Point, Polygon, Polyline, Extent, ScreenPoint, GraphicsLayer, SimpleLineSymbol, SimpleFillSymbol, TextSymbol, ClassBreaksRenderer, Graphic, Color, DrawTool, connect,ArcGISDynamicMapServiceLayer, Measurement, Units, dom) {  
	    		esri.config.defaults.io.corsDetection=false;	
	    		//去掉logo
	    		var options = {logo : false};
	    		//定义底图图层
	    		var basemap = new esri.layers.ArcGISDynamicMapServiceLayer("http://180.104.120.197:8090/arcgis/rest/services/peitu_10/MapServer", {
                    "id":"ght",
                    "opacity":1,
                    "visible":true
                });
	    		//创建一个map
	    		map = new Map("mapGaiHuaTu",{
	    			zoom:8,
	    			logo : false
	    		}); 
	            map.addLayer(basemap);
	        });  