<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta name="viewport" content="initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link href="https://fonts.googleapis.com/css?family=Rajdhani" rel="stylesheet">
        <title>Where The Trash | Homepage</title>
        <meta charset="utf-8">
        <script async defer src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyBEEbNurXmQmY8PfNN4Jy3UuWjL9LJAFXg&callback=initMap" ></script>
        <script src="http://maps.google.com/maps/api/js?sensor=false" type="text/javascript"></script>
    </head>
    <body>
        <c:forEach items="${trashList}" var="trash">
            <input type="hidden" name="trash[${trash.id}]" value='{ "lat":"${trash.trashLatitude}", "lng":"${trash.trashLongtitude}","status": "${trash.statusTrash}", "zoneName": "${trash.zoneName}" }' />
        </c:forEach>
        <img src="pic/wttlogo.png" class="p1">
        <div class="d1">

            <table>
                <tr><a href="home.jsp" class="hm">Home</a></tr>
                <tr style="color: white;">&nbsp;&nbsp;&nbsp;&nbsp;  |  &nbsp;&nbsp;&nbsp;&nbsp;</tr>
                <tr><a href="#" class="hm">Profile</a></tr>
                <tr style="color: white;">&nbsp;&nbsp;&nbsp;&nbsp;  |  &nbsp;&nbsp;&nbsp;&nbsp;</tr>
                <tr><a href="#" class="hm">Rewards</a></tr>
                <tr style="color: white;">&nbsp;&nbsp;&nbsp;&nbsp;  |  &nbsp;&nbsp;&nbsp;&nbsp;</tr>
                <tr><a href="#" class="hm">Report Problems</a></tr>
                <tr><a href="#" class="hm1">Login</a></tr>
            </table>

        </div>

        <div id="map"></div>
    </body>
    <span style="position: absolute">
        <script>
            var map;
            const trashLocation = []
            const trashes = Array.from(document.querySelectorAll("input[name^='trash[']"))
            trashes.map(trash => {
                trashLocation.push(JSON.parse(trash.value))
            })

            var infowindow = new google.maps.InfoWindow();
            var marker, i;
            var img1 = 'pic/trash_available.png';
            var img2 = 'pic/trash_defect.png';
            var img3 = 'pic/trash_full.png';


            function initMap() {
                map = new google.maps.Map(document.getElementById('map'), {
                    center: {lat: 13.650946, lng: 100.494738},
                    zoom: 17.5
                });
                trashLocation.map(location => {
                    marker = new google.maps.Marker({
                        position: new google.maps.LatLng(location.lat, location.lng),
                        map: map,
                        icon: img1
                    })
                    google.maps.event.addListener(marker, 'click', (function (marker, i) {
                        return function () {
                            infowindow.setContent(locations[i][0]);
                            infowindow.open(map, marker);
                        }
                    })(marker, i));
                })
            }
            window.onload = initMap();
        </script>
    </span>
    <div class="d2">
        <div class="d3">
            <p class="n1">Engineering Building</p>
        </div>
    </div>

</html>