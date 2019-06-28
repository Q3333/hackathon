<%@page import="javax.script.ScriptContext"%>
<%@page import="java.util.Enumeration"%>
<%@page import="lab.java.user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<h3>회원가입 action</h3>

<%
int result=-1;
int select = Integer.parseInt((String)application.getAttribute("select"));
UserDao userdao= new UserDao();
int totlanum=0;
int indexnum=0;


Enumeration<String> total = request.getParameterNames();
Enumeration<String> params = request.getParameterNames();

String cL[]=request.getParameterValues("concernList");
String str="";
for(int i=0; i<cL.length; i++){
	str=str+cL[i]+";";
}

while(total.hasMoreElements()){
	total.nextElement();
	totlanum++;
}

String attribute[] = new String[totlanum];//totla의 개수로 속성배열 만들기
String userinfo[] = new String[totlanum];

while(params.hasMoreElements()){
	attribute[indexnum]=(String)params.nextElement();
	if(attribute[indexnum].equals("concernList")){
		userinfo[indexnum]=str;
	}else{
		userinfo[indexnum]=(String)request.getParameter(attribute[indexnum]);
	}
	indexnum++;
}
for(int i=0; i<totlanum;i++){
	out.println("<script type='text/javascript'>console.log('"+attribute[i]+"')</script><br>");
}
for(int i=0; i<totlanum;i++){
	out.println("<script type='text/javascript'>console.log('"+userinfo[i]+"')</script>");
}

if(select == 1){
	//창업자
	for(int i = 0;i<attribute.length;i++){
		System.out.printf("attribute[%d] = %s \n",i,attribute[i]);
	}
	for(int i = 0; i<userinfo.length;i++){
		System.out.printf("userinfo[%d] = %s \n",i,userinfo[i]);
	}
	result=userdao.join(1,attribute,userinfo);
	System.out.println(result);
	
	if(result>0){
		out.println("<script>alert('창업자 가입 성공')");
		out.println("window.parent.location.href='login.jsp'</script>");
		out.println("</script>");
	}
	else if(result==0){
		out.println("<script type='text/javascript'>alert('창업자 가입 실패')");
		out.println("history.back()</script>");
	}
	
}
else if(select ==2){
	//일반사용자
	for(int i = 0;i<attribute.length;i++){
		System.out.printf("attribute[%d] = %s \n",i,attribute[i]);
	}
	for(int i = 0; i<userinfo.length;i++){
		System.out.printf("userinfo[%d] = %s \n",i,userinfo[i]);
	}
	result=userdao.join(2,attribute,userinfo);
	System.out.println(result);
	
	if(result>0){
		out.println("<script>");
		out.println("alert('일반사용자 가입 성공')");
		out.println("window.parent.location.href='login.jsp'</script>");

	}
	else if(result==0){
		out.println("<script>alert('일반사용자 가입 실패')");
		out.println("history.back()</script>");
	}
}
%>







</body>
</html>