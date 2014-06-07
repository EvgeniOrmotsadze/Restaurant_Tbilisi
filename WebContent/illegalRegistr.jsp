<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Verify Registration</title>

<style>
.body{
	float: left;
	width: 100%;
	height: 650px;
	background:url('Tbilisi.png');
	background-size:100% 560px;
	background-repeat:no-repeat;
	
	background-size: cover;
	-webkit-filter: blur(5px);
	z-index: 0;
}

</style>
</head>
<body>
<%@include file="menu-top.jsp"%>
 <div class="body"></div>
 	
 		 <div  class="centerStyle" style="position: absolute; top: 100px; left:400px; width:600px; margin:auto;" align="center">
			<font id="pass" color="red" size=3>კოდი არასწორად არის მითითებული </font>
			<p>გთხოვთ, გადაამოწმოთ  თქვენს მიერ მითითებულ ელექტრონულ ფოსტაზე მიღებული  დამადასტურებელი კოდი.<br>
			</p>
				<form method="post" action="RegistrUser">
					<input class="field" type="text" size="20" name="code">
					<input class="submitButton" type="submit" value="დადასტურება"/>
				</form>
		</div>
	
</body>
</html>