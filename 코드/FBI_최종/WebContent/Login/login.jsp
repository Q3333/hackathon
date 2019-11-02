<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그인 화면</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->  
<link rel="icon" type="image/png" href="../images/icons/favicon.ico"/>
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="../vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="../fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="../fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="../vendor/animate/animate.css">
<!--===============================================================================================-->  
<link rel="stylesheet" type="text/css" href="../vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="../vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="../vendor/select2/select2.min.css">
<!--===============================================================================================-->  
<link rel="stylesheet" type="text/css" href="../vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="../css/util.css">
<link rel="stylesheet" type="text/css" href="../css/main.css">
<!--===============================================================================================-->
</head>
<script type="text/javascript">
function moveJoin(){
    document.form1.submit();
}
</script>
<% 
    String hoho = request.getParameter("hoho");
    if(hoho == null){
        hoho = " ";
    }
%>

<body>
<div class="limiter">
        <div class="container-login100">
            <div class="wrap-login100 p-t-50 p-b-90">
                <form class="login100-form validate-form flex-sb flex-w">
                    <span class="login100-form-title p-b-51">
<h4>로그인</h4>
</span>

</form>
<div class="wrap-input100 validate-input m-b-16" data-validate = "Username is required">
<form method="get" action="loginAct.jsp">
    <input class="input100" type="text" name="userid" placeholder="Userid">
    <span class="focus-input100"></span>
</div>
<br>
<div class="wrap-input100 validate-input m-b-16" data-validate = "Password is required">
    <input class="input100" type="password" name="userpass" placeholder="Password">
    <span class="focus-input100"></span>
</div>
 <div class="flex-sb-m w-full p-t-3 p-b-24">
    <div class="contact100-form-checkbox">
        <input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
        <label class="label-checkbox100" for="ckb1">
          아이디 저장
        </label>
    </div>
    </div>
    <br>

<div class="container-login100-form-btn m-t-17">
 <input type="submit" value="로그인" name="login" class="login100-form-btn">
    </div>
    </form>
         <div class="container-login100-form-btn m-t-17">
<form name="form1" method="get" action="../Login(css1).NewFile(select).jsp">
<input type="submit" value="회원가입" onclick="moveJoin()" class="login100-form-btn"><br>
</form>
</div>
 </div>
 </div>
 </div>
 </div>
 


</body>
</html>