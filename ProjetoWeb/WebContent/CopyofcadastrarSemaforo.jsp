
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastro de Semáforo</title>
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900"
	rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />

<script type="text/javascript" src="ValidaCampos.js"></script>


<script type="text/javascript"
	src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/mapa.js"></script>
<script type="text/javascript" src="js/jquery-ui.custom.min.js"></script>


</head>

<body>
	<jsp:scriptlet>if (session == null
					|| session.getAttribute("usuarioLogado") == null) {
				response.sendRedirect("index.jsp");
			}</jsp:scriptlet>
	<div id="header-wrapper">
		<div id="header" class="container">
			<div id="logo">
				<h1>
					<a href="home.jsp">CTO</a>
				</h1>
				<span><a href="home.jsp">Controle de Tráfego Online</a></span>
			</div>
			<div id="menu">
				<ul>
					<li><a href="home.jsp" accesskey="1" title="">Homepage</a></li>
					<li class="current_page_item"><a href="sistema.jsp"
						accesskey="2" title="">Sistema</a></li>



					<li><a href="ControladorUsuario?cmd=logout" accesskey="4"
						title="">Sair</a></li>
				</ul>
			</div>
		</div>
		<div style="background-color: #069; text-align: center">
			<h2 align="center">
				<font size="+4" color="#FFFBF0">Cadastro de Semáforo</font>
			</h2>
			<form id="cadastrosemaforo" style="background-color: #069"
				action="CopiaControladoraServeltSemaforo?cmd=cadastrar"
				onsubmit="return CadastroSemaforo()" method="post">
				<table align="center">
					<tr>
						<td width="150" height="50" align="center"><b><font
								size="+1" color="#FFFBF0">Latitude:</font></b></td>
						<td width="163" align="center"><input type="text"
							name="latitude" id="txtLatitude"/></td>
					</tr>
					<tr>
						<td width="150" height="50" align="center"><b><font
								size="+1" color="#FFFBF0">Longitude:</font></b></td>
						<td width="163" align="center"><input type="text"
							name="longitude" id="txtLongitude" /></td>
					</tr>
					<tr>
						<td width="150" height="50" align="center"><b><font
								size="+1" color="#FFFBF0">Sentido da Via:</font></b></td>
						<td width="163" align="center"><input type="radio"
							name="sentido" value="UNICO" /><b><font size="+1"
								color="#FFFBF0">UNICO</font></b><input type="radio" name="sentido"
							value="DUPLO" /><b><font size="+1" color="#FFFBF0">DUPLO</font></b></td>
					</tr>
					<tr>
						<td width="150" height="50" align="center"><b><font
								size="+1" color="#FFFBF0">Cruzamento:</font></b></td>
						<td width="163" align="center"><input type="radio"
							name="cruzamento" value="SIM" /><b><font size="+1"
								color="#FFFBF0">SIM</font></b><input type="radio" name="cruzamento"
							value="NAO" /><b><font size="+1" color="#FFFBF0">NAO</font></b></td>
					</tr>
				</table>

				<table align="center">
					<tr>
						<td align="justify"><input type="submit" value="Cadastrar" />
							<input type="Reset" value="Cancelar" />
				</table>
				<div id="mapa" style="width: 80%; height: 400px; margin: auto; margin-top:30px; border: 3px solid #ccc;"></div>
			</form>

			<p align="center">
				<b><font color="white">${mensagem }</font></b>
			<p>
			<div id="copyright" class="container">
				<p>
					Developed By: UppSoftware (c) 2013 UppSoftware.ltda . Todos os
					direitos reservados. | Design by <a
						href="http://www.facebook.com.br/diego.vaz.gomes" rel="nofollow">Diêgo
						Vaz Gomes</a>.
				</p>
			</div>
		</div>
	</div>
</body>
</html>
