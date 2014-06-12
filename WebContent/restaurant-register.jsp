<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>საკვები ობიექტის რეგისტრაცია</title>
<style>



html,body {
	height: 100%;
	margin: 0px;
	background: #471016 url("bg.jpg") no-repeat top center
		fixed;
	background-size: cover;
	
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
.Cordinate input[type=text] {
	margin: 5px;
	padding: 0 10px;
	width: 130px;
	height: 35px;
	color: #404040;
	background: #fff;
	border-width: 1px;
	border-style: solid;
	border-color: #c4c4c4 #d1d1d1 #d4d4d4;
	border-radius: 3px; 
	-webkit-border-radius: 5px;
	-webkit-box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.12);
	-moz-box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.12);
	box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.12);
	margin: 10px 0;
	float: left;
}
.td.Cordinate{
	width:145px;
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
.table{
position: relative;
 left: 450px;
  top: 100px;
}
.table > tr#cordinate{
	width:140px;
}

</style>

<script type="text/javascript">
function ValidateName() {
	if(document.getElementById("name").value.length === 0){
		document.getElementById("FName").innerHTML="სახელწოდება არ არის მითითებული";
		document.getElementById("registerButton").disabled = true;
	}else{
		document.getElementById("registerButton").disabled = false;
		document.getElementById("FName").innerHTML="*";
	}
}

function ValidateAddress() {
	if(document.getElementById("address").value.length === 0){
		document.getElementById("LName").innerHTML="მისამართი არ არის მითითებული";
		document.getElementById("registerButton").disabled = true;
	}else{
		document.getElementById("registerButton").disabled = false;
		document.getElementById("LName").innerHTML="*";
	}
}



</script>

</head>

<body>
	<%@include file="menu-top.jsp"%>
	<form action="CheckRestaurantRegistrationParaamters" method="post">
		<table class ="table">
			<tr>
				<td class="textField"><input id="name" type="text"
					name="Name" placeholder="დასახელება" onchange="ValidateName()"><font
					id="FName" color="red" size=2>*</font></td>
				</tr>
			<tr>
				<td class="textField"><input id="address" type="text"
					name="Address" placeholder="მისამართი"  onchange="ValidateAddress()"><font id="LName"
					color="red" size=2>*</font>
				</td>
			</tr>
			<tr>
				<td class="textField"><input id="category" type="text"
					name="Category" placeholder="კატეგორია">
				</td>
			</tr>
			<tr>
				<td class="textField"><input id="phone" type="text"
					name="Phone" placeholder="ტელეფონი">
				</td>
			</tr>
			<tr>
				<td class="textField"><input id="location" type="text"
					name="Location" placeholder="მდებარეობა">
				</td>
			</tr>
			<tr id="Cordinate">
				<td class="Cordinate" ><input id="Coridante_X" type="text"
					name="Coridante_X" placeholder="კორდინატი(x)">
				</td>
				<td class="Cordinate"><input id="Coridante_Y" type="text"
					name="Coridante_Y" placeholder="კორდინატი(Y)">
				</td>
			</tr>
			<tr>
				<td><br> <input class="button"
					id="registerButton" type="submit" value="დამატება" /></td>
			</tr>
		</table>
	</form>
</body>
</html>