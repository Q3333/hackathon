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
 		document.getElementById("ceo").style.display='block';
 		document.getElementById("normal").style.display='none';
	}
	else if(select==2){
		document.getElementById("ceo").style.display='none';
		document.getElementById("normal").style.display='block';
	}
}
</script>

<body>
<h2>회원가입 유형 선택</h2>
<form>
<input type="radio" value="일반사용자" name="select" onclick="selected(2)" checked="checked">일반 사용자
<input type="radio" value="창업자" name="select" onclick="selected(1)">창업자
</form>
<div id="ceo" style="display:none">
	<jsp:include page="Join.jsp" flush="false">
		<jsp:param name="select" value="1"/>
	</jsp:include>
</div>
<div id="normal" style="display:block">
<jsp:include page="Join.jsp" flush="false">
	<jsp:param name="select" value="2"/>
</jsp:include>
</div>

</body>
</html>