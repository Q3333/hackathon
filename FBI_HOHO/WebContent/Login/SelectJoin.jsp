<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원가입 유형 선택</title>
</head>
<script type="text/javascript">
function selected(select){
	
 	if(select == 1){
 		document.form1.submit();	
	}
	else if(select==2){
		
		document.form2.submit();
	}
}
</script>

<body>
<h2>회원가입 유형 선택</h2>

<form method="get" name="form1" action="Join.jsp">
<input type="hidden" name="select" value="1"/>
<input type="button" value="창업자" onclick="selected(1)">
</form>

<form method="get" name ="form2" action="Join.jsp">
<input type="hidden" name="select" value="2">
<input type="button" value="일반 사용자" onclick="selected(2)">
</form>

</body>
</html>