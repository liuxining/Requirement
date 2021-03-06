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
		var status2 = $("#status2").val();
		window.location.href = "${pageContext.request.contextPath}/requirementServlet?method=list&to=index_listRequirement&name=" + name + "&status2=" + status2;
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
			<!-- <form action="${pageContext.request.contextPath}/requirementServlet?method=list&to=index_listRequirement" method="post"> -->
				技术需求名称：<input type="text" name="name" id="name" value="${param.name}" />
				需求状态：
				<select name="status2" id="status2">
					<option value="0">全部</option>
					<c:if test="${status2 == '1'}">
						<option value="1" selected="selected">未审核</option>
					</c:if>
					<c:if test="${status2 != '1'}">
						<option value="1">未审核</option>
					</c:if>
					<c:if test="${status2 == '2'}">
						<option value="2" selected="selected">已审核</option>
					</c:if>
					<c:if test="${status2 != '2'}">
						<option value="2">已审核</option>
					</c:if>
					<c:if test="${status2 == '3'}">
						<option value="3" selected="selected">被退回</option>
					</c:if>
					<c:if test="${status2 != '3'}">
						<option value="3">被退回</option>
					</c:if>
				</select>
			<button class="btnMy" onclick="func();">查询</button>&nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/requirementServlet?method=list&to=index_listRequirement"><button class="btnMy">显示全部</button></a>
			
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
						<td><a href="${pageContext.request.contextPath}/requirementServlet?method=detail&id=${item.id}&to=index_detailRequirement">${item.name}</a></td>
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
		
	</div>
</div>

</body>
</html>