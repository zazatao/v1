<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="nyleft">
	<div class="zdqwz">
		<c:if test="${page != 'brand' && page != 'special'}">
			<img src="../content/static/images/zy.png" /> > ${cate.category }
			</c:if>
		<c:if test="${page == 'brand'}">
			<img src="../content/static/images/zy.png" /> > 名品街
			</c:if>
		<c:if test="${page == 'special'}">
			<img src="../content/static/images/zy.png" /> > 打折热卖产品 
			</c:if>
	</div>
	<div class="nyflcd">
		<div id="my_menu" class="sdmenu">
			<c:forEach items="${shopCategories }" var="category" varStatus="loop">
				<c:if test="${category.parentLevel == cate }">
					<div class="collapsed">
						<span>${category.category }</span>
						<div>
							<c:forEach items="${shopCategories }" var="one">
								<c:if test="${one.parentLevel == category }">
									<a
										href="../proscenium/shopCommItem?id=${one.categoryID }&page=page">${one.category }</a>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</div>

	<div class="leftzs">
		<div class="nletop">Рекомендуемые</div>
		<ul>
			<li><a href="yl_list_detail.html"><img
					src="../content/static/images/dz/img_1.jpg" /></a> <h>【<span
					class="red">人气爆款</span>】测试信息测试信息测试信息</h><a class="bold"
				href="yl_list_detail.html">￥123</a></li>
			<li><a href="yl_list_detail.html"><img
					src="../content/static/images/dz/img_1.jpg" /></a> <h>【<span
					class="red">人气爆款</span>】测试信息测试信息测试信息</h><a class="bold"
				href="yl_list_detail.html">￥123</a></li>
			<li><a href="yl_list_detail.html"><img
					src="../content/static/images/dz/img_1.jpg" /></a> <h>【<span
					class="red">人气爆款</span>】测试信息测试信息测试信息</h><a class="bold"
				href="yl_list_detail.html">￥123</a></li>
			<li><a href="yl_list_detail.html"><img
					src="../content/static/images/dz/img_1.jpg" /></a> <h>【<span
					class="red">人气爆款</span>】测试信息测试信息测试信息</h><a class="bold"
				href="yl_list_detail.html">￥123</a></li>
			<li><a href="yl_list_detail.html"><img
					src="../content/static/images/dz/img_1.jpg" /></a> <h>【<span
					class="red">人气爆款</span>】测试信息测试信息测试信息</h><a class="bold"
				href="yl_list_detail.html">￥123</a></li>
		</ul>
	</div>
</div>
