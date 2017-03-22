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

    <form class="loginbox" action="${pageContext.request.contextPath}/user/editPassword" method="post">
        <h2 class="form-signin-heading text-center">修改密码</h2><br>
        <input type="text" id="username" name="username" class="form-control" value="${username }" required readonly="readonly">
        <input type="password" id="password" name="password" class="form-control" placeholder="新密码" required autofocus>
        <input type="password" id="okpassword" name="okpassword" class="form-control" placeholder="确认密码" required>
        <font color="red"></font>
       <button class="btn btn-lg btn-primary btn-block" type="submit" onclick="editPass();">确定</button>
    </form>

</div>


	<script type="text/javascript">
    function editPass() {
        var password = $('#password').val();
        var okpassword = $('#okpassword').val();

        if(password == '') {
            alert("请输入密码");
            return ;
        }

        if(okpassword == '') {
            alert("请输入确认密码");
            return ;
        }

        if(password != okpassword) {
            alert("密码和确认密码不一样");
            $('#password').val('');
            $('#okpassword').val('');
            return ;
        }

        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/user/editPassword",
            dataType: "json",
            data: {
                password:password
            },
            success: function(msg){
                if(msg.success) {
                    $.messager.show({
                        title:'操作成功',
                        msg:msg.msg,
                        timeout:3000,
                        showType:'slide'
                    });
                    parent.location.href = "${pageContext.request.contextPath}/user/logout";
                } else {
                    $.messager.show({
                        title:'操作失败',
                        msg:msg.msg,
                        timeout:2000,
                        showType:'slide'
                    });
                }
            }
        });
    }
</script>
</body>
</html>