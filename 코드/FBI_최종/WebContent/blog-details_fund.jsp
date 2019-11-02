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
<%!
public double amp(double a){
   return a+(a-50)*10;
}

%>
<%

UserDao a = new UserDao();
UserDao userdao = new UserDao();

String BID = request.getParameter("BDID");
//String BID = "KBM003653";
String AreaName = a.getAdd(BID);
double starAct = amp(a.getStarAct(AreaName)); //숫자 대신 마켓아이디
double starStb = amp(a.getStarStb(AreaName));
double starGrw = amp(a.getStarGrw(AreaName));
double starOvp = amp(a.getStarOvp(AreaName));
String pic = a.getBuildingPic(BID);

String BD_INFO = a.getBdInfo(BID);
String COMT = a.getBdComt(BID);
String TITLE = a.getBdTitle(BID);
String TA_Dtl = a.getTaDetail(BID);
String VOTE_DETAIL = a.getVoteDtl(BID);

String detail1 = a.getServiceDtl(BID,1);
String detail2 = a.getServiceDtl(BID,2);

HashMap<Integer,HashMap<Integer,String>> voteResult = new HashMap<Integer,HashMap<Integer,String>>();
HashMap<Integer,String> vote = new HashMap<Integer,String>();


voteResult.put(1,userdao.vote(userdao.getCategory(BID)));


%>
<style type="text/css">

#V_DTL{
	margin-top: 30px;
	margin-left:30px;
}

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

.pic2{
  margin-left: 20px;
}

#pic1{
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
	margin-top: 30px;
  margin-left: 30px;
}

#scroll{
    width: 350px;
    height: 120px;
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
	padding-top: 50px;
	margin-left: 70px;
}

#title_star_bottom{

}

#TA{
	margin-left: 30px;
}

.TA_dtl{
	margin-top: 10px;
	margin-left: 75px;
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
                 <li class="nav-item"><a class="nav-link"href="myPage.jsp"><img src="img/home/user.png" width="30px" height="30px"></a>
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
                              <img id= 'pic1' src="img/vote_detail/voteRating.PNG" alt="">
                          </div>

<!--                               <div class="col-6">
                                  <img class="img-fluid" src="img/blog/post-img2.jpg" alt="">
                              </div> -->
                              <div class="col-lg-12 mt-4">
                                  <p id='V_DTL'>
                                    <%=VOTE_DETAIL %>  
                                  </p>
                       
                              </div>
                          </div>
                      </div>

                      </div>
                  <div class="navigation-area">
                      <div class="row">

                         
                      </div>
                      <div class="col-lg-12">
                       <div class="row">
                             <div>
                               <h3 id = 'result1'>서비스 소개 </h4>
                              <img class= 'pic2' src="<%=detail1 %>" alt="" width=700px;>
                              <br>
                              <br>
                              <br>
                           
                              <img class= 'pic2' src="<%=detail2 %>" alt="" width=700px;>
                          </div>

                              <div class="col-lg-12 mt-4">
                                  <p class = "s_text">
                                      
                                  </p>
                                 <br>
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
                                      <img src="img/blog/gyusang.png" width="50px" height="50px" style="border-radius: 50%" alt="">
                                  </div>
                                  <div class="desc">
                                      <h5>
                                          <a href="#">Q3333</a>
                                      </h5>
                                      <p class="date">2019년 6월 30일 오전 6시 52분</p>
                                      <p class="comment">
                                          동네에 비어있는 가게가 많았는데 KB FBI덕분인지는 모르겠지만 확실히 요새들어 줄어든 느낌인 것 같아요. 
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
                                      <img src="img/blog/rubin.jpg" style="border-radius: 50%" width="50px" height="50px" alt="">
                                  </div>
                                  <div class="desc">
                                      <h5>
                                          <a href="#">RubinYoon</a>
                                      </h5>
                                      <p class="date">2019년 6월 30일 오전 6시 43분</p>
                                      <p class="comment">
                                          상권분석 서비스 진짜 신기해요! 내가 생각했던 느낌이랑 딱 맞게 나옴!ㅋㅋ
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
                                      <img src="img/blog/hajin.jpg" width="50px" height="50px" style="border-radius: 50%" alt="">
                                  </div>
                                  <div class="desc">
                                      <h5>
                                          <a href="#">downer92</a>
                                      </h5>
                                      <p class="date">2019년 6월 30일 오전 7시 24분 </p>
                                      <p class="comment">
                                         적은 돈으로 편리함을 사는 기분ㅋㅋ 주변에 또 마음에 드는 매물 있으면 바로 참여하려구요!
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
                                      <img src="img/blog/bono.png" width="50px" height="50px" style="border-radius: 50%" alt="">
                                  </div>
                                  <div class="desc">
                                      <h5>
                                          <a href="#">bonobono</a>
                                      </h5>
                                      <p class="date">2019년 6월 30일 오전 7시 30분 </p>
                                      <p class="comment">
                                            제가 후원한 가게가 동네에 생긴다고 생각하니 감회가 새롭네요ㅎㅎ 지나다닐 때마다 신기할 것 같아요~
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
                                      <img src="img/blog/minji.png" width="50px" height="50px" style="border-radius: 50%" alt="">
                                  </div>
                                  <div class="desc">
                                      <h5>
                                          <a href="#">minzykim</a>
                                      </h5>
                                      <p class="date">2019년 6월 30일 오전 6시 58분</p>
                                      <p class="comment">
                                           리워드도 훌륭하고 나만 가는 단골가게가 생긴 것 같아서 진짜 좋음. 안해 본 사람들 진짜 강추
                                      </p>
                                  </div>
                              </div>
                              <div class="reply-btn">
                                  <a href="#" class="btn-reply text-uppercase">reply</a>
                              </div>
                          </div>
                          
                          <div class="comment-form">
                      <h4>댓글 남기기</h4>
                      <form>
                          <div class="form-group form-inline">
                              <div class="form-group col-lg-6 col-md-6 name">
                                  <input type="text" class="form-control" id="name" placeholder="이름" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Name'">
                              </div>
                              <div class="form-group col-lg-6 col-md-6 email">
                                  <input type="email" class="form-control" id="email" placeholder="이메일" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter email address'">
                              </div>
                          </div>
                          <div class="form-group">
                              <input type="text" class="form-control" id="subject" placeholder="주제" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Subject'">
                          </div>
                          <div class="form-group">
                              <textarea class="form-control mb-10" rows="5" name="message" placeholder="메세지" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Messege'"
                                  required=""></textarea>
                          </div>
                          <a href="#" class="button button-postComment">댓글 작성</a>
                      </form>
                  </div>    
                      </div>
                  </div>

                         


                  

              </div>
              <div class="col-lg-4">
                  <div class="blog_right_sidebar">
                       
                       <!-- <img class="author_img" src="img/vote_detail/graph.PNG" alt="" width = 280px;>
                        -->
                        <div class="input-group">
							   <%@ include file= "map/map.jsp" %>
							
							   </div>
                        
                <div id = 'TA' class="row">
					<h3 id = 'title_star'>상권 분석</h3>
					<div class="col-lg-12">
						<br>
						<div class="star"><p class="star_act"></p></div>
						 <br><br><p class = 'TA_dtl'> 활성도 </p><br>
						 <div class="star"><p class="star_ovp"></p></div> <br>
						<br><p class = 'TA_dtl'> 과밀도 </p><br>
						<div class="star"><p class="star_stb"></p></div> <br>
						<br><p class = 'TA_dtl'> 안정성 </p><br>
						<div class="star"><p class="star_grw"></p></div> <br>
						<br><p class = 'TA_dtl'> 성장성 </p><br>
						
							
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