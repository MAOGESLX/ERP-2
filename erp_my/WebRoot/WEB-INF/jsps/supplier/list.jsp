<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<link href="css/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	$(function() {
		$("#query").click(function() {
			$("[name='pageNum']").val(1);
			$("form:first").submit();
		});
	});
	function showMsg(msg,uuid){
		top.$('context-msg').style.display = "block";
		top.$('context-msg-text').innerHTML=msg;
		top.$('hid-action').value="supplier_delete?model.uuid="+uuid;
		top.lock.show();
	}
</script>
<div class="content-right">
	<div class="content-r-pic_w">
		<div style="margin:8px auto auto 12px;margin-top:6px">
			<span class="page_title">供应商管理</span>
		</div>
	</div>
	<div class="content-text">
		<form action="supplier_list" method="post">
			<div class="square-o-top">
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					style="font-size:14px; font-weight:bold; font-family:"黑体";">
					<tr>
						<td width="28%" height="30">&nbsp;</td>
						<td width="8%">供应商:</td>
						<td width="17%"><s:textfield name="shq.name" size="18"/></td>
						<td width="8%">联系人:</td>
						<td width="17%"><s:textfield name="shq.contact" size="18"/></td>
						<td width="12%">
							<a id="query"><img src="images/can_b_01.gif" border="0" /> </a></td>
					</tr>
					<tr>
						<td height="30">&nbsp;</td>
						<td>电话:</td>
						<td><s:textfield name="shq.phone" size="18"/></td>
						<td>提货方式：</td>
						<td>
							<s:select list="@org.erp.invoice.supplier.entity.SupplierModel@needsMap"
								name="shq.needs" headerKey="-1" headerValue="----请-选-择----"/>
							<%-- <select class="kuan">
								<option value="-1"></option>
								<option value="1">送货</option>
								<option value="2">自提</option>
							</select> --%>
						</td>
						<td>
							<a href="supplier_input"><img	src="images/can_b_02.gif" border="0" /> </a></td>
					</tr>
				</table>
			</div>
			<!--"square-o-top"end-->
			<div class="square-order">
				<table width="100%" border="1" cellpadding="0" cellspacing="0">
					<tr align="center"
						style="background:url(images/table_bg.gif) repeat-x;">
						<td width="20%" height="30">供应商</td>
						<td width="20%">地址</td>
						<td width="20%">联系人</td>
						<td width="12%">电话</td>
						<td width="12%">送货方式</td>
						<td width="16%">操作</td>
					</tr>
					<s:iterator value="list">
					<tr align="center" bgcolor="#FFFFFF">
						<td width="13%" height="30">${name }</td>
						<td>${address }</td>
						<td>${contact }</td>
						<td>${phone }</td>
						<td>${needsView} </td>
						<td>
							<img src="images/icon_3.gif" /> 
							<span style="line-height:12px; text-align:center;"> 
								<s:a action="supplier_input">
									<s:param name="model.uuid" value="uuid"/>
									修改
								</s:a>
								<!-- <a href="./input.jsp" class="xiu">修改</a> -->
							</span> 
							<img src="images/icon_04.gif" /> 
							<span style="line-height:12px; text-align:center;"> 
								<a href="javascript:void(0)" class="xiu" onclick="showMsg('是否删除该项数据？',${uuid})">删除</a>
							</span>
						</td>
					</tr>
					</s:iterator>
				</table>
				<%@ include file="/WEB-INF/jsps/page/page.jsp" %>
			</div>
		</form>
	</div>
	<div class="content-bbg"></div>
</div>