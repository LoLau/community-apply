<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->

    <!--导入bootstrap核心css文件-->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="apply.css" type="text/css" rel="stylesheet">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="../js/jquery-1.11.1.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="../js/bootstrap.min.js"></script>
	<jsp:include page="include.jsp"/>
    <title>社团网申系统</title>
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
                <li class="active"><a href="${pageContext.request.contextPath}/index.jsp#ad-carousel">首页</a></li>
                <li><a href="${pageContext.request.contextPath}/index.jsp#summary-container">热门社团</a></li>
                <li><a href="#" data-toggle="modal" data-target="${pageContext.request.contextPath}/index.jsp#about-modal">关于</a>
                </li>
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
                 		[${currentUser }]
                 		<span>
                 			<a href="javascript:void(0)" style="cursor:pointer;font-size:14px;font-weight: bold;"title="注销" onclick="jumpToUI(this)">注销</a>
                		</span>
                		|<span><a href="javascript:void(0)"  style="cursor:pointer;font-size:14px;font-weight: bold;" title="个人中心" onclick="jumpToUI(this)">个人中心</a>
                        </span>
                	 </c:otherwise>
                 </c:choose>
                </li>
            
            </ul>
						<!-- <li style="padding-right:500px"></li> -->
        </div>
    </div>
</div>

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


<div class="head">
    <div id="headMenu" class="area">
	<%--
	<a href="${pageContext.request.contextPath}/index.jsp" target="_blank">
            <img style="padding-left:100px;float: left" src="${pageContext.request.contextPath}/images/homelogo.png" class="pngtm logo" alt="社团网申系统主页" title="社团网申系统主页" />
    </a> 
    --%>
    
        <div style="width:auto; float:left; text-align: center">
            <p style="float:left; margin-left:350px; margin-top:80px" class="xtdl1">社 团 申 请</p>

<%--            <a href="${pageContext.request.contextPath}/apply/showApplyResult.jsp" data-toggle="modal" data-target="#apply-modal">
            	
               <p style="float:right; margin-left:415px; margin-top:90px" class="xtdl2" alt="查看申请社团状态" title="查看申请社团状态">申请结果</p>
            </a> --%>
        </div>
    </div>
    <div class="area">
    <table width="100%">
        <tr>
            <td width="100%" height="450" colspan="2" align="center" valign="middle">
                <table>
                    <tr><td align="center" valign="middle">
                        <div class="area table_new">
                            <div class="content form">
                                <div class="table_content talbe_area2">
                                    <form autocomplete="off" id="RegisterForm" method="post" action="${pageContext.request.contextPath}/apply/fillInTable">
                                        <div class="bitian" style="top:15px; left:60px;">
                                            	个人信息
                                        </div>

                                        <div class="detail">
                                            <div>
                                                <p style="float: left">
                                                    <span><strong>用户名</strong><label id="speusername" class="sp"></label></span>
                                                <span>
                                                 	<input data-val="true" data-val-required="用户名不能为空" id="username" name="username" type="text" value="${currentUser}" readonly="readonly"/>
                                                    
                                                </span>
                                                </p>
                                                <p style="float:right;">
                                                    <span><strong>性&nbsp;&nbsp;&nbsp;&nbsp;别</strong></span>
                                                <span>
                                                    <select name="apply-position" id="input-sex" required>
                                                        <option value="男">男</option>
                                                        <option value="女">女</option>
                                                    </select>
                                                </span>
                                                </p>
                                            </div>
                                            <div>
                                                <p style="float:left;">
                                                    <span><strong>年&nbsp;&nbsp;&nbsp;龄</strong><label id="label-age" class="sp"></label></span>
                                                    <span><input id="input-age" name="age" type="number" required></span>
                                                </p>
                                                <p style="float:right;">
                                                    <span><strong>邮&nbsp;&nbsp;&nbsp;箱</strong><label id="spemail" class="sp"></label></span>
                                                    <span><input data-val="true" data-val-required="邮箱不能为空" id="input-email" name="email" type="email" required></span>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="bitian" style="top:244px; left:60px; width:80px;">
                                        	    社团信息
                                        </div>
                                        <div class="detail">
                                            <div>
                                                <p style="float:left;">
                                                    <span><strong>社团名称</strong><label id="label-community-name" class="sp"></label></span>
                                                    <span>
                                                    <input data-val="true" data-val-required="社团名称不能为空" id="communityName" name="communityName" type="text" value="${communityName}"readonly="readonly"/>
                                                   <%-- <label id="communityName" name="communityName">${communityName}</label> --%>
                                                    
                                                    </span>
                                                </p>
                                                <p style="float:right;">
                                                    <span><strong>申请职位</strong></span>
                                                <span>
                                                    <select name="applyJob" id="applyJob">
                                                        <option value="主席">主席</option>
                                                        <option value="副主席">副主席</option>
                                                        <option value="部长">部长</option>
                                                        <option value="副部长">副部长</option>
                                                        <option value="其他">其他</option>
                                                    </select>
                                                </span>
                                                </p>
                                            </div>

                                            <div>
                                                <p style="width:100%;">
                                                    <span><strong>申请时间</strong><label id="label-applytime" class="sp"></label></span>
                                                <span>
                                                    <span id="provincecity" style="width:260px;"></span>
                                                    <input name="applyDate" id="applyDate" style="width:222px; margin-top:2px;" type="date" required>
                                                </span>
                                                </p>
                                            </div>
                                        </div>
                                        <div>
                                            <!--<input id="btn_apply" type="button" onclick="register()" value="立即申请" class="apply_btn" style="margin:20px auto 5px;" />-->
                                            <button class="btn btn-lg btn-primary btn-block" style="width:200px" type="submit">立即申请</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>

<hr class="feature-divider">
    <!-- 底部 -->
    <footer>
        <div class="foot-text" style="text-align: center">
            <p>Copyright &#169; 2016 Powered by 华中科技大学校软件学院  </p>
            <p>地址：湖北省武汉市洪山区珞喻路1037号 邮政编码：430074　电话：027-87541114传真：027-87545438　鄂ICP备030193</p>
        </div>
    </footer>

</div>

</body>

</html>