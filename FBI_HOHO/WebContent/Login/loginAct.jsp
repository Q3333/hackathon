
<%@page import="javax.script.ScriptContext"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "lab.java.user.UserDao" %>
<%@ page import = "lab.java.user.userInfo" %>
<%@ page import="java.io.PrintWriter" %> <!-- 자바 클래스 사용 -->
<% request.setCharacterEncoding("UTF-8"); %>


    
    
<jsp:useBean id="user" class="lab.java.user.userInfo" scope="page" />
<jsp:setProperty name="user" property="userid" param="userid"/>
<jsp:setProperty name="user" property="userpass" param="userpass"/> 

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title></title>
</head>
<body>
<%
	

	UserDao userDao = new UserDao();
	session.setAttribute("ID", user.getUserid());//오류나면 보기
	session.setAttribute("PASS", user.getUserpass());//오류나면 보기
	
	int result = userDao.login(user.getUserid(), user.getUserpass());
	
	if(result==1){
		out.println("<script>");
		out.println("alert('로그인 성공!')");
		out.println("location.href='../main/mainDbAct.jsp'");
		out.println("</script>");
	}
	else if(result==0){
		out.println("<script>");
		out.println("alert('비밀번호가 틀렸습니다.')");
		out.println("history.back()");
		out.println("</script>");		
	}
	else if(result==-1){
		out.println("<script>");
		out.println("alert('아이디가 존재하지 않습니다.')");
		out.println("</script>");		
		response.sendRedirect("login.jsp?hoho=123");
	}
	else if(result==-2){
		out.println("<script>");
		out.println("alert('DB연결 실패.')");
		out.println("history.back()");
		out.println("</script>");
	}
	
%>

</body>
</html>