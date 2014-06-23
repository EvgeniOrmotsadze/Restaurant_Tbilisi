<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="javax.swing.text.StyledEditorKit.BoldAction"%>
<%@page import="ge.freeuni.restaurant.controllers.DBQuery"%>
<%@page import="ge.freeuni.restaurant.model.Restaurant"%>
<%@page import="ge.freeuni.restaurant.model.Menu"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
@import url(http://fonts.googleapis.com/css?family=Lato);

html,body {
	height: 100%;
	margin: 0px;
	background: #471016 url("bg.jpg") no-repeat top center fixed;
	background-size: cover;
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

#object_map {
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
.btnAdd {
	width: 210px;
	height: 25px;
	background: #634918;
	border: 1px solid #fff;
	cursor: pointer;
	border-radius: 12px;
	color: #EDEBE6;
	font-family: 'Exo', sans-serif;
	font-size: 20px;
	font-weight: 400;
	padding: 6px;
	margin-top: 30px;
}
.btnAdd span.icon {
	background: url('menus.png') no-repeat;
	float: left;
	width: 32px;
	height: 32px;
}
</style>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDN64CaFtRHTmz4ALnh3XLvbpldKNjOUuo&amp;sensor=false"></script>

  
<script src="ext-js/ext-all.js" type="text/javascript"></script>
<link href="ext-js/ext-theme-gray-all.css" rel="stylesheet" type="text/css" />       

</head>
<body>
	<%@include file="menu-top.jsp"%>
	<%Restaurant res = (Restaurant)request.getAttribute("myobject"); %>
	
	
	<table class="mainFrame" cel lpadding="0" cellspacing="0" border="0">
		<tr>
			<td class="mainFrame_margin"></td>
			<td class="content">
				<div class="objectW">
					<table class="objectWT" cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td class="object_title"><%=res.getName() %></td>
							<td class="rate" id="stars-div"></td>
							
							<td> <div onclick="callExtJsMenu()"
								style="float: left; " class="btnAdd">
								<span class="icon"></span><a>მენიუს ნახვა</a><span></span>
								</div>
							 </td>
						</tr>
						<tr>
							<td class="object_imageW"><img class="object_image"
								src="data:image/gif;base64,<%=res.getPhoto1Address()%>" />
							</td>
							<td class="object_info">
								<table class="object_infoT" cellpadding="0" cellspacing="0"
									border="0">
									<tr>
										<td class="object_info_attr">მისამართი:</td>
										<td class="object_info_val"><%=res.getAddress()%> </td>
									</tr>
									<tr>
										<td class="object_info_attr">ტელეფონი:</td>
										<td class="object_info_val"><%=res.getPhone()%></td>
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
							<td id="object_map" colspan="2">

							</td>
						</tr>
					</table>
				</div>
	</table>
		
		
<script type="text/javascript">
function mapInit() {
	console.log('mapInit fired');
	var point = new google.maps.LatLng(<%=res.getLac()%>,<%=res.getLng()%>);//avigot koordinatebi
	var opts = {
		zoom:	14,
		scrollwheel: false,
		center: point
	};
	window.map = new google.maps.Map(document.getElementById('object_map'), opts);
	window.marker = new google.maps.Marker({
		position: point,
		map: window.map,
		draggable: false,
		title: 'Portal is here'
	});
}
google.maps.event.addDomListener(window, 'load', mapInit);
</script>	
<script type="text/javascript">
var div = document.getElementById('stars-div');
var stars = [],
    starsCount = 5,
    rating = <%=res.getAvgScore() %>;
reload();

function reload () {
    stars = [];
    div.innerHTML = '';
    for (var i = 1; i <= starsCount; i++) {
        (function (index) {
            var img = new Image();
            if (index <= rating) {
                img.src = 'star-yellow.jpg';
            } else {
                img.src = 'star-white.jpg';
            }
            img.style.cursor = 'pointer';
            stars.push(img);
            div.appendChild(img);

			<% System.out.print(request.getAttribute("alreadyAss"));
			if(request.getAttribute("alreadyAss") == null) { %>
             img.addEventListener('mouseover', function () {
                var currentIndex = stars.indexOf(img);
                for (var i = 0; i < stars.length; i++) {
                    if (i <= currentIndex) {
                        stars[i].src = 'star-yellow.jpg';
                    } else {
                        stars[i].src = 'star-white.jpg';
                    }
                }
            });
            img.addEventListener('mouseout', function () {
              //  var currentIndex = stars.indexOf(img);
                for (var i = 0; i < stars.length; i++) {
                    if (i <= rating) {
                        stars[i].src = 'star-yellow.jpg';
                    } else {
                        stars[i].src = 'star-white.jpg';
                    }
                }
            });
            img.addEventListener('click', function () {
                var currentIndex = stars.indexOf(img);
                rating = currentIndex +1; 
				callAjax(rating);
                reload();
            });
            <%}%>
        })(i);
    }
}
	function callAjax(rating){
		$.ajax({
		    url: 'MakeAssessments',
		    data: {star:rating, res_id:<%=res.getID()%>},
		    dataType: "TEXT",
		    cache: false,
		    type: 'POST',
		    success: function(data){
		    }
		 });
	}
       </script>
       
<script type="text/javascript">
<%
@SuppressWarnings("unchecked")
ArrayList<Menu> menu = (ArrayList<Menu>)request.getAttribute("menu");
	
%>
       function callExtJsMenu(){
    	 <%  if(menu.size() > 0){ %>
    	   Ext.onReady(function(){
    		   Ext.define('MyApp.model.Dish', {
    		        extend: 'Ext.data.Model',
    		        fields: [{
    		            name: 'id',
    		            type: 'int'
    		        }, {
    		            name: 'dish',
    		            type: 'string'
    		        }, {
    		            name: 'priceG',
    		            type: 'string'
    		        }, {
    		            name: 'priceS',
    		            type: 'string'
    		        }]
    		    });

    		    Ext.define('MyApp.store.Dish', {
    		        extend: 'Ext.data.Store',
    		        requires: ['MyApp.model.Dish'],
    		        model: 'MyApp.model.Dish',
    		        storeId: 'markStore',
    		        data: {
    		            items: [
    	    		     <%
    	    		     int ms = menu.size() -1;
    	    		     for(int k = 1; k  < ms ; k++){
    	    		     %>       
    	    		     {
    		                id: <%=k%>,
    		                dish: "<%=menu.get(k).getDish()%>",
    		                priceG: "<%=menu.get(k).getPrice()%>",
    		                priceS: "6.73 $"
    		           	 },
    		           	 <%}%>
    		             {
     		                id: <%=ms%>,
     		                dish: "<%=menu.get(ms).getDish()%>",
     		                priceG: "<%=menu.get(ms).getPrice()%>",
     		                priceS: "6.73 $"
     		           	 }
    		            ]
    		        },
    		        proxy: {
    		            type: 'memory',
    		            reader: {
    		                type: 'json',
    		                root: 'items'
    		            }
    		        }
    		    });
				
    		   var grid = Ext.create('Ext.grid.Panel', {
    		        itemId: 'markGrid',
    		        store: Ext.create('MyApp.store.Dish'),
    		        loadMask: true,
    		        width: 500,
    		        columns: [{
    		            header: 'კერძის დასახელება',
    		            dataIndex: 'dish',
    		            width: 230,
    		            flex: 1
    		        }, {
    		            header: 'ფასი(GEL)',
    		            dataIndex: 'priceG',
    		            width: 30,
    		            flex: 1
    		        }, {
    		            header: 'ფასი($)',
    		            dataIndex: 'priceS',
    		            width: 30,
    		            flex: 1
    		        }]
    		    });	 
				
    		   var win =  Ext.create("Ext.window.Window", {
    	            title: "რესტორანი  <%=res.getName()%>-ს  მენიუ ",
    	            layout: 'fit',
    	            width: 500,
    	            height: 550,
    	            modal:true,
    	            items: [grid]
    	        });
   	        	win.show();
    		  });
    	   <%}else{ %>
    	    alert("მენიუ ცარიელია");
    	    <%}%>
       }
      
   </script>
</body>
</html>