<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>
<h2>메인</h2>
<p><%=session.getAttribute("ID") %></p>
<p><%=session.getAttribute("PASS") %></p>

</body>
</html>