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
	<c:if test="${shop.blacklist != null }">
		<br /><br /><br />
		<center><font color="red" size="+3">该店铺已入黑名单！</font></center>
		<br /><br /><br />
	</c:if>
	<c:if test="${shop.blacklist == null }">

	<!---------------   left   ----------------------->
    <jsp:include page="left.jsp"></jsp:include>
	<!---------------   right   ------------->
    	<div class="catelist">
        	<div>
            	<p>商品</p>
                <ul>
                  <li><a href="#">问题商品<span class="gay">(0)</span></a></li>
                  <li><a href="#">已售完<span class="gay">(0)</span></a></li>
                  <li><a href="#">到期下架<span class="gay">(0)</span></a></li>
                  <li><a href="#">留言/回复<span class="gay">(0)</span></a></li>
                  <li><a href="#">出售中<span class="gay">(0)</span></a></li>
                  <li><a href="#">仓库中<span class="gay">(0)</span></a></li>
                </ul>
                <span class="catelistup"></span>
            </div>
        	<div>
            	<p>交易</p>
                <ul>
                  <li><a href="#">待买家付款<span class="gay">(0)</span></a></li>
                  <li><a href="#">待发货<span class="gay">(0)</span></a></li>
                  <li><a class="grean" href="#">待评价<span class="gay">(0)</span></a></li>
                  <li><a href="#">留言/回复<span class="gay">(0)</span></a></li>
                  <li><a href="#">待买家收货<span class="gay">(0)</span></a></li>
                  <li><a href="#">退货退款<span class="gay">(0)</span></a></li>
                  <li><a href="#">收到维权投诉<span class="gay">(0)</span></a></li>
                  <li><a href="#">近期出售<span class="gay">(0)</span></a></li>
                </ul>
                <span class="catelistup"></span>
            </div>
            <div id="cl"></div>
        </div>
    	<div class="perterrtab">
        	<h3>7天内店铺交易访问情况：<span><a href="#">查看详细图表</a></span></h3>
            <div>
            	<table border="0" cellspacing="0" cellpadding="0" width="100%;">
                    <thead>
                      <tr align="center">
                        <td rowspan="2">日期</td>
                        <td colspan="2">访问</td>
                        <td colspan="3">下单</td>
                        <td colspan="3">支付</td>
                        <td colspan="3">退款</td>
                      </tr>
                      <tr align="center">
                        <td>访问人数</td>
                        <td>访问次数</td>
                        <td>下单人数</td>
                        <td>下单次数</td>
                        <td>下单金额</td>
                        <td>支付人数</td>
                        <td>支付次数</td>
                        <td>支付金额</td>
                        <td>退款人数</td>
                        <td>退款次数</td>
                        <td>退款金额</td>
                      </tr>
                     </thead>
                     <tbody>
                      <tr align="center">
                        <td>20101219</td>
                        <td>4561</td>
                        <td>45</td>
                        <td>45612</td>
                        <td>21</td>
                        <td>4578941</td>
                        <td>122</td>
                        <td>123</td>
                        <td>45678</td>
                        <td>1</td>
                        <td>2</td>
                        <td>45</td>
                      </tr>
                      <tr align="center">
                        <td>20101218</td>
                        <td>123</td>
                        <td>1234</td>
                        <td>789456</td>
                        <td>12</td>
                        <td>12</td>
                        <td>123</td>
                        <td>12345</td>
                        <td>98745</td>
                        <td>1</td>
                        <td>4</td>
                        <td>789</td>
                      </tr>
                      <tr align="center">
                        <td>20101217</td>
                        <td>789</td>
                        <td>4561</td>
                        <td>123</td>
                        <td>1156</td>
                        <td>4894123</td>
                        <td>123</td>
                        <td>123</td>
                        <td>45678</td>
                        <td>789</td>
                        <td>45</td>
                        <td>78</td>
                      </tr>
                      <tr align="center">
                        <td>20101216</td>
                        <td>45</td>
                        <td>45</td>
                        <td>45</td>
                        <td>45</td>
                        <td>789</td>
                        <td>453</td>
                        <td>70855</td>
                        <td>48</td>
                        <td>48</td>
                        <td>05812</td>
                        <td>5</td>
                      </tr>
                      <tr align="center">
                        <td>20101215</td>
                        <td>54948.36</td>
                        <td>4853</td>
                        <td>469</td>
                        <td>4639</td>
                        <td>47639</td>
                        <td>469</td>
                        <td>41.36</td>
                        <td>143.</td>
                        <td>14</td>
                        <td>648</td>
                        <td>6146</td>
                      </tr>
                      <tr align="center">
                        <td>20101214</td>
                        <td>4869</td>
                        <td>1465</td>
                        <td>123</td>
                        <td>465</td>
                        <td>789</td>
                        <td>56</td>
                        <td>89</td>
                        <td>4165</td>
                        <td>4798</td>
                        <td>15</td>
                        <td>489</td>
                      </tr>
                      <tr align="center">
                        <td>20101213</td>
                        <td>489</td>
                        <td>1456</td>
                        <td>123</td>
                        <td>489</td>
                        <td>45</td>
                        <td>67831</td>
                        <td>5817</td>
                        <td>89148</td>
                        <td>5179</td>
                        <td>48</td>
                        <td>74</td>
                      </tr>
                      </tbody>
                </table>
			<script>
            	$(function(){
				   $('.perterrtab tbody tr:odd').css("backgroundColor","#e5e5e5");
				});
            </script>
            </div>
        </div>
    	<div class="perterrcont">
       	  <h3>官方客服联系方式</h3>
            <p>
            <img  style="CURSOR: pointer" onclick="javascript:window.open('http://b.qq.com/webc.htm?new=0&sid=800025375&o=zzt&q=7', '_blank', 'height=502, width=644,toolbar=no,scrollbars=no,menubar=no,status=no');"  border="0" SRC="../content/static/images/brand/perterrcont1.jpg" alt="点击这里给我发消息"> 企业QQ(800025375)/在线时间<a href="#">08:00-23:30</a>
            </p>
            <span><img src="../content/static/images/brand/perterrcont3.jpg"/><img src="../content/static/images/brand/perterrcont2.jpg"/></span>
        </div>
	</c:if>
    </div>
    
</div>

<div class="clear"></div>
	<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>
