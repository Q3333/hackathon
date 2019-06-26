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
.h_graph ul{margin:0 50px 0 50px;padding:1px 0 0 0;border:1px solid #ddd;border-top:0;border-right:0;font-size:11px;list-style:none}
   .h_graph li{position:relative;margin:10px 0;vertical-align:top;white-space:nowrap}
   .h_graph .g_term{position:absolute;top:0;left:-50px;width:40px;font-weight:bold;color:#767676;line-height:20px;text-align:right}
   .h_graph .g_bar{display:inline-block;position:relative;height:20px;border:1px solid #ccc;border-left:0;background:#e9e9e9}
   .h_graph .g_bar span{position:absolute;top:0;right:-50px;width:40px;color:#767676;line-height:20px}

   .star{ clear: both; background: url('img/star1.png') 0px 0px; float:left; width: 205px; height: 40px; padding: 0; }
   .score1{ background: url('img/star.png')0px 0px; width: 70%; height: 40px; padding 0;  }
   .score2{ background: url('img/star.png')0px 0px; width: 80%; height: 40px; padding 0;  }
   .score3{ background: url('img/star.png')0px 0px; width: 78%; height: 40px; padding 0;  }
   .score4{ background: url('img/star.png')0px 0px; width: 60%; height: 40px; padding 0;  }

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
						<div class="feature-img">
							<img class="img-fluid" src="img/sale/feature-img1.jpg" alt="">
						</div>
						<div class="quotes">
							게시글 제목 자리입니다.  fontsize up 해야 할 듯 하죠?
						</div>
					</div>
				<h3>투표 현황 (틀은 잡았지만 실시간이라서 js/jquery 이용해야할듯해용)</h3>
				<div class="col-lg-12">
				<div class="h_graph">
			        <ul>
			            <li><span class="g_term">애견카페</span><span class="g_bar" style="width:56%"><span>56%</span></span></li>
        <li><span class="g_term">헬스장</span><span class="g_bar" style="width:14%"><span>14%</span></span></li>
        <li><span class="g_term">중식</span><span class="g_bar" style="width:10%"><span>10%</span></span></li>
        <li><span class="g_term">기타</span><span class="g_bar" style="width:20%"><span>20%</span></span></li>
	            
	        </ul>
	    </div>
		</div>
		
								
	<div class="col-lg-12">
		<div class="quotes">
												MCSE boot camps have its supporters and its detractors. Some people do not understand why you should have to spend money
												on boot camp when you can get the MCSE study materials yourself at a fraction of the camp
												price. However, who has the willpower to actually sit through a self-imposed MCSE training.
		</div>
	</div>
	<div class="row">
		<h3>상권 분석</h3>
		<div class="col-lg-12">

			<div class="star"><p class="score1"></p></div> 
			<div class="star"><p class="score2"></p></div> 
			<div class="star"><p class="score3"></p></div> 
			<div class="star"><p class="score4"></p></div> 
				
		</div>
		
	</div>
</div>


						<div class="navigation-area">
								<div class="row">
										<div class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
												<div class="thumb">
														<a href="#">
																<img class="img-fluid" src="img/sale/prev.jpg" alt="">
														</a>
												</div>
												<div class="arrow">
														<a href="#">
																<span class="lnr text-white lnr-arrow-left"></span>
														</a>
												</div>
												<div class="detials">
														<p>이전 매물</p>
														<a href="#">
																<h4>Space The Final Frontier</h4>
														</a>
												</div>
										</div>
										<div class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
												<div class="detials">
														<p>다음 매물</p>
														<a href="#">
																<h4>Telescopes 101</h4>
														</a>
												</div>
												<div class="arrow">
														<a href="#">
																<span class="lnr text-white lnr-arrow-right"></span>
														</a>
												</div>
												<div class="thumb">
														<a href="#">
																<img class="img-fluid" src="img/blog/next.jpg" alt="">
														</a>
												</div>
										</div>
								</div>
						</div>
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
						<div class="comment-form">
								<h4>Leave a Reply</h4>
								<form>
										<div class="form-group form-inline">
												<div class="form-group col-lg-6 col-md-6 name">
														<input type="text" class="form-control" id="name" placeholder="Enter Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Name'">
							</div>
							<div class="form-group col-lg-6 col-md-6 email">
									<input type="email" class="form-control" id="email" placeholder="Enter email address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter email address'">
							</div>
					</div>
					<div class="form-group">
							<input type="text" class="form-control" id="subject" placeholder="Subject" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Subject'">
					</div>
					<div class="form-group">
							<textarea class="form-control mb-10" rows="5" name="message" placeholder="Messege" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Messege'"
									required=""></textarea>
						</div>
						<a href="#" class="button button-postComment">Post Comment</a>
				</form>
		</div>
</div>
<div class="col-lg-4">
		<div class="blog_right_sidebar">
				<aside class="single_sidebar_widget search_widget">
						<div class="input-group">
								<input type="text" class="form-control" placeholder="OO명으로 매물 찾기">
								<span class="input-group-btn">
										<button class="btn btn-default" type="button">
												<i class="lnr lnr-magnifier"></i>
										</button>
								</span>
						</div>
						<!-- /input-group -->
					<div class="br"></div>
			</aside>
			<aside class="single_sidebar_widget author_widget">
					<img class="author_img rounded-circle" src="img/blog/author.png" alt="">
					<h4>해당 매물 상세정보</h4>
					<p>Senior blog writer</p>
					<div class="social_icon"> </div>
					<p>매물 정보 내용은 어떻게 입력하지?amps have its supporters andit sdetractors. Some people do not understand why you should
							have to spend money on boot camp when you can get. Boot camps have itssuppor ters andits
							detractors.
					</p>
					<div class="br"></div>
			</aside>
			<aside class="single_sidebar_widget popular_post_widget">
				<h3 class="widget_title">수요조사 참여하기</h3>
					<!--업종 dropdown-->
												<form>
												<div class="media post_item">
													<select>
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
													
												</div>
												<div class="media post_item">
													<select>
														<option value=""  select=selected>리워드선택</option>
														<option value="무료쿠폰">무료쿠폰</option>
														<option value="굿즈">굿즈</option>
														<option value="할인카드">할인카드</option>
														<option value="포인트카드">포인트카드</option>
														
													</select>
												</div>
												<div class="br"></div>
												<h3 class="widget_title">투표완료?</h3>											
												<div class="media post_item">
												<input type="submit" value="투표하기">
												<input type="button" value="창업신청하기">
												</div>
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
</body>
</html>