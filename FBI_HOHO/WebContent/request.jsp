<%@page import="lab.java.user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
 UserDao a = new UserDao();
 request.setCharacterEncoding("UTF-8");
            String K = request.getParameter("TOOPYO");
            String E = null;
            String BID = request.getParameter("bdid");
            //application.setAttribute("BID", request.getParameter("BID"));
            
            
           if(K.equals("커피")) {E="COFFEE"; a.V_DESSERT(E,BID);}        
  	       if(K.equals("베이커리")) {E="BAKERY"; a.V_DESSERT(E,BID);}
  	       if(K.equals("아이스크림")) {E="ICECREAM"; a.V_DESSERT(E,BID);}
  	       
  	       if(K.equals("한식")) {E="KRFOOD";  a.V_WESTERNFOOD(E,BID);}
  	       if(K.equals("양식")) {E="RESTAURANT"; a.V_WESTERNFOOD(E,BID);}
  	       if(K.equals("중식")) {E="CHIFOOD"; a.V_WESTERNFOOD(E,BID);}
  	       if(K.equals("일식")) {E="JAPFOOD"; a.V_WESTERNFOOD(E,BID);}
  	       if(K.equals("분식")) {E="SNACKBAR"; a.V_WESTERNFOOD(E,BID);}
  	       if(K.equals("베트남 음식")) {E="VIETFOOD"; a.V_WESTERNFOOD(E,BID);}
  	       if(K.equals("고기집")) {E="MEATREST"; a.V_WESTERNFOOD(E,BID);}
  	       if(K.equals("치킨")) {E="CHICKEN"; a.V_WESTERNFOOD(E,BID);}
  	       if (K.equals("피자")) {E="PIZZA"; a.V_WESTERNFOOD(E,BID);}
  	       if (K.equals("햄버거")) {E="HAMBURGER"; a.V_WESTERNFOOD(E,BID);}
  	       if (K.equals("야식메뉴")) {E="NIGHTMEAL"; a.V_WESTERNFOOD(E,BID);}         
  	           
  	       if (K.equals("편의점")) {E="CONVENIENSTORE"; a.V_STORE(E,BID);}
  	       if (K.equals("화장품")) {E="COSMETICS"; a.V_STORE(E,BID);}
  	       if (K.equals("악세사리")) {E="ACCESSORY"; a.V_STORE(E,BID);}
  	       if (K.equals("핸드폰 가맹점")) {E="PHONE"; a.V_STORE(E,BID);}
  	           
  	       if (K.equals("헬스장")) {E="FITNESS"; a.V_ENTERTAIMENT(E,BID);}
  	       if (K.equals("요가")) {E="YOGA"; a.V_ENTERTAIMENT(E,BID);}
  	       if (K.equals("당구장")) {E="BILLIARD"; a.V_ENTERTAIMENT(E,BID);}
  	       if (K.equals("스크린골프")) {E="SCREENGOLF"; a.V_ENTERTAIMENT(E,BID);}     
  	       if (K.equals("마사지")) {E="MASSAGE"; a.V_ENTERTAIMENT(E,BID);}      
  	       if (K.equals("네일샵")) {E="NAILCARE"; a.V_ENTERTAIMENT(E,BID);}      
  	       if (K.equals("피시방")) {E="PC"; a.V_ENTERTAIMENT(E,BID);}      
  	       if (K.equals("노래방")) {E="KARAOKE"; a.V_ENTERTAIMENT(E,BID);}            

  	       if (K.equals("호텔")) {E="HOTEL"; a.V_LODGMENT(E,BID);}
  	       if (K.equals("모텔")) {E="MOTEL"; a.V_LODGMENT(E,BID);}
  	       
           
  %>
        투표가 완료되었습니다.
        <%=E%>
        <%=BID%>



</body>
</html>