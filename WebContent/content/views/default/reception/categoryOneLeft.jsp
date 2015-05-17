<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="nyleft">
	<div class="zdqwz">
		<img src="../content/static/images/zy.png" /> > 
		<c:if test="${sessionScope.language == 'chinese' }">${cate.category }</c:if>
		<c:if test="${sessionScope.language == 'russina' }">${cate.russinaCategory }</c:if>
	</div>
	<div class="nyflcd">
		<div id="my_menu" class="sdmenu">
			<c:forEach items="${cate.children }" var="category" varStatus="loop">
					<div class="collapsed">
						<span>
						<c:if test="${sessionScope.language == 'chinese' }">${category.category }</c:if>
						<c:if test="${sessionScope.language == 'russina' }">${category.russinaCategory }</c:if>
						</span>
							<div>
								<c:forEach items="${category.children }" var="one">
									<c:if test="${sessionScope.language == 'chinese' }">
										<a href="../proscenium/shopCommItem?id=${one.categoryID }&page=page">${one.category }</a>
									</c:if>
									<c:if test="${sessionScope.language == 'russina' }">
										<a href="../proscenium/shopCommItem?id=${one.categoryID }&page=page">${one.russinaCategory }</a>
									</c:if>
									
								</c:forEach>
							</div>
					</div>
			</c:forEach>
		</div>
	</div>
</div>
