<%@page import="javax.script.ScriptContext"%>
<%@page import="org.apache.tomcat.util.net.ApplicationBufferHandler"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body >
<script type="text/javascript">
function checkId(){
	window.open("checkId.jsp","checkId.jsp","width=500 , height=300,alwaysRaised=yes");
}
</script>
<%
String select = request.getParameter("select");
if(select.equals("1")){
	out.println("<h2>창업자용 회원가입</h2>");
	
}
else if(select.equals("2")){
	out.println("<h2>일반사용자용 회원가입</h2>");
}
%>	


<form method="get" action="JoinAct.jsp" >
<label>이름</label>
<input type='text' name='username' /><br>
<label>아이디</label>
<input type='text' name='userid' id='userid'/>
<input type="button" value="중복확인" onclick="checkId()"/><br>
<label>비밀번호</label>
<input type='text' name='userpass'><br>
<label>전화번호</label>
<input type='text' name='usernum'><br>

<%
if(select.equals("1")){
	
	out.println("<label>관심 분야	</label>");
	out.println("<input type='text' name='concernList'><br>");
	out.println("<label>예상 총 비용</label>");
	out.println("<input type='text' name='foundMoney'><br>");
	out.println("<label>예상 날짜</label>");
	out.println("<input type='text' name='foundDate'><br>");
	out.println("<label>상담 여부</label>");
	out.println("<input type='text' name='adviceYN'><br>");
	

}
else if(select.equals("2")){
	out.println("<label>관심 분야</label>");
	out.println("<input type='text' name='concernList'><br>");
}
application.setAttribute("select", request.getParameter("select"));
%>
<input type="submit" value="회원 가입">
</form>
</body>
</html>