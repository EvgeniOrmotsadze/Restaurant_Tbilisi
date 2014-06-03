<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="images.jpg" rel="shortcut icon" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="main.css">
    <style>html { font-size: 12px; font-family: Arial, Helvetica, sans-serif; }</style>
    <title></title>
    <link href="http://cdn.kendostatic.com/2014.1.528/styles/kendo.common.min.css" rel="stylesheet" />
    <link href="http://cdn.kendostatic.com/2014.1.528/styles/kendo.default.min.css" rel="stylesheet" />
    <link href="http://cdn.kendostatic.com/2014.1.528/styles/kendo.dataviz.min.css" rel="stylesheet" />
    <link href="http://cdn.kendostatic.com/2014.1.528/styles/kendo.dataviz.default.min.css" rel="stylesheet" />
    <script src="http://cdn.kendostatic.com/2014.1.528/js/jquery.min.js"></script>
    <script src="http://cdn.kendostatic.com/2014.1.528/js/kendo.all.min.js"></script>
    
</head>
<body>

	<%-- 
	<div id="fb-root"></div>
			
			<script>(function(d, s, id) {
			  var js, fjs = d.getElementsByTagName(s)[0];
			  if (d.getElementById(id)) return;
			  js = d.createElement(s); js.id = id;
			  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.0";
			  fjs.parentNode.insertBefore(js, fjs);
			}(document, 'script', 'facebook-jssdk'));</script> 
	--%>
	<%@include file="menu-top.jsp"%>
	
	<div class="topbackgroud">
	</div>
			<div class="lastnews">
	     <%--<div class="fb-like" data-href="https://www.facebook.com/eormotsadze" data-width="50" data-layout="standard" data-action="like" data-show-faces="true" data-share="true"></div> --%>
                <div id="options">
			        <h4>აირჩიეთ კატეგორია</h4>
                    <input id="fabric" placeholder="კატეგორია..." /> <br> <br>
			        &nbsp; &nbsp;<button class="k-button" id="get"> ძებნა </button>
			    </div>
            </div>
            <script>
                $(document).ready(function() {
                    // create ComboBox from input HTML element
                    $("#fabric").kendoComboBox({
                        dataTextField: "text",
                        dataValueField: "value",
                        dataSource: [
                            { text: "რესტორნები", value: "1" },
                            { text: "კაფე–ბარები", value: "2" },
                            { text: "სახინკლეები", value: "3" },
                            { text: "სწრაფი კვება", value: "4" }
                        ],
                        filter: "contains",
                        suggest: true,
                        index: 3
                    });
                    // create ComboBox from select HTML element
                    var fabric = $("#fabric").data("kendoComboBox");
					$("#get").click(function() {
					    alert('Thank you! Your Choice is:\n\nFabric ID: ' + fabric.value() );
                    });
                });
            </script>
	   
            <marquee behavior="scroll" direction="left">
				<img src="res1.png" width="100" height="100" alt="smile" />
				<p>ბოლოს დამატებელი <a href="/html/codes/scrolling_images.cfm">scrolling image</a>.</p>
			</marquee>
</body>
</html>
