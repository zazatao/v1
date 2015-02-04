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
<div class="con">

	<!---------------   left   ----------------------->
    <jsp:include page="left.jsp"></jsp:include>
	<!---------------   right   ------------->
		<div class="perterrtab perterrtab_2">
			<h3>
				发布商品名称：<span><a href="../proscenium/releaseCommoidty">新增&nbsp;&nbsp;/&nbsp;&nbsp;</a><a
					href="#">修改&nbsp;&nbsp;/&nbsp;&nbsp;</a><a href="#">删除&nbsp;&nbsp;/&nbsp;&nbsp;</a><a
					href="#">全选</a></span>
			</h3>
			<div class="kd_yz_cont">
				<form action="" method="post">
					 <dl>
			            <dd><span>商品名称</span><input type="text" value="" name="commoidtyName"/></dd>
			            <dd><span>货号</span><input type="text" value="" name="commItem"/></dd>
			            <dd><span>商品分类</span>
				            <select name="" onchange="shopcateOne(this);" style="height:35px; width:303px; border:1px solid #ccc; margin-left: 7px">
				           		<option>----请选择----</option>
				            	<c:forEach items="${shopCategory }" var="shopcate" varStatus="loop">
				            		<c:if test="${shopcate.level == 1 }">
				            			<option value="${shopcate.categoryID }">${shopcate.category }</option>
				            		</c:if>
				            	</c:forEach>
				            </select>
			            </dd>
			            <dd><span>商品分类</span>
			            	<select name="" id="shopcateTwo" onchange="shopcate(this);" style="height:35px; width:303px; border:1px solid #ccc; margin-left: 7px">
				            	<option>----请选择----</option>
				            </select>
			            </dd>
			            <dd><span>商品分类</span>
			            	<select name="" id="shopcateThree" style="height:35px; width:303px; border:1px solid #ccc; margin-left: 7px">
				            	<option>----请选择----</option>
				            </select>
				        </dd>
				        <div id="guige">
					        
				        </div>
			            <dd><span>供应商(店家链接)</span><input type="text" value="" name="supplier"/></dd>
			            <dd><span>库存数量</span><input type="text" style="width:100px;" value="" name="stock"/><span>显示比例</span><input type="text" style="width:100px;" value="" name="proportion"/></dd>
			            <dd><span>单价</span><input type="text" style="width:100px;" value="" name="unitPrice"/><span>大概重量</span><input type="text" style="width:100px;" value="" name="probablyWeight"/></dd>
			            <dd><span>是否上架</span><input type="radio" style="width: 15px; height: 15px;" value="shi" name="shelves" checked="checked"/>上架&nbsp;&nbsp;&nbsp;&nbsp;<input style="width: 15px; height: 15px;"type="radio" value="fou" name="shelves" checked="checked"/>上架
			            	<span>是否折扣</span><input style="width: 15px; height: 15px;"type="radio" value="fou" name="isSpecial" checked="checked"/>不折扣&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" style="width: 15px; height: 15px;" value="shi" name="isSpecial" checked="checked"/>折扣<input type="text" style="width:100px;" value="" name="special"/>
			            	</dd>
			            <dd><span>是否精品</span><input type="radio" style="width: 15px; height: 15px;" value="shi" name="iscChoice" checked="checked"/>精品&nbsp;&nbsp;&nbsp;&nbsp;<input style="width: 15px; height: 15px;"type="radio" value="fou" name="iscChoice" checked="checked"/>普通
			            	</dd>
			            <dd><span>所属品牌</span>
			            <select name="belongTo" style="height:35px; width:303px; border:1px solid #ccc; margin-left: 7px">
				            	<option>----请选择----</option>
				            </select></dd>
			            <dd><span>照片上传</span><input type="file" /></dd>
			            <dd><span></span><button type="submit">添加</button></dd>
	        		</dl>
        		</form>
			</div>
		</div>
	</div>
	<script >
		function shopcateOne(obj){
			var Code = obj.value;
			var shopcateTwo =  document.getElementById('shopcateTwo');
			var num = shopcateTwo.options.length;
			for (i = num - 1; i >= 0; i--) {
				shopcateTwo.remove(i);
			}
			var shopcateThree =  document.getElementById('shopcateThree');
			var num = shopcateThree.options.length;
			for (i = num - 1; i >= 0; i--) {
				shopcateThree.remove(i);
			}
			var objOption = new Option("----请选择----", -1);
			shopcateTwo.options[shopcateTwo.options.length] = objOption;
			var objOptionT = new Option("----请选择----", -1);
			shopcateThree.options[shopcateThree.options.length] = objOptionT;
			<c:forEach items="${shopCategory }" var="leiBieTwo">
			if ('${leiBieTwo.parentLevel }' == Code
					&& '${leiBieTwo.level}' == 2) {
				var objOption = new Option("${leiBieTwo.category }",
						'${leiBieTwo.categoryID}');
				shopcateTwo.options[shopcateTwo.options.length] = objOption;
			}
			</c:forEach>
			
		}
		function shopcate(obj){
			var Code = obj.value;
			jQuery
			.ajax({
				type : 'GET',
				contentType : 'application/json',
				url : './getSpecific?ids='+Code,
				dataType : 'json',
				success : function(data) {
						if (data
								&& data.success == "true") {
							var $guige ="";
							$.each(data.spec,function(i,item) {
								var gui = item.attribute.split(',');
								var d = "";
								for (var j = 0; j < gui.length; j++) {
									d =  d+"<option value='"+gui[j]+"'>"+gui[j]+"</option>";
								}
								$guige = $guige + "<dd><span>"+item.specificatName+"</span><select onchange='guigechange(this,g"+i+");'  name='' style='height:35px; width:303px; border:1px solid #ccc; margin-left: 7px'><option>----请选择----</option>"+d+"</select></dd><input type='hidden' id='g"+i+"'/>";
							});
						}
						$('#guige').append($guige);
				}
			});
			var shopcateThree =  document.getElementById('shopcateThree');
			var num = shopcateThree.options.length;
			for (i = num - 1; i >= 0; i--) {
				shopcateThree.remove(i);
			}
			var objOptionT = new Option("----请选择----", -1);
			shopcateThree.options[shopcateThree.options.length] = objOptionT;
			<c:forEach items="${shopCategory }" var="leiBieThree">
			if ('${leiBieThree.parentLevel }' == Code
					&& '${leiBieThree.level}' == 3) {
				var objOption = new Option("${leiBieThree.category }",
						'${leiBieThree.categoryID}');
				shopcateThree.options[shopcateThree.options.length] = objOption;
			}
			</c:forEach>
		}
		function guigechange(obj,id){
			alert(obj.value+"  "+id);
		}
	</script>
	<div class="clear">
	</div>
	<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>
