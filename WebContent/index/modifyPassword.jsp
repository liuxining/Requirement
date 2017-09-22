<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/main.css">

<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-1.12.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/my.js"></script>

</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" style="text-align: center;background-color: #DCEEFC;">

	<div class="mainAction" style="text-align:center;align-content: center;">
		
		<form action="${pageContext.request.contextPath}/userServlet?method=modifyPassword" method="post">
			<table style="border-collapse: collapse;margin: 36px auto 0 auto;font-size: 16px;">
				<tr><td colspan="2" style="text-align: left;background-color: #8ACEEA;">修改密码</td></tr>
				<tr><td style="text-align: right;">旧 密 码：</td><td><input type="password" name="oldpassword"><strong style="color: red;">*</strong></td></tr>
				<tr><td style="text-align: right;">新 密 码：</td><td><input type="password" name="password"><strong style="color: red;">*</strong></td></tr>
				<tr><td style="text-align: right;">确认密码：</td><td><input type="password" name="password2"><strong style="color: red;">*</strong></td></tr>
					
			</table>
			<div style="margin: 8px;">
				<input type="submit" class="btnMy" value="提交">
			</div>
		</form>
	</div>
	<div>
		<c:if test="${param.status == 1}">
			<script type="text/javascript">
				alert("修改成功");
			</script>
		</c:if>
		<c:if test="${param.status == 2}">
			<script type="text/javascript">
				alert("旧密码错误");
			</script>
		</c:if>
		<c:if test="${param.status == 3}">
			<script type="text/javascript">
				alert("两次输入密码不一致");
			</script>
		</c:if>
	</div>

</body>
</html>