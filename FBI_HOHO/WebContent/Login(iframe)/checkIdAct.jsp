<%@page import="lab.java.user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>중복확인</title>
</head>
<script type="text/javascript">

</script>
<body>
<%
	UserDao userdao = new UserDao();
	int result = userdao.login(request.getParameter("checkedId"),"");
	if(result==0){
		out.println("<script>alert('아이디가 존재합니다.')");
		out.println("history.back()</script>");
	}
	else{
		out.println("<script>alert('아이디가 존재하지않습니다.')");
		out.println("history.back()</script>");
	}


%>

</body>
</html>