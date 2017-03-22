<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../include.jsp"/>
<title>用户信息查看</title>
</head>
<body>

<script type="text/javascript">
	var dataGrid;
	$(function() {
	dataGrid = $('#community').datagrid({
			url:'${pageContext.request.contextPath}/member/checkmemberinfo',
			nowrap : true,
			idField : 'id',
			pagination : true,
			frozenColumns : [ [ {
				field : 'name',
				title : '社团',
				width : 150,
				checkbox : false,
				align:'center'
			}]],
			 columns:[[
       			 {field:'username',title:'用户名',width:80,align:'center'},
       			 {field:'password',title:'密码',width:80,align:'center'},
        		 {field:'sex',title:'性别',width:80,align:'center'},
        		 {field:'age',title:'年龄',width:80,align:'center'},
        		 {field:'academy',title:'学院',width:80,align:'center'},
        		 {field:'major',title:'专业',width:100,align:'center'},
        		  {
				field : 'action',
				title : '操作',align:'center',
				width : 100,
				formatter : function(value, row, index) {
					var str = '';
						/* str += $.formatString('<img onclick="editFun(\'{0}\');" src="{1}" title="编辑"/>', row.user_id, '${pageContext.request.contextPath}/admin/jslib/style/images/extjs_icons/pencil.png');
					str += '&nbsp;'; */
						str += $.formatString('<img onclick="deleteFun(\'{0}\',\'{1}\');" src="{2}" title="删除"/>', row.name, row.username,'${pageContext.request.contextPath}/admin/jslib/style/images/extjs_icons/cancel.png');
					return str;
				}
			}
   			]],
   			toolbar : '#toolbar',
		});
	});
	
	/**删除用户*/
	function deleteFun(name,username) {
		if (name == undefined || username == undefined) {//点击右键菜单才会触发这个
			var rows = dataGrid.datagrid('getSelections');
			name = rows[0].name;
			username = rows[0].username;
		} else {//点击操作里面的删除图标会触发这个
			dataGrid.datagrid('unselectAll').datagrid('uncheckAll');
		}
		parent.$.messager.confirm('询问', '您是否要删除当前用户？', function(b) {
			if (b) {
					parent.$.messager.progress({
						title : '提示',
						text : '数据处理中，请稍后....'
					});
					$.ajax({
   				type: "POST",
   				url: "${pageContext.request.contextPath}/member/cancelmemberbyid?name="+name+"&username="+username,
   				dataType:"json",
   				success: function(j){
     				if(j.success == true) {
     						$.messager.show({
							title:'操作正确',
							msg:j.msg,
							timeout:2000,
							showType:'slide'
			});
							dataGrid.datagrid('reload');
     				} else {
     					parent.$.messager.alert('提示', j.msg, 'error');
     				}
     				
   				}
   				
				});
				parent.$.messager.progress('close');	
				} else {
					parent.$.messager.show({
						title : '提示',
						msg : '错误失败'
					});
				}
		});
	}
	
	
	/**设置职位操作*/
	function editFun(id) {
		if (id == undefined) {
			var rows = dataGrid.datagrid('getSelections');
			id = rows[0].id;
		} else {
			dataGrid.datagrid('unselectAll').datagrid('uncheckAll');
		}
		parent.$.modalDialog({
			title : '设置职位',
			width : 500,
			height : 300,
			href : '${pageContext.request.contextPath}/member/editPage?id=' + id,
 			buttons : [ {
				text : '提交',
				handler : function() {
					parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
					var f = parent.$.modalDialog.handler.find('#setposition');
					f.submit();
				}
			}] 
		});
	}
</script>

<div>
	<table id="community">
	</table>
</div>

</body>
</html>