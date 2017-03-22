<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆-社团网申系统</title>
	<jsp:include page="include.jsp"/>
</head>
<body style="height:100%;width:100%;overflow:hidden;border:none;">
	<!-- <button onclick="javascript:$('#win').window('open')">open</button> -->

	<div id="win" class="easyui-window" title="登陆"
		style="width:300px;height:180px;">
		<form action="${pageContext.request.contextPath}/admin/login" method="post"
			style="padding:10px 20px 10px 40px;">
			<p>
				用户名: <input name="username" type="text">
			</p>
			<p>
				密&nbsp;&nbsp;&nbsp;&nbsp;码: <input name="password" type="password">
			</p>
			<div style="padding:5px;text-align:center;">
				<input type="submit" value="登陆" class="easyui-linkbutton">&nbsp&nbsp
				<input type="button" value="取消" class="easyui-linkbutton">
			</div>
		</form>
	</div>
</body>
</html>