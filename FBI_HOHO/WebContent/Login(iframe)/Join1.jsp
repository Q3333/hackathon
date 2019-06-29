<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<script type="text/javascript">
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

<h2>창업자용 회원가입</h2>

<form onsubmit="return validate();" action="JoinAct.jsp" >
<label>이름</label>
<input type='text' name='username' placeholder="이름을 입력하세요." autofocus required/><br>
<label>아이디</label>
<input type='email' name='userid' id='userid' placeholder='abc@def.ghi' required/>
<input type="button" value="중복확인" onclick="checkId()"/><br>
<label>비밀번호</label>
<input type='text'  name='userpass' id='userpass' placeholder="4~12자의 영문 대소문자+숫자" required><br>
<label>전화번호</label>
<input type='tel' name='usernum' placeholder="연락가능한 전화번호" required><br>
<label>관심 분야 (관심 분야를 선택하세요.(개수 제한 없음.))	</label>
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
<label>예상 총 비용</label>
<input type='range' name='foundMoney' min=1 max=500000>(만원)<br>
<label>예상 날짜</label>
<input type='text' name='foundDate' placeholder="YY/MM/DD"><br>
<label>지금 창업상담신청 하시겠습니까?</label>
<input type='radio' name='adviceYN' value='Y'>Y
<input type='radio' name='adviceYN' value='N'>N <br>
<input type='submit' value ='회원가입'>
<%application.setAttribute("select", "1");%>
</form>
</body>
</html>