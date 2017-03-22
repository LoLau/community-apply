<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<jsp:include page="../include.jsp"/>
</head>

<body >

	<script type="text/javascript">
		$(function() {
			parent.$.messager.progress('close');
			$('#form').form({
				url : '${pageContext.request.contextPath}/CommunityManager/communityRecruit',
				onSubmit : function() {
					parent.$.messager.progress({
						title : '提示',
						text : '数据处理中，请稍后....'
					});
					
					var content = $('#content').val();
					var result = true;
					if(content == '') {
						parent.$.messager.progress('close');
						$.messager.alert('错误','招募内容不能为空!','error');
						result = false;
					}
					return result;
					},
					success : function(result) {
						parent.$.messager.progress('close');
						result = $.parseJSON(result);
						if (result.success) {
							parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
							parent.$.modalDialog.handler.dialog('close');
							$.messager.alert({
							title:'操作正确',
							msg:result.msg,
							timeout:2000,
							showType:'slide'
					});
						} else {
							parent.$.messager.alert('错误', result.msg, 'error');
						}
					}
				});
			});
	</script>
	
<div class="easyui-layout" data-options="fit:true,border:false">
	<div class="easyui-panel" data-options="region:'center',border:false" title="" style="overflow: hidden;">
		<form id="form" method="post" style="padding:10px 20px 10px 40px;" enctype="multipart/form-data">
			<table cellpadding="5">
				<input type="hidden" id="community_id" name="community_id" value="${community.community_id}"/> 
				<tr>
					<p>
						<td>社团名称:</td> <td>${community.name }</td>
					</p>
				</tr>
				<tr>
					<p>
						<td>招募内容:</td> <td><textarea id="content" name="content" style="width:280px;height:150px"></textarea></td>
					</p>
				</tr>
			</table>
		</form>
	</div>
</div>

</body>
</html>