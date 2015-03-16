<%@page import="com.yc.entity.user.User"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
				发布商品：<span><a href="../proscenium/releaseCommoidty">新增&nbsp;&nbsp;/&nbsp;&nbsp;</a><a
					href="#">修改&nbsp;&nbsp;/&nbsp;&nbsp;</a><a href="#"
					onclick="deleteShopComm();">删除&nbsp;&nbsp;/&nbsp;&nbsp;</a><a
					href="#" onclick="checkAll();">全选</a></span>
			</h3>
			<div>
				<table class="tab_1">
					<tr class="tit_tr">
						<td width="97">商品编号</td>
						<td width="119">商品分类</td>
						<td width="220">商品名称</td>
						<td width="122">商品图片</td>
						<td width="58">商品价格</td>
						<td width="51">加入拍卖</td>
						<td width="59">加入折扣</td>
						<td width="28"></td>
					</tr>
					<c:forEach var="shopComm" items="${shopComms }" varStatus="loop">
						<tr>
							<td>${shopComm.commCode }</td>
							<td>${shopComm.shopCategory.category }</td>
							<td>${shopComm.commoidtyName }</td>
							<td><img src="..${shopComm.shopCommImages[0].imagePath }" /></td>
							<td>￥${shopComm.unitPrice }</td>
							<td><button
									onclick="zhekou1(${shopComm.auction},${shopComm.commCode },${shopComm.shelves });">
									<c:if test="${shopComm.auction}">拍卖中</c:if>
									<c:if test="${!shopComm.auction}">下拍</c:if>
								</button></td>
							<td><button
									onclick="zhekou(${shopComm.isSpecial},${shopComm.commCode },${shopComm.shelves });">
									<c:if test="${shopComm.isSpecial}">已加入</c:if>
									<c:if test="${!shopComm.isSpecial}">不加入</c:if>
								</button></td>
							<td><span class="red">￥<fmt:formatNumber
										value="${shopComm.unitPrice * shopComm.special }"
										pattern="##.##" minFractionDigits="2"></fmt:formatNumber></span></td>
							<td><input type="checkbox" name="commID"
								value="${shopComm.commCode}" /></td>
						</tr>
					</c:forEach>
				</table>
				<script>
					var check = false;
					function deleteShopComm(){
						var ids = "";
						$("input[name='commID']").each(function(){
							if (true == $(this).attr("checked")) {
								ids = ids+"-"+$(this).attr('value');
						    }
						});
						if (ids != "") {
							if( confirm('您确定要删除这些货品吗？') ){
								location.href ='../proscenium/deleteComm?ids='+ids+"&page=release";
							}
						}
					}
					function zhekou(bool,commID,shangjia){
						if (bool) {
							if( confirm('该货品确定要退出折扣吗？') ){
								location.href ='../proscenium/updateState?id='+commID+'&page=release&param=isSpecial&isTrue='+!bool+"&num=0";
							}
						}else{
							if (shangjia) {
								if( confirm('确定将该货品加入折扣吗？') ){
									var num=prompt("该商品将要打几折呢？","9折");
									if (!isNaN(num))
								    {
										location.href ='../proscenium/updateState?id='+commID+'&page=release&param=isSpecial&isTrue='+!bool+"&num="+num;
								    }
									else
									{
									alert("只需要输入折扣数就好！！！");
									}
								}
							}else{
								alert("请将该货品先上架！！");
							}
						}
					}
					function zhekou1(bool,commID,shangjia){
						if (bool) {
							if( confirm('该货品确定要下拍吗？') ){
								location.href ='../proscenium/updateState?id='+commID+'&page=release&param=auction&isTrue='+!bool;
							}
						}else{
							if(shangjia){
								if( confirm('确定将该货品拍卖吗？') ){
									location.href ='../proscenium/updateState?id='+commID+'&page=release&param=auction&isTrue='+!bool;
								}
							}else{
								alert("请将该货品先上架！！");
							}
						}
					}
					function checkAll(){
							if (!check) {
								$("input[name='commID']").each(function(){
										$(this).attr("checked","checked");
										check = true;
								});
							} else {
								$("input[name='commID']").each(function(){
									$(this).attr("checked","");
									check = false;
								});
							}
					}
					$(function() {
						$('.perterrtab tbody tr:odd').css("backgroundColor",
								"#e5e5e5");
					})
				</script>
			</div>
		</div>
	</div>
	<div class="clear"></div>
	<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>
