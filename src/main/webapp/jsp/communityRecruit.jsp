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
                <button class="btn btn-default" type="button"onclick="searchC();">搜索</button>
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
                <div class="position">当前位置：<a href="${pageContext.request.contextPath}/index.jsp" title="首页">首页</a> &gt;<a href="${pageContext.request.contextPath}/jsp/communityList.jsp">社团列表</a>&gt;<a href="${pageContext.request.contextPath}/communityInfo/getRecruit">招募信息</a></div>
                <span>社团活动</span> </h3>
            <div class="active" id="shownews">
                <h1 class="title">${community.name }招募信息</h1>
                <div class="editor">
                      <!--   <p>二十多年来，协会组织了600余次讲座，100多个培训班，几十多次全校性的大赛及其他形式多样的活动。其中有面向入门者的基础技术培训班，帮助提高水平的中级辅导班，还有追踪新技术发展的专题系列讲座，全校100000余人次参加了协会的各种活动。近来，协会以其丰富多彩的活动、显著的工作成绩，得到了校内外的广泛好评，成为武汉高校界最具影响力的社团之一。在协会的影响下，全校学习计算机知识已蔚然成风，协会也在不断的发展壮大。目前，协会拥有包括研究生在内的近2000名会员，是我校规模最大的学生社团之一。
                            协会的各项活动得到了校团委和教务处的大力支持，并和中国计算机学会、湖北省信息产业厅、湖北省软考办以及包括微软、Intel、联想、IBM、方正等众多知名IT企业建立了良好的合作关系。 中关村在线、《武汉晚报》、《华中科技大学校报》、醉晚亭网站、华中大在线等都对我协会的发展进行过追踪系列报道。</p>
                        <p>协会一直负责一年一度的全国计算机软件专业资格和水平考试华工考点的报名、培训、组织考试、成绩发布及办证工作，此项工作正不断走向科学化，规范化。在历年考试中，报考人数之多，通过率之高，通过人数占全省通过总人数的比重之重，雄踞湖北各高校之首。尤其值得一提的是：通过的人员当中，非计算机专业的人员已占了很大比例，从中可以看出我协会的普及工作已取得了巨大成绩。2003年我校软考报名人数近3000人，占湖北省1/6。其中最高级别的系统分析员通过人数占全省4/5,高级程序员通过380人,占全省1/3。</p>
                        <p>2003年8月协会和湖北省软件水平考试实施小组办公室联合组织软考培训班。学员不但来自包括武大、华师、地大等10多所高校，还有大量社会学员，更有一些宜昌、荆州、沙市的外地学员。软考培训班的高级程序员通过率超过50%，中级程序员超过70%，而湖北省的通过率仅有20%，从中可以看出我们的培训起到很好的效果。</p> -->
               		${recruit.content }
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
