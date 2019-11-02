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
<%
//String userid = (String) session.getAttribute("userid");
UserDao a = new UserDao();

String BID = request.getParameter("BDID");

String AreaName = a.getAdd(BID);
String pic = a.getBuildingPic(BID);


double starAct = a.amp(a.getStarAct(AreaName)); 
double starStb = a.amp(a.getStarStb(AreaName));
double starGrw = a.amp(a.getStarGrw(AreaName));
double starOvp = a.amp(a.getStarOvp(AreaName));
double score = a.score(starAct, starStb, starGrw, starOvp);

String BD_INFO = a.getBdInfo(BID);
String COMT = a.getBdComt(BID);
String TITLE = a.getBdTitle(BID);
String TA_Dtl = a.getTaDetail(BID);
HashMap<Integer,HashMap<Integer,String>> voteResult = new HashMap<Integer,HashMap<Integer,String>>();
HashMap<Integer,String> vote = new HashMap<Integer,String>();

voteResult.put(1,a.vote(a.getCategory(BID)));


%>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


  <style>
.h_graph ul{margin:0 50px 0 50px;padding:1px 0 0 0;border:1px solid #ddd;border-top:0;border-right:0;font-size:11px;list-style:none}
   .h_graph li{position:relative;margin:10px 0;vertical-align:top;white-space:nowrap}
   .h_graph .g_term{position:absolute;top:0;left:-50px;width:40px;font-weight:bold;color:#767676;line-height:20px;text-align:right}
   .h_graph .g_bar{display:inline-block;position:relative;height:20px;border:1px solid #ccc;border-left:0;background:#e9e9e9}
   .h_graph .g_bar span{position:absolute;top:0;right:-50px;width:40px;color:#767676;line-height:20px}
   .star{ clear: both; background: url('img/star1.png') 0px 0px; float:left; width: 205px; height: 40px; padding: 0; }
  
  .star_act{ background: url('img/star.png')0px 0px; width: <%= starAct%>%; height: 40px; padding 0;  }
.star_stb{ background: url('img/star.png')0px 0px; width: <%= starStb%>%; height: 40px; padding 0;  }
.star_grw{ background: url('img/star.png')0px 0px; width: <%= starGrw%>%; height: 40px; padding 0;  }
.star_ovp{ background: url('img/star.png')0px 0px; width: <%= starOvp%>%; height: 40px; padding 0;  }
 
 
 #title{
   	margin-top: -35px;
   }
   
    #title_star{
margin-top: -10px;
margin-left: 70px;
}

#title_star_bottom{

}

#TA{
	margin-left: 30px;
}

.TA_dtl{
	margin-top: 10px;
	margin-left: -40px;
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
            <li class="nav-item"><a class="nav-link" href="services-2.jsp">수요조사</a>
              <li class="nav-item"><a class="nav-link" href="services-2.jsp">후원</a>
               <li class="nav-item"><a class="nav-link"href=""><img src="img/home/user.png" width="30px" height="30px"></a>
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
<!--================Blog Area =================-->
<section class="blog_area single-post-area section-margin">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 posts-list">
				<div class="single-post row">
					<div class="col-lg-12">
					<h3 id = 'title'>
							<%=TITLE %>
</h3>
<div class="feature-img">
	<img class="img-fluid" src=<%=pic %> alt="">
</div>
<div class="quotes">
	<%=COMT %>
		</div>
	</div>
<h3>투표 현황</h3>
<div class="col-lg-12">
<div class="h_graph">
       <ul>
       <li><span class="g_term"><%=voteResult.get(1).get(1) %></span><span class="g_bar" style="width:<%=voteResult.get(1).get(2) %>%"><span><%=voteResult.get(1).get(2) %>%</span></span></li>
       <li><span class="g_term"><%=voteResult.get(1).get(3) %></span><span class="g_bar" style="width:<%=voteResult.get(1).get(4) %>%"><span><%=voteResult.get(1).get(4) %>%</span></span></li>
       <li><span class="g_term"><%=voteResult.get(1).get(5) %></span><span class="g_bar" style="width:<%=voteResult.get(1).get(6) %>%"><span><%=voteResult.get(1).get(6) %>%</span></span></li>
       <li><span class="g_term"><%=voteResult.get(1).get(7) %></span><span class="g_bar" style="width:<%=voteResult.get(1).get(8) %>%"><span><%=voteResult.get(1).get(8) %>%</span></span></li>
       <li><span class="g_term"><%=voteResult.get(1).get(9) %></span><span class="g_bar" style="width:<%=voteResult.get(1).get(10) %>%"><span><%=voteResult.get(1).get(10) %>%</span></span></li>
               
           </ul>
       </div>
      </div>   
	
</div>

                  <div class="comments-area">
                      <h4>05 Comments</h4>
                      <div class="comment-list">
                          <div class="single-comment justify-content-between d-flex">
                              <div class="user justify-content-between d-flex">
                                  <div class="thumb">
                                      <img src="img/blog/gyusang.png" width="30px" height="30px" style="border-radius: 50%" alt="">
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
                                      <img src="img/blog/rubin.jpg" style="border-radius: 50%" width="30px" height="30px" alt="">
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
                                      <img src="img/blog/hajin.jpg" width="30px" height="30px" style="border-radius: 50%" alt="">
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
                                      <img src="img/blog/bono.png" width="30px" height="30px" style="border-radius: 50%" alt="">
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
                                      <img src="img/blog/minji.png" width="30px" height="30px" style="border-radius: 50%" alt="">
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
				<aside class="single_sidebar_widget search_widget">
						<div class="input-group">
							   <%@ include file= "map/map.jsp" %>
							   </div>
								
						<!-- /input-group -->
				<div class="br"></div>
		</aside>
		<aside class="single_sidebar_widget author_widget">
				

				
				
				<h4>해당 매물 상세정보</h4>
				<!-- <p>Senior blog writer </p> -->
				<div class="social_icon"> </div>
				<p><%=BD_INFO %>
									</p>
									<div class="br"></div>
									
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
							</aside>
							<aside class="single_sidebar_widget popular_post_widget">
								
									<!--업종 dropdown-->
												<div class="media post_item">
													<form action="request.jsp" method ="get">
													<input type=hidden name="bdid" value=<%=BID%>>
														<select id = 'pp' name = "TOOPYO"> 
														<option value=""  select=selected>업종선택</option>
														<optgroup label="휴게음식점(카페,제과)">
															<option value="커피">커피</option>
															<option value="베이커리">베이커리</option>
															<option value="아이스크림">아이스크림</option>
														</optgroup>
														<optgroup label="일반음식점">
															<option value="한식">한식</option>
															<option value="양식">양식</option>
															<option value="중식">중식</option>
															<option value="일식">일식</option>
															<option value="분식">분식</option>
															<option value="베트남 음식">베트남 음식</option>
															<option value="고기집">고기집</option>
															<option value="치킨">치킨</option>
															<option value="피자">피자</option>
															<option value="햄버거">햄버거</option>
															<option value="야식메뉴">야식메뉴</option>					
														</optgroup>
														<optgroup label="로드샵">
															<option value="편의점">편의점</option>
															<option value="화장품">화장품</option>
															<option value="악세사리">악세사리</option>
															<option value="핸드폰 가맹점">핸드폰 가맹점</option>			
														</optgroup>
														<optgroup label="여가시설">
															<option value="헬스장">헬스장</option>			
															<option value="요가">요가</option>			
															<option value="당구장">당구장</option>			
															<option value="스크린골프">스크린골프</option>			
															<option value="마사지">마사지</option>			
															<option value="네일샵">네일샵</option>			
															<option value="피시방">피시방</option>			
															<option value="노래방">노래방</option>						
														</optgroup>
														<optgroup label="숙박시설">
															<option value="호텔">호텔</option>
															<option value="모텔">모텔</option>
														</optgroup>
													</select>
													<br>
													<br>
													
													<select>
														<option value=""  select=selected>리워드선택</option>
														<option value="무료쿠폰">무료쿠폰</option>
														<option value="굿즈">굿즈</option>
														<option value="할인카드">할인카드</option>
														<option value="포인트카드">포인트카드</option>
														
													</select>
													<br>
													<br>
												
														<input type="submit" class="widget_title" value = '수요조사 참여하기'>
														<br>
													</form>
													
												</div>
												
												<div class="media post_item">
												
											
											</div>
											
											
											<div class="br"></div>
																					
											<!--  <div class="media post_item">
												<input type="submit" value="투표하기">
												<input type="button" value="창업신청하기">
											</div>-->
											</form>

										</aside>							

										
										<aside class="single_sidebar_widget ads_widget">
												<a href="#">
														<img class="img-fluid" src="img/blog/add.jpg" alt="">
												</a>
												<div class="br"></div>
										</aside>
										</div>
						</div>
				</div>
		</div>
</section>
<!--================Blog Area =================-->


</body>
</html>