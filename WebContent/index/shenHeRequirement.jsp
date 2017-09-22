<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>需求征集</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/main.css">

<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-1.12.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/my.js"></script>

<script type="text/javascript">
	function shenHe(obj){

		var status = obj.name;
		var suggest = $("#suggest").val();
		window.location.href = "${pageContext.request.contextPath}/requirementServlet?method=shenHe&status2=" + status + "&suggest=" + suggest + "&id=${reqBean.id}&currentPage=${currentPage}&name=${name}";
	}
</script>

</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" style="text-align: center;background-color: #DCEEFC;">

	<div class="mainAction" style="text-align:center;align-content: center;">
		<p style="text-align: center;font-size: 30px;">河北省重大需求技术征集表</p>
			<table border="1" style="border-collapse: collapse;margin: 2px auto 0 auto;font-size: 20px;width: 70%;">
<tr>
					<td style="width: 30%;">技术需求名称</td>
					<td><input class="fullTd" type="text" value="${reqBean.name }" readonly="readonly" /></td>
				</tr>
				<tr>
					<td style="width: 30%;">重大科技需求概述</td>
					<td>
						<textarea class="fullTd" readonly="readonly" rows="5">${reqBean.intro}</textarea>
					</td>
				</tr>
				<tr>
					<td style="width: 30%;">研究类型</td>
					<td style="background-color: #FFFFFF">
							<c:forEach items="types" var="item">
								<c:if test="${item == '1'}">
									基础研究&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</c:if>
								<c:if test="${item == '2'}">
									应用研究&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</c:if>
								<c:if test="${item == '3'}">
									试验发展&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</c:if>
								<c:if test="${item == '4'}">
									研究发展与成功应用&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</c:if>
								<c:if test="${item == '5'}">
									技术推广与科技服务&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</c:if>
							</c:forEach>
						
					</td>
				</tr>
				
				<tr>
					<td style="width: 30%;">技术需求合作模式</td>
					<td style="background-color: #FFFFFF">
							<c:if test="${reqBean.cooperationModel == 1 }">
								独立开发
							</c:if>
							<c:if test="${reqBean.cooperationModel == 2 }">
								技术转让
							</c:if>
							<c:if test="${reqBean.cooperationModel == 3 }">
								技术入股
							</c:if>
							<c:if test="${reqBean.cooperationModel == 4 }">
								合作开发
							</c:if>
						
					</td>
				</tr>
				<tr>
					<td style="width: 30%;">计划总投资</td>
					<td><input class="fullTd" type="text" value="${reqBean.planAllInvest }" readonly="readonly"/></td>
				</tr>
				<tr>
					<td style="width: 30%;">形式审核意见</td>
					<td>
						<textarea rows="5" class="fullTd" id="suggest"></textarea>
					</td>

				</tr>
				
			</table>
			<div style="margin: 10px;">
				管理处室：
				<select name="office" style="width: 20%;">
					<option value="1">办公室1</option>
					<option value="2">办公室2</option>
					<option value="3">办公室3</option>
				</select>
			</div>
			<div style="margin: 10px;">
				<button name="2" class="btnMy" onclick="shenHe(this)">通过</button>&nbsp;&nbsp;&nbsp;&nbsp;<button name="3" class="btnMy" onclick="shenHe(this)">不通过</button>
			</div>
	</div>
</body>
</html>