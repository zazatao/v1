<%@page import="com.yc.entity.user.Personnel"%>
<%@page import="com.yc.entity.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>zazatao</title>
<link href="../content/static/css/reception/css.css" rel="stylesheet"
	type="text/css" />
<link href="../content/static/css/reception/persc.css" rel="stylesheet"
	type="text/css" />
<link href="../content/static/css/reception/pingjia.css" rel="stylesheet"
	type="text/css" />	
<script type="text/javascript"
	src="../content/static/js/reception/png.js"></script>
<script type="text/javascript"
	src="../content/static/js/reception/sdmenu.js"></script>
<script type="text/javascript"
	src="../content/static/js/reception/jquery.min.js"></script>
<script type="text/javascript"
	src="../content/static/js/reception/js.js"></script>
<script language="JavaScript" type="text/javascript">
       function focusText(){
         document.getElementById("text").value="";
       }
</script>
</head>

<body>
		<!---------------   详细   ------------->
		<div class="orders">
			<p>买家评论详情</p>
			    <div class="orderstil">
					<ul class="ordersall">
					    <li class="ordersli1">货品名称</li>
						<li class="ordersli2">买家</li>
						<li class="ordersli3">评论等级</li>
						<li class="ordersli4">评论内容</li>
					</ul>
				</div>
		       	<div class="ordconpic">
					  <form method="post"  action="/proscenium/replyManage?id=${shopreviews.id}">
						<ul class="ordersall">
					        <li class="ordersli1"><div class="midl">${shopreviews.shopscommodity.commoidtyName }</div></li> 
							<li class="ordersli1"><div class="midl">${shopreviews.user.loginName }</div></li>
							<li class="ordersli3"><div class="midl"><img src="..${shopreviews.rankImagesPath}"/></div></li>
							<li class="ordersli4"><div class="midl">${shopreviews.reviews }</div></li>
			                </ul>
			                <br/>
						    <textarea id="text" name="replycontent" rows="25" cols="70" style="margin-top:10px;padding-left: 15px" onfocus="focusText()" >卖家回复...</textarea>
						    <br/>
						    <input type="submit" name="reply"  value="确认回复" style="float: right;margin-right: 200px;width:78px; height:28px;background: url(../content/static/images/pingjia/reply_btn_normal.png) no-repeat"/>
					</form>
				</div>
			
			</div>
</body>
</html>