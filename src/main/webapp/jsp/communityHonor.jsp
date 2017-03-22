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
                <div class="position">当前位置：<a href="${pageContext.request.contextPath}/index.jsp" title="首页">首页</a> &gt; <a href="${pageContext.request.contextPath}/jsp/communityList.jsp">社团列表</a>&gt; <a href="${pageContext.request.contextPath}/communityInfo/getHonor">社团荣誉</a></div>
                <span>社团荣誉</span> </h3>
            <div class="active" id="shownews">
                <h1 class="title">${community.name }荣誉</h1>
                <div class="editor">
                	${community.current_situation }
                   <!-- <p>2003年</p>
                    <p> 1.第八届挑战杯全国大学生课外科技学术大赛一等奖</p>
                    <p> 2.华中科技大学科技节社团联合会最受欢迎奖、最具潜力奖、和最佳表现奖</p>
                    <p>2004年</p>
                    <p> 1.IBM奖学金</p>
                    <p> 2．惠普奖学金</p>
                    <p> 3.全国百优社团</p>
                    <p> 4.趋势科技程序设计大赛全国第四名</p>
                    <p>2005年</p>
                    <p>1.全国FLAS设计大赛二等奖</p>
                    <p>2.计算机世界奖学金</p>
                    <p> 2006年</p>
                    <p> 1.华中科技大学A级社团</p>
                    <p>2.华中科技大学程序设计大赛一等奖</p>
                    <p>2007年</p>
                    <p> 1.湖北省优秀社团</p>
                    <p> 2.华中科技大学十佳社团</p>
                    <p>2010-2011年</p>
                    <p> 1.华中科技大学优秀社团</p>
                    <p> 2011—2012年 </p>
                    <p>1.华中科技大学社团最佳进步奖</p>
                    <p>　2.华中科技大学四星社团</p>
                    <p>2012—2013年</p>
                    <p> 1.华中科技大学三星社团</p>
                    <p>2.全国高校优秀社团计算机类特别奖</p> -->
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
