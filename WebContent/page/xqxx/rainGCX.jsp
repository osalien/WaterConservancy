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
			url: "../../json/rainb.json",//请求路径  
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
			      option = {
				    color: ['#3398DB'],
				    tooltip : {
				        trigger: 'axis',
				        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
				            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
				        }
				    },
				    grid: {
				        left: '3%',
				        right: '4%',
				        bottom: '3%',
				        containLabel: true
				    },
				    xAxis : [
				        {
				            type : 'category',
				            data : x,
				            axisTick: {
				                alignWithLabel: true
				            }
				        }
				    ],
				    yAxis : [
				        {
				            type : 'value'
				        }
				    ],
				    series : [
				        {
				            name:'雨量',
				            type:'bar',
				            barWidth: '50%',
				            data:y
				        }
				    ]
				};

			        // 使用刚指定的配置项和数据显示图表。
			        myChart.setOption(option);
				
			}  
		});
	   

      
    </script>
  </body>
</html>
