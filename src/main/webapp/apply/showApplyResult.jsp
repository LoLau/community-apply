<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 	<meta charset="UTF-8">
   	<meta http-equiv="x-ua-compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->

    <!--导入bootstrap核心css文件-->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="apply.css" type="text/css" rel="stylesheet">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="../js/jquery-1.11.1.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="../js/bootstrap.min.js"></script>
	<jsp:include page="include.jsp"/>
<title>申请结果查看</title>

</head>
<body>


    <table id="community">
    </table>

	<script type="text/javascript">
	var dataGrid;
	$(function() {
	dataGrid = $('#community').datagrid({
			url:'${pageContext.request.contextPath}/apply/showApplyResult',
			nowrap : true,
			idField : 'id',
			pagination : true,
			frozenColumns : [ [ {
				field : 'apply_id',
				title : '编号',
				width : 50,
				checkbox : false,
				align:'center'
			}]],
			 columns:[[
       			 {field:'community_id',title:'社团编号',width:80,align:'center'},
        		 {field:'user_id',title:'用户ID',width:80,align:'center'},
        		 {field:'apply_time',title:'申请时间',width:80,align:'center'},
        		 {field:'status',title:'申请状态',width:80,align:'center'}
 
   			]],
   			toolbar : '#toolbar',
		});
	});
	</script>
</body>
</html>