<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>მომხმარებლის რეგისტრაცია</title>
<style>

.body{
	float: left;
	width: 100%;
	height: 550px;
	background:url('Tbilisi.png');
	background-size:100% 550px;
	background-repeat:no-repeat;
	
	background-size: cover;
	-webkit-filter: blur(5px);
	z-index: 0;
}
.label {
 	left: 50%;
	width: 250px;
	height: 30px;
	background: transparent;
	border: 1px solid rgba(255,255,255,0.6);
	border-radius: 2px;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
}

.textField input[type=text] {
 margin: 5px;
  padding: 0 10px;
  width: 260px;
  height: 35px;
  color: #404040;
  background: #fff;
  border-width: 1px;
  border-style: solid;
  border-color: #c4c4c4 #d1d1d1 #d4d4d4;
  border-radius:3px;
  --webkit-border-radius: 5px;
  outline:3px solid rgba(200, 105, 137, 0.09);
  -moz-outline-radius:7px;
  -webkit-box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.12);
  -moz-box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.12);
  box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.12);
  margin:10px 0;
}
.textField input[type=password]{
 margin: 5px;
  padding: 0 10px;
  width: 260px;
  height: 35px;
  color: #404040;
  background: #fff;
  border-width: 1px;
  border-style: solid;
  border-color: #c4c4c4 #d1d1d1 #d4d4d4;
  border-radius:3px;
  --webkit-border-radius: 5px;
  outline:3px solid rgba(200, 105, 137, 0.09);
  -moz-outline-radius:7px;
  -webkit-box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.12);
  -moz-box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.12);
  box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.12);
  margin:10px 0;
}

.button {
	width: 260px;
	height: 35px;
	background: #C1D6D9;
	border: 1px solid #fff;
	cursor: pointer;
	border-radius: 2px;
	color: #a18d6c;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 6px;
}

.button:hover{ 
     opacity: 0.6;
}

.button:active{
    opacity: 0.4;
}
</style>
</head>
<body>
	<%@include file="menu-top.jsp"%>
	<form action="CheckRegistrationParameters"  method="post">
	<div class="body"></div>
	<table style="position: absolute; left: 850px; top: 100px;">
		<tr>
			<td class="textField"><input id="firstName" type="text"
				name="firstName" placeholder="სახელი"></td>
		</tr>
		<tr>
			<td class="textField"><input id="lastName"  type="text"
				name="lastName"  placeholder="გვარი"></td>
		</tr>
		<tr>
			<td class="textField"><input id="email" type="text"
				name="email" placeholder="ელ–ფოსტა"></td>
		</tr>
		<tr>
			<td class="textField"><input id="phone" type="text" name="phone" placeholder="ტელეფონი"></td>
		</tr>
		<tr>
			<td class="textField"><input id="password" type="password"
				name="password" placeholder="პაროლი"> </td>
		</tr>
		<tr>
			<td class="textField"><input id="repassword" type="password"
				name="repassword" placeholder="გაიმეორეთ პაროლი"></td>
		</tr>
		<tr>
		<td><br></td>
		</tr>
		<tr style="position: absolute;">
			<td>
				<font color="red"> ყველა  ველი სავალდებულოა</font>
			</td>
		</tr>
		<tr>
		<td><br></td>
		</tr>
		<tr>
			<td align="center"><br>
			<input class="button" id="registerButton" type="submit"
				value="რეგისტრაცია"/></td>
		</tr>
	</table>
	</form>
</body>
</html>