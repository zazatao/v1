<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品评价管理</title>
<link href="../content/static/css/reception/css.css" rel="stylesheet"
	type="text/css" />
<link href="../content/static/css/reception/qt.css" rel="stylesheet"
	type="text/css" />
<link href="../content/static/css/reception/persc.css" rel="stylesheet"
	type="text/css" />
<link href="../content/static/css/reception/Pingjia.css" rel="stylesheet"
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
<link href="../content/static/css/bootstrap/bootstrap.css"
	rel="stylesheet" />
<link href="../content/static/css/datetime/jquery-clockpicker.min.css"
	rel="stylesheet" />
<link href="../content/static/css/datetime/jquery.datetimepicker.css"
	rel="stylesheet" />
<script type="text/javascript"
	src="../content/static/js/lib/jquery.min.js"></script>
<script type="text/javascript"
	src="../content/static/js/lib/bootstrap.min.js"></script>
<script type="text/javascript"
	src="../content/static/js/datetime/jquery.datetimepicker.js"></script>
<script type="text/javascript"
	src="../content/static/js/datetime/bootstrap-clockpicker.min.js"></script>
<script type="text/javascript">
function popupwindow(url) {
	var title = "";
	 var w = 700;
	var h = 800;	
	var title = "";
	var left = (screen.width / 2) - (w / 2);
	var top = (screen.height / 2) - (h / 2); 
	window.opener = null;
	window.open('', '_self');
	window.close();
	return window
			.open(
					 url,
				     title,
					'directories=0,titlebar=0,toolbar=0,location=0,status=0,menubar=0,scrollbars=yes,resizable=yes, width='
							+ w
							+ ', height='
							+ h
							+ ', top='
							+ top
							+ ', left=' + left 
				  );
}
</script>	
</head>
<body>
	<jsp:include page="../common/prosceniumNav.jsp"></jsp:include>
	<div class="con">
		<c:if test="${shop.blacklist != null }">
			<br />
			<br />
			<br />
			<center>
				<font color="red" size="+3">该店铺已入黑名单！</font>
			</center>
			<br />	
			<br />
			<br />
		</c:if>
		<c:if test="${shop.blacklist == null }">
		<!---------------   left   ----------------------->
		<jsp:include page="left.jsp"></jsp:include>
		<div class="Pingjia01">
			<div class="biao" >
				<h1 style="background:url(../content/static/images/pingjia/icon02.png) no-repeat left;">卖家累积信用：</h1>
				<h2>81</h2>
				<h3>
					<img src="../content/static/images/pingjia/silver_icon.png" /><img
						src="../content/static/images/pingjia/silver_icon.png" /><img
						src="../content/static/images/pingjia/silver_icon.png" /><img
						src="../content/static/images/pingjia/silver_icon.png" /><img
						src="../content/static/images/pingjia/silver_icon.png" />
				</h3>
				<h4>
					好评率：<span style="color: #F60">100%</span>
				</h4>
			</div>
			<div class="nei">
				<div class="nei02">
					<table width="550" border="0" align="left" cellpadding="0"
						cellspacing="1" bgcolor="#CCCCCC">
						<tr>
							<td bgcolor="#F0F0F0"><div align="center"></div></td>
							<td bgcolor="#F0F0F0"><div align="center">最近一周</div></td>
							<td bgcolor="#F0F0F0"><div align="center">最近一个月</div></td>
							<td bgcolor="#F0F0F0"><div align="center">最近六个月</div></td>
							<td bgcolor="#F0F0F0"><div align="center">六个月前</div></td>
							<td bgcolor="#F0F0F0"><div align="center">总 计</div></td>
						</tr>
						<tr>
							<td height="26" bgcolor="#FFFFFF"><div align="center">
									<img src="../content/static/images/pingjia/gold_icon.png" width="16" height="16" />好评
								</div></td>
							<td bgcolor="#FFFFFF"><div align="center">1</div></td>
							<td bgcolor="#FFFFFF"><div align="center">0</div></td>
							<td bgcolor="#FFFFFF"><div align="center">20</div></td>
							<td bgcolor="#FFFFFF"><div align="center">50</div></td>
							<td bgcolor="#FFFFFF"><div align="center">81</div></td>
						</tr>
						<tr>
							<td height="26" bgcolor="#FFFFFF"><div align="center">
									<img src="../content/static/images/pingjia/silver_icon.png" width="16"
										height="16" />中评
								</div></td>
							<td bgcolor="#FFFFFF"><div align="center">0</div></td>
							<td bgcolor="#FFFFFF"><div align="center">2</div></td>
							<td bgcolor="#FFFFFF"><div align="center">0</div></td>
							<td bgcolor="#FFFFFF"><div align="center">0</div></td>
							<td bgcolor="#FFFFFF"><div align="center">2</div></td>
						</tr>
						<tr>
							<td height="26" bgcolor="#FFFFFF"><div align="center">
									<img src="../content/static/images/pingjia/ash_icon.png" width="16" height="16" />差评
								</div></td>
							<td bgcolor="#FFFFFF"><div align="center">0</div></td>
							<td bgcolor="#FFFFFF"><div align="center">0</div></td>
							<td bgcolor="#FFFFFF"><div align="center">0</div></td>
							<td bgcolor="#FFFFFF"><div align="center">0</div></td>
							<td bgcolor="#FFFFFF"><div align="center">0</div></td>
						</tr>
						<tr>
							<td height="26" bgcolor="#FFFFFF"><div align="center">总
									计</div></td>
							<td bgcolor="#FFFFFF"><div align="center">1</div></td>
							<td bgcolor="#FFFFFF"><div align="center">2</div></td>
							<td bgcolor="#FFFFFF"><div align="center">20</div></td>
							<td bgcolor="#FFFFFF"><div align="center">50</div></td>
							<td bgcolor="#FFFFFF"><div align="center">83</div></td>
						</tr>
					</table>
				</div>

			</div>

		</div>
		<div class="quanbu_dan autoh">
			<div class="tab-title" style="width: 780px;">
				<ul id="myTab1">
					<li class="active1" onmouseover="nTabs(this,0,&#39;公司新品&#39;);"
						style="top: 0; left: 0;">来自买家的评价</li>
				</ul>
			</div>
			<div style="clear: both"></div>
			<table width="470" border="0" cellspacing="0" cellpadding="0">
				<tbody>
					<tr>
						<td width="73%" height="160" valign="top"><div align="center">
								<div class="TabContent" id="myTab1_0"
									style="width: 780px; display:">
									<div class="pro">
										<div class="tou">
											<div class="t1">
												<select name="" style="margin-top: 10px">
													<option>评价</option>
												</select>
											</div>
											<div class="t2">
												<select name="" style="margin-top: 10px">
													<option>评论</option>
												</select>
											</div>
											<div class="t3">评价人</div>
											<div class="t4">商品信息</div>
											<div class="t5">操作</div>
										</div>
                                           <c:choose>
											    <c:when test="${not empty reviewslist}">
											         <c:forEach items="${reviewslist}" var="reviews">
											           <div class="xinxi">
											             <div class="t1">
												           <img src="..${reviews.rankImagesPath}" />
											             </div>
											             <div class="t2">好评<br/>${reviews.reviewsdate }</div>
											             <div class="t3">${reviews.user.loginName }</div>
											             <div class="t4">
											                   ${reviews.shopscommodity.commoidtyName}<br/>
											                   <span style="color: orange">${reviews.shopscommodity.unitPrice}元</span>
											             </div>
											             <div class="t5">
											                  <input type="button" name="reply" value="回复 " onclick="popupwindow('/proscenium/sellerReply?id=${reviews.id}')"/>
											             </div>
											             </div>
											         </c:forEach>	
											    </c:when>
											    <c:otherwise>
											             <span style="color:red;margin-left: 30px" >暂无评论</span>
											    </c:otherwise>
											</c:choose>

										<div class="page01">
											<a href="#">上一页</a><a href="#">1</a><a href="#">2</a><a
												href="#">下一页</a>
										</div>

									</div>
								</div>

							</div></td>
					</tr>
				</tbody>
			</table>
		</div>
		<script language="JavaScript" type="text/javascript">
//tab变换
function nTabs(thisObj, Num,Value) {
    if (thisObj.className == "active1") return;
 
 //得到LI的父ID 后面会重组ID用到
    var tabObj = thisObj.parentNode.id;   
 
    var tabList = document.getElementById(tabObj).getElementsByTagName("li");
    for (i = 0; i < tabList.length; i++) {
 
  //重组ID项 li 父ID + "_"+数组的键值
  var tabOptions =   tabObj+"_"+i;
  
        if (i == Num) {
   document.getElementById(tabOptions).style.display= 'block';
            thisObj.className = "active1";
        } else {
   document.getElementById(tabOptions).style.display= 'none';
            tabList[i].className = "normal1";
        }
    }
}
            </script>
        </c:if>
	</div>
	</div>
	<div class="clear"></div>
	<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>
