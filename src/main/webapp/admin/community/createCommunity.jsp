<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page language="java"%> 
<%@ page import="java.util.*"%> //获取系统时间必须导入的 
<%@ page import="java.text.*"%> //获取系统时间必须导入的 

<% 
	String datetime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime()); //获取系统时间 
	request.setAttribute("create_time", datetime);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>创建社团-社团管理</title>
	<jsp:include page="../include.jsp"/>
</head>

<body >

	<script type="text/javascript">
		$(function() {
			parent.$.messager.progress('close');
			$('#form').form({
				url : '${pageContext.request.contextPath}/CommunityManager/addCommunity',
				onSubmit : function() {
					parent.$.messager.progress({
						title : '提示',
						text : '数据处理中，请稍后....'
					});
					
					var community_id = $('#community_id').val();
					var name = $('#name').val();
					var type = $('#type').val();
					var src = document.getElementById("src").value;
					var intro = $('#intro').val();
					var current_situation = $('#current_situation').val();
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
					if(src == '') {
						parent.$.messager.progress('close');
						$.messager.alert('错误','社团图标不能为空!','error');
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
				<tr>
					<p>
						<td>社团名称:</td> <td><input id="name" name="name" class="easyui-textbox"  style="width:230px"></td>
					</p>
				</tr>
				<tr>
					<p>
						<td>社团类型:</td> <td><input id="type" name="type"class="easyui-textbox" style="width:230px"></td>
					</p>
				</tr>
				<tr>
					<p>
						<td>社团图标:</td> 
						<td>
							<input id="src" type="file"  name="src"  style="width:230px">
						</td>
					</p>
				</tr>
				<tr>
					<p>
						<td>社团简介: </td> <td><textarea id="type" name="intro" style="width:230px;height:60px"></textarea></td>
					</p>
				</tr>
				<tr>
					<p>	
						<td>社团荣誉:</td> <td> <textarea id="current_situation" name="current_situation" style="width:230px;height:40px"></textarea></td>
					</p>
					
				</tr>
				<tr>
					<p>
						<td></td> <td><input type="hidden" id="create_time" name="create_time" class="easyui-textbox" value="${create_time }"></td>
					</p>
				</tr>
			</table>
		</form>
	</div>
</div>
</script>
</body>
</html>