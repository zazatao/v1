<%@page import="com.yc.entity.user.User"%>
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
	 <div class="tit_5"><h1>免费开店</h1></div>  
     <div class="kd">
        <div class="kd_right">
        	<h2><img src="../content/static/images/small/kd_9.png" />开店条件检测</h2>
            <p><img src="../content/static/images/small/kd_2.png" />亲，恭喜您满足开店条件，请继续完成下面的开店认证后才能创建店铺！<a href="kd_help.html">认证帮助</a></p>
            <h2><img src="../content/static/images/small/kd_10.png" />申请开店认证</h2>
            <form action="./setUpShop" method="post">
            <ul>
            	<li><span>选择开店类型：</span><input type="radio" name="type" checked="checked" value="individual"/>个人开店<input type="radio" name="type" value="company" />企业开店</li>
                <li><span>选择所在地：</span><input type="radio"
						name="possessions" value="mainlandcChina" checked="checked" />中国大陆<input type="radio" name="possessions" value="HongKongAndMacao" />香港/澳门<input type="radio" name="possessions"   value="Taiwan"/>台湾<input type="radio" name="possessions"  value="Overseas"/>海外</li>
                <li><span>认&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;证：</span><em>您已绑定了zazatao账户：<%=((User) request.getSession().getAttribute("loginUser")).getId()%></em></li>
                <li>
                	<table>
                    	<tr class="kdtr_1"><td>状态</td><td>认证名称</td><td>操作</td></tr>
                        <tr><td><img src="../content/static/images/small/kd_3.png" />未通过</td><td>zazatao实名认证</td><td><a href="../proscenium/authentication">重新认证</a></td></tr>
                        <tr><td><img src="../content/static/images/small/kd_4.png" />未开始</td><td>开店认证</td><td><a href="#">立即认证</a></td></tr>
                    </table>	
                </li>
            </ul>
            </form>
           <div class="cj"><a href="#" onclick="kd();"><img src="../content/static/images/small/kd_7.png" width="122" height="37" /></a></div>
        </div>
     </div>
</div>
	<script type="text/javascript">
		function kd(){
			var types =$('input[name="type"]:checked').val();
			var possessions = $('input[name="possessions"]:checked').val();
			location.href ='../proscenium/openShop?type='+types+"&possessions="+possessions;
		}
	</script>
	<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>
