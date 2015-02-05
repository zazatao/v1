<%@page import="com.yc.entity.user.User"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>zazatao</title>
<link href="../content/static/css/reception/css.css" rel="stylesheet"
	type="text/css" />
<link href="../content/static/css/reception/qt.css" rel="stylesheet"
	type="text/css" />
<link href="../content/static/css/reception/persc.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="../content/static/js/reception/png.js"></script>
<script type="text/javascript"
	src="../content/static/js/reception/sdmenu.js"></script>
<script type="text/javascript"
	src="../content/static/js/reception/jquery-1.4.2.min.js"></script>
<script type="text/javascript"
	src="../content/static/js/reception/js.js"></script>
<SCRIPT src="../content/static/js/reception/ScrollPic.js"
	type=text/javascript></SCRIPT>
</head>

<body>
	<jsp:include page="../common/prosceniumNav.jsp"></jsp:include>
	<div class="con">

		<!---------------   left   ----------------------->
		<jsp:include page="left.jsp"></jsp:include>
		<!---------------   right   ------------->

		<div class="perterrtab perterrtab_2">
			<h3>
				发布商品名称：<span><a href="../proscenium/releaseCommoidty">新增&nbsp;&nbsp;/&nbsp;&nbsp;</a><a
					href="#">修改&nbsp;&nbsp;/&nbsp;&nbsp;</a><a href="#">删除&nbsp;&nbsp;/&nbsp;&nbsp;</a><a
					href="#">全选</a></span>
			</h3>
			<div>
				<table class="tab_1">
					<tr class="tit_tr">
						<td width="97">商品编号</td>
						<td width="119">商品分类</td>
						<td width="220">商品名称</td>
						<td width="122">商品图片</td>
						<td width="58">商品价格</td>
						<td width="51">加入促销</td>
						<td width="59">折扣</td>
						<td width="28"></td>
					</tr>
					<c:forEach var="shopComm" items="${shopComms }" varStatus="loop">
						<tr>
							<td>${shopComm.commCode }</td>
							<td>${shopComm.shopCategory.category }</td>
							<td>${shopComm.commoidtyName }</td>
							<td><img src="../${shopComm.shopCommImages[0].imagePath }" /></td>
							<td>￥${shopComm.unitPrice }</td>
							<td><input type="checkbox" /></td>
							<td><span class="red">￥${shopComm.special }</span></td>
							<td><input type="checkbox" name="commID"/></td>
						</tr>
					</c:forEach>
				</table>
				<script>
					$(function() {
						$('.perterrtab tbody tr:odd').css("backgroundColor",
								"#e5e5e5");
					});
				</script>
			</div>
		</div>
	</div>
	<div class="clear"></div>
	<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>
