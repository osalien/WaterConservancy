<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="../../js/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="../../js/pumping.js"></script>
    <style type="text/css">
    .bg_l{width: 100%;height: 100%;background-image:url('../../img/gongqingimg/beng-zbj.png');background-size:100% 109%; background-repeat: no-repeat;position: relative;left:0px;top:-11px;}
    .pum_a{width:135px;height:280px; background-image:url('../../img/gongqingimg/beng-zj1.png');background-size:100% 100%; background-repeat: no-repeat;position: relative;left:0px;top: 100px;z-index: 1;}
    .pum_input{width: 130px;margin-top: 1px;margin-left: 2px;text-align:center;}
    .pum_b{width:135px;height:350px; position: relative;left:0px;top: -80px;z-index: 2;}
    .pum_c{text-align:center;margin:0 auto;color: #FFFFFF;}
    #pumpinglist td{width:20%}
    #pumpinglist .pum_a{width:100%}
    #pumpinglist .pum_b{width:100%}
    #pumpinglist .pum_a{}
    .pum_d{text-align:center;margin:0 auto;}
 
	</style>
</head>
<script>
window.onload=pumping;
</script>
<body>
	<div style="width: 100%;height: 100%;">
		<div style="width: 100%;height: 5%;background-color: #FFFFFF">
			<table id="pumingtb">
					
			</table>
		</div>
		<div style="width: 100%;height: 85%;background-color: #1C80AA;overflow:hidden;">
			<div style="float: left;width: 20%;height: 100%;position:relative;overflow:hidden;">
				<table style="border-collapse:collapse;height: 100%;width:100%;position:relative;" cellspacing="0"  cellpadding="0">
					<tr style="height: 100%;width:100%;">
						<td><div class='bg_l'></div>
					</tr>
				</table>
			</div>
			
			<div style="float: left;width: 60%;height: 100%;overflow-x:auto;overflow-y:hidden;position:relative;top:16px;">
				<table style="border-collapse:collapse;width:100%" cellspacing="0"  cellpadding="0">
					<tr id="pumpinglist">
					
					</tr>
				</table>
			</div>
			<div style="float: left;width: 20%;height: 100%;background-image:url('../../img/gongqingimg/beng-ybj.png');background-size:100% 109%; background-repeat: no-repeat;margin-top: -9px;"></div>
		</div>
		<div style="width: 100%;height: 15%;background-color: #2A9BBF">
		
		</div>
	</div>
</body>
</html>
