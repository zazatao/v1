<%@page import="com.yc.entity.user.User"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link href="../content/static/css/reception/gr.css" rel="stylesheet"
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
<div class="con"><!---------------   页面主体   ----------------------->
	<div class="dqwz"><a href="../index">zazatao</a>> <a href="../proscenium/setUpShop">免费开店</a> ><a href="../proscenium/authentication">重新验证</a></div>
    <div class="kd_yz">
    	<h1><img src="../content/static/images/small/kd_5.png" /></h1>
        <h2><span class="orange">设置身份信息</span><span style="margin-left:230px;">设置支付方式</span><span style="margin-left:250px;">成功</span></h2>
        <div class="kd_yz_cont">
        <dl>
        	<dt class="dt_1">为了给你提供更好的支付和金融服务，你需要填写真实的身份信息享受会员保障服务。身份信息一经录入不可更改，隐私信息未经本人许可严格保密。</dt>
            <dd>账户名:<b><%=((User) request.getSession().getAttribute("loginUser")).getId()%></b></dd>
        </dl>
        <c:if test="${not empty msg }">密码输入错误</c:if>
        <form action="./authentication" method="post">
        <dl>
        	<dt><span class="orange"><b>设置登录密码</b></span><span class="gray">登录时需验证，保护账户信息</span></dt>
            <dd><span>登录密码</span><input type="password" value="" name="pwd"/></dd>
            <dd><span>再一次输入密码</span><input type="password" value="" name="password"/></dd>
        </dl>
        <dl>
        	<dt><span class="orange"><b>设置支付密码</b></span><span class="gray">交易付款或账户信息更改时需输入，与登录密码不一样，安全级别更高</span></dt>
            <dd><span>支付密码</span><input type="text" value="" name="payPassword" /></dd>
            <dd><span>支付密码</span><input type="text" value="" name="payPwd"/></dd>
        </dl>
        <dl>
        	<dt><span class="orange"><b>设置身份信息</b></span><span class="gray">请务必准确填写本人的身份信息，注册后不能更改，隐私信息未经本人许可严格保密

若您的身份信息和快捷支付身份信息不一致，将会自动关闭已开通的快捷支付服务。</span></dt>
            <dd><span>真实姓名</span><input type="text" value="" name="juridicalPerson" /></dd>
            <dd><span>身份证号码</span><input type="text" value="" name="idCard"/></dd>
            <dd><span></span><input type="checkbox" class="check" />我同意zazatao服务协议</dd>
            <dd><span></span><input type="submit" class="kd_bot" value="确定"/></dd>
        </dl>
        </form>
        </div>
    </div>
	
</div>
<div class="clear"></div>
	<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>
