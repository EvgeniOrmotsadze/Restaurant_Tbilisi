<%@page import="ge.freeuni.restaurant.model.Restaurant"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ძიების შედეგი</title>
<style>
html,body {
	height: 100%;
	margin: 0px;
	background: #471016 url("bg.jpg") no-repeat top center fixed;
	background-size: cover;
}
.result {
	margin-top: 80px;
	margin-bottom: 2px;
}


.object {
	width: 320px;
	heigth: 280px;
	vertical-align: top;
	background-color: #FFF;
	opacity: 0.8;
}

.object:hover {
	opacity: 1;
}

.object_title {
	padding: 7px;
	font-family: "Lato", sans-serif;
	font-size: 14px;
	color: #222;
	cursor: pointer;
}

.object_title:hover {
	text-decoration: underline;
}

.object_imageW {}

.object_image {
	display: block;
	width: 100%;
	height: 120px;
}

.rate {
	padding: 5px;
	overflow: auto;
}

.star {
	float: right;
	margin-right: 2px;
}

</style>
</style>
</head>

<body>
	<%@include file="menu-top.jsp"%>
		<% 
		@SuppressWarnings("unchecked")
		ArrayList<Restaurant> arr = (ArrayList<Restaurant>)request.getAttribute("SearchResult");
		%>
		<table class="result"  align ="center" cellspacing="5" >
			<tr>
			<% for(int i = 1; i <= arr.size(); i++){ %>
			 	<%if(i%3 == 0){%>
			 		<tr/> <tr>
			 	<%} %>
				<td  onclick="location.href='/Restaurants/ObjectShow?id=<%=arr.get(i-1).getID()%>'" class="object">
					<div class="object_title">  <%=arr.get(i-1).getName()%>  </div>
					<div class="object_imageW">
						<img class="object_image" src="data:image/gif;base64,<%=arr.get(i-1).getPhoto1Address()%>" />
					</div>
					<div class="rate">
					 <%for(int m = 0; m < 5 - arr.get(i-1).getAvgScore(); m ++){ %>
						<img class="star" src="star-white.jpg" />
						<%} %>
					<% for(int m = 0; m < arr.get(i-1).getAvgScore(); m ++){ %>
						<img class="star"src="star-yellow.jpg" />
						<% } %>
					</div>
				</td>
				<%}%>
			</tr>
			
			
			
		</table>
	
</body>
</html>