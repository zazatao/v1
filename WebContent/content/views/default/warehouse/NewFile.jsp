<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li><span onclick="onclickID(0);"><i
				class="icon-folder-open"></i> zazatao</span> <!--引入jstl包-->
			<ul>

				<!-- 每一次循环，index+1 -->
				<li><span onclick="onclickID(1);"><i
						class="icon-minus-sign"></i>采购部</span><a href="#">-</a></li>


				<!-- 每一次循环，index+1 -->
				<li><span onclick="onclickID(2);"><i
						class="icon-minus-sign"></i>财务部</span><a href="#">-</a></li>


				<!-- 每一次循环，index+1 -->
				<li><span onclick="onclickID(3);"><i
						class="icon-minus-sign"></i>仓储部</span><a href="#">-</a> <!-- 如果有childen -->
					<!-- 循环一次子列表，level+1 --> <!-- 注意此处，子列表覆盖treeList，在request作用域 -->
					<ul>

						<!-- 每一次循环，index+1 -->
						<li><span onclick="onclickID(5);"><i
								class="icon-minus-sign"></i>中转部</span><a href="#">-</a></li>
					</ul></li>
				<!-- 这就是递归了 -->
			</ul></li>
	</ul>

</body>
</html>