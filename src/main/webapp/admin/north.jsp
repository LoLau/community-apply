<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<script type="text/javascript" charset="utf-8">

	function logout() {
		window.location.href = "${pageContext.request.contextPath}/admin/logout";
	}
	
</script>
<h1 style="margin:15px 10px;">社团网申系统-后台管理</h1>
<div style="position: absolute; right: 0px; bottom: 0px;">
	<c:if test="${currentAdmin != null}"><strong>${currentAdmin}</strong>，欢迎你！</c:if>
	<a href="javascript:void(0);" class="easyui-menubutton" data-options="menu:'#layout_north_zxMenu',iconCls:'cog'">注销</a>
</div>

<div id="layout_north_zxMenu" style="width: 100px; display: none;">
	<div onclick="logout();">退出系统</div>
</div>