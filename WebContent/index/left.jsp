<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../static/css/main.css">

<script type="text/javascript" src="../static/js/jquery-1.12.1.js"></script>
<script type="text/javascript" src="../static/js/my.js"></script>

</head>
<body>
<div class="leftMenu">
	<div class="menu">
		<div class="menuParent">
			<div class="ListTitlePanel">
				<div class="ListTitle" style="height: 34px; background-color: #44A2EF">
					<strong style="color: #FFFFFF;font-size: 20px;line-height: 34px;">系统菜单</strong>
					<div class="leftbgbt"> </div>
				</div>
			</div>
			<div class="menuList">
			</div>
		</div>
		<div class="menuParent">
			<div class="ListTitlePanel">
				<div class="ListTitle">
					<img src="../index/lefticon.png">
					<strong>信息查询</strong>
					<div class="leftbgbt"> </div>
				</div>
			</div>
			<div class="menuList">
				<div> <a href="addRequirement.jsp" target="mainAction">需求征集</a></div>
				<div> <a href="${pageContext.request.contextPath}/requirementServlet?method=list&to=index_listRequirement" target="mainAction">查看需求</a> </div>
				<div> <a href="${pageContext.request.contextPath}/requirementServlet?method=list&status2=1&to=index_list1Requirement" target="mainAction">需求审核</a> </div>
				<div> <a href="${pageContext.request.contextPath}/index/modifyPassword.jsp" target="mainAction">修改密码</a> </div>
			</div>
		</div>
		<div class="menuParent">
			<div class="ListTitlePanel">
				<div class="ListTitle">
					<img src="../index/lefticon.png">
					<strong>统计汇总</strong>
					<div class="leftbgbt2"> </div>
				</div>
			</div>
			<div class="menuList">
				
			</div>
		</div>
		<div class="menuParent">
			<div class="ListTitlePanel">
				<div class="ListTitle">
					<img src="../index/lefticon.png">
					<strong>短信管理</strong>
					<div class="leftbgbt2"> </div>
				</div>
			</div>
			<div class="menuList">
				
			</div>
		</div>
		<div class="menuParent">
			<div class="ListTitlePanel">
				<div class="ListTitle">
					<img src="../index/lefticon.png">
					<strong>通知通告</strong>
					<div class="leftbgbt2"> </div>
				</div>
			</div>
			<div class="menuList">
				
			</div>
		</div>
		<div class="menuParent">
			<div class="ListTitlePanel">
				<div class="ListTitle">
					<img src="../index/lefticon.png">
					<strong>法律法规</strong>
					<div class="leftbgbt2"> </div>
				</div>
			</div>
			<div class="menuList">
				
			</div>
		</div>
		<div class="menuParent">
			<div class="ListTitlePanel">
				<div class="ListTitle">
					<img src="../index/lefticon.png">
					<strong>用户管理</strong>
					<div class="leftbgbt2"> </div>
				</div>
			</div>
			<div class="menuList">
				
			</div>
		</div>
		<div class="menuParent">
			<div class="ListTitlePanel">
				<div class="ListTitle">
					<img src="../index/lefticon.png">
					<strong>个人信息</strong>
					<div class="leftbgbt2"> </div>
				</div>
			</div>
			<div class="menuList">
				
			</div>
		</div>
		<div class="menuParent">
			<div class="ListTitlePanel">
				<div class="ListTitle">
					<img src="../index/lefticon.png">
					<a href="${pageContext.request.contextPath }/userServlet?method=logout">安全退出</a>
					<div class="leftbgbt2"> </div>
				</div>
			</div>
			<div class="menuList">
				
			</div>
		</div>
		
	</div>
</div>
</body>
</html>