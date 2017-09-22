<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url(images/loginbg.jpg);
	background-repeat: repeat-x;
}
-->
</style>
<script type="text/javascript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
<script type="text/javascript">
	function reloadCheckCode(){
		document.getElementById("checkCode").src = "${pageContext.request.contextPath}/checkCode?" + Math.random();
	}
</script>


</head>
<body bgcolor="#FFFFFF" onLoad="MM_preloadImages('images/login000_06.jpg','images/loging000_07.jpg')">

<table width="795" height="475" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
<tr>
		<td colspan="5">
			<img src="images/login_01.jpg" width="795" height="159" alt=""></td>
	</tr>
	<tr>
		<td rowspan="2">
			<img src="images/login_02.jpg" width="269" height="278" alt=""></td>
		<td bgcolor="#CFE5F2">
			<img src="images/login_03.png" width="66" height="215" alt=""></td>
		<td colspan="2" bgcolor="#D0E6F3"><table width="100%" height="116" border="0" cellpadding="0" cellspacing="0">
	      <tr>
	        <td height="32" colspan="2" align="left" valign="bottom"><INPUT NAME="username" TYPE="text" id="username" CLASS="STYLE1" STYLE="width:180px; height:17px; border:#336699 1px solid" tabindex="1" MAXLENGTH="26"></td>
          </tr>
 		  <tr>
	        <td height="32" colspan="2" align="left" valign="bottom"><INPUT NAME="password" TYPE="password" id="password" CLASS="STYLE1" STYLE="width:180px; height:17px; border:#336699 1px solid" tabindex="1" MAXLENGTH="26"></td>
          </tr>
 		  <tr>
	        <td height="32" colspan="2" align="left" valign="bottom"><INPUT NAME="password2" TYPE="password" id="password2" CLASS="STYLE1" STYLE="width:180px; height:17px; border:#336699 1px solid" tabindex="1" MAXLENGTH="26"></td>
          </tr>

	      <tr>
	        <td height="32" colspan="2" align="left" valign="bottom"><INPUT NAME="phone" TYPE="text" id="phone" CLASS="STYLE1" STYLE="width:180px; height:17px; border:#336699 1px solid" tabindex="1" MAXLENGTH="26"></td>
          </tr>

          <tr>
	        <td height="32" colspan="2" align="left" valign="bottom"><INPUT NAME="department" TYPE="text" id="department" CLASS="STYLE1" STYLE="width:180px; height:17px; border:#336699 1px solid" tabindex="1" MAXLENGTH="26"></td>
          </tr>
	      <tr>
	        <td width="50%" height="29" align="left" valign="bottom"><INPUT NAME="checkCodeInput" id="checkCodeInput" TYPE="text" CLASS="STYLE1" STYLE="width:100px; height:17px; border:#336699 1px solid" tabindex="1" MAXLENGTH="26"></td>
            <td width="50%" align="left" valign="bottom"><a href="javascript:void(0)" onclick="reloadCheckCode();"><img
							src="${pageContext.request.contextPath}/checkCode" id="checkCode" /></a></td>
          </tr>
	      <tr>
	        <td height="30" colspan="1" align="left" valign="bottom">&nbsp;</td>
	      </tr>
      </table></td>
<td rowspan="2">
			<img src="images/login_05.jpg" width="262" height="278" alt=""></td>
	</tr>
	<tr>
		<td colspan="2"><a href="${pageContext.request.contextPath }/login/login.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image12','','images/loging000_06.jpg',1)"><img src="images/login_06.jpg" name="Image12" width="135" height="59" border="0"></a></td>
<td><a href="#" onclick="check()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image13','','images/loging000_07.jpg',1)"><img src="images/login_07.jpg" name="Image13" width="129" height="59" border="0"></a></td>
  </tr>
	<tr>
		<td colspan="5">
			<img src="images/login_08.jpg" width="795" height="141" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="269" height="1" alt=""></td>
		<td>
			<img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="66" height="1" alt=""></td>
		<td>
			<img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="69" height="1" alt=""></td>
		<td>
			<img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="129" height="1" alt=""></td>
		<td>
			<img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="262" height="1" alt=""></td>
	</tr>
</table>
<!-- End Save for Web Slices -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/static/js/jquery-1.12.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/static/js/jquery.validate.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/static/js/myvalidate.js"></script>


<script type="text/javascript">
	function check(){
		var username = $("#username").val();
		var password = $("#password").val();
		var password2 = $("#password2").val();
		var phone = $("#phone").val();
		var department = $("#department").val();
		var checkCodeInput = $("#checkCodeInput").val();
		if(username == null || username.length == 0 || password == null || password.length == 0 || password2 == null || password2.length == 0 || phone == null || phone.length == 0 || department == null || department.length == 0 || checkCodeInput == null || checkCodeInput.length == 0){
			alert("填写不完整");
			return false;
		}
		
		if(password != password2){
			alert("两次输入的密码不一致");
			return false;
		}
		$.post('${pageContext.request.contextPath}/userServlet', {'method': 'add','username':username,'password':password,'phone':phone,'department':department,"checkCodeInput":checkCodeInput}, function(data, textStatus, xhr) {
			if(data != null && data.length > 0){
				//alert(data);
				if(data == 1){
					reloadCheckCode();
					alert("用户名已存在");
				}
				else if(data == 2){
					reloadCheckCode();
					alert("验证码错误");
				}
				else{
					window.location.href = "${pageContext.request.contextPath}/login/login.jsp";
				}
			}
		});
	}
</script>

</body>
</html>