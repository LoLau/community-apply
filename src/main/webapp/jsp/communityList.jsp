 <%@ page language="java" contentType="text/html; charset=UTF-8"
             pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>社团网申系统</title>
    <link href="/CommunityApply/css/bootstrap.min.css" rel="stylesheet">
    <link href="/CommunityApply/css/main.css" rel="stylesheet">
    <link href="/CommunityApply/css/comlist.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="/CommunityApply/js/html5shiv.js"></script>
    <script src="/CommunityApply/js/respond.min.js"></script>
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
 
	function jumpToUI(a) {
		if (a.title == "登录")
		 {
			window.location.href = "${pageContext.request.contextPath}/user/prelogin";
		} else if (a.title == "注册") 
		{
			window.location.href = "${pageContext.request.contextPath}/user/preregister";
		} else if (a.title == "注销") 
		{
			window.location.href = "${pageContext.request.contextPath}/user/logout";
		} else if (a.title == "个人中心") 
		{
			window.location.href = "${pageContext.request.contextPath}/CommunityManager/indi";
		}
	}
</script>
<!-- Main jumbotron for a primary marketing message or call to action -->


<!-- 主要内容 -->
<div class="container summary">
    <h2 id="hotcommunity">社团列表</h2>
    <!-- 当前位置 -->
    <div class="position pull-right">当前位置：<a href="${pageContext.request.contextPath}/index.jsp" title="首页">首页</a> &gt; <a
            href="${pageContext.request.contextPath}/jsp/communityList.jsp">社团列表</a></div>
</div>

<div class="container summary">
    <!-- 社团列表-->
        <div class="sb_box br-bg">

            <div class="active" id="newslist">
                <ul class='list-none metlist'>

                    <li class='list top'><a href='${pageContext.request.contextPath}/communityInfo/getCommunity?name=计算机爱好者协会' title='计算机爱好者协会'
                                            target='_self'>计算机爱好者协会</a>
                        <p>由软件学院成立，为对计算机技术感兴趣的同学，提供一个提高技术、交流心得的平台。</p>
                    </li>

                    <li class='list top'><a href='${pageContext.request.contextPath}/communityInfo/getCommunity?name=街舞社' title='街舞社'
                                            target='_self'>街舞社</a>
                        <p>时尚与潮流的结合，劲爆而动感的运动，是目前年轻人最流行和热爱的舞蹈。</p>
                    </li>

                    <li class='list top'><a href='${pageContext.request.contextPath}/communityInfo/getCommunity?name=英语社团'
                                            title='“英语社团' target='_self'>英语社团</a>
                        <p>为广大英语爱好者提供学习、交流、交友的平台，营造浓厚的学习氛围，丰富校园生活。</p>
                    </li>

                    <li class='list top'><a href='${pageContext.request.contextPath}/communityInfo/getCommunity?name=环保协会' title='环保协会'
                                            target='_self'>环保协会</a>
                        <p>提高大众的环保意识，促进环保事业的发展，保护我们生存的环境，使地球家园更美丽！</p>
                    </li>

                    <li class='list top'><a href='${pageContext.request.contextPath}/communityInfo/getCommunity?name=篮球协会'
                                            title='篮球协会' target='_self'>篮球协会</a>
                        <p>丰富了学生的课余生活，使校园精神文明建设工作、阳光体育工作迈上了一个新台阶。</p>
                    </li>

                    <li class='list top'><a href='${pageContext.request.contextPath}/communityInfo/getCommunity?name=乒乓球协会' title='乒乓球协会'
                                            target='_self'>乒乓球协会</a>
                        <p>以“传播乒乓文化、汇聚四海友谊”为目标和宗旨，切磋技术，组织赛事活动。</p>
                    </li>

                    <li class='list top'><a href='${pageContext.request.contextPath}/communityInfo/getCommunity?name=手语社团' title='手语社团'
                                            target='_self'>手语社团</a>
                        <p>教授日常交际手语,手语歌曲及舞蹈，定期举行沙龙手语活动,不定期的组织手语知识竞赛。</p>
                    </li>

                    <li class='list top'><a href='${pageContext.request.contextPath}/communityInfo/getCommunity?name=灵感之家协会' title='灵感之家协会'
                                            target='_self'>灵感之家协会
                        </a>
                        <p>平凡的英才校园中不平凡的超人气社团,社团口号： 因灵而感，因感而声。</p>
                    </li>

                    <li class='list top'><a href='${pageContext.request.contextPath}/communityInfo/getCommunity?name=大学生科技协会' title='大学生科技协会'
                                            target='_self'>大学生科技协会</a>
                        <p>以科技讲座为依托，以实验实习为基础，以科技创新为目标，以兴趣小组培养人才，使用人才。</p>
                    </li>

                    <li class='list top'><a href='${pageContext.request.contextPath}/communityInfo/getCommunity?name=戏剧社' title='戏剧社'
                                            target='_self'>戏剧社</a>
                        <p>由戏剧爱好者自发组成的社团，义务教学、排练、演出，交流技艺、增进友谊，弘扬戏剧艺术、丰富文化生活。</p>
                    </li>

                    <li class='list top'><a href='${pageContext.request.contextPath}/communityInfo/getCommunity?name=摄影协会' title='摄影协会'
                                            target='_self'>摄影协会</a>
                        <p>这里有擅长各门类摄影、持各种摄影观念的人员，让摄影爱好者能够共同学习，互相交流，提高艺术修养和摄影技术。</p>
                    </li>
                    <li class='list top'><a href='${pageContext.request.contextPath}/communityInfo/getCommunity?name=志愿者协会' title='志愿者协会'
                                            target='_self'>志愿者协会</a>
                        <p>以“奉献、友爱、互助、进步”为宗旨，受教育、长才干、做奉献，多层次、全方位、深入持久地展开志愿服务活动。</p>
                    </li>

                </ul>
            
        </div>
    </div>
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
