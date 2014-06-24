<%@page import="ge.freeuni.restaurant.model.Restaurant"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<style>
html,body {
	height: 100%;
	margin: 0px;
	background: #471016 url("bg.jpg") no-repeat top center fixed;
	background-size: cover;
}

.btnAdd {
	width: 210px;
	height: 25px;
	background: #634918;
	border: 1px solid #fff;
	cursor: pointer;
	border-radius: 12px;
	color: #EDEBE6;
	font-family: 'Exo', sans-serif;
	font-size: 20px;
	font-weight: 400;
	padding: 6px;
	margin-top: 30px;
}

.btnAdd span.icon {
	background: url('add.png') no-repeat;
	float: left;
	width: 32px;
	height: 32px;
}

.edit {
	width: 40px;
	background: #634918;
	border: 1px solid #fff;
	cursor: pointer;
	border-radius: 12px;
	color: #EDEBE6;
	font-family: 'Exo', sans-serif;

}

.edit span.icon {
	background: url('edit.png') no-repeat;
	float: left;
	width: 32px;
	height: 32px;
}

.delete {
	width: 40px;
	background: #634918;
	border: 1px solid #fff;
	cursor: pointer;
	border-radius: 12px;
	color: #EDEBE6;
	font-family: 'Exo', sans-serif;
	
}

.delete span.icon {
	background: url('delete.png') no-repeat;
	float: left;
	width: 32px;
	height: 32px;
}


#wrapper {
	text-align: center;
	top: 120px;
	width: 760px;
	margin: 0 auto;
	font-size: 24px;
	color: #CDCDCD;
	position: relative;
	height: 30px
}


.result {
	margin-top: 200px;
}

.object {
	vertical-align: top;
	background-color: #FFF;
	opacity: 0.8;
	cursor: pointer;
}

.object:hover {
	opacity: 1;
}

.object_title {
	padding: 7px;
	font-family: "Lato", sans-serif;
	font-size: 14px;
	color: #222;
}

.object_title:hover {
	text-decoration: underline;
}

.object_imageW {
	
}

.object_image {
	display: block;
	width: 390px;
	height: 170px;
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

<body>
	<%@include file="menu-top.jsp"%>
	<%
		if (request.getSession().getAttribute("user") == null) {
			request.getRequestDispatcher("user-login.jsp").forward(request,
					response);
		} else {
	%>
	<div onclick="location.href='/Restaurants/ForwardRestaurantRegister';"
		style="float: left; margin-top: 40px;" class="btnAdd">
		<span class="icon"></span><a>დაამატე ობიექტი</a><span></span>
	</div>
	 <div id="wrapper">ჩემს მიერ დამატებული ობიექტები:</div>
	<% 
		@SuppressWarnings("unchecked")
		ArrayList<Restaurant> arr = (ArrayList<Restaurant>)request.getAttribute("MyRestaurants");
	%>
		<table class="result"  align ="center" >
		 <% for(int i = 0; i < arr.size(); i++){ %>
			<tr>
				<td  onclick="location.href='/Restaurants/ObjectShow?id=<%=arr.get(i).getID()%>'" class="object">
					<div class="object_title"> 
						<%=arr.get(i).getName()%> 
						<button class="edit" style="float:right;"><span class="icon"></span> </button>
						<button class="delete" style="float:right;"><span class="icon"></span></button>
					</div>
					<div class="object_imageW">
						<img class="object_image"
							src="data:image/gif;base64,<%=arr.get(i).getPhoto1Address()%>" />
					</div>
					<div class="rate">
					 <%for(int m = 0; m < 5 - arr.get(i).getAvgScore(); m ++){ %>
						<img class="star" src="star-white.jpg" />
						<%} %>
					<% for(int m = 0; m < arr.get(i).getAvgScore(); m ++){ %>
						<img class="star"src="star-yellow.jpg" />
						<% } %>
					</div>
				</td>
			</tr>
			<% }%>
			<tr> </tr>
		</table>
	<%
		}
	%>
</body>
</html>