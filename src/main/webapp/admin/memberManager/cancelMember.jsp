<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../include.jsp"/>
<title>成员删除</title>
<script type="text/javascript">
	$(function(){
		$("#submit").click(function(){
			$.ajax({
				type:"POST",
				cache:"true",
				url:"cancelmember",
				data:$("#delete").serialize(),
				async: false,
				success:function(){
					alert("删除成功！");
				}
			});
		});
	});
</script>
</head>
<body>
	<form id="delete">
		请输入用户姓名：<input type="text" id="username" name="username"/>
		<input type="button" id="submit" value="删除"/>
	</form>
</body>
</html>