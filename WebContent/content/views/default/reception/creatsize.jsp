<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>我的尺码创建</title>
<script type="text/javascript"
	src="../content/static/js/reception/jquery.min.js"></script>
<script type="text/javascript">
    $(function(){
    	$("input[name='zise']").change(function(){
    	    var value=$(this).val();
    	    var filename=$("input[name='filename").val();
    	    if(value!=null&&value=="Female"){
    	    	location.href="/user/chooseCate?id=5&sex=Female&fname="+filename;    
    	    }else if(value!=null&&value=="Male"){
    	    	location.href="/user/chooseCate?id=1&sex=Male&fname="+filename;    
    	    }
    	});
    	$("#cate").change(function(){
    		   var value=$(this).val();
    		   var districtSelect = document.getElementById('size');
    			var numd = districtSelect.options.length;
    			for (i = numd - 1; i >= 0; i--) {
    				districtSelect.remove(i);
    			}
    			var objOption = new Option("----尺寸----", -1);
    			districtSelect.options[districtSelect.options.length] = objOption;
    			jQuery.ajax({
					type : 'GET',
					async:false,
					contentType : 'application/json',
					url : '../getShopCategory/getSpacesByCateID?id='+value,
					dataType : 'json',
					success : function(data) {
						$.each(data.spec,function(i, specs) {
							if(specs.specificatName != '颜色'){
							    var attr = (specs.attribute).split(',');
								for (var j = 0; j< attr.length; j++) {
									var objOption = new Option(attr[j] , attr[j]);
									districtSelect.options[districtSelect.options.length] = objOption;
								}
							}
						});
					}
				});
    	})
    });
</script>
</head>
<body>
		     	<div class="sizetex">
        	<h3>我的尺寸<span>创建配置文件</span></h3>
        	<form method="post"  action="/user/mysize" id="form">
            <div class="sizetab">
            	<p class="sizetabtil">选择一个或多个尺寸成为您感兴趣的产品类别。 </p>
                <div class="sztales">
                  <hr style="width:100%"/>
                  <div>
                    <p class="sztalest" style="float: left;font-weight: bold;">文件名称:</p>
                    <c:if test="${fname ==null}">
                    <p style="float: left"><input name="filename" type="text" onblur="if(this.value==''){this.value='文件名称';}" onfocus="this.value=''" value="文件名称" /></p>
                   </c:if>
                   <c:if test="${fname !=null}">
                   <c:if test="${ fname !='文件名称' }">
                    <p style="float: left"><input name="filename" type="text"  onfocus="this.value=''" value="${fname}" /></p>
                   </c:if>
                   <c:if test="${ fname =='文件名称' }">
                     <p style="float: left"><input name="filename" type="text" onblur="if(this.value==''){this.value='文件名称';}" onfocus="this.value=''" value="文件名称" /></p>
                   </c:if>
                   </c:if>
                  </div>
                  <div>
                    <p class="sztalest" style="font-weight: bold;clear: left;float: left">性别:</p>
                    <p style="float: left"><label><input type="radio" name="zise"  value="Female" id="zise_0" <c:if test="${sex == 'Female'}">checked</c:if> />针对女性</label></p>
                  </div>
                  <div>
                    <p class="sztalest"></p>
                    <p style="float: left"><label><input type="radio" name="zise" value="Male" id="zise_1"  <c:if test="${sex == 'Male'}">checked</c:if>/>针对男性</label></p>
                  </div>
                  <div style="margin-top: 120px;">
                  <div style="clear: left;">
                          <select id="cate"  name="cates" style="float: left">
                            <option value='0'>----类型----</option>
                            <c:forEach items="${catelist}" var="cate">
                                       <option value=12 >${cate.category}</option>
                            </c:forEach>
                          </select> 
                  </div>
                   <div style="margin-left: 120px">
                          <select id="size" name="sizes" style="float: left">
                            <option value='0'>----均码----</option>
                          </select> 
                  </div>
                  </div>
                  <div style="clear: both;margin-top: 160px;">
                    <p class="sztalest"></p>
                    <p><label><input name="isdefault" type="checkbox" value="" />默认配置文件</label></p>
                  </div>
                </div>
                <p class="sztatexbon"><span><button onclick="closecurrent()">保存</button></span></p>
            </div>
            </form>
        </div>
      <div class="cl"></div>
    </div>
    <hr style="width:100%"/>
    <script type="text/javascript">
    function closecurrent(){
    	      window.close();
    }
    window.onunload = refreshParent;
	function refreshParent() {
		window.opener.location.reload();
	}
	
	function addMaterial(){
		document.form.action="../user/mysize";
		document.form.submit();
		return closeAndRefresh();
	}
	function closeAndRefresh() {
		window.onunload = refreshParent;
		self.close();
		return true;
	}
	</script>
</body>
</html>