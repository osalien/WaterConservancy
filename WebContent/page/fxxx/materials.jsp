<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../../base.jsp"%>
<html>
<head>
    <title>防汛物资.jsp</title>
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../../css/kkpager_blue.css">
    <script type="text/javascript" src="../../js/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="../../js/kkpager.js"></script>
    <script type="text/javascript" src="../../js/bootstrap.js"></script>
    <script type="text/javascript" src="../../js/jquery.nicescroll.min.js"></script>
    <script type="text/javascript" src="../../js/jquery.ztree.core-3.5.js"></script>
    <script type="text/javascript" src="../../js/jquery.ztree.excheck-3.5.js"></script>
    <script type="text/javascript" src="../../js/jquery.ztree.exedit-3.5.js"></script>
    <script type="text/javascript" src="../../js/floodlb.js"></script>
  </head>
  <style>
    /*表格不同分辨率样式*/
    @media screen and (min-width: 1400px){
        .container{width: 1460px;}
        .floodlist_box{font-size: 14px;}
    }

    @media screen and (min-width: 1900px){
        .container{width: 1700px;}
        .floodlist_box{/* font-size: 18px\9;font-size: 18px\0; */font-size: 14px;}
    }
</style>
<script>

    $(function(){
        var bd_ht=$(document).height();
        var hd_ht=$(".hd").height();
        var map_ht=bd_ht-hd_ht-12;

      //列表中折叠/展开按钮
        $(".fold").click(function(){
            if($(".fold_box").hasClass("active")){
                $(".fold_box").removeClass("active");
                $(this).html("折叠");
            }else{
                $(".fold_box").addClass("active");
                $(this).html("展开");
            }
        });

    })
     window.onload=floodlb;
</script>
<body>

   	<!--列表-->
<div class="floodlist_box">
    <div class="container">
        <div class="flood_cx">
            <form class="form-inline">
            	<div class="fold_box active">               
	                <div class="form-group">
	                    <label>避雷器：</label>
	                    <input type="text" class="form-control" id="blqStr" placeholder="">
	                </div>
	                <div class="form-group">
	                    <label>彩布条：</label>
	                    <input type="text" class="form-control" id="cbtStr" placeholder="">
	                </div>
	               
	                <div class="form-group">
	                    <label>发电机：</label>
	                    <input type="text" class="form-control" id="fdjStr" placeholder="">
	                </div>
	                 <div class="form-group">
	                    <label>草包：</label>
	                    <input type="text" class="form-control" id="cbStr" placeholder="">
	                </div>
	                 <div class="form-group">
	                    <label>电缆：</label>
	                    <input type="text" class="form-control" id="dlStr" placeholder="">
	                </div>
	                <div class="form-group">
	                    <label>斧子：</label>
	                    <input type="text" class="form-control" id="fzStr" placeholder="">
	                </div>
	                <div class="form-group cx5">
	                    <label>电缆保护管：</label>
	                    <input type="text" class="form-control" id="bhgStr" placeholder="">
	                </div>
	                
	                <div class="form-group cx6">
	                    <label>钢桩基及附件：</label>
	                    <input type="text" class="form-control" id="gzStr" placeholder="">
	                </div>
                </div>
               
                <div class="form-group cx4">
                     <label for="exampleInputName1" class="">所属乡镇：</label>
                         <select class="form-control" id="exampleInputName1">
                               <option value="0">全县</option>
                               <option value="1">淳溪镇</option>
                               <option value="2">桠溪镇</option>
                               <option value="3">漆桥镇</option>
                               <option value="4">固城镇</option>
                               <option value="5">阳江镇</option>
                               <option value="6">东坝镇</option>
                               <option value="7">古柏镇</option>
                      	</select>
                </div>
                 <div class="form-group town">
                    <label>仓库名称：</label>
                    <input type="text" class="form-control" id="nameStr" placeholder="">
                </div>
             
                <button type="button" class="btn btn-primary" onclick="floodlb();"  style="margin-bottom: 10px;font-size: 16px\9;font-size: 16px\0;">查询</button>
                <button type="reset" class="btn btn-default"  style="margin-bottom: 10px;font-size: 16px\9;font-size: 16px\0;">重置</button>
                <span class="fold">展开</span>
            </form>
        </div>
        <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover">
                <thead>
                    <tr>
                        <th>名称</th>
                        <th>避雷器(组)</th>
                        <th>彩布条(条)</th>
                        <th>草包(件)</th>
                        <th>发电机(台)</th>
                        <th>电缆(米)</th>
                        <th>电缆保护管(米)</th>
                        <th>斧子(把)</th>
                        <th>钢桩基及附件(根)</th>
                        <th>所属乡镇</th>
                    </tr>
                </thead>
                <tbody id="floodlistlb">
                </tbody>
            </table>
        </div>
        <div class="bloodpage_box">
            <div  class="kkpager"></div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function getParameter(name) {
        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r!=null) return unescape(r[2]); return null;
    }
    $(function(){
        var totalPage = 10;
        var totalRecords = 100;
        var pageNo = getParameter('pno');
        if(!pageNo){
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
            hrefFormer : 'materials',
            //链接尾部
            hrefLatter : '.jsp',
            getLink : function(n){
                return this.hrefFormer + this.hrefLatter + "?pno="+ n;
            }
            /*
             ,lang				: {
             firstPageText			: '首页',
             firstPageTipText		: '首页',
             lastPageText			: '尾页',
             lastPageTipText			: '尾页',
             prePageText				: '上一页',
             prePageTipText			: '上一页',
             nextPageText			: '下一页',
             nextPageTipText			: '下一页',
             totalPageBeforeText		: '共',
             totalPageAfterText		: '页',
             currPageBeforeText		: '当前第',
             currPageAfterText		: '页',
             totalInfoSplitStr		: '/',
             totalRecordsBeforeText	: '共',
             totalRecordsAfterText	: '条数据',
             gopageBeforeText		: '&nbsp;转到',
             gopageButtonOkText		: '确定',
             gopageAfterText			: '页',
             buttonTipBeforeText		: '第',
             buttonTipAfterText		: '页'
             }*/

            //,
            //mode : 'click',//默认值是link，可选link或者click
            //click : function(n){
            //	this.selectPage(n);
            //  return false;
            //}
        });

    })
</script>
  </body>
</html>