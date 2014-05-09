<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<meta charset="UTF-8">

		<title>Google Maps API v3: Busca de endereço e Autocomplete - Demo</title>

		<link href="http://fonts.googleapis.com/css?family=Open+Sans:600" type="text/css" rel="stylesheet" />
		<link href="css/estilo.css" type="text/css" rel="stylesheet" />

		<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/mapa.js"></script>
		<script type="text/javascript" src="js/jquery-ui.custom.min.js"></script>

	</head>

	<body>

		<form method="post" action="index.html">
			
			Latitude: <input type="text" class="campos"/><br>
			Longitude: <input type="text" class="campos"/>
			<div id="mapa" style="width: 800px; height:500px;"></div>
			
			 <input type="hidden" id="txtLatitude" name="txtLatitude" />
             <input type="hidden" id="txtLongitude" name="txtLongitude" />
             <input type="submit" value="Enviar" name="btnEnviar" />
             
		</form>

	</body>
</html>
