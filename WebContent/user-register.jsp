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

.body {
	float: left;
	width: 100%;
	height: 580px;
	background: url('Tbilisi.png');
	background-size: 100% 580px;
	background-repeat: no-repeat;
	background-size: cover;
	-webkit-filter: blur(5px);
	z-index: 0;
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
	border-radius: 3px; -
	-webkit-border-radius: 5px;
	outline: 3px solid rgba(200, 105, 137, 0.09);
	-moz-outline-radius: 7px;
	-webkit-box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.12);
	-moz-box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.12);
	box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.12);
	margin: 10px 0;
}

.textField input[type=password] {
	margin: 5px;
	padding: 0 10px;
	width: 260px;
	height: 35px;
	color: #404040;
	background: #fff;
	border-width: 1px;
	border-style: solid;
	border-color: #c4c4c4 #d1d1d1 #d4d4d4;
	border-radius: 3px; -
	-webkit-border-radius: 5px;
	outline: 3px solid rgba(200, 105, 137, 0.09);
	-moz-outline-radius: 7px;
	-webkit-box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.12);
	-moz-box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.12);
	box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.12);
	margin: 10px 0;
}

.button {
	width: 280px;
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

.button:hover {
	opacity: 0.6;
}

.button:active {
	opacity: 0.4;
}
</style>

<script type="text/javascript">
function namevalidates() {
	if(document.getElementById("firstName").value.length === 0){
		document.getElementById("FName").innerHTML="სახელი არ არის მითითებული";
		document.getElementById("registerButton").disabled = true;
	}else{
		document.getElementById("registerButton").disabled = false;
		document.getElementById("FName").innerHTML="*";
	}
}
function lastnamevalidates() {
	if(document.getElementById("lastName").value.length === 0){
		document.getElementById("LName").innerHTML="გვარი არ არის მითითებული";
		document.getElementById("registerButton").disabled = true;
	}else{
		document.getElementById("registerButton").disabled = false;
		document.getElementById("LName").innerHTML="*";
	}
}

function emailvalidates() {
	 var email = document.getElementById('email');
	 var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	 if (!filter.test(email.value)) {
		document.getElementById("Email").innerHTML="არასწორი ფორმატი";
		document.getElementById("registerButton").disabled = true;
	}else{
		document.getElementById("registerButton").disabled = false;
		document.getElementById("Email").innerHTML="*";
	}
}
function validatePassword1() {
	var pass = document.getElementById("password").value;
	if (pass.length < 6) {
		document.getElementById("pass").innerHTML="პაროლი უნდა შეიცავდეს მინიმუმ 6 სიმბოლოს!";
		document.getElementById("registerButton").disabled = true;
	}else{
		document.getElementById("registerButton").disabled = false;
		document.getElementById("pass").innerHTML="*";
	}
}

function validatePassword2() {
	var pass = document.getElementById("password").value;
	var repass = document.getElementById("repassword").value;
	if (pass != repass) {
		document.getElementById("repass").innerHTML="არ ემთხვევა პაროლი";
		document.getElementById("registerButton").disabled = true;
	}else{
		document.getElementById("registerButton").disabled = false;
		document.getElementById("repass").innerHTML="";
	}
}



</script>

</head>

<body>
	<%@include file="menu-top.jsp"%>
	<form action="CheckRegistrationParameters" method="post">
		<div class="body"></div>
		<table style="position: absolute; left: 750px; top: 100px;">
			<tr>
				<td class="textField"><input id="firstName" type="text"
					name="firstName" placeholder="სახელი" onchange="namevalidates()"><font
					id="FName" color="red" size=2>*</font></td>
			</tr>
			<tr>
				<td class="textField"><input id="lastName" type="text"
					name="lastName" placeholder="გვარი"  onchange="lastnamevalidates()"><font id="LName"
					color="red" size=2>*</font></td>
			</tr>
			<tr>
				<td class="textField"><input id="email" type="text"
					name="email" placeholder="ელ–ფოსტა"
					onchange="emailvalidates()"><font id="Email"
					color="red" size=2>*</font></td>
			</tr>
			<tr>
				<td class="textField"><input id="phone" type="text"
					name="phone" placeholder="ტელეფონი"></td>
			</tr>
			<tr>
				<td class="textField"><input id="password" type="password"
					name="password" placeholder="პაროლი" onchange="validatePassword1()"><font
					id="pass" color="red" size=2>*</font></td>
			</tr>
			<tr>
				<td class="textField"><input id="repassword" type="password"
					name="repassword" placeholder="გაიმეორეთ პაროლი"
					onchange="validatePassword2()"><font id="repass"
					color="red" size=2></font></td>
			</tr>
			<tr>
				<td><br> <input class="button"
					id="registerButton" type="submit" value="რეგისტრაცია" /></td>
			</tr>
		</table>
	</form>
</body>
</html>