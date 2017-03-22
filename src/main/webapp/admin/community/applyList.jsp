 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../include.jsp"/>
<title>申请列表-社团管理</title>
</head>
<body>

<script type="text/javascript">
	var dataGrid;
	$(function() {
	dataGrid = $('#apply').datagrid({
			url:'${pageContext.request.contextPath}/applyHandel/getApplyList',
			nowrap : true,
			idField : 'apply_id',
			pagination : true,
			frozenColumns : [ [ {
				field : 'apply_id',
				title : '编号',
				width : 50,
				checkbox : true,
				align:'center'
			}]],
			 columns:[[
       			 {field:'community_name',title:'社团名称',width:130,align:'center'},
        		 {field:'username',title:'申请人',width:80,align:'center'},
        		 {field:'apply_time',title:'申请时间',width:150,align:'center'},
        		 {field:'pos',title:'申请职位 ',width:80,align:'center'},
        		 {field:'status',title:'申请状态 ',width:80,align:'center'},
        		  {
     				field : 'action',
     				title : '申请处理',align:'center',
     				width : 100,
     				formatter : function(value, row, index) {
     					var str = '';
     						str += $.formatString('<img onclick="approveFun(\'{0}\');" src="{1}" title="通过"/>', row.apply_id, '${pageContext.request.contextPath}/admin/jslib/style/images/extjs_icons/emoticon_smile.png');
     						str += '&nbsp;';
						str += $.formatString('<img onclick="disApproveFun(\'{0}\');" src="{1}" title="不通过"/>', row.apply_id, '${pageContext.request.contextPath}/admin/jslib/style/images/extjs_icons/emoticon_unhappy.png');
     					return str;
     				}
     			}
   			]],
   			toolbar : '#toolbar',
		});
	});

	/**同意*/
	function approveFun(id) {
		if (id == undefined) {//点击右键菜单才会触发这个
			var rows = dataGrid.datagrid('getSelections');
			id = rows[0].id;
			
		} else {//点击操作里面的删除图标会触发这个
			dataGrid.datagrid('unselectAll').datagrid('uncheckAll');
		}
		parent.$.messager.confirm('询问', '您是否同意此用户的申请？', function(b) {
			if (b) {
					parent.$.messager.progress({
						title : '提示',
						text : '数据处理中，请稍后....'
					});
					$.ajax({
   				type: "POST",
   				url : "${pageContext.request.contextPath}/applyHandel/approve?id=" + id,
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
	
	
	/**不同意*/
	function disApproveFun(id) {
		if (id == undefined) {//点击右键菜单才会触发这个
			var rows = dataGrid.datagrid('getSelections');
			id = rows[0].id;
			
		} else {//点击操作里面的删除图标会触发这个
			dataGrid.datagrid('unselectAll').datagrid('uncheckAll');
		}
		parent.$.messager.confirm('询问', '您是否不同意此用户的申请？', function(b) {
			if (b) {
					parent.$.messager.progress({
						title : '提示',
						text : '数据处理中，请稍后....'
					});
					$.ajax({
   				type: "POST",
   				url : "${pageContext.request.contextPath}/applyHandel/disApprove?id=" + id,
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
</script>
	
	
	<div>
		<table id="apply">
	</table>
</div>
</body>
</html>