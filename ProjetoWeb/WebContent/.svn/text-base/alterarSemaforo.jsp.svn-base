<%@page import="br.com.fafica.cto.persistencia.SemaforoDAO"%>
<%@page import="br.com.fafica.cto.modelo.Semaforo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Alterar Semáforo</title>
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="ValidaCampos.js"></script>
<script type="text/javascript" src="jquery-1.8.3.min.js" charset="utf-8"></script>
<script type="text/javascript" src="jquery.maskedinput.min.js"></script>
</head>

<body>
<jsp:scriptlet> 
if (session == null || session.getAttribute("usuarioLogado") == null) {
 response.sendRedirect("index.jsp");
}</jsp:scriptlet>
<%
	Semaforo semaforo = new Semaforo(request.getParameter("latitude"),request.getParameter("longitude"));
	semaforo = new SemaforoDAO().PesquisaUnica(semaforo);
     %>
    <div id="header-wrapper">
	<div id="header" class="container">
		<div id="logo">
			<h1><a href="home.jsp">CTO</a></h1>
			<span><a href="home.jsp">Controle de Tráfego Online</a></span>
		</div>
		<div id="menu">
			<ul>
				<li><a href="home.jsp" accesskey="1" title="">Homepage</a></li>
				<li class="current_page_item"><a href="sistema.jsp" accesskey="2" title="">Sistema</a></li>
				
				
				
                <li><a href="ControladorUsuario?cmd=logout" accesskey="4" title="">Sair</a></li>
			</ul>
		</div>
	</div>
	<div style="background-color:#069; text-align: center">
		<h2 align="center"><font size="+4" color="#FFFBF0">Alterar Semáforo</font></h2>
		<form id="cadastrosemaforo" style="background-color:#069"
			action="ControladorSemaforo?cmd=alterar"
			method="post">
			<table align="center">
				<tr>
					<td width="150" height="50" align="center"><b><font size="+1" color="#FFFBF0">Latitude:</font></b></td>
					<td width="163" align="center"><input type="text"
						name="latitude" id="latitude" value="<%=semaforo.getLatitude()%>"/></td>
				</tr>
				<tr>
					<td width="150" height="50" align="center"><b><font size="+1" color="#FFFBF0">Longitude:</font></b></td>
					<td width="163" align="center"><input type="text"
						name="longitude" id="longitude" value="<%=semaforo.getLongitude()%>"/></td>
				</tr>
				<tr>
					<td width="150" height="50" align="center"><b><font size="+1" color="#FFFBF0">Sentido da Via:</font></b></td>
					<td width="163" align="center">
					<% if (semaforo.getSentido().equals("UNICO")){ %>
							<input type="radio" name="sentido" value="UNICO" checked="checked"/><b><font size="+1" color="#FFFBF0">UNICO</font></b><br />
							<input type="radio" name="sentido" value="DUPLO" /><b><font size="+1" color="#FFFBF0">DUPLO</font></b><br /> 
						<%} else { %>
							<input type="radio" name="sentido" value="UNICO" /><b><font size="+1" color="#FFFBF0">UNICO</font></b><br />
							<input type="radio" name="sentido" value="DUPLO" checked="checked"/><b><font size="+1" color="#FFFBF0">DUPLO</font></b><br /> 
						<%} %>
						</td>
				</tr>
				<tr>
					<td width="150" height="50" align="center"><b><font size="+1" color="#FFFBF0">Cruzamento:</font></b></td>
					<td width="163" align="center">
					<% if (semaforo.getCruzamento().equals("SIM")){ %>
							<input type="radio" name="cruzamento" value="SIM" checked="checked" /><b><font size="+1" color="#FFFBF0">SIM</font></b><br />
							<input type="radio" name="cruzamento" value="NAO" /><b><font size="+1" color="#FFFBF0">NÃO</font></b><br /> 
						<%} else { %>
							<input type="radio" name="cruzamento" value="SIM" /><b><font size="+1" color="#FFFBF0">SIM</font></b><br />
							<input type="radio" name="cruzamento" value="NAO" checked="checked" /><b><font size="+1" color="#FFFBF0">NÃO</font></b><br />  
						<%} %>
					</td>
				</tr>
			</table>

			<table align="center">
				<tr>
					<td align="justify"><input type="submit" value="Alterar" />
						<input type="Reset" value="Cancelar" />
			</table>
		</form>
		<div id="copyright" class="container">
	<p>Developed By: UppSoftware (c) 2013 UppSoftware.ltda . Todos os direitos reservados. | Design by <a href="http://www.facebook.com.br/diego.vaz.gomes" rel="nofollow">Diêgo Vaz Gomes</a>.</p>
		</div>

	</div>
	</div>
</body>
</html>
