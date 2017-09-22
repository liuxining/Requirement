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
<style type="text/css">
label{
	color: #C4C4C4;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-1.12.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/my.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var type = "${reqBean.researchType}";
		var types = type.split("_");
		for (var i = 0; i < types.length; i++) {
			$("#researchType" + types[i]).attr('checked', true);
			$("#researchType" + types[i] + "_l").css('color', '#000000');
		}
		var mode = "${reqBean.cooperationModel}";
		$("#cooperationModel" + mode).attr('checked', true);
		$("#cooperationModel" + mode + "_l").css('color', '#000000');
		var status = "${reqBean.status}";
		if(status == "1"){
			$("#status").val("未审核");
		}
		else if(status == "2"){
			$("#status").val("已审核");
		}
		else{
			$("#status").val("被退回");
		}
	});
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
						<textarea class="fullTd" readonly="readonly" rows="8">${reqBean.intro}</textarea>
					</td>
				</tr>
	 			<tr>
					<td style="width: 30%;">研究类型</td>
					<td>
						<div style="background-color: #FFFFFF">
						<input type="checkbox" name="researchType" value="1" id="researchType1" disabled="disabled" /><label for="researchType1" id="researchType1_l">基础研究</label>&nbsp;&nbsp;
						<input type="checkbox" name="researchType" value="2" id="researchType2" disabled="disabled"/><label for="researchType2" id="researchType2_l">应用研究</label>&nbsp;&nbsp;
						<input type="checkbox" name="researchType" value="3" id="researchType3" disabled="disabled"/><label for="researchType3" id="researchType3_l">试验发展</label>&nbsp;&nbsp;
						<input type="checkbox" name="researchType" value="4" id="researchType4" disabled="disabled"/><label for="researchType4" id="researchType4_l">研究发展与成果应用</label>&nbsp;&nbsp;
						<input type="checkbox" name="researchType" value="5" id="researchType5" disabled="disabled"/><label for="researchType5" id="researchType5_l">技术推广与科技服务</label>&nbsp;&nbsp;
						</div>
					</td>
				</tr>
				
				<tr>
					<td style="width: 30%;">技术需求合作模式</td>
					<td>
						<div style="background-color: #FFFFFF;">
						<input type="radio" name="cooperationModel" value="1" id="cooperationModel1" disabled="disabled"/><label for="cooperationModel1" id="cooperationModel1_l">独立开发</label>&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="cooperationModel" value="2" id="cooperationModel2" disabled="disabled"/><label for="cooperationModel2" id="cooperationModel2_l">技术转让</label>
						<input type="radio" name="cooperationModel" value="3" id="cooperationModel3" disabled="disabled"/><label for="cooperationModel3" id="cooperationModel3_l">技术入股</label>&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="cooperationModel" value="4" id="cooperationModel4" disabled="disabled"/><label for="cooperationModel4" id="cooperationModel4_l">合作开发</label>
						</div>
					</td>
				</tr>
				<tr>
					<td style="width: 30%;">计划总投资</td>
					<td><input class="fullTd" type="text" value="${reqBean.planAllInvest }" readonly="readonly"/></td>
				</tr>
				<tr>
					<td style="width: 30%;">填报时间</td>
					<td><input class="fullTd" type="text" value="${reqBean.createDate }" readonly="readonly"/></td>
				</tr>
				<tr>
					<td style="width: 30%;">审核状态</td>
					<td>
						<input type="text" class="fullTd" id="status" readonly="readonly" />
						<!-- <c:if test="${reqBean.status == 1}">
							未审核
						</c:if>
						<c:if test="${reqBean.status == 2}">
							已审核
						</c:if>
						<c:if test="${reqBean.status == 3}">
							被退回
						</c:if> -->
					</td>
				</tr>
				<tr>
					<td style="width: 30%;">审核意见</td>
					<td>
						<textarea class="fullTd" readonly="readonly" rows="5">${reqBean.suggest}</textarea>
					</td>
				</tr>

				
			</table>
	</div>
</body>
</html>