<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<!-- easyUI CSS -->
<link rel="stylesheet" type="text/css"
	href="../../themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="../../themes/icon.css">
<!-- easyui js -->
<script type="text/javascript" src="../../js/jquery.min.js"></script>
<script type="text/javascript" src="../../js/jquery.easyui.min.js"></script>

</head>

<body style="background-color: #EAEAEA;margin: 0px">
	<div style="margin: 10px;">
		<div style="float: left">
			<a id="add"
				href="${pageContext.request.contextPath}/warehouse/cargo/cargoCreate.jsp"
				style="margin-left: 0px;background: #EAEAEA"
				class="easyui-linkbutton" data-options="iconCls:'icon-add'">增加</a> <a
				id="update" href="#" style="margin-left: 0px;background: #EAEAEA"
				class="easyui-linkbutton" data-options="iconCls:'icon-edit'"
				onclick="getID()">修改</a> <a id="delete" href="#"
				style="margin-left: 0px;background: #EAEAEA"
				class="easyui-linkbutton" data-options="iconCls:'icon-remove'"
				onclick="Delete()">删除</a>
		</div>
		<a style="margin-left: 5px"></a><input class="easyui-searchbox"
			data-options="prompt:'Please Input Value',menu:'#mm',searcher:doSearch"
			style="width:350px;">
		<div id="mm">
			<div data-options="name:'id',iconCls:'icon-ok'">编号</div>
			<div data-options="name:'sports'"></div>
		</div>
	</div>
	<div style="background:gray;width:1320px;height:500px;margin: 0px">
		<table class="easyui-datagrid" id="productorJson"
			data-options="title:'货物列表',
		halign:'center',fitColumns : true,singleSelect : false,pagination : true,">
		</table>
	</div>
</body>
<script type="text/javascript">
	$('#productorJson').datagrid({
		url : '${pageContext.request.contextPath}/warehouse/cargo/list.action',
		fit : true,
		pageSize : 15,
		pageList : [ 10, 15, 20 ],
		columns : [ [ {
			field : 'id',
			title : '货物编号',
			align : 'center',
			width : 1,
		}, {
			field : 'name',
			title : '名称',
			align : 'center',
			width : 1,
		}, {
			field : 'price',
			title : '价格',
			align : 'center',
		}, {
			field : 'num',
			title : '数量',
			align : 'center',
			width : 1,
		}, {
			field : 'store_id',
			title : '仓库编号',
			align : 'center',
			width : 1,
		} ] ]
	});
</script>

<script type="text/javascript">
	function getID() {
		var selectedID = $('#productorJson').datagrid('getSelected');
		var cid = selectedID['cid'];
		str = '${pageContext.request.contextPath}/warehouse/cargo/toupdate.action?cid='
				+ cid;
		window.location.href = str;
	}
	function Delete() {
		var selectedID = $('#productorJson').datagrid('getSelections');
		var sum = 0;
		var id = [];
		for ( var i in selectedID)
			id[i] = selectedID[i]['cid'];
		if (id.length != 0) {
			str = '${pageContext.request.contextPath}/warehouse/cargo/delete.action?id='
					+ id + '&num=' + id.length;
			window.location.href = str;
		}
	}
	$('#productorJson')
			.datagrid(
					{
						onDblClickRow : function(rowIndex, rowData) {
							var cid = rowData['cid'];
							str = '${pageContext.request.contextPath}/warehouse/cargo/toupdate.action?cid='
									+ cid;
							window.location.href = str;
						}
					});

	function doSearch(value, name) {
		if (value) {
			str = '${pageContext.request.contextPath}/warehouse/cargo/search.action?name='
					+ name + '&value=' + value;
			$('#productorJson').datagrid({
				url : str,
			});
		} else {
			str = '${pageContext.request.contextPath}/warehouse/cargo/list.action';
			$('#productorJson').datagrid({
				url : str,
			});
		}
	}
</script>
</html>
