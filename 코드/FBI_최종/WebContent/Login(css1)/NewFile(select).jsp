<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원가입 유형 선택</title>
	<!-- Font Icon -->
    <link rel="stylesheet" href="../fonts(css1)/material-icon/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="../vendor(css1)/nouislider/nouislider.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="../css(css1)/style.css">
</head>
<script type="text/javascript">


	function selected(select){
 	if(select==1){
 		document.getElementById('iframe').setAttribute('src','NewFile(join1).jsp')

	}
 	
	else if(select==2){	
		document.getElementById('iframe').setAttribute('src','NewFile(join2).jsp')

	}
}
</script>

<body>
<div class="main">
<div class="container">

<h2 style=text-align:center>Resister now</h2>
<h2 style=text-align:center>회원가입 유형 선택</h2>

</div>
</div>
<form method="get" name="form1">
<input class='select_btn' type="button" value="창업자" onclick="selected(1)">
</form>

<form method="get" name ="form2">
<input class='select_btn' type="button" value="일반 사용자" onclick="selected(2)">
</form>
<p style=align:center>
<iframe id = iframe src=NewFile(join1).jsp width=700px height=800px style=border:none ></iframe>
</p>
</body>
</html>