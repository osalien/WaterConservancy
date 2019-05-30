<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=7" />
    <title>ArcGIS实例</title>
    <script type="text/javascript" src="../../js/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="../../js/echarts.min.js"></script>
</head>
  <body style="width: 400px;height:220px;">
    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main" style="width: 400px;height:220px;"></div>
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));
		var x="[";
		var y="[";
        $.ajax({       
			type:"POST",//请求方式  
			url: "../../json/raina.json",//请求路径  
			dataType: "json",//数据格式  
			success: function(data){
				for (var i = 0; i < data.length; i++) {
					if(i<data.length-1){
						x+="\'"+data[i].time+"\'"+",";
						y+="\'"+data[i].rz+"\'"+",";
					}else{
						x+="\'"+data[i].time+"\'"+"]";
						y+="\'"+data[i].rz+"\'"+"]";
					}
				}
				
				x= eval('(' + x + ')');
				y= eval('(' + y + ')');
				 // 指定图表的配置项和数据
			       var option = {
			    		   title: {
			    	            text: '过程线'
			    	        },
			    	        tooltip: {
			    	            trigger: 'axis'
			    	        },
			    	        xAxis: {
			    	            data: x
			    	        },
			    	        yAxis: {
			    	            splitLine: {
			    	                show: false
			    	            }
			    	        },
			    	        toolbox: {
			    	            left: 'center',
			    	            feature: {
			    	                dataZoom: {
			    	                    yAxisIndex: 'none'
			    	                },
			    	                restore: {},
			    	                saveAsImage: {}
			    	            }
			    	        },
			    	        dataZoom: [{
			    	            startValue: '2014-06-01'
			    	        }, {
			    	            type: 'inside'
			    	        }],
			    	        visualMap: {
			    	            top: 10,
			    	            right: 10,
			    	            pieces: [{
			    	                gt: 0,
			    	                lte: 30,
			    	                color: '#096'
			    	            }],
			    	            outOfRange: {
			    	                color: '#999'
			    	            }
			    	        },
			    	        series: {
			    	            name: '水位',
			    	            type: 'line',
			    	            data: y,
			    	            markLine: {
			    	                silent: true,
			    	                data: [{
			    	                    yAxis: 30
			    	                }]
			    	            }
			    	        }
			       };

			        // 使用刚指定的配置项和数据显示图表。
			        myChart.setOption(option);
				
			}  
		});
	   

      
    </script>
  </body>
</html>
