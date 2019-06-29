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
 		document.getElementById('iframe').setAttribute('src','Join1.jsp')
 		
 		
	}
 	
	else if(select==2){	
		document.getElementById('iframe').setAttribute('src','Join2.jsp')

	}
}
</script>

<body>
<h2>회원가입 유형 선택</h2>

<form method="get" name="form1">

<input type="button" value="창업자" onclick="selected(1)">
</form>

<form method="get" name ="form2">

<input type="button" value="일반 사용자" onclick="selected(2)">
</form>

<iframe id = iframe src=Join2.jsp width=500px height=500px></iframe>

</body>
</html>