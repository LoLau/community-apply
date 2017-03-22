<%@page import="com.hust.entity.User"%>
<%@page import="com.hust.entity.Community"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>社团网申系统</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/main.css" rel="stylesheet">
    <link href="../css/individual_center.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="../js/html5shiv.js"></script>
    <script src="../js/respond.min.js"></script>
    <![endif]-->
</head>

<body>

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
                <li class="active"><a href="#ad-carousel">首页</a></li>
                <li><a href="#summary-container">热门社团</a></li>
                <li><a href="#" data-toggle="modal" data-target="#about-modal">关于</a></li>
            </ul>
            <form class="navbar-form navbar-right">
                <input type="text" class="form-control" placeholder="搜索社团..." id="search">

                <button class="btn btn-default" type="button" onclick="searchC();">搜索</button>
            </form>

            <!--modify by lxh-->
            <ul class="nav navbar-nav navbar-right">
                <li style="float:right;margin:15px 20px;">
                <c:choose>
                	<c:when test="${currentUser==null}">
                    	<span><a href="javascript:void(0)"  style="cursor:pointer;font-size:14px;font-weight: bold;" title="登录" onclick="jumpToUI(this)">登录</a>
                    	| <a href="javascript:void(0)" style="cursor:pointer;font-size:14px;font-weight: bold;" title="注册" onclick="jumpToUI(this)">注册</a>
                   		</span>
                	 </c:when>
                	 <c:otherwise>
                 		<font color="red">[${currentUser }]</font>
                 		<span>
                 			<a href="javascript:void(0)" style="cursor:pointer;font-size:14px;font-weight: bold;"title="注销" onclick="jumpToUI(this)">注销</a>
                		</span>
                	 </c:otherwise>
                 </c:choose>
                </li>
            </ul>

        </div>
    </div>
</div>

<!--add by lxh-->
<script>
    function jumpToUI(a)
    {
        if (a.title == "登录")
        {
            window.location.href = "${pageContext.request.contextPath}/user/prelogin";
        }
        else if(a.title == "注册")
        {
            window.location.href = "${pageContext.request.contextPath}/user/preregister";
        }
        else if(a.title == "注销")
        {
            window.location.href = "${pageContext.request.contextPath}/user/logout";
        }
    }
</script>
<!-- Main jumbotron for a primary marketing message or call to action -->


<!-- 主要内容 -->
<div class="container summary" id="individual_center">
    <h3>个人资料</h3>
    <!-- 个人中心信息-->
        <div class="info_preview" id="info_preview">
            <div class="preview_list">
            <%
            	User user = (User)request.getAttribute("user");
             %>
            <ul>
                <li>
                    <label>姓&nbsp;&nbsp;&nbsp;&nbsp;名：</label>
                    <div id="name" class="preview_option"><%=user.getName() %></div>
                </li>
                <li>
                    <label>性&nbsp;&nbsp;&nbsp;&nbsp;别：</label>
                    <div id="sex" class="preview_option">
                    <%=user.getSex()%></div>
                </li>
                <li>
                    <label>年&nbsp;&nbsp;&nbsp;&nbsp;龄：</label>
                    <div id="age" class="preview_option"><%=user.getAge() %></div>
                </li>
                <li>
                    <label>学&nbsp;&nbsp;&nbsp;&nbsp;院：</label>
                    <div id="academy" class="preview_option"><%=user.getAcademy() %></div>
                </li>
                <li>
                    <label>专&nbsp;&nbsp;&nbsp;&nbsp;业：</label>
                    <div id="major" class="preview_option"><%=user.getMajor() %></div>
                </li>
            </ul>
    </div>
</div>
</div>
<div class="container summary" id="applyStatus" >
    <h3>社团申请状态</h3>
    <table class="table table-bordered" >
        <thead>
        <tr>
            <th>申请社团名称</th>
            <th>申请职位</th>
            <th>申请时间</th>
            <th>申请状态</th>
        </tr>
        </thead>
        <tbody>
       <%
        	Object obj = request.getAttribute("community");
        	List<Community> communitys = (List<Community>)obj;
        	for(Community community : communitys) {
      %>
        <tr>
           <td><%
           	String id = community.getCommunity_id()+"";
           	if("5".equals(id)) {
           		out.println("计算机爱好者协会");
           	}
           	if("6".equals(id)) {
           		out.println("街舞社");
           	}
           	if("7".equals(id)) {
           		out.println("英语社团");
           	}
           	if("8".equals(id)) {
           		out.println("环保协会");
           	}
           	if("9".equals(id)) {
           		out.println("篮球协会");
           	}
           	if("10".equals(id)) {
           		out.println("乒乓球协会");
           	}
           	if("11".equals(id)) {
           		out.println("手语协会");
           	}
           	if("12".equals(id)) {
           		out.println("灵感之家协会");
           	}
           	if("13".equals(id)) {
           		out.println("大学生科技协会");
           	}
           	if("14".equals(id)) {
           		out.println("戏剧社");
           	}
           	if("15".equals(id)) {
           		out.println("摄影协会");
           	}
           	if("16".equals(id)) {
           		out.println("志愿者协会");
           	}
             %> </td>
            <td><%=community.getPos_id()
           
            %></td>
            <td><%=community.getTime() %>  </td>
            <td><%String id2 = community.getStatus();
            if("0".equals(id2))
            	out.println("未通过");
            if("1".equals(id2))
            	out.println("已审核");
            	 %></td>
        </tr>
        <%
        	}
         %>
        </tbody>
    </table>
</div>
<!-- 社团动态 -->

<hr class="feature-divider">
<div class="container summary">
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

<script src="../js/jquery-1.11.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
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

    function searchC() {
        var search = $('#search').val();
        if(search == null || search == '') {
            alert("请输入要查询的社团名称或类别");
            return ;
        }
        window.location.href = "/CommunityApply/search/searchCommunityByName?name="+search;
    }
</script>
</body>
</html>