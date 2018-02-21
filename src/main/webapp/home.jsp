<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <!--<meta name="viewport" content="initial-scale=1.0">-->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link href="https://fonts.googleapis.com/css?family=Rajdhani" rel="stylesheet">
        <title>Where The Trash | Homepage</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#myModal").modal('show');
            });
        </script>
        <meta charset="utf-8">
        <script async defer src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyBEEbNurXmQmY8PfNN4Jy3UuWjL9LJAFXg&callback=initMap" ></script>
        <script src="http://maps.google.com/maps/api/js?sensor=false" type="text/javascript"></script>
    
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body onload="myFunction()" style="margin:0;">
        
                <div id="myModal" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title">Where the Trash</h4>
                            </div>
                            <div class="modal-body">
                                <p>Would you like to use this web site? You need to turn on your location services in setting.</p>
                            </div>
                            <div class="modal-footer">
                                 <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> 
                                <button type="button" class="btn btn-primary">Go to setting</button>
                            </div>
                        </div>
                    </div>
                </div>
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
        <div id="loader"></div>
        
        <div style="display:none;" id="myDiv" class="animate-bottom">
        <div id="map"></div>
        <div class="d2">
        <div class="d3">
            <p class="n1">Engineering Building</p>
        </div>
    </div>
        </div>
        
        <script>
var myVar;

function myFunction() {
    setTimeout(function(){ 
        showPage();
    }, 6000);
}

function showPage() {
  document.getElementById("loader").style.display = "none";
  document.getElementById("myDiv").style.display = "block";
}
</script>
    </body>
    <span style="position: absolute">
        <script>
            var latitude;
            var longitude;
            var infowindow = new google.maps.InfoWindow();
            var marker, i;
            var img1 = 'pic/trash_available.png';
            var img2 = 'pic/trash_defect.png';
            var img3 = 'pic/trash_full.png';
            myFunction();
            function showPosition(position)
            {
                latitude = position.coords.latitude;
                longitude = position.coords.longitude;
                console.log(latitude);
                console.log(longitude);
            }
            
            var map;
            const trashLocation = []
            const trashes = Array.from(document.querySelectorAll("input[name^='trash[']"))
            trashes.map(trash => {
                trashLocation.push(JSON.parse(trash.value))
            })

            function initMap() {
                console.log("initMap")
                if (navigator.geolocation) {
                    navigator.geolocation.getCurrentPosition(showPosition);
                }
                latitude = 13.651567;
                longitude = 100.495030;
                console.log(">>>" + latitude);
                console.log(">>>" + longitude);
                map = new google.maps.Map(document.getElementById('map'), {
//                    center: {lat: 13.650946, lng: 100.494738},
                    center: {lat: latitude, lng: longitude},
                    zoom: 20
                });

                marker = new google.maps.Marker({
                    position: new google.maps.LatLng(latitude,longitude),
                    map: map,
                }
                );

                trashLocation.map(location => {
                    if (location.status == "Available") {
                        marker = new google.maps.Marker({
                            position: new google.maps.LatLng(location.lat, location.lng),
                            map: map,
                            icon: img1
                        })
                    } else if (location.status == "Defect") {
                        marker = new google.maps.Marker({
                            position: new google.maps.LatLng(location.lat, location.lng),
                            map: map,
                            icon: img2
                        })
                    } else if (location.status == "Full") {
                        marker = new google.maps.Marker({
                            position: new google.maps.LatLng(location.lat, location.lng),
                            map: map,
                            icon: img3
                        })
                    }

                    google.maps.event.addListener(marker, 'click', (function (marker, i) {
                        return function () {
                            infowindow.setContent(locations[i][0]);
                            infowindow.open(map, marker);
                        }
                    })(marker, i));
                })
            }
            window.onload = initMap;
        </script>
    </span>
    

</html>