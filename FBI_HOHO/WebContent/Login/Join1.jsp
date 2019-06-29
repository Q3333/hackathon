<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<h2>창업자용 회원가입</h2>

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
<label>관심 분야	</label>
<input type='text' name='concernList'><br>
<label>예상 총 비용</label>
<input type='text' name='foundMoney'><br>
<label>예상 날짜</label>
<input type='text' name='foundDate'><br>
<label>상담 여부</label>
<input type='text' name='adviceYN'><br>
<input type='submit' value ='회원가입'>
<%application.setAttribute("select", "1");%>
</form>
</body>
</html>