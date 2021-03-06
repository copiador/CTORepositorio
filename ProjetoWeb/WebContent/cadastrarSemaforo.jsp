
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastro de Sem�foro</title>
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900"
	rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="menu_jquery.js"></script>
<link href="styles.css" rel="stylesheet" type="text/css" />
<link href="buttons.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="ValidaCampos.js"></script>
<script type="text/javascript"
	src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/mapa_cadastro_semaforo.js"></script>
<script type="text/javascript" src="js/jquery-ui.custom.min.js"></script>


</head>

<body>
	<jsp:scriptlet>if (session == null
					|| session.getAttribute("usuarioLogado") == null) {
				response.sendRedirect("index.jsp");
			}</jsp:scriptlet>
	<div id="header-wrapper">
		<div id='cssmenu'>
			<ul>
   				<li class='active'><a href='home.jsp'><span>Home</span></a></li>
   				<li class='has-sub'><a href='#'><span>Cadastros</span></a>
      				<ul>
         				<li><a href='cadastrarUsuario.jsp'><span>Usu�rios</span></a></li>
         				<li><a href='cadastrarVeiculo.jsp'><span>Ve�culos</span></a></li>
		 				<li><a href='cadastrarSemaforo.jsp'><span>Sem�foros</span></a></li>
		 				<li><a href='cadastrarMotorista.jsp'><span>Motoristas</span></a></li>
         				<li class='last'><a href='cadastrarMarca.jsp'><span>Marcas</span></a></li>
      				</ul>
   				</li>
   			<li class='has-sub'><a href='#'><span>Listar</span></a>
      			<ul>
         			<li><a href='listarUsuario.jsp'><span>Usu�rios</span></a></li>
         			<li><a href='listarVeiculo.jsp'><span>Ve�culos</span></a></li>
         			<li><a href='listarSemaforo.jsp'><span>Sem�foros</span></a></li>
         			<li><a href='listarMotorista.jsp'><span>Motoristas</span></a></li>
         			<li class='last'><a href='listarMarca.jsp'><span>Marcas</span></a></li>
      			</ul>
   			</li>
	   			<li class='last'><a href='mapaPontosPersonalizados.jsp'><span>Mapa</span></a></li>
   				<li><a href="ControladorUsuario?cmd=logout">Sair</a></li>
			</ul>
		</div>
		<div style="background-color: #069; text-align: center">
			<h2 align="center">
				<font size="+4" color="#FFFBF0">Cadastro de Sem�foro</font>
			</h2>
			<form id="cadastrosemaforo" style="background-color: #069"
				action="ControladorSemaforo?cmd=cadastrar"
				onsubmit="return CadastroSemaforo()" method="post">
				<table align="center">
					<tr>
						<td width="150" height="50" align="center"><b><font
								size="+1" color="#FFFBF0">Latitude:</font></b></td>
						<td width="163" align="center"><input type="text"
							name="latitude" id="txtLatitude"/></td>
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
						<td align="justify"><input type="submit" class="buttons" value="Cadastrar" />
							<input type="Reset" class="buttons" value="Cancelar" />
				</table>
				<div id="mapa" style="width: 80%; height: 400px; margin: auto; margin-top:30px; border: 3px solid #ccc;"></div>
			</form>

			<p align="center">
				<b><font color="white">${mensagem }</font></b>
			<p>
			<div id="copyright" class="container">
				<p>
					Developed By: UppSoftware (c) 2013 UppSoftware.ltda . Todos os
					direitos reservados.</a>.
				</p>
			</div>
		</div>
	</div>
</body>
</html>
