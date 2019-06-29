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
<input type='text' name='userid' placeholder="영문 8자이상" id='userid'/>
<input type="button" value="중복확인" onclick="checkId()"/><br>
<label>비밀번호</label>
<input type='text' placeholder="영문 + 특수문자 8자이상" name='userpass'><br>
<label>전화번호</label>
<input type='text' name='usernum'><br>
<label>관심분야</label>
<ul>
	<li>휴게음식점(카페,제과)<br>
		<input type='checkbox' name='concernList' value='coffee'>커피
		<input type='checkbox' name='concernList' value='bakery'>베이커리
		<input type='checkbox' name='concernList' value='icecream'>아이스크림
	</li>
	<li>일반음식점<br>
		<input type='checkbox' name='concernList' value='koreanfood'>한식
		<input type='checkbox' name='concernList' value='chinesefood'>중식
		<input type='checkbox' name='concernList' value='americanfood'>양식
		<input type='checkbox' name='concernList' value='japanesefood'>일식
		<input type='checkbox' name='concernList' value='schoolfood'>분식
		<input type='checkbox' name='concernList' value='vietnamfood'>베트남음식
		<input type='checkbox' name='concernList' value='meat'>고기집
		<input type='checkbox' name='concernList' value='chicken'>치킨
		<input type='checkbox' name='concernList' value='pizza'>피자
		<input type='checkbox' name='concernList' value='hamburger'>햄버거
		<input type='checkbox' name='concernList' value='late_nightfood'>야식
	</li>
	<li>로드샵<br>
		<input type='checkbox' name='concernList' value='csv'>편의점
		<input type='checkbox' name='concernList' value='buety'>뷰티
		<input type='checkbox' name='concernList' value='accessory'>액세서리
		<input type='checkbox' name='concernList' value='phoneshop'>핸드폰 가맹점
	</li>
	<li>여가시설<br>
		<input type='checkbox' name='concernList' value='gym'>헬스장
		<input type='checkbox' name='concernList' value='yoga'>요가
		<input type='checkbox' name='concernList' value='pool'>당구장
		<input type='checkbox' name='concernList' value='screengolf'>스크린골프
		<input type='checkbox' name='concernList' value='massage'>마사지
		<input type='checkbox' name='concernList' value='nail'>네일
		<input type='checkbox' name='concernList' value='internetcafe'>피시방
		<input type='checkbox' name='concernList' value='karaoke'>노래방
	</li>
	<li>숙박시설<br>
		<input type='checkbox' name='concernList' value='hotel'>호텔
		<input type='checkbox' name='concernList' value='motel'>모텔 
	</li>	
</ul>
<%
if(select.equals("1")){

	out.println("<label>예상 총 비용</label>");
	out.println("<input type='text' placeholder='' name='foundMoney'><br>");
	out.println("<label>예상 날짜</label>");
	out.println("<input type='text' placeholder='yy/mm/dd' name='foundDate'><br>");
	out.println("<label>지금 창업상담신청 하시겠습니까?</label>");
	out.println("<input type='radio' name='adviceYN' value='Y'>Y");
	out.println("<input type='radio' name='adviceYN' value='N'>N <br>");
	
}

application.setAttribute("select", request.getParameter("select"));
%>
<input type="submit" value="회원 가입">
</form>
</body>
</html>