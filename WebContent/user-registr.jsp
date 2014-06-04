<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>მომხმარებლის რეგისტრაცია</title>
<style>
.label {
	background: #0000FF;
	vertical-align: middle;
	color: black;
	padding: 3px 5px;
}

.textField {
	left: 50%;
}

.button {
	background: #0000FF;
	font-size: 18px;
	color: black;
	padding: 5px 10px;
	border: 0px solid rgb(10, 10, 15);
	border-radius: 2px;
	cursor: pointer;
}
</style>
</head>
<body>
	<%@include file="menu-top.jsp"%>
	<table style="position: absolute; left: 250px; top: 120px;">
		<tr>
			<td class="label">სახელი:</td>
			<td class="textField"><input id="firstName" type="text"
				name="firstName" size="20"></td>
		</tr>
		<tr>
			<td class="label">გვარი:</td>
			<td class="textField"><input id="lastName" type="text"
				name="lastName" size="20"></td>
		</tr>
		<tr>
			<td class="label">კომპანიის სახელი:</td>
			<td class="textField"><input id="companyName" type="text"
				name="companyName" size="20"></td>
		</tr>
		<tr>
			<td class="label">ელ-ფოსტა:</td>
			<td class="textField"><input id="email" type="text" name="email"
				size="20"></td>
		</tr>
		<tr>
			<td class="label">პაროლი:</td>
			<td class="textField"><input id="password" type="text"
				name="password" size="20"></td>
		</tr>
		<tr>
			<td class="label">გაიმეორეთ პაროლი:</td>
			<td class="textField"><input id="rePassword" type="text"
				name="rePassword" size="20"></td>
		</tr>
		<tr>
		<td><br></td>
		</tr>
		<tr style="position: absolute;">
			<td>
				<font color="red">ყველა ჩამოთვლილი ველი სავალდებულოა</font>
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
</body>
</html>