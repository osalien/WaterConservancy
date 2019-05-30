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
<script type="text/javascript" src="../../js/disaster-flood.js"></script>

<style type="text/css">
.table>thead>tr>th {
	padding: 5px !important;
	vertical-align: middle !important;
	text-align: center !important;
}

.table>tbody>tr>td {
	padding: 7px !important;
	vertical-align: middle !important;
}
</style>
</head>
<body>
	<div
		style="width: 80px; position: fixed; top: 0px; left: 81px; height: 100%; width: 94%;">
		<div style="margin: 10px">
			<form class="form-inline">
				<div class="form-group">
					<label>起止时间：</label> <input class="form-control date-picker"
						id="startTime" type="text" value="2017-09-01" /> <label>~</label>
					<input class="form-control date-picker" id="endTime" type="text" value="2017-09-05"/>
				</div>
				<button type="button" class="btn btn-primary"
					onclick="showDisasterFlood();" style="margin-left: 20px">查询</button>
				<button type="reset" class="btn btn-default" id="reset">重置</button>
			</form>
		</div>

		<div style="width: 100%; box-sizing: padding-bottom: 10px;">
			<div class="tab-content" style="padding-top: 10px;">
				<div role="tabpanel" class="tab-pane active" id="flood">
					<div class="table-responsive" style="margin: 10px">
						<p style="font-weight:bold;" id="showTime"></p>
						<table class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th rowspan="3" colspan="2" width="80px">地区</th>
									<th colspan="5">受灾范围</th>
									<th rowspan="2">受灾人口</th>
									<th rowspan="2" width="60px">洪水围困人口</th>
									<th rowspan="2" width="60px">紧急转移人口</th>
									<th colspan="2">受淹城镇</th>
									<th colspan="2">住宅受淹</th>
									<th rowspan="2">损坏房屋</th>
									<th rowspan="2">倒塌房屋</th>
									<th rowspan="2" width="80px">道路积水最大水深</th>
									<th rowspan="2">死亡人口</th>
									<th rowspan="2">失踪人口</th>
									<th colspan="2">受伤人口</th>
									<th rowspan="2" width="60px">直接经济损失</th>
								</tr>
								<tr>
									<th>县</th>
									<th width="40px">乡镇</th>
									<th>村</th>
									<th width="40px">街道</th>
									<th width="60px">居委会</th>
									<th width="40px">小计</th>
									<th width="80px">县级以上</th>
									<th width="50px">城镇</th>
									<th width="50px">农村</th>
									<th width="40px">小计</th>
									<th width="40px">重伤</th>
								</tr>
								<tr>
									<th>(个)</th>
									<th>(个)</th>
									<th>(个)</th>
									<th>(个)</th>
									<th>(个)</th>
									<th>(万人)</th>
									<th>(万人)</th>
									<th>(万人)</th>
									<th>(个)</th>
									<th>(个)</th>
									<th>(万户)</th>
									<th>(万户)</th>
									<th>(万间)</th>
									<th>(万间)</th>
									<th>(米)</th>
									<th>(人)</th>
									<th>(人)</th>
									<th>(人)</th>
									<th>(人)</th>
									<th>(亿元)</th>
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
			</div>
		</div>
	</div>
	<!-- 用于提示输入错误的模态框 -->
	<div class="modal fade" id="error-info" tabindex="-1" role="dialog"
		aria-labelledby="error-title" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<div style="float: left">
						<img src="../../img/disaster_error.png" width="50px" height="50px">
					</div>
					<div>
						<b class="modal-title" id="error-title" style="font-size: 35px">错误</b>
					</div>
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
				hrefFormer : 'disaster_flood',
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