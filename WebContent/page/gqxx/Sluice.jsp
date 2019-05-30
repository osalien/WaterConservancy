<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="../../js/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="../../js/sluice.js"></script>
    <style type="text/css">
    	/* .gq_a{width: 135px;height: 97px;}
    	.gq_b{width: 100px;height: 30px;background-color: #C1C1C1;color: #ffffff;text-align:center;margin:0 auto; position: relative;top:40px;line-height:30px;}
    	.gq_c{width:135px;height:85%;  background-image:url('../../img/gongqingimg/03zm.png');background-size:100% 100%; background-repeat: no-repeat; position: relative;top:120px;left: -1px;z-index: 2;}
    	.gq_d{width: 130px;height: 90px; position: relative;top:165px;}
    	.gq_input{background-color: #ffffff;text-align:center;margin-top: 8px;width: 120px;margin-left: 7px;}
    	.gq_e{width:135px;height:240px;background-image:url('../../img/gongqingimg/zqtd-zm.png');background-size:100% 100%; background-repeat: no-repeat;position: relative;left: -1px;z-index: 1;} */
		.gq_a{width: 135px;height: 97px;}
    	.gq_b{width: 100px;height: 30px;background-color: #C1C1C1;color: #ffffff;text-align:center;margin:0 auto; position: relative;top:40px;line-height:30px;}
    	.gq_c{width:135px;height:88%;  background-image:url('../../img/gongqingimg/03zm.png');background-size:100% 100%; background-repeat: no-repeat; position: relative;top:0;left: -1px;z-index: 1;}
    	.gq_d{width: 130px;height: 90px; position: relative;/* top:144px; */top:33%;z-index:1}
    	.gq_input{background-color: #ffffff;text-align:center;margin-top: 8px;width: 120px;margin-left: 7px;}
    	.gq_e{width:135px;z-index: 0;height:240px;background-image:url('../../img/gongqingimg/zqtd-zm.png');background-size:100% 100%; background-repeat: no-repeat;position: absolute;left: -1px;}
	
	</style>
</head>
<script>
window.onload=sluice;
</script>
<body style="width: 100%;height: 100%;">
	<div style="width: 100%; height: 5%;"> 
		<table id="sluicetb">
					
		</table>
	</div>
	<div class="gq_w" style="width: 100%; height: 95%; background-image:url('../../img/gongqingimg/thbg1.png');background-size:100% 100%; background-repeat: no-repeat;">
		<div style="width: 25%; height:91.5%; float: left;overflow-x:auto;overflow-y:hidden;position:relative;">
			<div style="width: 50%; height:50%;float: left; background-image:url('../../img/gongqingimg/01zzq.png');background-size:100% 100%; background-repeat: no-repeat;margin-top: 96%;"></div>
			<div style="width: 130px;height: 90px; position: absolute;/* top:165px; */top:42%;left:52%;z-index:2">
						<p style="text-align:center;margin-top: 8px;width: 120px;font-size: 14px;">启闭状态:</p>
						<p style="text-align:center;margin-top: 8px;width: 120px;font-size: 14px;">开高(m)</p>
						<p style="text-align:center;margin-top: 8px;width: 120px;font-size: 14px;">流量(m³/s)</p>
			</div>
			<div style="width: 50%; height: 100%; float: left;overflow-x:auto;overflow-y:hidden;">
				<table style="border-collapse:collapse;width:100%;height: 100%;margin:0;padding:0;" cellspacing="0"  cellpadding="0">
					<tr style="height: 100%;width:100%;">
						<td style='position:relative;'>
						<div style="margin-top:97px;"></div>
							<div class='' style="width:100%;height:88%;  background-image:url('../../img/gongqingimg/02zzc.png');background-size:100% 100%; background-repeat: no-repeat; position: relative;top:-1px;z-index: 1;"></div>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div style="width: 50%; height: 91.5%; float: left;overflow-x:auto;overflow-y:hidden; ">
			<div style="width: 100%; height: 100%; float: left;overflow-x:auto;overflow-y:hidden; ">
				<table style="border-collapse:collapse;height: 100%;margin:0;padding:0;" cellspacing="0"  cellpadding="0">
					<tr id="sluicelist" style="height: 100%;">
					</tr>
				</table>
			</div>
		</div>
		<div style="width: 25%; height: 91.5%; float: left;overflow-x:auto;overflow-y:hidden;">
			<div style="width: 50%; height:100%; float: left;position:relative; ">
				<div style="width: 100%; height: 100%; float: left;overflow-x:auto;overflow-y:hidden;">
					<table style="border-collapse:collapse;width:100%;height: 100%;margin:0;padding:0;" cellspacing="0"  cellpadding="0">
						<tr style="height: 100%;width:100%;">
							<td style='position:relative;'>
								<div style="margin-top:97px;"></div>
								<div class='' style="width:100%;height:88%;  background-image:url('../../img/gongqingimg/02yzc.png');background-size:100% 100%; background-repeat: no-repeat; position: relative;top:-1px;z-index: 1;"></div>
							</td>
						</tr>
					</table>
				</div>
			</div>	
			<!-- <div style="width: 50%; height:77%;float: left;background-image:url('../../img/gongqingimg/02yzc.png');background-size:100% 100%; background-repeat: no-repeat;margin-top: 30%;"></div> -->
			<div style="width: 50%; height:50%;float: left; background-image:url('../../img/gongqingimg/01yzq.png');background-size:100% 100%; background-repeat: no-repeat;margin-top: 96%;"></div>
		</div>
	</div>
</body>
</html>
