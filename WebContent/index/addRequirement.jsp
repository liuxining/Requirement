<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>需求征集</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/main.css">

<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-1.12.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/my.js"></script>


</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" style="text-align: center;background-color: #DCEEFC;">

	<div class="mainAction" style="text-align:center;align-content: center;">
		<p style="text-align: center;font-size: 30px;">河北省重大需求技术征集表</p>
		<form action="${pageContext.request.contextPath}/requirementServlet?method=add" method="post">
			<table border="1" style="border-collapse: collapse;margin: 2px auto 0 auto;font-size: 20px;">
				<tr>
					<td>技术需求名称</td>
					<td><input type="text" name="name" class="fullTd" /></td>
				</tr>
				<tr>
					<td colspan="2" style="border-bottom-style: none;">重大科技需求概述(主要内容，技术指标、预期经济和社会效益等，<strong style="color: red;">限 500 字</strong>)</td>
				</tr>
				<tr>
					<td colspan="2" style="border-top-style: none;">
						<textarea name="intro" class="fullTd" rows="8" style="border-style: none;"></textarea>
					</td>
					
				</tr>
	 			<tr>
					<td>研究类型</td>
					<td>
						<input type="checkbox" name="researchType" value="1" id="researchType1" /><label for="researchType1">基础研究</label>&nbsp;&nbsp;
						<input type="checkbox" name="researchType" value="2" id="researchType2" /><label for="researchType2">应用研究</label>&nbsp;&nbsp;
						<input type="checkbox" name="researchType" value="3" id="researchType3" /><label for="researchType3">试验发展</label>&nbsp;&nbsp;
						<input type="checkbox" name="researchType" value="4" id="researchType4" /><label for="researchType4">研究发展与成果应用</label>&nbsp;&nbsp;
						<input type="checkbox" name="researchType" value="5" id="researchType5" /><label for="researchType5">技术推广与科技服务</label>&nbsp;&nbsp;
					</td>
				</tr>
				
				<tr>
					<td>技术需求合作模式</td>
					<td>
						<input type="radio" name="cooperationModel" value="1" id="cooperationModel1" /><label for="cooperationModel1">独立开发</label>&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="cooperationModel" value="2" id="cooperationModel2" /><label for="cooperationModel2">技术转让</label>
						<input type="radio" name="cooperationModel" value="3" id="cooperationModel3" /><label for="cooperationModel3">技术入股</label>&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="cooperationModel" value="4" id="cooperationModel4" /><label for="cooperationModel4">合作开发</label>
					</td>
				</tr>
				<tr>
					<td>计划总投资</td>
					<td><input type="text" onkeyup="this.value=this.value.replace(/[^\d\.]+/,'');" name="planAllInvest" class="fullTd"/></td>
				</tr>
				
			</table>
			<div style="margin: 8px;">
				<input type="submit" class="btnMy" value="提交">
			</div>
		</form>
	</div>

</body>
</html>