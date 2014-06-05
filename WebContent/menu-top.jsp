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
	height: 50px;
	background-image: url("menubg.png");
}
.menufooter{
	float: left;
	width: 100%;
	height: 0px;
	background-color: #06a45b;
}
.logo{
	float: left;
	width: 81px;
	height: 55px;
}
.midmenuitem{
	float: left;
	width: 15px;
	height: 35px;
	background-color: ;
}
.menuitem{
	float: left;
	width: auto;
	height: 45px;
	color: #0f9d5c;
	line-height: 45px;
	font-size: 14px;
	cursor: pointer; 
}
.lastmenuitem{
	float: right;
	width: auto;
	height: 45px;
	color: #0f9d5c;
	line-height: 45px;
	font-size: 14px;
	cursor: pointer; 
}

#searchbox
{
   	float: left;
    background-color: #eaf8fc;
    background-image: linear-gradient(#fff, #d4e8ec);
    border-radius: 30px;    
    border-style: solid;
    border-color: #c4d9df #a4c3ca #83afb7;            
    width: 260px;
    height: 25px;
    margin: 5px 0 0 140px;
    overflow: hidden; /* Clear floats */
}
#search, 
#submit {
    float: left;
}
#search {
    padding: 5px 9px;
    height: 18px;
    width: 203px;
    border: 1px solid #a4c3ca;
    background: #f1f1f1;
    border-radius: 50px 3px 3px 50px;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.25) inset, 0 1px 0 rgba(255, 255, 255, 1);            
}

/* ----------------------- */

#submit
{       
    background-image: url('search.png');
    background-repeat:no-repeat;
    border-radius: 3px 50px 50px 3px;    
    border-style: solid;
    border-color: #7eba7c #578e57 #447d43;
    box-shadow: 0 0 1px rgba(0, 0, 0, 0.3), 
                0 1px 0 rgba(255, 255, 255, 0.3) inset;
    height: 25px;
    width: 29px;
    cursor: pointer;
     margin: 0 0 0 5px;
    color: #23441e;    
    text-shadow: 0 1px 0 rgba(255,255,255,0.5);
}
 

#submit:active {       
    outline: none;
    box-shadow: 0 1px 4px rgba(0, 0, 0, 0.5) inset;        
}

#submit::-moz-focus-inner {
       border: 0;  /* Small centering fix for Firefox */
}
</style>
</head>
<body>
	<div class="topmenu">
		<div class="logo">
			<a href="/Restaurants/HomePage"><img src="logo.png"></a>
		</div>
		
		<div class="midmenuitem"></div>
		<div onclick="location.href='/Restaurants/HomePage';"class="menuitem" onmouseover="this.style.background='#2AE8E5'; this.style.color='#fff';" onmouseout="this.style.background='url(menubg.png)'; this.style.color='#0f9d5c';">
			&nbsp;	&nbsp; მთავარი &nbsp;	&nbsp;	
		</div>
		
		<div class="midmenuitem"></div>	
		<div onclick="location.href='/Restaurants/MyPage';" class="menuitem" onmouseover="this.style.background='#2AE8E5';   this.style.color='#fff';" onmouseout="this.style.background='url(menubg.png)'; this.style.color='#0f9d5c';">
			&nbsp;	&nbsp;	ჩემი გვერდი  &nbsp;	&nbsp;	
		</div>
		
		<div class="midmenuitem"></div>	
		<div onclick="location.href='';" class="menuitem" onmouseover="this.style.background='#2AE8E5'; this.style.color='#fff';" onmouseout="this.style.background='url(menubg.png)'; this.style.color='#0f9d5c';">
			&nbsp;	&nbsp;	რეკლამა &nbsp;	&nbsp;	
		</div>
		
		<div class="midmenuitem"></div>
		<div onclick="location.href='/HomePage';" class="menuitem" onmouseover="this.style.background='#2AE8E5';  this.style.color='#fff';" onmouseout="this.style.background='url(menubg.png)'; this.style.color='#0f9d5c';">
			&nbsp;	&nbsp;	კონტაქტი  &nbsp;	&nbsp;	
		</div>
		<div class="midmenuitem"></div>
		<div onclick="location.href='/HomePage';" class="menuitem" onmouseover="this.style.background='#2AE8E5'; this.style.color='#fff';" onmouseout="this.style.background='url(menubg.png)'; this.style.color='#0f9d5c';">
			&nbsp;	&nbsp;	რეგისტრაცია  &nbsp;	&nbsp;	
		</div>
		
		<div class="midmenuitem"></div>	
		<form id="searchbox" action="">
    		<input id="search" type="text" placeholder="ძებნა...">
  			  <input id="submit" type="submit" value="" >
		</form>
		
		<div class="midmenuitem"></div>
			<div onclick="location.href='/HomePage';" class="lastmenuitem" onmouseover="this.style.background='#2AE8E5'; this.style.color='#fff';" onmouseout="this.style.background='url(menubg.png)'; this.style.color='#0f9d5c';">
			<div class="midmenuitem"></div>
			&nbsp;	&nbsp; შესვლა  &nbsp;	&nbsp;	
		</div>
		
	</div>
	<div class="menufooter"></div>

</body>
</html>