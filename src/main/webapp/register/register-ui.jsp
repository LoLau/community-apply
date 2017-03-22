<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>社团网申系统</title>
	<link href="../css/bootstrap.min.css" rel="stylesheet">
	<link href="../css/main.css" rel="stylesheet">
	<link href="../css/register.css" rel="stylesheet">
	<!--[if lt IE 9]>
	<script src="/CommunityApply/js/html5shiv.js"></script>
	<script src="/CommunityApply/js/respond.min.js"></script>
	<![endif]-->
	<jsp:include page="../admin/include.jsp"/>
</head>

<body>

<!-- 顶部导航 -->
<div class="navbar navbar-inverse navbar-fixed-top" role="navigation" id="menu-nav">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
				<span class="sr-only">切换导航</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<strong><a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">社团网申系统</a></strong>
		</div>
		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li class="active"><a href="${pageContext.request.contextPath}/index.jsp">首页</a></li>
				<li><a href="${pageContext.request.contextPath}/index.jsp">热门社团</a></li>
				<li><a href="#" data-toggle="modal" data-target="#about-modal">关于</a></li>
			</ul>
		</div>
	</div>
</div>

<div class="container summary" id="registerArea">
	<form id="form" action="${pageContext.request.contextPath}/user/register" class="registerbox" method="post">
		<div class="form-group">
			<div class="col-sm-offset-4 col-sm-9">
				<h2>用户注册</h2><br>
			</div></div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-9">
				<input type="text" class="form-control" id="username" name="username"
					   placeholder="输入用户名" required autofocus>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-9">
				<input type="password" id="password" name="password" class="form-control"
					   placeholder="输入登录密码" required>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-9">
				<input input type="password" id="ensurePassword" name="ensurePassword" class="form-control" placeholder="输入确认密码" required>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-9">
				<input type="text" id="name" name="name" class="form-control" placeholder="输入您的真实姓名"
					   required>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-9">
				<select class="form-control"  name="sex" id="sex" required>
					<option value="">---输入您的性别---</option>
					<option value="男">男</option>
					<option value="女">女</option>
				</select>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-9">
				<select class="form-control"  name="age" id="age" required>
					<option value="">---输入您的年龄---</option>
					<option value="16">16</option>
					<option value="17">17</option>
					<option value="18">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
					<option value="24">24</option>
					<option value="25">25</option>
					<option value="26">26</option>
					<option value="27">27</option>
					<option value="28">28</option>
					<option value="29">29</option>
					<option value="30">30</option>
					<option value="31">31</option>
					<option value="32">32</option>
					<option value="33">33</option>
					<option value="34">34</option>
					<option value="35">35</option>
					<option value="36">36</option>
				</select>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-9">
				<input type="text" id="academy" name="academy" class="form-control"
					   placeholder="输入您所在学院" required>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-9">
				<input type="text" id="major" name="major" class="form-control" placeholder="输入您所在专业" required>
			</div>
		</div>
		<div class="form-group">
			
			<div class="col-sm-offset-3 col-sm-7">
			<br><span id="tip" style="color: red;height:20px;">${msg }</span>
				<button class="btn btn-lg btn-primary btn-block" type="submit">注册</button>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-3 col-sm-7">
				
				<br>
				<div class="registbox">
					<span>已有账号？</span>
					<a href="javascript:void(0)" onclick="login()" target="_parent">立即登陆>></a>
				</div>
			</div>
		</div>
	</form>
</div>

<!-- 主要内容 -->
<div class="container summary">
	<!-- 社团动态 -->
	<hr class="feature-divider">
	<!-- 关于 -->
	<div class="modal fade" id="about-modal" tabindex="-1" role="dialog" aria-labelledby="modal-label"
		 aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span
							aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
					<h4 class="modal-title" id="modal-label">关于</h4>
				</div>
				<div class="modal-body">
					<p style="text-indent:2em;">社团这一元素是学校和企业现在不可或缺的重要元素之一，它代表着一群志趣相似的人的集合，
						它的存在对学校或是企业的发展起着重要的作用。而当我们到一个新的学校或是企业之后要做
						的第一件事也是加入一个社团，这样做能够使我们更快的了解我们的学校或是公司，使我们融
						入这个新集体的速度也更加的快。而在我们申请加入社团的时候，一个重要的问题摆在了我们
						面前，首先我们对新环境里的社团没有任何了解，其次我们不知道怎么加。，这时，一款好的
						社团网申系统的存在就很好的帮我们解决了这一系列的问题，它能带领着我们最快的了解所有
						的社团，最方便的加入一个社团。</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">了解了</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 底部 -->
	<footer>
		<div class="foot-text">
			<p class="pull-right"><a href="#top">返回顶部</a></p>
			<p>Copyright &#169; 2016 Powered by 华中科技大学校软件学院  </p>
			<p>地址：湖北省武汉市洪山区珞喻路1037号 邮政编码：430074　电话：027-87541114传真：027-87545438　鄂ICP备030193</p>
		</div>
	</footer>

</div>
</body>
<script src="../js/jquery-1.11.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../layer/layer.js"></script>
<script>
	$(function () {
		$('#ad-carousel').carousel();
		$('#menu-nav .navbar-collapse a').click(function (e) {
			var href = $(this).attr('href');
			var tabId = $(this).attr('data-tab');
			if ('#' !== href) {
				e.preventDefault();
				$(document).scrollTop($(href).offset().top - 70);
				if (tabId) {
					$('#feature-tab a[href=#' + tabId + ']').tab('show');
				}
			}
		});
	});

    //弹出一个iframe层
   function login(){
        layer.open({
            type: 2,
            title: '',
            maxmin: true,
            shadeClose: true, //点击遮罩关闭层
            area : ['450px' , '58%'],
            content: '../login/login-ui.jsp'
        });
    }
    
  /*   function register(){
    	var username = $('#username').val();
		var password = $('#password').val();
		var ensurePassword = $('#ensurePassword').val();
		if (password != ensurePassword){
			$('#tip').html("两次输入密码不一致");
			return;
		} else{
			$.ajax({
				type: "POST",
				url: "${pageContext.request.contextPath}/user/register",
				dataType:"json",
				data:$('#form').serialize(),
				success: function(msg) {
					if(msg.success) {
						 alert("注册成功");
       					 window.location.href="${pageContext.request.contextPath}/index.jsp";
					} else {
						$('#tip').html(msg.msg);
					}
					
				},
				error : function(msg) {
					console.info("msg = " + msg);
					alert(1111);
					
				}
			});
		}
    } */
</script>
</html>