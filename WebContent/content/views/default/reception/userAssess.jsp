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
			<p>我的订单</p>
			    <div class="orderstil">
					<ul class="ordersall">
					    <li class="ordersli1">商品照片</li>
						<li class="ordersli1">货品名称</li>
						<li class="ordersli2">卖家</li>
						<li class="ordersli3">单价</li>
					</ul>
				</div>
		       	<div class="ordconpic">
					  <form method="post"  action="/proscenium/userReviews">
						<ul class="ordersall">
					           <li class="ordersli1"><div class="midl"><img src="..${shopcommoidty.shopCommImages[0].imagePath }"></img></div></li>
							<li class="ordersli1"><div class="midl">
									${shopcommoidty.commoidtyName }
									<input type="hidden" name="id" value="${shopcommoidty.commCode}"/>
								</div></li>
							<li class="ordersli3"><div class="midl">${shopcommoidty.belongTo.shopName }</div></li>
							<li class="ordersli4"><div class="midl">${shopcommoidty.unitPrice }</div></li>
			                </ul>
			                <br/>
			                <div style="margin-top:50px;margin-left: 20px;">
						    <label><input name="rank" type="radio" value="good" /><img src="../content/static/images/pingjia/gold_icon.png" /><span style="font-size: 18px;">好评</span></label>
						    <label><input name="rank" type="radio" value="better" /><img src="../content/static/images/pingjia/silver_icon.png" /><span style="font-size: 18px;">中评</span></label>
						    <label><input name="rank" type="radio" value="bad" /><img src="../content/static/images/pingjia/ash_icon.png" /><span style="font-size: 18px;">差评</span></label>
						    </div>
						    <textarea id="text" name="reviewscontent" rows="25" cols="70" style="margin-top:10px;padding-left: 15px" onfocus="focusText()" >买家评论...</textarea>
						    <br/>
						    <input type="submit" name="reviews"  value="确认评论" style="float: right;margin-right: 200px;width:78px; height:28px;background: url(../content/static/images/pingjia/reply_btn_normal.png) no-repeat"/>
					</form>
				</div>
			
			</div>
</body>
</html>