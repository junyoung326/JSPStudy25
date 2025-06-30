<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%! String greeting="도서 쇼핑몰에 오신 것을 환영합니다.";
	String tagline="Welcome to Web Market!";%>
	<div class="row align-items-md-stretch text-center">
		<div class="col-md-12">
			<div class="h-100 p-5">
				<h3><%=tagline %></h3>
					<%
						Date day = new java.util.Date();
						String am_pm;
						int hour = day.getHours();
						int minute=day.getMinutes();
						int second=day.getSeconds();
						if (hour/12==0){
							am_pm="AM";
						} else{
							am_pm="PM";
							hour=hour-12;
						}
						String CT = hour+":"+minute+":"+second +":"+am_pm;
						out.println("현재 접속 시각: "+ CT +"\n");
					%>
			</div>
		</div>
	</div>
</body>
</html>