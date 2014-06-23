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
	background: #471016 url("bg.jpg") no-repeat top center fixed;
	background-size: cover;
}

.textField input[type=text],.textField select {
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

.td.Cordinate {
	width: 145px;
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

.table {
	position: relative;
	left: 450px;
	top: 100px;
}

.table>tr#cordinate {
	width: 140px;
}

#menu_table {
	display: none;
	margin-top: 10px;
	width: 280px;
}

#menu_table td {
	width: 50%;
	background-color: #FFF;
}

#menu_table td input {
	margin: 0px;
	padding: 5px 0px;
	border: none;
	width: 100%;
	outline: none;
	font-family: "Lato", sans-serif;
}

#menu_row_button {
	display: none;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function ValidateName() {
		if (document.getElementById("name").value.length === 0) {
			document.getElementById("FName").innerHTML = "სახელწოდება არ არის მითითებული";
			document.getElementById("registerButton").disabled = true;
		} else {
			document.getElementById("registerButton").disabled = false;
			document.getElementById("FName").innerHTML = "*";
		}
	}

	function ValidateAddress() {
		if (document.getElementById("address").value.length === 0) {
			document.getElementById("LName").innerHTML = "მისამართი არ არის მითითებული";
			document.getElementById("registerButton").disabled = true;
		} else {
			document.getElementById("registerButton").disabled = false;
			document.getElementById("LName").innerHTML = "*";
		}
	}
	
</script>
</head>

<body>
	<%@include file="menu-top.jsp"%>
	<form action="CheckRestaurantRegistrationParaamters" method="post">
		<table class="table">
			<tr>
				<td class="textField"><input id="name" type="text" name="Name"
					placeholder="დასახელება" onchange="ValidateName()"><font
					id="FName" color="red" size=2>*</font></td>
			</tr>
			<tr>
				<td class="textField"><input id="address" type="text"
					name="Address" placeholder="მისამართი" onchange="ValidateAddress()"><font
					id="LName" color="red" size=2>*</font></td>
			</tr>
			<tr>
				<td class="textField"><input id="address" type="text"
					name="GoogleAddress" placeholder="მისამართი ინგლისურად " onchange="ValidateAddress()"><font
					id="LName" color="red" size=2>*</font></td>
			</tr>
			<tr>
				<td class="textField"><input id="zipcode" type="text"
					name="Zipcode" placeholder="საფოსტო ინდექსი" onchange="ValidateAddress()"><font
					id="LName" color="red" size=2>*</font></td>
			</tr>
			<tr>
				<td class="textField">
					<select name="category">
						<option >ტიპი</option>
						<option value="1">რესტორანი</option>
						<option value="2">ბარი</option>
						<option value="3">კაფე</option>
						<option value="4">სწრაფი კვება</option>
						<option value="5">პაბი</option>
						<option value="6">კლუბი</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="textField" >
					<select name = "location">
						<option>მდებარეობა</option>
						<option value="1">საბურთალო</option>
						<option value="2">ვაკე</option>
						<option value="3">მთაწმინდა</option>
						<option value="4">დიდუბე</option>
						<option value="5">ვარკეთილი</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="textField" >
					<select name = "cuisine">
						<option>სამზარეულო</option>
						<option value="1">ქართული</option>
						<option value="2">იტალიური</option>
						<option value="3">იაპონური</option>
						<option value="4">ფრანგული</option>
						<option value="5">ჩინური</option>
						<option value="6">რუსული</option>
						<option value="7">სხვა</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="textField"><input id="phone" type="text"
					name="Phone" placeholder="ტელეფონი"></td>
			</tr>
			<tr>
				<td class="textField"><input id="additional_info" type="text"
					name="additional_info" placeholder="დამატებითი ინფორმაცია"></td>
			</tr>
			<tr>
				<td><br> <input class="button" id="registerButton"
					type="submit" value="განაგრძეთ რეგისტრაცია" /></td>
			</tr>
		</table>
	</form>
</body>
</html>