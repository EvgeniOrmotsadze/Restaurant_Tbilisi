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
	background: #471016 url("bg.jpg") no-repeat top center
		fixed;
	background-size: cover;
}

.btnAdd{
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
</style>
<body>
<%@include file="menu-top.jsp"%>
<% if (request.getSession().getAttribute("user") == null) { 
	request.getRequestDispatcher("user-login.jsp").forward(request, response);
   }else{
%>
	<div onclick="location.href='/Restaurants/HomePage';" style="float:left; margin-top:40px;" class="btnAdd"><span class="icon"></span><a>დაამატე ობიექტი</a><span></span></div>

<%} %>
</body>
</html>