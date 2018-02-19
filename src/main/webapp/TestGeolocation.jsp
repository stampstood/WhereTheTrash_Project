<%-- 
    Document   : TestGeolocation
    Created on : Feb 15, 2018, 11:17:51 PM
    Author     : KUROMMNK
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <
    <body>
        <p id="demo">หาตำแหน่งของฉัน</p>

       <form action="/WhereTheTrash_Project/TestGeolocation" method="get">
       <input name="latitude" id="latitude" type="hidden">
       <input name="longitude" id="longitude" type="hidden">
            <input type="submit" value="Go">       
       </form>

        <script>

            var x = document.getElementById("demo");
            var latitude;
            var longitude;

            function getLocation()
            {
                if (navigator.geolocation) {
                    navigator.geolocation.getCurrentPosition(showPosition);
                } else {
                    //x.innerHTML = "Geolocation is not supported by this browser.";
                }
            }

            function showPosition(position)
            {
                latitude = position.coords.latitude;
                longitude = position.coords.longitude;
                // x.innerHTML = "Latitude: " + latitude + "<br>Longitude: " + longtitude;
                //console.log(latitude);
                document.getElementById("latitude").value = latitude;
                document.getElementById("longitude").value = longitude;

            }


            window.onload = getLocation();

        </script>
    </body>
</html>
