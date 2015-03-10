<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="nyleft">
	<div class="zdqwz">
		<img src="../content/static/images/zy.png" /> > ${cate.category }
	</div>
	<div class="nyflcd">
		<div id="my_menu" class="sdmenu">
			<c:forEach items="${cate.children }" var="category" varStatus="loop">
					<div class="collapsed">
						<span>${category.category }</span>
							<div>
								<c:forEach items="${category.children }" var="one">
									<a href="../proscenium/shopCommItem?id=${one.categoryID }&page=page">${one.category }</a>
								</c:forEach>
							</div>
					</div>
			</c:forEach>
		</div>
	</div>
</div>
