<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body >
	
	<script type="text/javascript">
	$(function() {
			parent.$.messager.progress('close');
			$('#form').form({
				url : '${pageContext.request.contextPath}/CommunityManager/editCommunity',
				onSubmit : function() {
					parent.$.messager.progress({
						title : '提示',
						text : '数据处理中，请稍后....'
					});
					
					var name = $('#name').val();
					var type = $('#type').val();
					var result = true;
					if(name == '') {
						parent.$.messager.progress('close');
						$.messager.alert('错误','社团名称不能为空!','error');
						result = false;
					}
					if(type == ''){
						parent.$.messager.progress('close');
						$.messager.alert('错误','社团类型不能为空!','error');
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
	<div data-options="region:'center',border:false" title="" style="overflow: hidden;">
		<form id="form" method="post" style="padding:10px 20px 10px 40px;">
		<table cellpadding="5">
				<input type="hidden" id="community_id" name="community_id" value="${community.community_id}"/> 
				<tr>
					<p>
						<td>社团名称:</td> <td><input id="name" name="name" type="text" style="width:230px" value="${community.name }"></td>
					</p>
				</tr>
				<tr>
					<p>
						<td>社团类型:</td> <td><input id="type" name="type" type="text" style="width:230px" value="${community.type }"></td>
					</p>
				</tr>
				<tr>
					<p>
						<td>社团简介:</td> <td><textarea id="intro" name="intro" style="width:230px;height:80px">${community.intro }</textarea></td>
					</p>
				</tr>
				<tr>
					<p>
						<td>社团荣誉:</td> <td><textarea id="current_situation" name="current_situation" style="width:230px;height:40px" >${community.current_situation }</textarea></td>
					</p>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>