<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign Up Page</title>
	<!-- Font Icon -->
    <link rel="stylesheet" href="../fonts(css1)/material-icon/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="../vendor(css1)/nouislider/nouislider.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="../css(css1)/style.css">
</head>
<script type="text/javascript">
function checkId(){
	window.open("checkId.jsp","checkId.jsp","width=500 , height=300,alwaysRaised=yes");
}
function validate() {
    var re = /^[a-zA-Z0-9]{4,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
    var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    // 이메일이 적합한지 검사할 정규식

    var id = document.getElementById("id");
    var pw = document.getElementById("pw");

    // ------------ 이메일 까지 -----------

    if(!check(re,id,"아이디는 4~12자의 영문 대소문자와 숫자로만 입력")) {
        return false;
    }

    if(!check(re,pw,"패스워드는 4~12자의 영문 대소문자와 숫자로만 입력")) {
        return false;
    }

    if(join.pw.value != join.checkpw.value) {
        alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
        join.checkpw.value = "";
        join.checkpw.focus();
        return false;
    }
    alert("회원가입이 완료되었습니다.");
}
function check(re, what, message) {
    if(re.test(what.value)) {
        return true;
    }
    alert(message);
    what.value = "";  
    what.focus();
    //return false;
}
</script>
<body>
<div class="main">
<div class="container">
<div class="signup-img" style='backgroudnd-color:yellow'>
<div class='signup-img-content'>
<h2>Resister now</h2>
<p>창업자용 회원가입!</p>
</div> <!--s-i-content close -->
</div> 
<div class='signup-form'>
<div class='form-row'>
<form onsubmit="return validate();" action="JoinAct.jsp" >
<div class='form-group'>
<div class='form-input'>
	<label class='required'>이름</label>
	<input type='text' name='username' placeholder="이름을 입력하세요." autofocus/><br>
</div><!-- form-input -->

<div class='form-input'>
	<label class='required'>아이디</label>
	<input type='email' name='userid' placeholder="abcd@efhij.com"/><br>
	<input type='button' value='중복확인' onclick='chectkId()'/>
</div><!-- form-input -->

<div class='form-input'>
	<label class='required'>비밀번호</label>
	<input type='password' name='userpass' placeholder="8자 이상" min='8'/><br>
</div><!-- form-input -->

<div class='form-input'>
	<label class='required'>핸드폰번호</label>
	<input type='tel' name='usernum' placeholder="OOO-OOOO-OOOO" /><br>
</div><!-- form-input -->
</div>
<div class='form-radio'>
<div class='label-flex'>
<label>관심 분야</label>
</div>
<div class="form-radio-group">

<div class='form-radio-item'>
<label>휴게음식점(카페,제과)</label>
	<input type='checkbox' name='concernList' value='coffee'>커피
	<input type='checkbox' name='concernList' value='bakery'>베이커리
	<input type='checkbox' name='concernList' value='icecream'>아이스크림
</div>
</div>
<div class="form-radio-group">

<div class='form-radio-item'>
<label>일반음식점</label>
	<input type='checkbox' name='concernList' value='koreanfood'>한식
	<input type='checkbox' name='concernList' value='chinesefood'>중식
	<input type='checkbox' name='concernList' value='americanfood'>양식
	<input type='checkbox' name='concernList' value='japanesefood'>일식
	<input type='checkbox' name='concernList' value='schoolfood'>분식
	<input type='checkbox' name='concernList' value='vietnamfood'>베트남
	<input type='checkbox' name='concernList' value='meat'>고기집
	<input type='checkbox' name='concernList' value='chicken'>치킨
	<input type='checkbox' name='concernList' value='pizza'>피자
	<input type='checkbox' name='concernList' value='hamburger'>햄버거
	<input type='checkbox' name='concernList' value='late_nightfood'>야식
</div>
</div>
<div class="form-radio-group">

<div class='form-radio-item'>
<label>로드샵</label>
	<input type='checkbox' name='concernList' value='csv'>편의점
	<input type='checkbox' name='concernList' value='buety'>뷰티
	<input type='checkbox' name='concernList' value='accessory'>액세서리
	<input type='checkbox' name='concernList' value='phonshop'>핸드폰가맹점
</div>
</div>
<div class="form-radio-group">

<div class='form-radio-item'>
<label>여가시설</label>
	<input type='checkbox' name='concernList' value='gym'>헬스장
    <input type='checkbox' name='concernList' value='yoga'>요가
    <input type='checkbox' name='concernList' value='pool'>당구장
    <input type='checkbox' name='concernList' value='screengolf'>스크린골프
    <input type='checkbox' name='concernList' value='massage'>마사지
    <input type='checkbox' name='concernList' value='nail'>네일
    <input type='checkbox' name='concernList' value='internetcafe'>피시방
    <input type='checkbox' name='concernList' value='karaoke'>노래방
</div>
</div>
<div class="form-radio-group">

<div class='form-radio-item'>
<label>숙박시설</label>
 <input type='checkbox' name='concernList' value='hotel'>호텔
 <input type='checkbox' name='concernList' value='motel'>모텔 
</div>
</div>
</div>
<div class='form-submit'>
<input type='submit' value='회원가입' class='submit'>
<%
application.setAttribute("select", "2");
%>
</div>
</form>
</div>
</div>
</div>
</body>

</html>