<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.HashMap"%>
<%@page import="lab.java.user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>FBI - Home</title>
   <link rel="icon" href="img/lg2.png" type="image/png">

  <link rel="stylesheet" href="vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">
  <link rel="stylesheet" href="vendors/themify-icons/themify-icons.css">
  <link rel="stylesheet" href="vendors/linericon/style.css">
  <link rel="stylesheet" href="vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
  <link rel="stylesheet" href="vendors/Magnific-Popup/magnific-popup.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/style.css">

  <style>
    #searchEngine {
      float: right; margin-top: 60px; margin-right: 200px;
    }

    .arrange {
      font-size: 17px; color:#FFBB00; border:solid 1px; max-width: 80px; padding-left: 2px;
    }

    .arrange_span{
      margin-left: 12px;
    }

    #whole {
      float: right;
    }
  </style>
</head>
<body>

<%
   UserDao userdao = new UserDao();
   HashMap<Integer,HashMap<String,String>> map=userdao.getXY();
   
   SimpleDateFormat dt = new SimpleDateFormat("yyyyy-MM-dd hh:mm:ss"); 
   Calendar cal = Calendar.getInstance();
   
   int money[] = new int[6];
   String startDate[] = new String[6];
   String endDate[] = new String[6];
   
   Date startD[] = new Date[6];
   Date startE[] = new Date[6];
   
   long calDate[] = new long[6];
   long calDateDays[] = new long[6];
   
   
   for(int i = 1; i<=3;i++){
      double moneyA =Integer.parseInt(map.get(i).get("CURRENTMONEY"));
      double moneyB =Integer.parseInt(map.get(i).get("FOUNDENDMONEY")); 
      money[i] = (int)((moneyA/moneyB)*100);
      
      startDate[i] =   map.get(i).get("STARTDATE");
      endDate[i] = map.get(i).get("ENDDATE");
      
      startD[i] = dt.parse(startDate[i]);
      startE[i] = dt.parse(endDate[i]);
      
      calDate[i] = startE[i].getTime() - startD[i].getTime();
      calDateDays[i] = calDate[i] / ( 24*60*60*1000);
      calDateDays[i] = Math.abs(calDateDays[i]);
      
      
   }
   

   

    


   
   
   
   
%>

  <script>
  function onClick(select){
     if(select == 1){
        document.form1.submit();
     }
     else if (select == 2){
        document.form2.submit();
     }
     else if (select == 3){
        document.form3.submit();
     }
     else if (select == 4){
        document.form4.submit();
     }
     else if (select == 5){
        document.form5.submit();
     }
     else if (select == 6){
        document.form6.submit();
     }
  
  }
  </script>

  <!--================ Header Top Area Start =================-->
  <section class="header-top d-none d-sm-block">
    <div class="container">
      <div class="d-sm-flex justify-content-between">
        
        <ul class="header-top__social">
          <li><a href="#"><strong color="white">회원가입</strong></a></li>
          <li><a href="#"><strong color="white">로그인</strong></a></li>
        </ul>
      </div>
    </div>
  </section>
  <!--================ Header Top Area end =================-->

  <!--================ Header Menu Area start =================-->
  <header class="header_area">
    <div class="main_menu">
      <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container box_1620">
          <a class="navbar-brand logo_h" href="index.jsp"><img src="img/lg1.png" width="140" height="60" alt=""></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>

          <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
            <ul class="nav navbar-nav menu_nav justify-content-end">
              <li class="nav-item active"><a class="nav-link" href="index.jsp">Home</a></li> 
              <li class="nav-item submenu dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                  aria-expanded="false">이용안내</a>
                <ul class="dropdown-menu">
                  <li class="nav-item"><a class="nav-link" href="about_startup.jsp">예비창업자</a></li>
                  <li class="nav-item"><a class="nav-link" href="about_investor.jsp">개인후원자</a></li>
                </ul>
                     </li>
              <li class="nav-item"><a class="nav-link" href="services-1.jsp">수요조사</a>
                <li class="nav-item"><a class="nav-link" href="services-2.jsp">후원</a>
              <!-- <li class="nav-item submenu dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                  aria-expanded="false">Pages</a>
                <ul class="dropdown-menu">
                  <li class="nav-item"><a class="nav-link" href="blog.html">Blog</a></li>
                  <li class="nav-item"><a class="nav-link" href="blog-details.html">Blog Details</a></li>
                </ul>
                     </li> -->
            </ul>
          </div> 
        </div>
      </nav>
    </div>
  </header>
  <!--================Header Menu Area =================-->

  <!--================ Hero Banner start =================-->      
  <div class="container">  
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
  
      <!-- Wrapper for slides -->
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <img src="img/store1.png" width="1648" height="600" alt="">
          <div class="carousel-caption">
            <h2><strong>당신의 상가에</strong></h2>
            <h3><strong>투표하세요!</strong></h3>
            <a href="#"><strong>투표하기</strong></a>
        </div>
      </div>

        <div class="item">
          <img src="img/store1.png" width="1648" height="600" alt="">
        </div>
      
        <div class="item">
          <img src="img/store1.png" width="1648" height="600" alt="">
        </div>
      </div>
  
      <!-- Left and right controls -->
      <a class="left carousel-control" href="#myCarousel" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  </div>
  
  <!--================ Blog section start =================-->  

  <section class="section-margin">
   <!-- section title -->
   <div id="now">
      <a href="" id="whole"> <u>전체보기</u> </a>
      <!-- section title -->
      <div class="section-title text-center">
          
        <p class="sub-title">&nbsp;&nbsp;*실시간 투표현황&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
      </div>
      </div>
  <!-- section title -->

  <!-- causes -->

  <form name ="form1" method="get" action="blog-details_vote.jsp">
     <div class="col-md-4">
       <div class="causes">
         <div class="causes-img">
         <input type="hidden" name="BDID" value=<%=map.get(4).get("BDID") %>  />
           <a onclick="onClick(1)">
               <img src="./img/index/상가4.jpg"  alt="" >
             </a>
         </div>
         <div class="causes-progress">
           <div class="causes-progress-bar">
             <div style="width: 87%;">
               <span>87%</span>
             </div>
           </div>
           <div>
             <span class="causes-raised">현재 1위: <strong>카페</strong></span>
             <span class="causes-goal">현재 2위: <strong>고기집</strong></span>
           </div>
         </div>
         <div class="causes-content">
           <h3><a onclick="onClick(1)"><%=map.get(4).get("COMMENTS") %></a></h3>
           <p><%=map.get(4).get("ADDRESS")%></p>
           <a onclick="onClick(1)" class="primary-button causes-donate">수요조사 바로가기</a>
         </div>
       </div>
     </div>
  </form>
  <!-- /causes -->

  <!-- causes -->
  <form name ="form2" method="get" action="blog-details_vote.jsp">
  <input type="hidden" name="BDID" value=<%=map.get(5).get("BDID") %>  />
  <div class="col-md-4">
    <div class="causes">
      <div class="causes-img">
        <a onclick="onClick(2)">
            <img src="./img/index/상가3.jpg" alt="">
          </a>
      </div>
      <div class="causes-progress">
        <div class="causes-progress-bar">
          <div style="width: 53%;">
            <span>53%</span>
          </div>
        </div>
        <div>
          <span class="causes-raised">현재 1위: <strong>빵집</strong></span>
          <span class="causes-goal">현재 2위: <strong>PC방</strong></span>
        </div>
      </div>
      <div class="causes-content">
        <h3><a onclick="onClick(2)"><%=map.get(5).get("COMMENTS") %></a></h3>
        <p><%=map.get(5).get("ADDRESS")%></p>
        <a onclick="onClick(2)" class="primary-button causes-donate">수요조사 바로가기</a>
      </div>
    </div>
  </div>
  </form>
  <!-- /causes -->

  <!-- causes -->
  <form name ="form3" method="get" action="blog-details_vote.jsp">
  <input type="hidden" name="BDID" value=<%=map.get(6).get("BDID") %>  />
  <div class="col-md-4">
    <div class="causes">
      <div class="causes-img">
        <a onclick="onClick(3)">
          <img src="./img/index/상가5.jpg" alt="">
        </a>
      </div>
      <div class="causes-progress">
        <div class="causes-progress-bar">
          <div style="width: 72%;">
            <span>72%</span>
          </div>
        </div>
        <div>
          <span class="causes-raised">현재 1위: <strong>헬스장</strong></span>
          <span class="causes-goal">현재 2위: <strong>미용실</strong></span>
        </div>
      </div>
      <div class="causes-content">
        <h3><a onclick="onClick(3)"><%=map.get(6).get("COMMENTS") %></a></h3>
        <p><%=map.get(6).get("ADDRESS") %></p>
        <a onclick="onClick(3)" class="primary-button causes-donate">수요조사 바로가기</a>
      </div>
    </div>
  </div>
  </form>
  <!-- /causes -->

  <div class="clearfix visible-md visible-lg"></div>

  <a href="" id="whole"> <u>전체보기</u> </a>
  <!-- section title -->
  <div class="section-title text-center">
      
    <p class="sub-title">&nbsp;&nbsp;*실시간 후원현황&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
  </div>
  <!-- causes -->
  <form name ="form4" method="get" action="blog-details_fund.jsp">
  <input type="hidden" name="BDID" value=<%=map.get(1).get("BDID") %>  />
  <div class="col-md-4">
    <div class="causes">
      <div class="causes-img">
        <a onclick="onClick(4)">
            <img src="./img/index/상가4.jpg" alt="">
          </a>
      </div>
      <div class="causes-progress">
        <div class="causes-progress-bar">
          <div style="width: <%= money[1]%>%;">
            <span><%=money[1]%> %</span>
          </div>
        </div>
        <div>
          <span class="causes-raised">달성금액: <strong><%=map.get(1).get("CURRENTMONEY")%>원</strong></span>
          <span class="causes-goal">목표금액: <strong><%=map.get(1).get("FOUNDENDMONEY")%>원</strong></span>
        </div>
      </div>
      <div class="causes-content">
        <h3><a onclick="onClick(4)"><%=map.get(1).get("COMMENTS") %></a></h3>
        <p><%=map.get(1).get("ADDRESS") %><br><%=calDateDays[1]%>일 남음</p>
        <a onclick="onClick(4)" class="primary-button causes-donate">후원 바로가기</a>
      </div>
    </div>
  </div>
  </form>
  <!-- /causes -->

  <!-- causes -->
  <form name ="form5" method="get" action="blog-details_fund.jsp">
  <input type="hidden" name="BDID" value=<%=map.get(2).get("BDID") %>  />
  <div class="col-md-4">
    <div class="causes">
      <div class="causes-img">
        <a onclick="onClick(5)">
            <img src="./img/index/상가3.jpg" alt="">
          </a>
      </div>
      <div class="causes-progress">
        <div class="causes-progress-bar">
          <div style="width: <%= money[2]%>%;">
            <span><%= money[2]%>%</span>
          </div>
        </div>
        <div>
          <span class="causes-raised">달성금액: <strong><%=map.get(2).get("CURRENTMONEY")%>원</strong></span>
          <span class="causes-goal">목표금액: <strong><%=map.get(2).get("FOUNDENDMONEY")%>원</strong></span>
        </div>
      </div>
      <div class="causes-content">
        <h3><a onclick="onClick(5)"><%=map.get(2).get("COMMENTS") %> </a></h3>
        <p><%=map.get(2).get("ADDRESS") %><br><%=calDateDays[2] %> 일 남음</p>
        <a onclick="onClick(5)" class="primary-button causes-donate">후원 바로가기</a>
      </div>
    </div>
  </div>
  </form>
  <!-- /causes -->

  <!-- causes -->
  <form name ="form6" method="get" action="blog-details_fund.jsp">
  <input type="hidden" name="BDID" value=<%=map.get(3).get("BDID") %>  />
  <div class="col-md-4">
    <div class="causes">
      <div class="causes-img">
        <a onclick="onClick(6)">
          <img src="./img/index/상가5.jpg" alt="">
        </a>
      </div>
      <div class="causes-progress">
        <div class="causes-progress-bar">
          <div style="width: <%= money[3]%>%;">
            <span><%= money[3]%>%</span>
          </div>
        </div>
        <div>
          <span class="causes-raised">달성금액: <strong><%=map.get(3).get("CURRENTMONEY")%>원</strong></span>
          <span class="causes-goal">목표금액: <strong><%=map.get(3).get("FOUNDENDMONEY")%>원</strong></span>
        </div>
      </div>
      <div class="causes-content">
        <h3><a onclick="onClick(6)"><%=map.get(3).get("COMMENTS") %></a></h3>
        <p><%=map.get(3).get("ADDRESS") %><br><%=calDateDays[3] %>일 남음</p>
        <a class="primary-button causes-donate" >후원 바로가기</a>
      </div>
    </div>
  </div>
  </form>
  </section>
  
  
  <!--================ Blog section end =================-->  

  <!-- ================ start footer Area ================= -->
  <footer class="footer-area">
   <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
<script>@copyright</script>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
         
  </footer>
  <!-- ================ End footer Area ================= -->

  <script src="vendors/jquery/jquery-3.2.1.min.js"></script>
  <script src="vendors/bootstrap/bootstrap.bundle.min.js"></script>
  <script src="vendors/owl-carousel/owl.carousel.min.js"></script>
  <script src="vendors/Magnific-Popup/jquery.magnific-popup.min.js"></script>
  <script src="js/jquery.ajaxchimp.min.js"></script>
  <script src="js/mail-script.js"></script>
  <script src="js/main.js"></script>
</body>
</html>