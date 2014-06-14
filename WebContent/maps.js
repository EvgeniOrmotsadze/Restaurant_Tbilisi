function mapInit() {

	console.log('mapInit fired');

	var point = new google.maps.LatLng(41.541565, 45.013115);

	var opts = {
		zoom:	14,
		scrollwheel: false,
		center: point
	};

	window.map = new google.maps.Map(document.getElementById('map-canvas'), opts);

	window.marker = new google.maps.Marker({
		position: point,
		map: window.map,
		draggable: false,
		title: 'Portal is here'
	});

	// Draggable roja

	window.marker2 = new google.maps.Marker({
		position: new google.maps.LatLng(41.551565, 45.019115),
		map: window.map,
		draggable: true,
		title: 'Drag this'
	});

	google.maps.event.addListener(window.map, "click", function(e) {
		var lon = e.latLng.lng().toFixed(6);
		var lat = e.latLng.lat().toFixed(6);
		$("[name=gps_lat]").val(lat);
		$("[name=gps_lon]").val(lon);
		window.marker2.setPosition(new google.maps.LatLng(lat, lon));
	});

	// Marker drag event
	google.maps.event.addListener(window.marker2, "position_changed", function(e) {
		var pos = window.marker2.getPosition();
		var lon = pos.lng().toFixed(6);
		var lat = pos.lat().toFixed(6);
		// avoid input interfering
		if (!$("[name=gps_lat]").is(":focus") && !$("[name=gps_lon]").is(":focus")) {
			$("[name=gps_lat]").val(lat);
			$("[name=gps_lon]").val(lon);
		}
	});

	// lat/lng input change event
	$("[name=gps_lat],[name=gps_lon]").on("change keyup", function(e) {
		var lon = $("[name=gps_lon]").val();
		var lat = $("[name=gps_lat]").val();
		window.marker2.setPosition(new google.maps.LatLng(lat, lon));
	});


}

google.maps.event.addDomListener(window, 'load', mapInit);
getCoord();



function getCoord() {

    gc.geocode({ address: window.prompt("Enter address:") }, function(r) {
        alert(r[0].geometry.location);
    });

}