<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Verify Registration</title>

<style>
html,body {
	height: 100%;
	margin: 0px;
	background: #471016 url("bg.jpg") no-repeat top center
		fixed;
	background-size: cover;
}
.submitButton{
	background: #634918;
	border: 1px solid #fff;
	cursor: pointer;
	border-radius: 12px;
	color: #EDEBE6;
	font-family: 'Exo', sans-serif;
	font-size: 20px;
	font-weight: 400;
}
.field{
	border: 1px solid #fff;
	border-radius: 4px;
	font-family: 'Exo', sans-serif;
	font-size: 20px;
	font-weight: 400;
}
</style>
</head>
<body>
<%@include file="menu-top.jsp"%>
 		 <div  class="centerStyle" style="position: absolute; top: 100px; left:400px; width:600px; margin:auto;" align="center">
			<p style="color:red; font-size: 18px;">კოდი არასწორად არის მითითებული </p>
			<p style="color:white; font-size: 18px;">გთხოვთ, გადაამოწმოთ  თქვენს მიერ მითითებულ ელექტრონულ ფოსტაზე მიღებული  დამადასტურებელი კოდი.<br>
			</p>
				<form method="post" action="RegistrUser">
					<input class="field" type="text" size="30" name="code">
					<input class="submitButton" type="submit" value="დადასტურება"/>
				</form>
		</div>
</body>
</html>