<%@page import="ge.freeuni.restaurant.model.Picture"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ge.freeuni.restaurant.model.Restaurant"%>
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

.delete {
	display: block;
	width: 32px;
	height: 32px;
	border: none;
	cursor: pointer;
	background-color: transparent;
	background-image: url('delete.png') no-repeat !important;
}

.delete span.icon {
	
	float: left;
	width: 32px;
	height: 32px;
}

.button:hover {
	opacity: 0.6;
}

.button:active {
	opacity: 0.4;
}

.table {
	
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

.main_table {
	margin-top: 30px;
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
	<table class="main_table" align="center">
		<tr>
			<td>
				<form action="EditRestaurants" method="post" enctype="multipart/form-data">
					<% 
					@SuppressWarnings("unchecked")
					Restaurant res =  (Restaurant)request.getAttribute("editRes");
					%>
					<table class="table">
						<tr>
						<td>
							<input type="hidden" name="resID" value="<%=res.getID()%>" />
						</td>
						</tr>
						<tr>
							<td class="textField"><input id="name" type="text" name="Name"
								placeholder="დასახელება" onchange="ValidateName()" value="<%=res.getName()%>"><font
								id="FName" color="red" size=2>*</font>
								
							</td>
						</tr>
						<tr>
							<td class="textField"><input id="address" type="text"
								name="Address" placeholder="მისამართი" onchange="ValidateAddress()" value="<%=res.getAddress() %>"><font
								id="LName" color="red" size=2>*</font></td>
						</tr>
						<tr>
							<td class="textField"><input id="address" type="text"
								name="GoogleAddress" placeholder="მისამართი ინგლისურად " onchange="ValidateAddress()" value="<%=res.getGoogle()%>"><font
								id="LName" color="red" size=2>*</font></td>
						</tr>
						<tr>
							<td class="textField"><input id="zipcode" type="text"
								name="Zipcode" placeholder="საფოსტო ინდექსი" onchange="ValidateAddress()" value="<%=res.getZip() %>"><font
								id="LName" color="red" size=2>*</font></td>
						</tr>
						<tr>
						<% 
						int category = res.getCategoryID();
						%>
							<td class="textField">
								<select name="Category">
									<option >ტიპი</option>
									<option <% if(category == 1) {%> selected  <% } %> value="1">რესტორანი</option>
									<option <% if(category == 2) {%> selected <%} %> value="2">ბარი</option>
									<option <% if(category == 3) {%>selected <% } %> value="3">კაფე</option>
									<option <% if(category == 4) {%> selected <%} %>value="4">სწრაფი კვება</option>
									<option <% if(category == 5){ %>selected <%} %>value="5">პაბი</option>
									<option <% if(category == 6){ %>selected <%} %> value="6">კლუბი</option>
								</select>
							</td>
						</tr>
						<tr>
						<% int cusine = res.getCuisineID(); %>
							<td class="textField" >
								<select name = "Cuisine">
									<option>სამზარეულო</option>
									<option <% if(cusine == 1) {%>selected<%} %> value="1">ქართული</option>
									<option <% if(cusine == 2) {%> selected <%} %> value="2">იტალიური</option>
									<option <% if(cusine == 3) {%> selected <%} %> value="3">იაპონური</option>
									<option <% if(cusine == 4) {%> selected <%} %> value="4">ფრანგული</option>
									<option <% if(cusine == 5) {%> selected <%} %> value="5">ჩინური</option>
									<option <% if(cusine == 6) {%> selected <%} %> value="6">რუსული</option>
									<option <% if(cusine == 7) {%> selected <% } %> value="7">სხვა</option>
								</select>
							</td>
						</tr>
						<tr>
							<td class="textField"><input id="phone" type="text"
								name="Phone" placeholder="ტელეფონი" value="<%=res.getPhone()%>"></td>
						</tr>
						<tr>
							<td class="textField"><textarea style="width: 100%" id="Additional_info" 
								name="Additional_info" placeholder="დამატებითი ინფორმაცია" ><%=res.getAdditionalInfo()%></textarea></td>
						</tr>
						<tr>
							<td>
								<input style="padding: 10px; background-color: #FFF;" type="file" id="images" value="აირჩიეთ სურათი " name="images[]" multiple />
							</td>
						</tr>
						<tr>
							<td><br> <input class="button" id="registerButton"
								type="submit" value="შეინახეთ დარედაქტირებული" /></td>
						</tr>
					</table>
				</form>
			</td>
			<td valign="top" style="padding: 30px;">
				<table>
					<%
					@SuppressWarnings("unchecked")
					ArrayList<Picture> pic = (ArrayList<Picture>)request.getAttribute("pictures");
					%>
					<% for(int k = 0; k < pic.size(); k++){ %>
						<tr>
							
							<td>
								<img style="max-width: 70px; max-height: 70px;" src="data:image/gif;base64,<%=pic.get(k).getBlob() %>" />
							</td>
							<td>
								<form action="DeletePhotos" method="POST">
									<input type="hidden" name="value" value="<%=res.getID()%>" />
									<input type="hidden" name="picture_value" value="<%=pic.get(k).getID()%>" />
									<input type="image" src="delete.png" />
								</form>
							</td>
						</tr>
						<%} %>
					
				</table>
			</td>
		</tr>
	</table>
</body>
</html>