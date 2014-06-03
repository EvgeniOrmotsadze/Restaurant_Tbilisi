<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<style>
.topmenu{
	float: left;
	width: 100%;
	height: 66px;
	background-image: url("menubg.png");
}
.menufooter{
	float: left;
	width: 100%;
	height: 4px;
	background-color: #06a45b;
}
.logo{
	float: left;
	width: 120px;
	height: 66px;
}
.midmenuitem{
	float: left;
	width: 1px;
	height: 66px;
	background-color: #aaaaaa;
}
.menuitem{
	float: left;
	width: auto;
	height: 66px;
	color: #0f9d5c;
	line-height: 64px;
	font-size: 18px;
}
.lastmenuitem{
	float: right;
	width: auto;
	height: 66px;
	color: #0f9d5c;
	line-height: 64px;
	font-size: 18px;
}
</style>
</head>
<body>
	<div class="topmenu">
		<div class="logo">
			<a href="/"><img src="logo.png"></a>
		</div>
		<div class="midmenuitem"></div>
		<div onclick="location.href='newurl.html';"class="menuitem" onmouseover="this.style.background='#06a45b'; this.style.color='#fff';" onmouseout="this.style.background='url(menubg.png)'; this.style.color='#0f9d5c';">
			&nbsp;	&nbsp; მთავარი &nbsp;	&nbsp;	
		</div>
		<div class="midmenuitem"></div>
		<div class="menuitem" onmouseover="this.style.background='#06a45b'; this.style.color='#fff';" onmouseout="this.style.background='url(menubg.png)'; this.style.color='#0f9d5c';">
			&nbsp;	&nbsp;	ჩემი გვერდი  &nbsp;	&nbsp;	
		</div>
		<div class="midmenuitem" onmouseover="this.style.background='#06a45b'; this.style.color='#fff';" onmouseout="this.style.background='url(menubg.png)'; this.style.color='#0f9d5c';"></div>
		<div class="menuitem" onmouseover="this.style.background='#06a45b'; this.style.color='#fff';" onmouseout="this.style.background='url(menubg.png)'; this.style.color='#0f9d5c';">
			&nbsp;	&nbsp;	რეკლამა &nbsp;	&nbsp;	
		</div>
		<div class="midmenuitem"></div>
		<div class="menuitem" onmouseover="this.style.background='#06a45b'; this.style.color='#fff';" onmouseout="this.style.background='url(menubg.png)'; this.style.color='#0f9d5c';">
			&nbsp;	&nbsp;	კონტაქტი  &nbsp;	&nbsp;	
		</div>
		<div class="midmenuitem"></div>
		<div class="menuitem" onmouseover="this.style.background='#06a45b'; this.style.color='#fff';" onmouseout="this.style.background='url(menubg.png)'; this.style.color='#0f9d5c';">
			&nbsp;	&nbsp;	რეგისტრაცია  &nbsp;	&nbsp;	
		</div>
		<div class="midmenuitem"></div>
			<div class="lastmenuitem" onmouseover="this.style.background='#06a45b'; this.style.color='#fff';" onmouseout="this.style.background='url(menubg.png)'; this.style.color='#0f9d5c';">
			<div class="midmenuitem"></div>
			&nbsp;	&nbsp; შესვლა  &nbsp;	&nbsp;	
		</div>
		
	</div>
	<div class="menufooter"></div>

</body>
</html>