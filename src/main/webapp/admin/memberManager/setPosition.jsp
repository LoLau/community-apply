<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- <jsp:include page="../include.jsp"/> --%>
<title>成员职位设置</title>
</head>
<body>

<script type="text/javascript">

$(function() {
			parent.$.messager.progress('close');
			$('#setposition').form({
				url : '${pageContext.request.contextPath}/member/setposition',
				onSubmit : function() {
					parent.$.messager.progress({
						title : '提示',
						text : '数据处理中，请稍后....'
					});
					
					var username = $('#username').val();
					var position = $('#position').val();
					var result = true;
					if(position == '') {
						parent.$.messager.progress('close');
						$.messager.alert('错误','请设置职位','error');
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
						$.messager.show({
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
	<form id="setposition" method="post" style="padding:10px 20px 10px 40px;">
<!-- 		用户名称：<input type="text" id="username" name="username"/>
		职位：<input type="text" id="position" name="position"/>
		<input type="button" id="btnSubmit" value="设置"/>
		<input type="button" id="btnCancel" value="取消"/> -->
		<table> 
				<tr>
					<p>
						<td>用户名称:</td> <td><input id="username" name="username" type="text" style="width:230px" value="${username}"></td>
					</p>
				</tr>
				<tr>
					<p>
						<td>设置职位:</td> <td><input id="position" name="position" type="text" style="width:230px" value=""></td>
					</p>
				</tr>
				<!-- <tr>
					<p>
						<td><input id="btnSubmit" name="btnSubmit" type="button" value="设置"></td> 
						<td><input id="btnCancel" name="btnCancel" type="button" value="取消"></td>
					</p>
				</tr> -->
		</table>
	</form>
	</div>
	</div>
</body>
</html>