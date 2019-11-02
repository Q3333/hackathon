<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="lab.java.user.UserDao"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
   <div board ="1" id="map" style="width:290px;height:300px;"></div>

   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=aad4bf3f77dfed13f54d32cd0ddf635d">
   </script>
   
   
<%
      UserDao userdaoo = new UserDao();
      String bdid = request.getParameter("BDID").toString();
      HashMap<String,HashMap<String,String>> hashmap = userdaoo.getXYZ();
      Set key = hashmap.keySet();
      HashMap<String, String> xy = new HashMap<String, String>();
      
      String userid="48naver@naver.com";
      
      
%>
   
   
   <script>   
   
      //##############################################################################
      //지도가 처음 표시 될 곳
      var container = document.getElementById('map');
      var options = {
         center: new daum.maps.LatLng(<%= hashmap.get(bdid).get("x")%>, <%= hashmap.get(bdid).get("y")%>),//DB
         level: 6
      };
      var map = new daum.maps.Map(container, options);
      
      
      
      //##############################################################################
      //마커 생성하기
      //빌딩 개수 파악해서 주변 마커 찍기
      <%
         double centerX = Double.parseDouble(hashmap.get(bdid).get("x")); 
         double centerY = Double.parseDouble(hashmap.get(bdid).get("y"));    
         
         
         int p = 0;
         HashMap<Integer,HashMap<String,Integer>> result = new HashMap<Integer,HashMap<String,Integer>>();
        

         for(Object compare: key){
            double distanceX = (Double.parseDouble(hashmap.get(compare).get("x"))-centerX)*92;
            double distanceY = (Double.parseDouble(hashmap.get(compare).get("y"))-centerY)*114;
            double distance = (Math.sqrt(Math.pow(distanceX,2)+Math.pow(distanceY,2)))*1000; 
            
            
            if(distance<=10000){
               out.println("var markerPosition  = new kakao.maps.LatLng("+hashmap.get(compare).get("x")+","+ hashmap.get(compare).get("y")+");");
               out.println("var "+compare+"= new kakao.maps.Marker({");
               out.println("map: map,");
               out.println("position: markerPosition});");
               out.println(compare+".setMap(map);");
               
               if(hashmap.get(compare).get("z").equals("Y")) {
                  out.println("var iwContent = \'<div style=\"padding:5px;\">펀딩 진행중</div>\';");
                  out.println("var infowindow = new kakao.maps.InfoWindow({content : iwContent});");
                  out.println("kakao.maps.event.addListener("+compare+", 'mouseover', function() {infowindow.open(map, "+compare+");});");
                  request.setAttribute("BDID", compare);
                  out.println("kakao.maps.event.addListener("+compare+", 'click', function() {location.href='./blog-details_fund.jsp?BDID="+compare+"';});");
                  out.println("kakao.maps.event.addListener("+compare+", 'mouseout', function() {infowindow.close();});");
               } 
               
               else if(hashmap.get(compare).get("z").equals("N")) {
                  out.println("var pwContent = \'<div style=\"padding:5px;\">준비중</div>\';");
                  out.println("var pnfowindow = new kakao.maps.InfoWindow({content : pwContent});");
                  out.println("kakao.maps.event.addListener("+compare+", 'mouseover', function() {pnfowindow.open(map, "+compare+");});");
                  
                  out.println("kakao.maps.event.addListener("+compare+", 'click', function() {location.href='./blog-details_vote.jsp?BDID="+compare+"';});");
                  out.println("kakao.maps.event.addListener("+compare+", 'mouseout', function() {pnfowindow.close();});");
               }

            }//if1 end
            
         }//for end
      %>
   </script>
</body>
</html> 


