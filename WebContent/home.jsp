<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="images.jpg" rel="shortcut icon" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="main.css">
<style>
html {
	font-size: 12px;
	font-family: Arial, Helvetica, sans-serif;
}
</style>
<title></title>
<link
	href="http://cdn.kendostatic.com/2014.1.528/styles/kendo.common.min.css"
	rel="stylesheet" />
<link
	href="http://cdn.kendostatic.com/2014.1.528/styles/kendo.default.min.css"
	rel="stylesheet" />
<link
	href="http://cdn.kendostatic.com/2014.1.528/styles/kendo.dataviz.min.css"
	rel="stylesheet" />
<link
	href="http://cdn.kendostatic.com/2014.1.528/styles/kendo.dataviz.default.min.css"
	rel="stylesheet" />
<script src="http://cdn.kendostatic.com/2014.1.528/js/jquery.min.js"></script>
<script src="http://cdn.kendostatic.com/2014.1.528/js/kendo.all.min.js"></script>
</head>

<style type="text/css">
#wrapper {
  text-align: center;
  top:200px;
  width: 760px; 
  margin: 0 auto;
  font-size: 24px; 
  color: #CDCDCD;
   position: relative;
   height: 30px
  }
</style>
<body>
	<%@include file="menu-top.jsp"%>

	<div class="lastnews">
		<%--<div class="fb-like" data-href="https://www.facebook.com/eormotsadze" data-width="50" data-layout="standard" data-action="like" data-show-faces="true" data-share="true"></div> --%>
		<div id="options">
			<h4>აირჩიეთ კატეგორია</h4>
			<input id="fabric" placeholder="კატეგორია..." /> <br> <br>
			&nbsp; &nbsp;
			<button class="k-button" id="get">ძებნა</button>
		</div>
	</div>
	<script>
		$(document).ready(
						function() {
							$("#fabric").kendoComboBox({
								dataTextField : "text",
								dataValueField : "value",
								dataSource : [ {
									text : "რესტორანი",
									value : "1"
								}, {
									text : "ბარი",
									value : "2"
								}, {
									text : "კაფე",
									value : "3"
								}, {
									text : "სწრაფი კვება",
									value : "4"
								}, {
									text : "პაბი",
									value : "5"
								}, {
									text : "კლუბი",
									value : "6"
								}],
								filter : "contains",
								suggest : true,
								index : 3
							});
							// create ComboBox from select HTML element
							var fabric = $("#fabric").data("kendoComboBox");
							$("#get").click(
											function() {
												alert('Thank you! Your Choice is:\n\nFabric ID: '+ fabric.value());
											});
						});
	</script>

		<div id="wrapper">ბოლოს დამატებული ობიექტები:</div>
		<marquee direction="up" scrolldelay="90" scrollamount="4"
			behavior="alternate" loop="0" style="height: 400px; width:1100px; top: 250px; left: 200px; z-index:0;border: 8px solid #291D06; position: relative;"
			id="Marquee1" onmouseover="this.stop()" onmouseout="this.start()">
			<%@include file="last-adds.jsp"%>
		</marquee>
	
</body>
</html>
