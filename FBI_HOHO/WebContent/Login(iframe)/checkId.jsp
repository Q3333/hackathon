<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
function sendCheckValue(){
	opener.document.getElementById("userid").value=document.getElementById("checkedId").value;
	window.close();
}
function getValue(){
	document.getElementById("checkedId").value = opener.document.getElementById("userid").value;
}
</script>

<body onload='getValue()'>
<h2>중복확인</h2>
<form method="get" action=checkIdAct.jsp>
<label>아이디</label>
<input type=text id="checkedId" name="checkedId">
<input type="submit" value="중복확인">
<input type="button" value="사용하기" onclick="sendCheckValue()">
</form>

</body>
</html>