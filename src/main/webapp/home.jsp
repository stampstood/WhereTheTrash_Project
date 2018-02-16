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
<!--        <div class="d2">
            <div class="d3">
            
            </div>
        </div>-->
        
        
        <div id="map"></div>
    </body>
    <script>
         var map;
        var locations = [
            ['SIT KMUTT', 13.652383, 100.493834, 3],
            ['Koffee Park', 13.651969, 100.493147, 2],
            ['KMUTT Food Center', 13.651259, 100.492028, 1],
        ];

        var infowindow = new google.maps.InfoWindow();
        var marker, i;
        var img = 'pic/c.png';

        function initMap() {
            map = new google.maps.Map(document.getElementById('map'), {
                center: {lat: 13.650946, lng: 100.494738},
                zoom: 17.5
            });
            for (i = 0; i < locations.length; i++) {
            marker = new google.maps.Marker({
                position: new google.maps.LatLng(locations[i][1], locations[i][2]),
                map: map,
                icon: img
            });
            console.log(locations[i][1])
            
            google.maps.event.addListener(marker, 'click', (function (marker, i) {
                return function () {
                    infowindow.setContent(locations[i][0]);
                    infowindow.open(map, marker);
                }
            })(marker, i));
        }
        }
        window.onload = initMap();
        
    </script>
</html>