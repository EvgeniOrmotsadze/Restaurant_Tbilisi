<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page  import="ge.freeuni.restaurant.model.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">


<style>

.navigation {
	margin-top: 20px;
}
.first_navigation{
border-radius: 50px 3px 3px 50px;
height: 25px;
	padding: 0px 15px;
	font-family: "Lato", sans-serif;
	font-size: 15px;
	background-color: #FFF;
	color: #222;
	border-right: 1px solid #CCC;
	cursor: pointer;

}
.last_navigation{
-moz-border-radius: 0px;
-webkit-border-radius: 3px 50px 50px 0px;
border-radius: 3px 50px 50px 0px; 
 height: 25px;
	padding: 0px 15px;
	font-family: "Lato", sans-serif;
	font-size: 15px;
	background-color: #FFF;
	color: #222;
	border-right: 1px solid #CCC;
	cursor: pointer;
}
.text_navigation{
-moz-border-radius: 0px;
-webkit-border-radius: 3px 50px 50px 0px;
border-radius: 3px 50px 50px 0px; 
font-size: inherit;
font-weight: bold;
font-family: inherit;
font-style: normal;
text-decoration: inherit;
height: 25px;
	padding: 0px 15px;
	font-family: "Lato", sans-serif;
	font-size: 15px;
	background-color: #FFF;
	color: #222;
	border-right: 1px solid #CCC;
}
.navigation_item {
	height: 25px;
	padding: 0px 15px;
	font-family: "Lato", sans-serif;
	font-size: 15px;
	background-color: #FFF;
	color: #222;
	border-right: 1px solid #CCC;
	cursor: pointer;
}

.navigation td:last-child {
	border: none;
}

.navigation_item:hover {
	box-shadow: inset 0px 0px 20px #AAA;
}
.first_navigation:hover{
	box-shadow: inset 0px 0px 20px #AAA;
 }
 .last_navigation:HOVER{
  	box-shadow: inset 0px 0px 20px #AAA;
 }
#searchbox
{
   	float: left;
    background-color: #eaf8fc;
    background-image: linear-gradient(#fff, #d4e8ec);
    border-radius: 30px;    
    border-style: solid;
    border-color: #c4d9df #a4c3ca #83afb7;            
    width: 260px;
    height: 25px;
    margin: 5px 0 0 140px;
    overflow: hidden; /* Clear floats */
}
#search, 
#submit {
    float: left;
}
#search {
    padding: 5px 9px;
    height: 18px;
    width: 203px;
    border: 1px solid #a4c3ca;
    background: #f1f1f1;
    border-radius: 50px 3px 3px 50px;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.25) inset, 0 1px 0 rgba(255, 255, 255, 1);            
}

/* ----------------------- */

#submit
{       
    background-image: url('search.png');
    background-repeat:no-repeat;
    border-radius: 3px 50px 50px 3px;    
    border-style: solid;
    border-color: #7eba7c #578e57 #447d43;
    box-shadow: 0 0 1px rgba(0, 0, 0, 0.3), 
                0 1px 0 rgba(255, 255, 255, 0.3) inset;
    height: 25px;
    width: 29px;
    cursor: pointer;
     margin: 0 0 0 5px;
    color: #23441e;    
    text-shadow: 0 1px 0 rgba(255,255,255,0.5);
}
 

#submit:active {       
    outline: none;
    box-shadow: 0 1px 4px rgba(0, 0, 0, 0.5) inset;        
}

#submit::-moz-focus-inner {
       border: 0;  /* Small centering fix for Firefox */
}

.logo {
	width: 60px;
	height: 60px;
	background-image: url("res1.png");
	background-size: 60px;
	position: fixed;
	top: 15px;
	left: 15px;
	cursor: pointer;
}
</style>
</head>
<body>

<div class="logo"></div>
	<table class="navigation" cellpadding="0" cellspacing="0" border="0" align="center">
						<tr>
							<td onclick="location.href='/Restaurants/HomePage';" class="first_navigation">მთავარი</td>
							<td onclick="location.href='/Restaurants/MyPage';" class="navigation_item">ჩემი გვერდი</td>
							<td onclick="location.href='/Restaurants/MyPage';"class="navigation_item">რეკლამა</td>
							<td onclick="location.href='/Restaurants/MyPage';"class="navigation_item">კონტაქტი</td>
							<%
								if (request.getSession().getAttribute("user") == null) {
							%>
							<td onclick="location.href='/Restaurants/RegisterPage';"class="navigation_item">რეგისტრაცია</td>
							<td onclick="location.href='/Restaurants/LoginServletForward';" class="last_navigation">შესვლა</td>
							<%
								} else {
									User user = (User) request.getSession().getAttribute("user");
									String name = user.getName();
							%>
							
							<td onclick="location.href='/Restaurants/LoginOutServlet';" class="navigation_item">გამოსვლა</td>
							<td class="text_navigation"><%=name %> </td>
							
							<%} %>
							<td>
							<form id="searchbox" action="">
    							<input id="search" type="text" placeholder="ძებნა...">
  								  <input id="submit" type="submit" value="" >
							</form>
							</td>
						</tr>
					</table>

</body>
</html>