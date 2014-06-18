<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>მენიუს დამატება</title>
<style>
html,body {
	height: 100%;
	margin: 0px;
	background: #471016 url("bg.jpg") no-repeat top center fixed;
	background-size: cover;
}

.textField input[type=text]{
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
<script type="text/javascript"
	src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#menu_button").click(function(event) {
							event.preventDefault();
							$("#menu_table").show();
							$("#menu_row_button").show();
						});
						$("#menu_row_button").click(function(event) {
							event.preventDefault();
							$("#menu_table").append('<tr><td><input type="text" spellcheck="false" placeholder="კერძის დასახელება" /></td><td><input type="text" spellcheck="false" placeholder="ფასი" /></td></tr>');
							});
					});
</script>
</head>
<body>
	<table class="table">
		<%@include file="menu-top.jsp"%>
		<tr>
			<td>
				<button id="menu_button">მენიუს დამატება</button>
				<table id="menu_table" cellpadding="3" cellspacing="1" border="0">
					<tr>
						<td><input type="text" spellcheck="false"
							placeholder="კერძის დასახელება" /></td>
						<td><input type="text" spellcheck="false" placeholder="ფასი" /></td>
					</tr>
				</table>
				<button id="menu_row_button">ახალი ველი</button>
			</td>
		</tr>
		<tr>
			<td><br> <input class="button" id="registerButton"
				type="submit" value="განაგრძეთ რეგისტრაცია" /></td>
		</tr>
	</table>
</body>
</html>