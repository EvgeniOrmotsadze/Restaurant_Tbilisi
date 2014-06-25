<%@page import="java.util.ArrayList"%>
<%@page import="ge.freeuni.restaurant.model.Restaurant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="images.jpg" rel="shortcut icon" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="main.css">
<style>
html {
	font-size: 12px;
	font-family: Arial, Helvetica, sans-serif;
}
</style>
<title></title>
<link
	href="http://cdn.kendostatic.com/2014.1.528/styles/kendo.common.min.css"
	rel="stylesheet" />
<link
	href="http://cdn.kendostatic.com/2014.1.528/styles/kendo.default.min.css"
	rel="stylesheet" />
<link
	href="http://cdn.kendostatic.com/2014.1.528/styles/kendo.dataviz.min.css"
	rel="stylesheet" />
<link
	href="http://cdn.kendostatic.com/2014.1.528/styles/kendo.dataviz.default.min.css"
	rel="stylesheet" />
<script src="http://cdn.kendostatic.com/2014.1.528/js/jquery.min.js"></script>
<script src="http://cdn.kendostatic.com/2014.1.528/js/kendo.all.min.js"></script>
</head>

<style type="text/css">
#wrapper {
  text-align: center;
  width: 760px; 
  margin: 0 auto;
  margin-top: 50px;
  margin-bottom: 50px;
  font-size: 24px; 
  color: #CDCDCD;
   height: 30px
  }
  
  .result {
	width: 1000px;
}


.object {
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

.widgets {
	text-align: center;
	width: 1000px;
	margin: 0 auto;
	margin-top: 30px;
}
</style>
<body>
	<%@include file="menu-top.jsp"%>
	<div class="widgets">
		<iframe style="background-color: #FFF;" id="forecast_embed" type="text/html" frameborder="0" height="200" width="200" src="http://forecast.io/embed/#lat=41.7167&lon=44.7833&name=Tbilisi&units=uk"> </iframe>
		<div class="lastnews">
			<%--<div class="fb-like" data-href="https://www.facebook.com/eormotsadze" data-width="50" data-layout="standard" data-action="like" data-show-faces="true" data-share="true"></div> --%>
			<div id="options">
				<h4>აირჩიეთ კატეგორია</h4>
			
				<form id="saerch" action="SearchByCategory" method="POST">
					<select name = "category">
						<option>კატეგორია</option>
						<option value="1">რესტორანი</option>
						<option value="2">ბარი</option>
						<option value="3">კაფე</option>
						<option value="4">სწრაფი კვება</option>
						<option value="5">პაბი</option>
						<option value="6">კლუბი</option>
					</select>
					<br/><br/>
				<button class="k-button" id="get">ძებნა</button>
			</form>
			</div>
		</div>
	</div>
	
	<% 
	@SuppressWarnings("unchecked")
	ArrayList<Restaurant> res = (ArrayList<Restaurant>)request.getAttribute("lastAdd");
	if(res.size() != 0){
	%>
		<div id="wrapper">ბოლოს დამატებული ობიექტები:</div>
		<marquee direction="up" scrolldelay="90" scrollamount="4"
			behavior="alternate" loop="0" "
			id="Marquee1" onmouseover="this.stop()" onmouseout="this.start()">
			<table class="result" cellpadding="0" cellspacing="5" border="0" align="center">
				<% for (int i = 1; i <= res.size(); i++) { %>
					<%if (i % 4 == 1) {
							if (i != 1) {%>
								</tr>
							<%}%>
							<tr>
					<%}%>
					<td class="object" onclick="location.href='/Restaurants/ObjectShow?id=<%=res.get(i-1).getID()%>'" >
						<div class="object_title">
							<%= res.get(i-1).getName() %>
						</div>
						<div class="object_imageW">
							<img class="object_image" src="data:image/gif;base64,<%=res.get(i-1).getPhoto1Address()%>" />
						</div>
						<div class="rate">
						<%for(int m = 0; m < 5 - res.get(i-1).getAvgScore(); m ++){ %>
							<img class="star" src="star-white.jpg" />
						<%} %>
						<% for(int m = 0; m < res.get(i-1).getAvgScore(); m ++){ %>
							<img class="star"src="star-yellow.jpg" />
						<% } %>
						</div>
					</td>
				<% } %>
			</table>
		</marquee>
		<%} %>
</body>
</html>
