var map;
var imgl;
require([ "esri/map", "esri/layers/MapImage", "esri/layers/MapImageLayer",
		"tdlib/TDTLayer", "tdlib/TDTAnnoLayer", "tdlib/TDTImage",
		"tdlib/TDTAnnoImage", "esri/dijit/Basemap", "esri/SpatialReference",
		"esri/geometry/Point", "esri/geometry/Polygon",
		"esri/geometry/Polyline", "esri/geometry/Extent",
		"esri/geometry/ScreenPoint", "esri/layers/GraphicsLayer",
		"esri/symbols/SimpleLineSymbol", "esri/symbols/SimpleFillSymbol",
		"esri/symbols/TextSymbol", "esri/renderers/ClassBreaksRenderer",
		"esri/graphic", "esri/Color", "esri/toolbars/draw",
		"dojo/_base/connect", "esri/layers/ArcGISDynamicMapServiceLayer",
		"esri/dijit/Measurement", "esri/units", "dojo/dom", "dojo/domReady!" ],
		function(Map, MapImage, MapImageLayer, TDTLayer, TDTAnnoLayer,
				TDTImage, TDTAnnoImage, Basemap, SpatialReference, Point,
				Polygon, Polyline, Extent, ScreenPoint, GraphicsLayer,
				SimpleLineSymbol, SimpleFillSymbol, TextSymbol,
				ClassBreaksRenderer, Graphic, Color, DrawTool, connect,
				ArcGISDynamicMapServiceLayer, Measurement, Units, dom) {
			//定义天地图矢量图
			var tianditu = new TDTLayer();
			//标注
			var annolayer = new TDTAnnoLayer();
			//创建一个map
			map = new Map("mapDiv", {
				zoom : 2,
				logo : false
			});
			//设置地图坐标系类型  
			var spatialReference = new SpatialReference(4326);
			map.spatialReference = spatialReference;
			//中心基于地图位置  (设置坐标类型)
			map.centerAt(new Point(104.152819, 36.691284, new SpatialReference(
					4326)));
			//将底图添加到map中
			map.addLayer(tianditu);
			map.addLayer(annolayer);
			
			imgl = new MapImageLayer();

		});

setTimeout("getAllLi()", "500");

function getAllLi() {
	$("#timeLi").empty();
	$.ajax({
		type : "POST",//请求方式  
		url : "../../json/cloud.json",//请求路径  
		dataType : "json",//数据格式  
		success : function(data) {
			var str = "";
			for (var i = 0; i < data.length; i++) {
				str += "<li value=" + data[i].name + " onclick='aaa()'><span style='display:none;'>"+data[i].time+"</span></li>";
			}
			$("#timeLi").append(str);
			playImg(data[0].name,data[0].time);
			//$("#startTM").html(data[0].time);
			$(".pro_ul li").css("width",(850/$(".pro_ul li").length)+"px");
			
			var obj_lis = document.getElementById("timeLi").getElementsByTagName("li");
			for(i=0;i<obj_lis.length;i++){
		        obj_lis[i].onclick = function(){
		            aaa($(this).index(),$(this).attr("value"),$(this).text());
		        }
		    }
		}
	});

}
var ia=0;
var timer;
function aaa(num,name,tm){
	$(".play b").removeClass().addClass("stop_ico");
	$(".pro_ul li").removeClass("active");
    for(var i=0;i<=num;i++){
        $(".pro_ul li").eq(i).addClass("active");
    }
    ia=num;
    playImg(name,tm);
    auto();
}

//台风图播放，点击播放与暂停按钮互换
function auto(){
    if($(".play b").hasClass("play_ico")){
        $(".play b").removeClass().addClass("stop_ico");
        var len=$(".pro_ul li").length;
        timer=setInterval(function play(){
            $(".pro_ul li").eq(ia).addClass("active");
            if(ia<len){
            	playImg($(".pro_ul li").eq(ia).attr("value"),$(".pro_ul li").eq(ia).text());
            }
            if(ia==len){
                ia=-1;
                $(".pro_ul li").removeClass("active");
            }
            ia++;
        },500)
    }else{
        $(".play b").removeClass().addClass("play_ico");
        clearInterval(timer);
    }
}


function playImg(name,tm) {
	$("#startTM").html(tm);
	var latMax = 70.025016;
	var latMin = -5.025016;
	var lonMax = 150.025012;
	var lonMin = 49.974987;
	latMid = latMin + (latMax - latMin) / 2;
	lonMid = lonMin + (lonMax - lonMin) / 2;

	var m1 = new esri.layers.MapImage({
		'extent' : {
			'xmin' : lonMin,
			'ymin' : latMid,
			'xmax' : lonMid,
			'ymax' : latMax,
			'spatialReference' : {
				'wkid' : 4326
			}
		},
		'href' : "../../cloudImg/" + name + "_0_0.png"
	});
	imgl.addImage(m1);
	var m2 = new esri.layers.MapImage({
		'extent' : {
			'xmin' : lonMid,
			'ymin' : latMid,
			'xmax' : lonMax,
			'ymax' : latMax,
			'spatialReference' : {
				'wkid' : 4326
			}
		},
		'href' : "../../cloudImg/" + name + "_1_0.png"
	});
	imgl.addImage(m2);
	var m3 = new esri.layers.MapImage({
		'extent' : {
			'xmin' : lonMin,
			'ymin' : latMin,
			'xmax' : lonMid,
			'ymax' : latMid,
			'spatialReference' : {
				'wkid' : 4326
			}
		},
		'href' : "../../cloudImg/" + name + "_0_1.png"
	});
	imgl.addImage(m3);
	var m4 = new esri.layers.MapImage({
		'extent' : {
			'xmin' : lonMid,
			'ymin' : latMin,
			'xmax' : lonMax,
			'ymax' : latMid,
			'spatialReference' : {
				'wkid' : 4326
			}
		},
		'href' : "../../cloudImg/" + name + "_1_1.png"
	});
	imgl.addImage(m4);
	imgl.opacity = 0.5;
	map.addLayer(imgl);
}