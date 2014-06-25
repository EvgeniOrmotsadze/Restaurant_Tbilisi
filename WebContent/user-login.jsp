<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

  <meta charset="UTF-8">

  <title>Login Form </title>
 <style>
 html,body {
	height: 100%;
	margin: 0px;
	background: #471016 url("bg.jpg") no-repeat top center
		fixed;
	background-size: cover;
	font-size: 12px;
	font-family: Arial, Helvetica, sans-serif;
}

.grad{
	position: absolute;
	top: -20px;
	left: -20px;
	right: -40px;
	bottom: -40px;
	width: auto;
	height: auto;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(0,0,0,0)), color-stop(100%,rgba(0,0,0,0.65))); /* Chrome,Safari4+ */
	z-index: 1;
	opacity: 0.7;
}

.header{
	position: absolute;
	top: calc(50% - 35px);
	left: calc(50% - 255px);
	z-index: 2;
}

.header div{
	float: left;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 35px;
	font-weight: 200;
}

.header div span{
	color: #5379fa !important;
}

.login{
	width: 350px;
	height: 150px;
	padding: 10px;
	margin: 0 auto;
	margin-top: 200px;
}
.login input[type=text]{
	width: 250px;
	height: 30px;
	background: transparent;
	border: 1px solid rgba(255,255,255,0.6);
	border-radius: 2px;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
}

.login input[type=password]{
	width: 250px;
	height: 30px;
	background: transparent;
	border: 1px solid rgba(255,255,255,0.6);
	border-radius: 2px;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
	margin-top: 10px;
}

.btnLogin{
	width: 260px;
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
	margin-top: 10px;
}

.btnLogin:hover{
	opacity: 0.5;
}

.btnLogin:active{
	opacity: 0.3;
}

.login input[type=text]:focus{
	outline: none;
	border: 1px solid rgba(255,255,255,0.9);
}

.login input[type=password]:focus{
	outline: none;
	border: 1px solid rgba(255,255,255,0.9);
}

.btnLogin:focus{
	outline: none;
}

::-webkit-input-placeholder{
   color: rgba(255,255,255,0.6);
}

::-moz-input-placeholder{
   color: rgba(255,255,255,0.6);
}
.btnFb { 
   cursor: pointer;
    width: 260px;
    	
	height: 35px;
	background:url('fb.png'); no-repeat;
    -webkit-background-size: cover;
     -moz-background-size: cover;
     -o-background-size: cover;
   	padding: 6px;
	margin-top: 10px;
   background-size:100%;
   background-position:  0px -6px;
   
}
.btnFb:hover{ 
     opacity: 0.6;
}

.btnFb:active{
    opacity: 0.4;
}

</style>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script>
	  window.fbAsyncInit = function() {
	    FB.init({
	      appId      : 'YOUR_APP_ID', // App ID
	      channelUrl : 'YOUR_WEBSITE_CHANNEL_URL',
	      status     : true, // check login status
	      cookie     : true, // enable cookies to allow the server to access the session
	      xfbml      : true  // parse XFBML
	    });
	    };
	 
	  (function(d){
	     var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
	     if (d.getElementById(id)) {return;}
	     js = d.createElement('script'); js.id = id; js.async = true;
	     js.src = "//connect.facebook.net/en_US/all.js";
	     ref.parentNode.insertBefore(js, ref);
	   }(document));
	 
	</script>
	<script src="//connect.facebook.net/en_US/all.js"></script>
	<script>
		$(document).ready(function() {
			$(".btnFb").click(function() {
				FB.login();
			});
		});
	</script>
</head>

<body>
	
  <%@include file="menu-top.jsp"%>
			<div class="login">
					<form action="LoginServlet" method="post">
						<input type="text" placeholder="e-mail" name="email"><br>
						<input type="password" placeholder="password" name="password"><br>
						<input type="submit" value="Login" class="btnLogin">
					</form>
					<input type="button" value="" class="btnFb" onclick="FB.init()" />
			</div>
	
</body>

</html>