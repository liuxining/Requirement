<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>需求征集清单</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/main.css">

<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-1.12.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/my.js"></script>
<script type="text/javascript">
	function func(){
		var name = $("#name").val();
		window.location.href = "${pageContext.request.contextPath}/requirementServlet?method=list&status2=1&to=index_list1Requirement&name=" + name;
	}
</script>
</head>
<body>
	<div class="mainAction" style="text-align:center;align-content: center;background-color: #DCEEFC;">
		<p style="text-align: center;font-size: 30px;">
			河北省重大需求技术征集清单&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="${pageContext.request.contextPath}/index/addRequirement.jsp" target="mainAction"><button class="btnMy">添加技术需求</button></a>
		</p>
		<div>
			<!-- <form action="${pageContext.request.contextPath}/requirementServlet?method=list&to=index_list1Requirement" method="post"> -->
				技术需求名称：<input type="text" name="name" id="name" value="${param.name}" />
				<input type="hidden" name="status2" value="1" />
			<!-- </form> -->
			 <button class="btnMy" onclick="func();">查询</button>&nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/requirementServlet?method=list&status2=1&to=index_list1Requirement" target="mainAction"><button class="btnMy">显示全部</button></a>
			
		</div>
		<div>
			<table border="1" style="border-collapse: collapse;margin: 2px auto 0 auto;font-size: 16px;width: 90%">
				<tr style="background-color: #2993FC;color: #FFFFFF">
					<th>需求编号</th>
					<th>技术需求名称</th>
					<th>填报时间</th>
					<th>需求状态</th>
					
				</tr>
				<c:forEach items="${requirementList}" var="item">
					<tr>
						<td>${item.id}</td>
						<td><a href="${pageContext.request.contextPath}/requirementServlet?method=detail&id=${item.id}&to=index_shenHeRequirement&currentPage=${currentPage}&name=${name}">${item.name}</a></td>
						<td>${item.createDate}</td>
						<td>
							<c:if test="${item.status == 1}">
								未审核
							</c:if>
							<c:if test="${item.status == 2}">
								已审核
							</c:if>
							<c:if test="${item.status == 3}">
								被退回
							</c:if>
						</td>
						

					</tr>
				</c:forEach>

			</table>
			<div style="margin: 8px auto 0 auto;font-size: 16px;">
				${pagingMsg}
			</div>
			<div style="margin: 16px auto 0 auto;font-size: 16px;">
				<c:if test="${param.status == 1}">
					<script type="text/javascript">
						alert("审核成功");
					</script>
				</c:if>
			</div>
					
	</div>
</div>

</body>
</html>