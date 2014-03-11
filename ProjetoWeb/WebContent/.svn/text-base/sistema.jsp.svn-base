<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sistema</title>
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />

</head>

<body>
<jsp:scriptlet> 
if (session == null || session.getAttribute("usuarioLogado") == null) {
 response.sendRedirect("index.jsp");
}</jsp:scriptlet>
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
<div style="background-color:#069;text-align:center">
<h2 align="center"><font size="+4" color="#FFFBF0">Funções do Sistema</font></h2>
<table align="center">
	<tr>
    	<td width="150" height="50" align="center"><b><font size="+1" color="#	">Usuários</font></b></td>
    	<td width="150" height="50" align="center"><b><font size="+1" color="#000000">Motoristas</font></b></td>
    	<td width="150" height="50" align="center"><b><font size="+1" color="#000000">Semáforos</font></b></td>
		<td width="150" height="50" align="center"><b><font size="+1" color="#000000">Veículos</font></b></td>
		<td width="150" height="50" align="center"><b><font size="+1" color="#000000">Marcas</font></b></td>
    </tr>
    <tr>
    	<td width="150" height="50" align="center"><a href="cadastrarUsuario.jsp"><b><font size="+1" color="#FFFBF0">Cadastrar</font></b></a></td>
    	<td width="150" height="50" align="center"><a href="cadastrarMotorista.jsp"><b><font size="+1" color="#FFFBF0">Cadastrar</font></b></a></td>
		<td width="150" height="50" align="center"><a href="cadastrarSemaforo.jsp"><b><font size="+1" color="#FFFBF0">Cadastrar</font></b></a></td>
		<td width="150" height="50" align="center"><a href="cadastrarVeiculo.jsp"><b><font size="+1" color="#FFFBF0">Cadastrar</font></b></a></td>
		<td width="150" height="50" align="center"><a href="cadastrarMarca.jsp"><b><font size="+1" color="#FFFBF0">Cadastrar</font></b></a></td>
    </tr>
	<tr>
    	<td width="150" height="50" align="center"><a href="listarUsuario.jsp"><b><font size="+1" color="#FFFBF0">Listar</font></b></a></td>
    	<td width="150" height="50" align="center"><a href="listarMotorista.jsp"><b><font size="+1" color="#FFFBF0">Listar</font></b></a></td>
		<td width="150" height="50" align="center"><a href="listarSemaforo.jsp"><b><font size="+1" color="#FFFBF0">Listar</font></b></a></td>
		<td width="150" height="50" align="center"><a href="listarVeiculo.jsp"><b><font size="+1" color="#FFFBF0">Listar</font></b></a></td>
		<td width="150" height="50" align="center"><a href="listarMarca.jsp"><b><font size="+1" color="#FFFBF0">Listar</font></b></a></td>
    </tr>
    </table>
    
</div>

</div>
<div id="copyright" class="container">
	<p>Developed By: UppSoftware (c) 2013 UppSoftware.ltda . Todos os direitos reservados. | Design by <a href="http://www.facebook.com.br/diego.vaz.gomes" rel="nofollow">Diêgo Vaz Gomes</a>.</p>
		</div>
</body>
</html>
