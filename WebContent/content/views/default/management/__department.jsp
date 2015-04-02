<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%><!--引入jstl包-->
<ul>
	<c:forEach var="cur" items="${treeList}" varStatus="vs">  
	  <c:set var="index" value="${index + 1}" scope="request" /><!-- 每一次循环，index+1 -->  
	 <li><span><i class="icon-minus-sign"></i>${cur.departmentname }</span><a href="#" onclick="onclickID('${cur.departmentID}');">&nbsp;&nbsp;<img title="操作" src="../content/static/img/banshou.png"></a>
		  <c:if test="${fn:length(cur.children) > 0}"><!-- 如果有childen -->  
		    <c:set var="level" value="${level + 1}" scope="request" /><!-- 循环一次子列表，level+1 -->  
		    <c:set var="treeList" value="${cur.children}" scope="request" /><!-- 注意此处，子列表覆盖treeList，在request作用域 -->  
		    <c:import url="__department.jsp" /><!-- 这就是递归了 -->  
		  </c:if>
	  </li>  
	</c:forEach> 
</ul>  
<c:set var="level" value="${level - 1}" scope="request" />