<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<style>
@import url(http://fonts.googleapis.com/css?family=Lato);

html,body {
	height: 100%;
	margin: 0px;
	background: #471016 url("../IMG/bg.jpg?1363646640") no-repeat top center
		fixed;
	background-size: cover;
}

.logo {
	width: 50px;
	height: 50px;
	background-image: url("../IMG/logow.png");
	background-size: 50px;
	position: fixed;
	top: 20px;
	left: 20px;
	cursor: pointer;
}

.mainFrame {
	width: 100%;
	height: 100%;
}

.mainFrame_margin {
	width: 90px;
}

.content {
	vertical-align: top;
}

.navigation {
	margin-top: 20px;
}

.navigation_item {
	height: 50px;
	padding: 0px 15px;
	font-family: "Lato", sans-serif;
	font-size: 15px;
	background-color: #FFF;
	color: #222;
	border-right: 1px solid #CCC;
	cursor: pointer;
}

.navigation td:last-child {
	border: none;
}

.navigation_item:hover {
	box-shadow: inset 0px 0px 20px #AAA;
}

.objectW {
	width: 80%;
	margin: 0 auto;
	margin-top: 50px;
	padding: 10px;
	background-color: #FFF;
	box-shadow: inset 0px 0px 20px #000;
}

.objectWT {
	width: 100%;
}

.object_map {
	height: 200px;
}

.object_title {
	width: 40%;
	padding: 10px;
	font-family: "Lato", sans-serif;
	font-size: 16px;
	font-weight: bold;
	color: #424242;
}

.rate {
	overflow: auto;
	padding-right: 10px;
}

.star {
	display: block;
	float: right;
	margin-right: 2px;
}

.object_imageW {
	vertical-align: top;
	padding: 10px;
}

.object_image {
	display: block;
	width: 100%;
}

.object_info {
	vertical-align: top;
	padding: 10px;
}

.object_infoT {
	width: 100%;
}

.object_info_attr {
	vertical-align: top;
	width: 30%;
	padding: 10px;
	font-family: "Lato", sans-serif;
	font-size: 13px;
	color: #BA1213;
	border-bottom: 1px dashed #CCC;
}

.object_info_val {
	vertical-align: top;
	padding: 10px;
	font-family: "Lato", sans-serif;
	font-size: 13px;
	color: #424242;
	border-bottom: 1px dashed #CCC;
}

.object_infoT tr:last-child td {
	border-bottom: none;
}
</style>

<body>
	<%@include file="menu-top.jsp"%>
	<table class="mainFrame" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td class="mainFrame_margin"></td>
			<td class="content">
				<div class="objectW">
					<table class="objectWT" cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td class="object_title">დაკარგული სამოთხე</td>
							<td class="rate"><img class="star"
								src="assets/IMG/star_5.png" /> <img class="star"
								src="assets/IMG/star_5.png" /> <img class="star"
								src="assets/IMG/star_5.png" /> <img class="star"
								src="assets/IMG/star_5.png" /> <img class="star"
								src="assets/IMG/star_5.png" /></td>
						</tr>
						<tr>
							<td class="object_imageW"><img class="object_image"
								src="http://intbilisi.info/uploads/posts/2014-01/1388850917_paradiselost_photo2.jpg" />
							</td>
							<td class="object_info">
								<table class="object_infoT" cellpadding="0" cellspacing="0"
									border="0">
									<tr>
										<td class="object_info_attr">მისამართი:</td>
										<td class="object_info_val">თბილისი, ძმები კაკაბაძეების
											ქ. №2</td>
									</tr>
									<tr>
										<td class="object_info_attr">ტელეფონი:</td>
										<td class="object_info_val">995 32 999207</td>
									</tr>
									<tr>
										<td class="object_info_attr">სამზარეულო:</td>
										<td class="object_info_val">ევროპული და ქართული</td>
									</tr>
									<tr>
										<td class="object_info_attr">გართობა:</td>
										<td class="object_info_val">ცოცხალი მუსიკა</td>
									</tr>
									<tr>
										<td class="object_info_attr">დამატებითი ინფორმაცია:</td>
										<td class="object_info_val">ყოველ სტუმარს, რომელიც
											განახორციელებს 50 ლარის ან მეტი ღირებულების შეკვეთას
											გადაეცემა ბარათი, რომლის მეშვეობითაც იგი შეძლებს ერთი თვის
											განმავლობაში ისარგებლოს რესტორანში დამზადებულ კერძებზე 20%
											-ის ფასდაკლებით.</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td class="object_map" colspan="2"><iframe
									src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d190556.5817750593!2d44.80709555!3d41.73245925!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x40440cd7e64f626b%3A0x61d084ede2576ea3!2sTbilisi!5e0!3m2!1sen!2s!4v1402518438106"
									width="100%" height="100%" frameborder="0" style="border: 0"></iframe>
							</td>
						</tr>
					</table>
				</div>
	</table>

</body>
</html>