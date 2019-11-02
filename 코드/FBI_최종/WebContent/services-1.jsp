<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
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
  <title>FBI - SERVICE 1</title>
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
<%
	UserDao userdao = new UserDao();

	int TB = userdao.getTotalBd();
	int TM = userdao.getTotalMoney();
	
	String TM2 = Integer.toString(TM);
	String STM = userdao.comma(TM2);

	HashMap<Integer,HashMap<String,String>> map = userdao.getXY(3);
	
	
	for(int i = 1;i<=map.size();i++) {
		System.out.println(map.get(i));
	}
	
	SimpleDateFormat dt = new SimpleDateFormat("yyyyy-MM-dd hh:mm:ss"); 
	Calendar cal = Calendar.getInstance();
	
	int money[] = new int[7];
	String startDate[] = new String[7];
	String endDate[] = new String[7];
	
	Date startD[] = new Date[7];
	Date startE[] = new Date[7];
	
	long calDate[] = new long[7];
	long calDateDays[] = new long[7];
	
	
	for(int i = 1; i<=6;i++){
		double moneyA =Integer.parseInt(map.get(i).get("CURRENTMONEY"));
		double moneyB =Integer.parseInt(map.get(i).get("FOUNDENDMONEY")); 
		money[i] = (int)((moneyA/moneyB)*100);
		
		startDate[i] =	map.get(i).get("STARTDATE");
		endDate[i] = map.get(i).get("ENDDATE");
		
		startD[i] = dt.parse(startDate[i]);
		startE[i] = dt.parse(endDate[i]);
		
		calDate[i] = startE[i].getTime() - startD[i].getTime();
		calDateDays[i] = calDate[i] / ( 24*60*60*1000);
		calDateDays[i] = Math.abs(calDateDays[i]);

	} 
	
	HashMap<Integer,HashMap<Integer,String>> voteResult = new HashMap<Integer,HashMap<Integer,String>>();
	HashMap<Integer,String> vote = new HashMap<Integer,String>();
	
	 for(int i = 1 ; i<=map.size();i++){
		voteResult.put(i, userdao.vote(userdao.getCategory(map.get(i).get("BDID"))));
	} 


%>
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

  <!--================ Hero sm Banner start =================-->      
  <section class="hero-banner hero-banner--sm">
    <div class="hero-banner__content text-center">
      <h1>BE A KB PRODUCER</h1>
      <nav aria-label="breadcrumb" class="banner-breadcrumb">
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="#">홈</a></li>
          <li class="breadcrumb-item active" aria-current="page">수요조사 진행중</li>
        </ol>
      </nav>
    </div>
  </section>
  <!--================ Hero sm Banner end =================-->

      


      <!-- ABOUT -->
  <div id="about" class="section">
    <!-- container -->
    <div class="container">
      <!-- row -->
      <div class="row">
        <!-- about content -->
        <div class="col-md-5">
          <div class="section-title">
            <h2 class="title">동네 상권 만들기</h2>
            <p class="sub-title">'여기는 항상 망하네..' </p>
          </div>
          <div class="about-content">
            <p>그런 생각 해보셨나요?<br>
            여기 이 가게는 왜 들어오는 것마다 망할까?<br>
            여기는 이거보단 다른 품목이 어울릴 것 같은데..<br>
            그렇다면 이 플랫폼을 이용해보세요.<br>
            내 가게에 필요한 상권을 직접 꾸려보세요!</p>
          
          </div>
        </div>
        <!-- /about content -->

        <!-- about video -->
        <div class="col-md-offset-1 col-md-6">
          <a href="#" class="about-video">
              <i class="play-icon fa fa-play"></i>
              <img src="./img/index/about.jpg" alt="">
            </a>
        </div>
        <!-- /about video -->
      </div>
      <!-- /row -->
    </div>
    <!-- /container -->
  </div>
  <!-- /ABOUT -->

  <!-- NUMBERS -->
  <div id="numbers" class="section">
    <!-- container -->
    <div class="container">
      <!-- row -->
      <div class="row">
        <!-- number -->
        <div class="col-md-3 col-sm-6">
          <div class="number">
            <div class="icon">
              <img src="img/home/donator.png" width="50" height="50">
            </div>
            <h3>8,400</h3>
            <span>오늘의 후원자</span>
          </div>
        </div>
        <!-- /number -->

        <!-- number -->
        <div class="col-md-3 col-sm-6">
          <div class="number">
            <img src="img/home/money.png" width="50" height="50">
            <h3>1,000,000</h3>
            <span>현재 후원금</span>
          </div>
        </div>
        <!-- /number -->

        <!-- number -->
        <div class="col-md-3 col-sm-6">
          <div class="number">
            <img src="img/home/store.png" width="50" height="50">
            <h3>25</h3>
            <span>신규 매물</span>
          </div>
        </div>
        <!-- /number -->

        <!-- number -->
        <div class="col-md-3 col-sm-6">
          <div class="number">
            <img src="img/home/connection.png" width="50" height="50">
            <h3>32</h3>
            <span>오늘의 창업자 매칭</span>
          </div>
        </div>
        <!-- /number -->
      </div>
      <!-- /row -->
    </div>
    <!-- /container -->
  </div>
  <!-- /NUMBERS -->

  <!-- CAUSESS -->
  <div id="causes" class="section">
    <!-- container -->
    <div class="container">
      <!-- row -->
      <div class="row">

        <!-- section title -->
        <div id="now">
          <div class="section-title text-center">
            
            <p class="sub-title">&nbsp;&nbsp;"실시간 수요조사"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
          </div>
        </div>

        <a href="" id="whole"> <u>전체보기</u> </a>
        <!-- section title -->

        <!-- causes -->
        <div class="col-md-4">
        <form name ="form1" method="get" action="blog-details_vote.jsp">
        <input type="hidden" name="BDID" value=<%=map.get(1).get("BDID") %>  />
          <div class="causes">
            <div class="causes-img">
              <a onclick="onClick(1)"">
                  <img src="./img/index/상가4.jpg" alt="">
                </a>
            </div>
            <div class="causes-progress">
              <div class="causes-progress-bar">
                <div style="width: <%=voteResult.get(1).get(2) %>%;">
                  <span><%=voteResult.get(1).get(2) %>%</span>
                </div>
              </div>
              <div>
                <span class="causes-raised">현재 1위: <strong><%=voteResult.get(1).get(1) %></strong></span>
              </div>
            </div>
            <div class="causes-content">
              <h3><a onclick="onClick(1)"><%=map.get(1).get("COMMENTS") %></a></h3>
              <p><%=map.get(1).get("ADDRESS") %></p>
              <a onclick="onClick(1)" class="primary-button causes-donate">수요조사 바로가기</a>
            </div>
          </div>
          </form>
        </div>
        <!-- /causes -->

        <!-- causes -->
        <div class="col-md-4">
        <form name ="form2" method="get" action="blog-details_vote.jsp">
        <input type="hidden" name="BDID" value=<%=map.get(2).get("BDID") %>  />
          <div class="causes">
            <div class="causes-img">
              <a onclick="onClick(2)">
                  <img src="./img/index/상가3.jpg" alt="">
                </a>
            </div>
            <div class="causes-progress">
              <div class="causes-progress-bar">
                <div style="width: <%=voteResult.get(2).get(2) %>%;">
                  <span><%=voteResult.get(2).get(2) %>%</span>
                </div>
              </div>
              <div>
                <span class="causes-raised">현재 1위: <strong><%=voteResult.get(2).get(1) %></strong></span>
              </div>
            </div>
            <div class="causes-content">
              <h3><a onclick="onClick(2)"><%=map.get(2).get("COMMENTS") %></a></h3>
              <p><%=map.get(2).get("ADDRESS") %></p>
              <a onclick="onClick(2)" class="primary-button causes-donate">수요조사 바로가기</a>
            </div>
          </div>
          </form>
        </div>
        <!-- /causes -->

        <!-- causes -->
        <div class="col-md-4">
        <form name ="form3" method="get" action="blog-details_vote.jsp">
        <input type="hidden" name="BDID" value=<%=map.get(3).get("BDID") %>  />
          <div class="causes">
            <div class="causes-img">
              <a onclick="onClick(3)">
                <img src="./img/index/상가5.jpg" alt="">
              </a>
            </div>
            <div class="causes-progress">
              <div class="causes-progress-bar">
                <div style="width: <%=voteResult.get(3).get(2) %>%;">
                  <span><%=voteResult.get(3).get(2) %>%</span>
                </div>
              </div>
              <div>
                <span class="causes-raised">현재 1위: <strong><%=voteResult.get(3).get(1) %></strong></span>
              </div>
            </div>
            <div class="causes-content">
              <h3><a onclick="onClick(3)"><%=map.get(3).get("COMMENTS") %></a></h3>
              <p><%=map.get(3).get("ADDRESS") %></p>
              <a onclick="onClick(3)" class="primary-button causes-donate">수요조사 바로가기</a>
            </div>
          </div>
          </form>
        </div>
        <!-- /causes -->

        <div class="clearfix visible-md visible-lg"></div>

        <!-- causes -->
        <div class="col-md-4">
        <form name ="form4" method="get" action="blog-details_vote.jsp">
        <input type="hidden" name="BDID" value=<%=map.get(4).get("BDID") %>  />
          <div class="causes">
            <div class="causes-img">
              <a onclick="onClick(4)">
                <img src="./img/index/상가6.jpg" alt="">
              </a>
            </div>
            <div class="causes-progress">
              <div class="causes-progress-bar">
                <div style="width: <%=voteResult.get(4).get(2) %>%;">
                  <span><%=voteResult.get(4).get(2) %>%</span>
                </div>
              </div>
              <div>
                <span class="causes-raised">현재 1위: <strong><%=voteResult.get(4).get(1) %></strong></span>
              </div>
            </div>
            <div class="causes-content">
              <h3><a onclick="onClick(4)"><%=map.get(4).get("COMMENTS") %></a></h3>
              <p><%=map.get(4).get("ADDRESS") %></p>
              <a onclick="onClick(4)" class="primary-button causes-donate">수요조사 바로가기</a>
            </div>
          </div>
          </form>
        </div>
        <!-- /causes -->

        <!-- causes -->
        <div class="col-md-4">
        <form name ="form5" method="get" action="blog-details_vote.jsp">
        <input type="hidden" name="BDID" value=<%=map.get(5).get("BDID") %>  />
          <div class="causes">
            <div class="causes-img">
              <a onclick="onClick(5)">
                <img src="./img/index/상가7.jpg" alt="">
              </a>
            </div>
            <div class="causes-progress">
              <div class="causes-progress-bar">
                <div style="width: <%=voteResult.get(5).get(2) %>%;">
                  <span><%=voteResult.get(5).get(2) %>%</span>
                </div>
              </div>
              <div>
                <span class="causes-raised">현재 1위: <strong><%=voteResult.get(5).get(1) %></strong></span>
              </div>
            </div>
            <div class="causes-content">
              <h3><a onclick="onClick(5)"><%=map.get(5).get("COMMENTS") %></a></h3>
              <p><%=map.get(5).get("ADDRESS") %></p>
              <a onclick="onClick(5)" class="primary-button causes-donate">수요조사 바로가기</a>
            </div>
          </div>
          </form>
        </div>
        <!-- /causes -->

        <!-- causes -->
        <div class="col-md-4">
        <form name ="form6" method="get" action="blog-details_vote.jsp">
        <input type="hidden" name="BDID" value=<%=map.get(6).get("BDID") %>  />
          <div class="causes">
            <div class="causes-img">
              <a onclick="onClick(6)">
                <img src="./img/index/상가3.jpg" alt="">
              </a>
            </div>
            <div class="causes-progress">
              <div class="causes-progress-bar">
                <div style="width: <%=voteResult.get(6).get(2) %>%;">
                  <span><%=voteResult.get(6).get(2) %>%</span>
                </div>
              </div>
              <div>
                <span class="causes-raised">현재 1위: <strong><%=voteResult.get(6).get(1) %></strong></span>
              </div>
            </div>
            <div class="causes-content">
              <h3><a onclick="onClick(6)"><%=map.get(6).get("COMMENTS") %></a></h3>
              <p><%=map.get(6).get("ADDRESS") %></p>
              <a onclick="onClick(6)" class="primary-button causes-donate">수요조사 바로가기</a>
            </div>
          </div>
          </form>
        </div>
        <!-- /causes -->

        

      </div>
      <!-- /row -->
    </div>
    <!-- /container -->
  </div>
  <!-- /CAUSESS -->

  


  <!-- EVENTS -->
  <div id="events" class="section">
    <!-- container -->
    <div class="container">
      <!-- row -->
      <div class="row">
        <!-- section title -->
        <div class="col-md-8 col-md-offset-2">
          <div class="section-title text-center">
            <h2 class="title">【 Upcoming Matchings 】</h2>
          </div>
        </div>
        <!-- /section title -->

        <!-- event -->
        <div class="col-md-6">
          <div class="event">
            <div class="event-img">
              <a href="single-event.jsp">
                <img src="./img/index/상가3.jpg" alt="">
              </a>
            </div>
            <div class="event-content">
              <h3><a href="single-event.jsp">꿈을 담은 빵</a></h3>
              <ul class="event-meta">
                <li><i class="fa fa-clock-o"></i> 2019년 6월 30일 후원 시작!</li>
                <li><i class="fa fa-map-marker"></i> 서울특별시 종로구 교남동 송월길99</li>
              </ul>
              <p>빵집하나 없는 지역에 드디어 빵집이! 유명 호텔 출신 파티셰가 빵집 주인임ㅎㄷㄷ</p>
            </div>
          </div>
        </div>
        <!-- /event -->

        <!-- event -->
        <div class="col-md-6">
          <div class="event">
            <div class="event-img">
              <a href="single-event.jsp">
                <img src="./img/index/상가4.jpg" alt="">
              </a>
            </div>
            <div class="event-content">
              <h3><a href="single-event.jsp">Vix fuisset tibique facilisis cu. Justo accusata ius at</a></h3>
              <ul class="event-meta">
                <li><i class="fa fa-clock-o"></i> 24 October, 2018 | 8:00AM - 11:00PM</li>
                <li><i class="fa fa-map-marker"></i> 2736 Hinkle Deegan Lake Road</li>
              </ul>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
            </div>
          </div>
        </div>
        <!-- /event -->

        <div class="clearfix visible-md visible-lg"></div>

        <!-- event -->
        <div class="col-md-6">
          <div class="event">
            <div class="event-img">
              <a href="single-event.jsp">
                <img src="./img/index/상가5.jpg" alt="">
              </a>
            </div>
            <div class="event-content">
              <h3><a href="single-event.jsp">Possit nostro aeterno eu vis, ut cum quem reque</a></h3>
              <ul class="event-meta">
                <li><i class="fa fa-clock-o"></i> 24 October, 2018 | 8:00AM - 11:00PM</li>
                <li><i class="fa fa-map-marker"></i> 2736 Hinkle Deegan Lake Road</li>
              </ul>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
            </div>
          </div>
        </div>
        <!-- /event -->

        <!-- event -->
        <div class="col-md-6">
          <div class="event">
            <div class="event-img">
              <a href="single-event.jsp">
                <img src="./img/index/상가6.jpg" alt="">
              </a>
            </div>
            <div class="event-content">
              <h3><a href="single-event.jsp">Vix fuisset tibique facilisis cu. Justo accusata ius at</a></h3>
              <ul class="event-meta">
                <li><i class="fa fa-clock-o"></i> 24 October, 2018 | 8:00AM - 11:00PM</li>
                <li><i class="fa fa-map-marker"></i> 2736 Hinkle Deegan Lake Road</li>
              </ul>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
            </div>
          </div>
        </div>
        <!-- /event -->
      </div>
      <!-- /row -->
    </div>
    <!-- /container -->
  </div>
  <!-- /EVENTS -->

  <!-- TESTIMONIAL -->
  <div id="testimonial" class="section">
    <!-- background section -->
    <div class="section-bg" style="background-image: url(./img/index/background-3.jpg);" data-stellar-background-ratio="0.5"></div>
    <!-- /background section -->

    <!-- container -->
    <div class="container">
      <!-- row -->
      <div class="row">
        <!-- Testimonial owl -->
        <div class="col-md-12">
          <div id="testimonial-owl" class="owl-carousel owl-theme">
            <!-- testimonial -->
            <div class="testimonial">
              <div class="testimonial-meta">
                <div class="testimonial-img">
                  <img src="./img/index/avatar-1.jpg" alt="">
                </div>
                <h3>윤루빈</h3>
                <span>후원자 회원</span>
              </div>
              <div class="testimonial-quote">
                <blockquote>
                  <p>리워드 혜택으로 직접 만든 케잌도 받고 한달동안 무료 커피도 5잔이나 마심. 사장님이랑 친해져서 여기 카페만 가게 되고 진심 집 바로앞에 카페생겨서 너무좋음 </p>
                </blockquote>
              </div>
            </div>
            <!-- /testimonial -->

            <!-- testimonial -->
            <div class="testimonial">
              <div class="testimonial-meta">
                <div class="testimonial-img">
                  <img src="./img/index/avatar-2.jpg" alt="">
                </div>
                <h3>성하진</h3>
                <span>후원자 회원</span>
              </div>
              <div class="testimonial-quote">
                <blockquote>
                  <p>맨날 가던 길에 내가 후원한 빵집이 생겨서 지나갈 때마다 엄청 뿌듯하네요. 행복^^ </p>
                </blockquote>
              </div>
            </div>
            <!-- /testimonial -->

            <!-- testimonial -->
            <div class="testimonial">
              <div class="testimonial-meta">
                <div class="testimonial-img">
                  <img src="./img/index/avatar-1.jpg" alt="">
                </div>
                <h3>김민지</h3>
                <span>후원자 회원</span>
              </div>
              <div class="testimonial-quote">
                <blockquote>
                  <p>제발 학원 근처에 명랑핫도그 하나만 생기면 좋겠다고 생각했는데 KB FBI에 기가 막히게 떴다는 친구 말 듣고 후원했어요! 점심은 배불러서 간단하게 떼우는 편인데 명랑핫도그 생겨서 너무 좋습니다!!  </p>
                </blockquote>
              </div>
            </div>
            <!-- /testimonial -->

            <!-- testimonial -->
            <div class="testimonial">
              <div class="testimonial-meta">
                <div class="testimonial-img">
                  <img src="./img/index/avatar-2.jpg" alt="">
                </div>
                <h3>이원호</h3>
                <span>창업자 회원</span>
              </div>
              <div class="testimonial-quote">
                <blockquote>
                  <p>확실히 손님들이 원하는 자리에 원하는 가게가 생기다보니 초반부터 많은 관심을 받을 수 있었습니다. 창업에 있어서 초반 고객 유치가 굉장히 중요하다고 생각하는데 KB FBI 정말 감사합니다.</p>
                </blockquote>
              </div>
            </div>
            <!-- /testimonial -->
          </div>
        </div>
        <!-- /Testimonial owl -->
      </div>
      <!-- /Row -->
    </div>
    <!-- /container -->
  </div>
  <!-- /TESTIMONIAL -->

  




  <!-- ================ start footer Area ================= -->
  <footer class="footer-area">
    <div class="container">
      <div class="row">
        <div class="col-lg-3  col-md-6 col-sm-6">
          <div class="single-footer-widget">
            <h6>About Agency</h6>
            <p>
              The world has become so fast paced that people don’t want to stand by reading a page of information, they would much rather look at a presentation and understand the message. It has come to a point 
            </p>
          </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-6">
          <div class="single-footer-widget">
            <h6>Navigation Links</h6>
            <div class="row">
              <div class="col">
                <ul>
                  <li><a href="#">Home</a></li>
                  <li><a href="#">Feature</a></li>
                  <li><a href="#">Services</a></li>
                  <li><a href="#">Portfolio</a></li>
                </ul>
              </div>
              <div class="col">
                <ul>
                  <li><a href="#">Team</a></li>
                  <li><a href="#">Pricing</a></li>
                  <li><a href="#">Blog</a></li>
                  <li><a href="#">Contact</a></li>
                </ul>
              </div>										
            </div>							
          </div>
        </div>							
        <div class="col-lg-3  col-md-6 col-sm-6">
          <div class="single-footer-widget">
            <h6>Newsletter</h6>
            <p>
              For business professionals caught between high OEM price and mediocre print and graphic output.									
            </p>								
            <div id="mc_embed_signup">
              <form target="_blank" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01" method="get" class="subscription relative">
                <div class="input-group d-flex flex-row">
                  <input name="EMAIL" placeholder="Email Address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email Address '" required="" type="email">
                  <button class="btn bb-btn"><span class="lnr lnr-location"></span></button>		
                </div>									
                <div class="mt-10 info"></div>
              </form>
            </div>
          </div>
        </div>
        <div class="col-lg-3  col-md-6 col-sm-6">
          <div class="single-footer-widget mail-chimp">
            <h6 class="mb-20">InstaFeed</h6>
            <ul class="instafeed d-flex flex-wrap">
              <li><img src="img/instagram/i1.jpg" alt=""></li>
              <li><img src="img/instagram/i2.jpg" alt=""></li>
              <li><img src="img/instagram/i3.jpg" alt=""></li>
              <li><img src="img/instagram/i4.jpg" alt=""></li>
              <li><img src="img/instagram/i5.jpg" alt=""></li>
              <li><img src="img/instagram/i6.jpg" alt=""></li>
              <li><img src="img/instagram/i7.jpg" alt=""></li>
              <li><img src="img/instagram/i8.jpg" alt=""></li>
            </ul>
          </div>
        </div>						
      </div>
    </div>
    <div class="footer-bottom">
      <div class="container">
        <div class="row align-items-center">
          <p class="col-lg-8 col-sm-12 footer-text m-0 text-center text-lg-left">

<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
          <div class="col-lg-4 col-sm-12 footer-social text-center text-lg-right">
            <a href="#"><i class="fab fa-facebook-f"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-dribbble"></i></a>
            <a href="#"><i class="fab fa-behance"></i></a>
          </div>
        </div>
      </div>
    </div>
  </footer>
  <!-- ================ End footer Area ================= -->

  <script src="vendors/jquery/jquery-3.2.1.min.js"></script>
  <script src="vendors/bootstrap/bootstrap.bundle.min.js"></script>
  <script src="vendors/owl-carousel/owl.carousel.min.js"></script>
  <script src="vendors/Magnific-Popup/jquery.magnific-popup.min.js"></script>
  <script src="js/jquery.ajaxchimp.min.js"></script>
  <script src="js/mail-script.js"></script>
  <script src="js/main.js"></script>

  <!-- jQuery Plugins -->
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/main1.js"></script>

</body>
</html>