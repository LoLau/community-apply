<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>社团网申系统</title>
    <link href="/CommunityApply/css/bootstrap.min.css" rel="stylesheet">
    <link href="/CommunityApply/css/main.css" rel="stylesheet">
    <link href="/CommunityApply/css/comInfo.css" rel="stylesheet">
    <link href="/CommunityApply/css/metinfo_ui.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
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
                <li class="active"><a href="#ad-carousel">首页</a></li>
                <li><a href="#summary-container">热门社团</a></li>
                <li><a href="#" data-toggle="modal" data-target="#about-modal">关于</a></li>
            </ul>
            <form class="navbar-form navbar-right">
                <input type="text" class="form-control" placeholder="搜索社团..." id="search">
                <button class="btn btn-default" type="button" onclick="searchC();">搜索</button>
            </form>
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
                		|<span><a href="javascript:void(0)"  style="cursor:pointer;font-size:14px;font-weight: bold;" title="个人中心" onclick="jumpToUI(this)">个人中心</a>
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
         else if(a.title == "个人中心")
        {
        	window.location.href = "${pageContext.request.contextPath}/CommunityManager/indi";
        }
        else if(a.title == "申请加入")
        {
      	  <%
        	Object obj = session.getAttribute("currentUser");
        	if(obj == null) {
          %>
        		alert("您还未登陆,请先登陆！");	
        		window.location.href = "${pageContext.request.contextPath}/login/login-ui.jsp";
          <%
        		} else {
        		
          %>
        		window.location.href = "${pageContext.request.contextPath}/apply/apply.jsp";
         <% 
        	    }
          %>
        }
    }
</script>
<!-- Main jumbotron for a primary marketing message or call to action -->

<!-- 主要内容 -->
<div class="container summary" id="com_1">
    <!-- 社团信息-->
    <div class="sidebar inner">
        <div class="sb_nav">
            <div class="ti1-bg"><span>社团信息</span></div>
            <h3 class='title1'></h3>
            <div class="active" id="sidebar" data-csnow="39" data-class3="0" data-jsok="2">

                <dl class="list-none navnow">
                    <dt id='part2_2'><a href='${pageContext.request.contextPath}/communityInfo/getCommunityInfo' class="zm"><span>社团简介</span></a></dt>
                </dl>

                <dl class="list-none navnow">
                    <dt id='part2_3'><a href='${pageContext.request.contextPath}/communityInfo/getHonor' class="zm"><span>社团荣誉</span></a></dt>
                </dl>

                <dl class="list-none navnow">
                    <dt id='part2_4'><a href='${pageContext.request.contextPath}/communityInfo/getRecruit' class="zm"><span>招募信息</span></a></dt>
                </dl>

                <div class="clear"></div>
            </div>
            <h3 class='title2 line'>联系方式</h3>
            <div class="active ct-con"><span style="line-height: 2;"><strong><span style="font-family:宋体;">华中科技大学软件学院</span></strong><br />
      地址：华中科技大学东校区东九楼</span>
                <div style="font-family:宋体;">电话：027-87541114</div>
                <div style="font-family:宋体;"> E-mail：hustsoftware@163.com</div>
                <div style="font-family:宋体;"> 宗旨：服务·指导·监督</div>
                <div class="clear"></div>
            </div>
        </div>
        <div class="sb_box br-bg">
            <h3 class="title">
                <div class="position">当前位置：<a href="${pageContext.request.contextPath}/index.jsp" title="首页">首页</a> &gt; <a href="${pageContext.request.contextPath}/jsp/communityList.jsp">社团列表</a>&gt; <a href="${pageContext.request.contextPath}/communityInfo/getCommunityInfo">社团简介</a></div>
                <span>社团简介</span> </h3>
            <div class="active" id="shownews">
                <h1 class="title">${community.name }简介</h1>
                <div class="editor">
                        <!-- <p>华中科技大学计算机协会成立于1990年3月，是学校成立最早、规模最大的学生社团之一。十多年来，为普及计算机知识、提高同学的计算机水平、促进计算机学术热潮的形成，付出了辛勤的劳动，并取得了累累硕果。多次荣获“华中科技大学十佳社团”，“华中科技大学社团之星”等荣誉。</p>
                        <p> 协会一直坚持“一个中心”、“两个方向”、“四个结合”的发展理念，即以服务广大会员和全校师生为中心，走“普及计算机知识”和“培养IT精英人才”的发展方向，开展讲座、竞赛、培训、开发相结合的活动。协会的基本任务是：广泛团结、组织计算机爱好者开展学术交流和技术培训，提高会员理论修养，增强学生工作能力，营造良好的校园学术氛围，培养高素质、复合型、研究型的创新人才。
                        <p>讲座是协会的主要活动方式之一，二十多年来协会组织了500多场讲座，其中有面向入门者的基础知识讲座，有帮助提高水平的中级辅导讲座，还有追踪新技术发展的专题系列讲座，受到了全校同学的热烈欢迎，全校100000余人次参加过协会的各种讲座。
                        <p>作为一个技能培养类的社团，计算机协会一直重视技术开发。协会现有两个开发团队：步步高（BBK）游戏开发基地和红马视觉（homervision）创业团队。步步高（BBK）游戏开发基地是由步步高公司资助组建的，是一个以开发电子词典及手持PDA的网络下载游戏的社会实践基地。基地成立于2003年9月，现已成功开发出10多款游戏，另有十多款游戏正在测试中。红马视觉创业团队由原计算机协会网络部组建，以从事平面设计、网站开发及网络编程为主。团队成立于2004年2月，短短几个月，已经成功开发出宏武跆拳道会所、海峡两岸研习营、梧桐雨等5个网站，还承接调查研究中心成立5周年成就展的宣传设计，大型门户网站——华中创业网也正在筹划中。
                        <p>协会郑重承诺：协会新会员经过一段时间学习，经考核合格后将可以加入到步步高（BBK）游戏开发基地和红马视觉（homervision）创业团队，直接参与项目开发。
                        <p>回顾过去，我们走过了一条艰苦而又辉煌的道路，在我们面前，有一片充满无限希望的广阔天地。虽然前进的路上还有不少困难，但是我们相信，凭我们的热情和才干，在各方面力量的支持下，我们协会一定会越办越好，为提高全校的计算机水平做出新的贡献！
                        <p>计算机协会办公室：华中科技大学沁苑东10栋703室</p> -->
                        ${community.intro }

                <a class="btn btn-primary btn-lg pull-right" role="button" title="申请加入" onclick="jumpToUI(this)" style="margin:10px 10px;">加入我们>></a>
                </div>
            </div>
        </div>
    </div>
    </div>
<!-- 底部footer -->
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
                <p>社团这一元素是学校和企业现在不可或缺的重要元素之一，它代表着一群志趣相似的人的集合，
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
        <p>Copyright &#169; 2016 Powered by 华中科技大学校软件学院 </p>
        <p>地址：湖北省武汉市洪山区珞喻路1037号 邮政编码：430074　电话：027-87541114传真：027-87545438　鄂ICP备030193</p>
    </div>
</footer>

</div>

<script src="/CommunityApply/js/jquery-1.11.1.min.js"></script>
<script src="/CommunityApply/js/bootstrap.min.js"></script>
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
    	window.location.href = "/CommunityApply/communityInfo/getCommunity?name="+search;
    }
</script>
</body>
</html>
