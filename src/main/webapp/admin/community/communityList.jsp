<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../include.jsp"/>
<title>社团列表-社团管理</title>
</head>
<body>

<script type="text/javascript">
	var dataGrid;
	$(function() {
	dataGrid = $('#community').datagrid({
			url:'${pageContext.request.contextPath}/CommunityManager/getCommunityList',
			nowrap : true,
			idField : 'community_id',
			pagination : true,
			frozenColumns : [ [ {
				field : 'community_id',
				title : '编号',
				width : 50,
				checkbox : true,
				align:'center'
			}]],
			 columns:[[
       			 {field:'name',title:'社团名称',width:80,align:'center'},
        		 {field:'type',title:'社团类型',width:80,align:'center'},
        		 {field:'intro',title:'社团简介',width:200},
        		 {field:'current_situation',title:'社团荣誉',width:150,align:'center'},
        		 {field:'create_time',title:'创建时间',width:150,align:'center'},
        		  {
				field : 'action',
				title : '操作',align:'center',
				width : 100,
				formatter : function(value, row, index) {
					var str = '';
						str += $.formatString('<img onclick="editFun(\'{0}\');" src="{1}" title="编辑"/>', row.community_id, '${pageContext.request.contextPath}/admin/jslib/style/images/extjs_icons/pencil.png');
					str += '&nbsp;';
						str += $.formatString('<img onclick="deleteFun(\'{0}\');" src="{1}" title="删除"/>', row.community_id, '${pageContext.request.contextPath}/admin/jslib/style/images/extjs_icons/cancel.png');
					return str;
				}
			}
   			]],
   			toolbar : '#toolbar',
		});
	});
	
	/**修改*/
	function editFun(id) {
		if (id == undefined) {
			var rows = dataGrid.datagrid('getSelections');
			id = rows[0].id;
		} else {
			dataGrid.datagrid('unselectAll').datagrid('uncheckAll');
		}
		parent.$.modalDialog({
			title : '编辑社团',
			width : 500,
			height : 350,
			href : '${pageContext.request.contextPath}/CommunityManager/editPage?id=' + id,
			buttons : [ {
				text : '提交',
				handler : function() {
					parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
					var f = parent.$.modalDialog.handler.find('#form');
					f.submit();
				}
			} ]
		});
	}
	
	/**删除*/
	function deleteFun(id) {
		if (id == undefined) {//点击右键菜单才会触发这个
			var rows = dataGrid.datagrid('getSelections');
			id = rows[0].id;
			
		} else {//点击操作里面的删除图标会触发这个
			dataGrid.datagrid('unselectAll').datagrid('uncheckAll');
		}
		parent.$.messager.confirm('询问', '您是否要删除当前社团？', function(b) {
			if (b) {
					parent.$.messager.progress({
						title : '提示',
						text : '数据处理中，请稍后....'
					});
					$.ajax({
   				type: "POST",
   				url: "${pageContext.request.contextPath}/CommunityManager/deleteCommunity?id="+id,
   				dataType:"json",
   				success: function(j){
     				if(j.success == true) {
     					$.messager.alert({
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
					parent.$.messager.alert({
						title : '提示',
						msg : '错误失败',
					});
				}
		});
	}
	
	/**添加*/
	function add() {
	parent.$.modalDialog({
			title : '创建社团',
			width : 500,
			href : '${pageContext.request.contextPath}/CommunityManager/createPage',
			height : 325,
			buttons : [ {
				text : '添加',
				handler : function() {
					parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
					var f = parent.$.modalDialog.handler.find('#form');
					f.submit();
				}
			} ]
		});
	}
</script>
	<div id="toolbar" style="display: none;">
		<a onclick="add();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'pencil_add'">创建社团</a>
	</div>
	
	<div>
		<table id="community">
	</table>
</div>

</body>
</html>