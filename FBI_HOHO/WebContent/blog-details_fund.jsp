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
<%
UserDao a = new UserDao();

String BID = request.getParameter("BDID");
//String BID = "KBM003657";
String AreaName = a.getAdd(BID);
String pic = a.getBuildingPic(BID);
double starAct = a.getStarAct(AreaName); //숫자 대신 마켓아이디
double starStb = a.getStarStb(AreaName);
double starGrw = a.getStarGrw(AreaName);
double starOvp = a.getStarOvp(AreaName);
String BD_INFO = a.getBdInfo(BID);
String COMT = a.getBdComt(BID);
String TITLE = a.getBdTitle(BID);
String TA_Dtl = a.getTaDetail(BID);
%>
<style type="text/css">

#sec1{
  margin-bottom: -20px;
}

#logo{
  margin-bottom: -30px;
 /* margin-top: -30px;*/
}
.nav-item{
  margin-top: 30px;
}
#sec2{
  margin-top: 50px; 
}

#pic2{
  margin-left: 100px;
}

#result1{
  margin-left: 50px;
  margin-top: 30px;
  margin-bottom: 20px;
}

#BHC{
  margin-left: 300px
}

#bhc2{
  text-align: 
}
.s_text{
  margin-left: 30px;
}

#scroll{
    width: 350px;
    height: 450px;
    float: right;
    margin-top: 30px;
    border: Solid 1px #eeeeee;
    background: #fafaff;
    position : sticky;
    top :100px;
  }



#box{
    width: 150px;
  height: 100px;
  border: solid 1px #eeeeee;
  padding-top: 20px;
  margin-top: 30px;
  margin-left: 100px;
  text-align: center;
}

.cfun{
  margin-left: 110px;
}

#fun{
  margin-top: 30px;
  width: 200px;
  height: 50px;
  color: white;
  background: skyblue;
  margin-left: 75px;

}

 .star{
clear: both; 
 background: url('img/star1.png') 0px 0px;
  float:left; 
  width: 205px;
   height: 40px;
    padding: 0;
     }
    .star_act{ background: url('img/star.png')0px 0px; width: <%= starAct%>%; height: 40px; padding 0;  }
    .star_stb{ background: url('img/star.png')0px 0px; width: <%= starStb%>%; height: 40px; padding 0;  }
    .star_grw{ background: url('img/star.png')0px 0px; width: <%= starGrw%>%; height: 40px; padding 0;  }
    .star_ovp{ background: url('img/star.png')0px 0px; width: <%= starOvp%>%; height: 40px; padding 0;  }
  


#title_star{
	margin-top: -10px;
	margin-left: 80px;
}

#title_star_bottom{

}

</style>

</head>
<body>

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
          <a class="navbar-brand logo_h" href="index.html"><img src="img/lg1.png" width="140" height="60" alt=""></a>
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
<hr>



 <!--================Blog Area =================-->
  <section id = 'sec2' class="blog_area single-post-area section-margin">
      <div class="container">
          <div class="row">
              <div class="col-lg-8 posts-list">
                  <div class="single-post row">
                      <div class="col-lg-12">
                          <div class="feature-img">
                              <img class="img-fluid" src="<%=pic %>" alt="">
                          </div>
                      </div>
                      <div class="col-lg-3  col-md-3">
                          <div class="blog_info text-left">
                              <div class="post_tag">
                                   [ 매물 기본 정보 ]
                              </div>
                              <ul class="blog_meta list">
             					<p> <%=BD_INFO %></p>
                              </ul>
                              <ul class="social-links">
                                  <li>
                                      <a href="#">
                                          <i class="fab fa-facebook-f"></i>
                                      </a>
                                  </li>
                                  <li>
                                      <a href="#">
                                        <i class="fab fa-twitter"></i>                                        
                                      </a>
                                  </li>
                                  <li>
                                      <a href="#">
                                        <i class="fab fa-github"></i>                                       
                                      </a>
                                  </li>
                                  <li>
                                      <a href="#">
                                        <i class="fab fa-behance"></i>                                        
                                      </a>
                                  </li>
                              </ul>
                          </div>
                      </div>
                      <div class="col-lg-9 col-md-9 blog_details">
                          <h2><%=TITLE %></h2>
                          <p class="excert">
                            <%=COMT %>
                          </p>
                          <p>
                             <!--  나눠서 쓸 경우 -->
                          </p>
                        
                      </div>
                      <div class="col-lg-12">
                          <div class="quotes">
                              <!-- 이거는 밑에 설명  --> 
                          </div>
                          <div class="row">
                             <div >
                               <h4 id = 'result1'>수요조사 결과</h4>
                              <img id= 'pic2' src="img/vote_detail/voteRating.PNG" alt="">
                          </div>

<!--                               <div class="col-6">
                                  <img class="img-fluid" src="img/blog/post-img2.jpg" alt="">
                              </div> -->
                              <div class="col-lg-12 mt-4">
                                  <p>
                                      수요조사 결과 ㅁㄴㅇㅁㄴㅇ 가 ㅁㄴㅇㅁ ㄴㅇㅁ
                                      ㅁㄴㅇㄴㅇㅁㄴ 

                                      둘다 화면에서 HTML의 요소를 보여주거나 숨기는 기능을 합니다.
                                      차이점은 숨기는 기능을 하는 hidden , none을 주었을 때
                                      visibility는 영역은 살아있으나 안보이는 것뿐이고 display는 영역 자체가 사라집니다.
                                      visibility: visible, hidden;
                                      display의 속성은
                                      display: none, inline, block, inline-block ; 가 있습니다.
                                  </p>
                                  <p>
                                      수요조사 결과2 ㅁㄴㅇㅁㄴㅇ 가 ㅁㄴㅇㅁ ㄴㅇㅁ
                                      ㅁㄴㅇㄴㅇㅁㄴ 

                                      둘다 화면에서 HTML의 요소를 보여주거나 숨기는 기능을 합니다.
                                      차이점은 숨기는 기능을 하는 hidden , none을 주었을 때
                                      visibility는 영역은 살아있으나 안보이는 것뿐이고 display는 영역 자체가 사라집니다.
                                      visibility: visible, hidden;
                                      display의 속성은
                                      display: none, inline, block, inline-block ; 가 있습니다.
                                  </p>
                              </div>
                          </div>
                      </div>

                      </div>
                  <div class="navigation-area">
                      <div class="row">

                          <div class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center" id = "BHC">
                              <div class="detials" >
                                  <p>매칭 창업자 상세보기</p>                              
                                      <h4 id = 'bhc2'>BHC</h4>
                              </div>
                              <div class="arrow">
                                  <a href="#">
                                      <span class="lnr text-white lnr-arrow-right"></span>
                                  </a>
                              </div>
                              <div class="thumb">
                                  <a href="#">
                                      <img class="img-fluid" src="img/vote_detail/chicken.PNG" alt="" width = 70px; height = 100px>
                                  </a>
                              </div>
                          </div>
                      </div>
                      <div class="col-lg-12">
                          <div class="quotes">
                              이거는 밑에 설명 
                          </div>





                          <div class="row">
                             <div>
                               <h3 id = 'result1'>서비스 소개 </h4>
                              <img id= 'pic2' src="img/vote_detail/vedioEx.PNG" alt="">
                              <br>
                              <br>
                              <br>
                           
                              <img id= 'pic2' src="img/vote_detail/service_detail.PNG" alt="" width=600px;>
                          </div>

                              <div class="col-lg-12 mt-4">
                                  <p class = "s_text">
                                      수요조사 결과 ㅁㄴㅇㅁㄴㅇ 가 ㅁㄴㅇㅁ ㄴㅇㅁ
                                      ㅁㄴㅇㄴㅇㅁㄴ 

                                      둘다 화면에서 HTML의 요소를 보여주거나 숨기는 기능을 합니다.
                                      차이점은 숨기는 기능을 하는 hidden , none을 주었을 때
                                      visibility는 영역은 살아있으나 안보이는 것뿐이고 display는 영역 자체가 사라집니다.
                                      visibility: visible, hidden;
                                      display의 속성은
                                      display: none, inline, block, inline-block ; 가 있습니다.
                                  </p>
                                  <p class = "s_text">
                                      수요조사 결과2 ㅁㄴㅇㅁㄴㅇ 가 ㅁㄴㅇㅁ ㄴㅇㅁ
                                      ㅁㄴㅇㄴㅇㅁㄴ 

                                      둘다 화면에서 HTML의 요소를 보여주거나 숨기는 기능을 합니다.
                                      차이점은 숨기는 기능을 하는 hidden , none을 주었을 때
                                      visibility는 영역은 살아있으나 안보이는 것뿐이고 display는 영역 자체가 사라집니다.
                                      visibility: visible, hidden;
                                      display의 속성은
                                      display: none, inline, block, inline-block ; 가 있습니다.
                                  </p>
                              </div>
                          </div>
                      </div>


                  




                  </div>
                  <hr>

                  <div class="comments-area">
                      <h4>05 Comments</h4>
                      <div class="comment-list">
                          <div class="single-comment justify-content-between d-flex">
                              <div class="user justify-content-between d-flex">
                                  <div class="thumb">
                                      <img src="img/blog/c1.jpg" alt="">
                                  </div>
                                  <div class="desc">
                                      <h5>
                                          <a href="#">Emilly Blunt</a>
                                      </h5>
                                      <p class="date">December 4, 2017 at 3:12 pm </p>
                                      <p class="comment">
                                          Never say goodbye till the end comes!
                                      </p>
                                  </div>
                              </div>
                              <div class="reply-btn">
                                  <a href="#" class="btn-reply text-uppercase">reply</a>
                              </div>
                          </div>
                      </div>
                      <div class="comment-list left-padding">
                          <div class="single-comment justify-content-between d-flex">
                              <div class="user justify-content-between d-flex">
                                  <div class="thumb">
                                      <img src="img/blog/c2.jpg" alt="">
                                  </div>
                                  <div class="desc">
                                      <h5>
                                          <a href="#">Elsie Cunningham</a>
                                      </h5>
                                      <p class="date">December 4, 2017 at 3:12 pm </p>
                                      <p class="comment">
                                          Never say goodbye till the end comes!
                                      </p>
                                  </div>
                              </div>
                              <div class="reply-btn">
                                  <a href="#" class="btn-reply text-uppercase">reply</a>
                              </div>
                          </div>
                      </div>
                      <div class="comment-list left-padding">
                          <div class="single-comment justify-content-between d-flex">
                              <div class="user justify-content-between d-flex">
                                  <div class="thumb">
                                      <img src="img/blog/c3.jpg" alt="">
                                  </div>
                                  <div class="desc">
                                      <h5>
                                          <a href="#">Annie Stephens</a>
                                      </h5>
                                      <p class="date">December 4, 2017 at 3:12 pm </p>
                                      <p class="comment">
                                          Never say goodbye till the end comes!
                                      </p>
                                  </div>
                              </div>
                              <div class="reply-btn">
                                  <a href="#" class="btn-reply text-uppercase">reply</a>
                              </div>
                          </div>
                      </div>
                      <div class="comment-list">
                          <div class="single-comment justify-content-between d-flex">
                              <div class="user justify-content-between d-flex">
                                  <div class="thumb">
                                      <img src="img/blog/c4.jpg" alt="">
                                  </div>
                                  <div class="desc">
                                      <h5>
                                          <a href="#">Maria Luna</a>
                                      </h5>
                                      <p class="date">December 4, 2017 at 3:12 pm </p>
                                      <p class="comment">
                                          Never say goodbye till the end comes!
                                      </p>
                                  </div>
                              </div>
                              <div class="reply-btn">
                                  <a href="#" class="btn-reply text-uppercase">reply</a>
                              </div>
                          </div>
                      </div>
                      <div class="comment-list">
                          <div class="single-comment justify-content-between d-flex">
                              <div class="user justify-content-between d-flex">
                                  <div class="thumb">
                                      <img src="img/blog/c5.jpg" alt="">
                                  </div>
                                  <div class="desc">
                                      <h5>
                                          <a href="#">Ina Hayes</a>
                                      </h5>
                                      <p class="date">December 4, 2017 at 3:12 pm </p>
                                      <p class="comment">
                                          Never say goodbye till the end comes!
                                      </p>
                                  </div>
                              </div>
                              <div class="reply-btn">
                                  <a href="#" class="btn-reply text-uppercase">reply</a>
                              </div>
                          </div>
                      </div>
                  </div>

                         


                  

              </div>
              <div class="col-lg-4">
                  <div class="blog_right_sidebar">
                       
                       <!-- <img class="author_img" src="img/vote_detail/graph.PNG" alt="" width = 280px;>
                        -->
                <div class="row">
					<h3 id = 'title_star'>상권 분석</h3>
					<div class="col-lg-12">
						
						<div class="star"><p class="star_act"></p></div>
						 <br><br>활성도<br>
						 <div class="star"><p class="star_ovp"></p></div> <br>
						<br>과밀도<br>
						<div class="star"><p class="star_stb"></p></div> <br>
						<br>안정성<br>
						<div class="star"><p class="star_grw"></p></div> <br>
						<br>성장성<br>
						
							
					</div>
					
				</div>
                         <div class="br"></div>
                          <h4 id = 'title_star_bottom'> 상권에 관한 내용 설명 </h4>
                          <p>
                            <%=TA_Dtl%>
                          </p>   
                          <hr>
                          </aside>

                          
                          
                     
                      
                  </div>
                  <scl id = 'scroll'>
                    <div id = 'box'>

                      이 부분은 이미지로 <br>
                      하는게 깔끔할듯<br>


                    </div>

                    <button class = "cfun">
                      이 조건으로 펀딩
                    </button>

                      <div id = 'box'>

                       5000원 리워드<br>
                       콜라 1병 증정<br>

                    </div>
                     <button class = "cfun">
                      이 조건으로 펀딩
                    </button>

                    <button id = "fun">
                      지금 바로 펀딩하기
                    </button>

                  </scl>


              </div>





          </div>
      </div>
  </section>



<!--   // <script src="vendors/jquery/jquery-3.2.1.min.js"></script>
  // <script src="vendors/bootstrap/bootstrap.bundle.min.js"></script>
  // <script src="vendors/owl-carousel/owl.carousel.min.js"></script>
  // <script src="vendors/Magnific-Popup/jquery.magnific-popup.min.js"></script>
  // <script src="js/jquery.ajaxchimp.min.js"></script>
  // <script src="js/mail-script.js"></script>
  // <script src="js/main.js"></script> -->

</body>
</html>