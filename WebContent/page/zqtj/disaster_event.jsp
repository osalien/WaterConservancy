<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../base.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 分页控件 -->
<link rel="stylesheet" type="text/css" href="../../css/kkpager_blue.css">
<script type="text/javascript" src="../../js/kkpager.js"></script>
<!-- 日历控件 -->
<link rel="stylesheet" href="../../css/bootstrap-datetimepicker.min.css" />
<script type="text/javascript"
	src="../../js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript"
	src="../../js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script type="text/javascript" src="../../js/disaster-event.js"></script>

<style type="text/css">
.table>thead>tr>th {
	padding: 8px !important;
	vertical-align: middle !important;
	text-align: center !important;
}

.table>tbody>tr>td {
	padding: 8px !important;
	vertical-align: middle !important;
}
</style>
</head>
<body>
	<div
		style="width: 80px; position: fixed; top: 0px; left: 81px; height: 100%; width: 94%; ">
		<div style="margin: 20px">
			<form class="form-inline">
				<div class="form-group">
					<label>起止时间：</label> <input class="form-control date-picker"
						id="startTime" type="text" value="2017-09-01" /> <label>~</label>
					<input class="form-control date-picker" id="endTime" type="text" value="2017-09-05"/>
				</div>
				<div class="form-group" style="margin-left: 20px">
					<label>地区：</label> <select class="form-control" id="disasterArea"
						style="width: 110px">
					</select>
				</div>
				<div class="form-group" style="margin-left: 20px">
					<label>灾害类型：</label> <select class="form-control" id="disasterType"
						style="width: 110px">
					</select>
				</div>
				<button type="button" class="btn btn-primary"
					onclick="showDisasterEvent();" style="margin-left: 20px">查询</button>
				<button type="reset" class="btn btn-default">重置</button>
			</form>
		</div>
		<div class="table-responsive" style="margin: 20px">
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th rowspan="2" colspan="2" width="15%">时间</th>
						<th rowspan="2" width="15%">地区</th>
						<th rowspan="2" width="15%">灾害类型</th>
						<th width="10%">受灾人口</th>
						<th width="10%">经济损失</th>
						<th rowspan="2" width="35%">灾害简述</th>
						<!-- <th rowspan="2" width="15%">灾害详情</th> -->
					</tr>
					<tr>
						<th>（万人）</th>
						<th>（亿元）</th>
					</tr>
				</thead>
				<tbody id="disasterList">
				</tbody>
			</table>
			<div style='margin: 0 350px;'>
				<div class="kkpager"></div>
			</div>
		</div>
	</div>
	<!-- 用于展示详情的模态框 -->
	<!-- <div class="modal fade" id="disaster-info" tabindex="-1" role="dialog"
		aria-labelledby="info-title" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="info-title">标题</h4>
				</div>
				<div class="modal-body" id="info-content"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
				</div>
			</div>
		</div>
	</div> -->
	<!-- 用于提示输入错误的模态框 -->
	<div class="modal fade" id="error-info" tabindex="-1" role="dialog"
		aria-labelledby="error-title" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<div style="float:left"><img src="../../img/disaster_error.png" width="50px" height="50px"></div><div><b class="modal-title" id="error-title" style="font-size:35px">错误</b></div>
				</div>
				<div class="modal-body" id="error-content">开始时间不得晚于结束时间，请重新输入！</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function getParameter(name) {
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
			var r = window.location.search.substr(1).match(reg);
			if (r != null)
				return unescape(r[2]);
			return null;
		}
		$(function() {
			var totalPage = 10;
			var totalRecords = 100;
			var pageNo = getParameter('pno');
			if (!pageNo) {
				pageNo = 1;
			}
			//生成分页
			//有些参数是可选的，比如lang，若不传有默认值
			kkpager.generPageHtml({
				pno : pageNo,
				//总页码
				total : totalPage,
				//总数据条数
				totalRecords : totalRecords,
				//链接前部
				hrefFormer : 'disaster_event',
				//链接尾部
				hrefLatter : '.jsp',
				getLink : function(n) {
					return this.hrefFormer + this.hrefLatter + "?pno=" + n;
				}
			});

		})
	</script>
</body>
</html>