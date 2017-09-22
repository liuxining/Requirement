<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
	<frameset rows="100px,*" frameborder="no">
		<frame src="${pageContext.request.contextPath}/index/head.jsp" />
		<frameset cols="203px,*">
			<frame src="${pageContext.request.contextPath}/index/left.jsp" />
			<frameset rows="36px,*">
				<frame src="${pageContext.request.contextPath}/index/mainBar.jsp" />
				<frame name="mainAction" src="${pageContext.request.contextPath }/index/index.html">
			</frameset>
		</frameset>
	</frameset>
</html>