<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
      html { height: 100% }
      body { height: 100%; margin: 0; padding: 0 }
      #map_canvas { height: 100% }
    </style>
    <script type="text/javascript"
      src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDoYxD-g2Dtbea-siKNViq4vWDpr0U4D0I&sensor=true">
    </script>
    <script type="text/javascript">
      function initialize() {
        var mapOptions = {
          center: new google.maps.LatLng(-8.283513, -35.971026),
          zoom: 16,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document.getElementById("map_canvas"),
            mapOptions); 
        
        var lat_long_nMusic = new google.maps.LatLng(-8.282214122086744,-35.9713783008026);
        var lat_long_correios = new google.maps.LatLng(-8.281891030842033,-35.968933622476186);
        
        var nMusic = new google.maps.Marker({
            position: lat_long_nMusic,
            title:"N. Music"
        });
        
        var correios = new google.maps.Marker({
            position: lat_long_correios,
            title:"Ag. Correios"
        });
        
       nMusic.setMap(map);
       correios.setMap(map);       
      }
    </script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CTO - Mapa de Caruaru</title>
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />
</head>

<body onload="initialize()">

<div id="header-wrapper">
	<div id="header" class="container">
		<div id="logo">
			<h1><a href="home.jsp">CTO</a></h1>
			<span><a href="home.jsp">Controle de Tráfego Online</a></span>
		</div>
		<div id="menu">
				<ul>
					<li class="current_page_item"><a href="home.jsp" accesskey="1" title="">Homepage</a></li>
					<li><a href="#" accesskey="2" title="">Cadastros</a></li>
					<li><a href="#" accesskey="3" title="">Listar</a></li>
					<li><a href="ControladorUsuario?cmd=logout" accesskey="4" title="">Sair</a></li>
				</ul>
			</div>
	</div>

</div>
<div id="map_canvas" style="width:100%; height:60%"></div>
<div id="copyright" class="container">
	<p>Developed By: UppSoftware (c) 2013 UppSoftware.ltda . Todos os direitos reservados. | Design by <a href="http://www.facebook.com.br/diego.vaz.gomes" target="_blank" rel="nofollow">Diêgo Vaz Gomes</a>.</p>
		</div>
</body>
</html>