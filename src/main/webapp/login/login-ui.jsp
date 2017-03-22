<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->

	<meta name="description" content="">
	<meta name="author" content="">
	<title>社团网申系统用户登录</title>
	
	 <!-- Bootstrap core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="signin.css" rel="stylesheet">
	<jsp:include page="../admin/include.jsp"/>
</head>
<!--添加背景图片-->
<body>

<div class="container">

    <form id="form" class="loginbox" method="post">
        <h2 class="form-signin-heading text-center">用户登录</h2><br>
        <input type="text" id="username" name="username" class="form-control" value="">
        <input type="password" id="password" name="password" class="form-control" value="">

        <div class="checkbox">
            <label>
                <input type="checkbox" value="remember-me"> 记住我
            </label>
           <%--  <label>
                <a class="pull-right" href="${pageContext.request.contextPath}/user/forgetPass">忘记密码?</a>
            </label> --%>
        </div>
		<span id="tip" style="color: red;"></span>
		<a onclick="login();" class="btn btn-lg btn-primary btn-block">登陆</a>
        <div class="registbox">
            <span>没有账号？</span>
            <a href="../register/register-ui.jsp" target="_parent">免费注册>></a>
        </div>
    </form>
</div> 

	<script type="text/javascript">
		function login(){
			var username = $('#username').val();
			var password = $('#password').val();
			if (username == ''|| password == ''){
				$('#tip').html("请输入用户名或密码");
				return;
			} else{
				$.ajax({
   				type: "POST",
   				url: "${pageContext.request.contextPath}/user/logIn",
   				dataType:"json",
   				data:$('#form').serialize(),
   				success: function(msg){
   					if(msg.success) {
           				 parent.location.href="${pageContext.request.contextPath}/user/index";
   					} else {
   						$('#tip').html(msg.msg);
   					}
   					
   				}
				});
			}
		}
	</script>
</body>
</html>