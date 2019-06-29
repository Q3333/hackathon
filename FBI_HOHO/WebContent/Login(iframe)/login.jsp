<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그인 화면</title>
</head>
<script type="text/javascript">
function moveJoin(){
	document.form1.submit();
}
</script>
<style>
label{
color: red;
background-color: yellow;
}
</style>

<% 
	String hoho = request.getParameter("hoho");
	if(hoho == null){
		hoho = " ";
	}
%>

<body>
<form method="get" action="loginAct.jsp">
<h4>로그인</h4>
<label>아이디 </label>
<input type="text" name="userid"><br>
<label>비밀번호</label>	
<input type="password" name="userpass"><br>
<input type="submit" value="로그인" name="login">
</form>
<form name="form1" method="get" action="SelectJoin.jsp">
<input type="hidden" name="select" value="1"/>
<input type="button" value="회원가입" onclick="moveJoin()"><br>
<label><%= hoho%></label>

</form>
</body>
</html>