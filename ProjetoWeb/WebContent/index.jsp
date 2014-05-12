<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CTO - Controle de Trafego Online</title>
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="menu_jquery.js"></script>
<link href="styles.css" rel="stylesheet" type="text/css" />
<link href="buttons.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="ValidaCampos.js"></script>
</head>
<body>
	<div id="header-wrapper">
	<div id='cssmenu'>
<ul>
   <li class='active'><a href='index.jsp'><span>Login</span></a></li>
</ul>
</div>
	</div>
	<div style="background-color:#069; text-align: center">
		<h2 align="center"><font size="+4" color="#FFFBF0">Acesso ao Sistema</font></h2>
	<form id="formLogin" style="background-color: #069" method="post"
		action="ControladorUsuario?cmd=login" onsubmit="return Login()">
		<table align="center">
			<tr>
				<td width="36" align="center"><b><font size="+1" color="#FFFBF0">Login</font></b></td>
				<td width="115" align="center"><input type="text" name="login"
					maxlength="20" style="width: 120px;"></td>
			</tr>

			<tr>
				<td align="center"><b><font size="+1" color="#FFFBF0">Senha</font></b></td>
				<td align="center"><input type="password" name="senha"
					maxlength="20" style="width: 120px;"></td>
			</tr>
		</table>
		<br />
		<table align="center">
			<tr>
				<td align="center"><input type="submit" class="buttons" value="Entrar"></td>
				<td align="center"><input type="reset" class="buttons" value="Cancelar"></td>
			</tr>
		</table>
	</form>
	<p align="center"><b><font size="+1" color="#FFFBF0">${mensagem }</font></b><p>
	</div>
	<div id="copyright" class="container">
	<p>Developed By: UppSoftware (c) 2013 UppSoftware.ltda . Todos os direitos reservados. | Design by <a href="http://www.facebook.com.br/diego.vaz.gomes" rel="nofollow">Diêgo Vaz Gomes</a>.</p>
		</div>   	
</body>
</html>