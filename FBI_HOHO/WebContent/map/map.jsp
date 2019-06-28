<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="lab.java.user.UserDao"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
	<div board ="1" id="map" style="width:500px;height:400px;"></div>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=aad4bf3f77dfed13f54d32cd0ddf635d">
	</script>
	
	
	<%
	
		
	 	UserDao userdao = new UserDao();
	 	String bdid = "KBM003657";
		HashMap<String,HashMap<String,String>> hashmap = userdao.getXY();
	    Set key = hashmap.keySet();
	   	request.getParameter("bdid");
	   	HashMap<String, String> xy = new HashMap<String, String>();
	    for(Object pp : key)
	    System.out.println(hashmap.get(pp));
	    System.out.println(key);
	    
	    
	    
   %>
   
   
	<script>	
	
		//##############################################################################
		//지도가 처음 표시 될 곳
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(<%= hashmap.get(bdid).get("x")%>, <%= hashmap.get(bdid).get("y")%>),//DB
			level: 3
		};
		var map = new daum.maps.Map(container, options);
		
		
		
		//##############################################################################
		//마커 생성하기
		//빌딩 개수 파악해서 주변 마커 찍기
		<%
			double centerX = Double.parseDouble(hashmap.get(bdid).get("x")); 
			double centerY = Double.parseDouble(hashmap.get(bdid).get("y")); 	
			for(Object compare: key){
				double distanceX = (Double.parseDouble(hashmap.get(compare).get("x"))-centerX)*92;
				double distanceY = (Double.parseDouble(hashmap.get(compare).get("y"))-centerY)*114;
				double distance = (Math.sqrt(Math.pow(distanceX,2)+Math.pow(distanceY,2)))*1000; 
				System.out.println(distance);
				if(distance<=100000){
					out.println("var markerPosition  = new kakao.maps.LatLng("+hashmap.get(compare).get("x")+","+ hashmap.get(compare).get("y")+");");
					out.println("var "+compare+"= new kakao.maps.Marker({");
					out.println("map: map,");
					out.println("position: markerPosition});");
					out.println(compare+".setMap(map);");
					if(hashmap.get(compare).get("z").equals("Y")) {
						out.println("var iwContent = \'<div style=\"padding:5px;\">펀딩 진행중</div>\';");
						out.println("var infowindow = new kakao.maps.InfoWindow({content : iwContent});");
						out.println("kakao.maps.event.addListener("+compare+", 'mouseover', function() {infowindow.open(map, "+compare+");});");
						out.println("kakao.maps.event.addListener("+compare+", 'click', function() {location.href='../blog-details.jsp?bdid="+compare+"';});");
						out.println("kakao.maps.event.addListener("+compare+", 'mouseout', function() {infowindow.close();});");
					} else if(hashmap.get(compare).get("z").equals("N")) {
						out.println("var pwContent = \'<div style=\"padding:5px;\">준비중</div>\';");
						out.println("var pnfowindow = new kakao.maps.InfoWindow({content : pwContent});");
						out.println("kakao.maps.event.addListener("+compare+", 'mouseover', function() {pnfowindow.open(map, "+compare+");});");
						out.println("kakao.maps.event.addListener("+compare+", 'click', function() {location.href='../blog-details.jsp?bdid="+compare+"';});");
						out.println("kakao.maps.event.addListener("+compare+", 'mouseout', function() {pnfowindow.close();});");
					}
					
				
				
				}//if1 end
				
			}//for end
		%>
		 		
		
		//##############################################################################
		// 마커 올리면 정보 나오게 하기
		// 마커 올리면 보일 정보 정하기
		
		
			 // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			// 인포윈도우를 생성합니다
			
			// 마커에 마우스오버 이벤트를 등록합니다
			
			// 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
			// 마커에 마우스 클릭했을때 이벤트
			
			// 마커에 마우스아웃 이벤트를 등록합니다 올렸을때 이벤트
			
			// 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
			
		
		//##############################################################################
	</script>
</body>
</html> 




