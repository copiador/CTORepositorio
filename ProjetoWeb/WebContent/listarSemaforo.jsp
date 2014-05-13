<%@page import="br.com.fafica.cto.persistencia.SemaforoDAO"%>
<%@page import="br.com.fafica.cto.modelo.Semaforo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista Semaforos</title>
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900"
	rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="menu_jquery.js"></script>
<link href="styles.css" rel="stylesheet" type="text/css" />
<script>     
function confirmExclusao(latitude,longitude) {     
   if (confirm("Tem certeza que deseja excluir o usuario?")) {
	   location.href="ControladorSemaforo?cmd=excluir&latitude="+latitude+"&longitude="+longitude;
   }
        
}     
</script>
</head>
<body>
<jsp:scriptlet> 
if (session == null || session.getAttribute("usuarioLogado") == null) {
 response.sendRedirect("index.jsp");
}</jsp:scriptlet>
<div id="header-wrapper">
		<div id='cssmenu'>
<ul>
   <li class='active'><a href='home.jsp'><span>Home</span></a></li>
   <li class='has-sub'><a href='#'><span>Cadastros</span></a>
      <ul>
         <li><a href='cadastrarUsuario.jsp'><span>Usuários</span></a></li>
         <li><a href='cadastrarVeiculo.jsp'><span>Veículos</span></a></li>
		 <li><a href='cadastrarSemaforo.jsp'><span>Semáforos</span></a></li>
		 <li><a href='cadastrarMotorista.jsp'><span>Motoristas</span></a></li>
         <li class='last'><a href='cadastrarMarca.jsp'><span>Marcas</span></a></li>
      </ul>
   </li>
   <li class='has-sub'><a href='#'><span>Listar</span></a>
      <ul>
         <li><a href='listarUsuario.jsp'><span>Usuários</span></a></li>
         <li><a href='listarVeiculo.jsp'><span>Veículos</span></a></li>
         <li><a href='listarSemaforo.jsp'><span>Semáforos</span></a></li>
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
				<font size="+4" color="#FFFBF0">Lista de Semáforos</font>
			</h2>
	<%
	ArrayList<Semaforo> lista = new ArrayList<Semaforo>();		
	lista = new SemaforoDAO().Listar();
	int cont = lista.size();
	%>

	<table align="center">
		<thead>
			<tr>
				<td width="150" height="50" align="center"><b><font size="+1" color="#FFFBF0">Latitude</font></b></td>
				<td width="150" height="50" align="center"><b><font size="+1" color="#FFFBF0">Longitude</font></b></td>
				<td width="150" height="50" align="center"><b><font size="+1" color="#FFFBF0">Sentido</font></b></td>
				<td width="150" height="50" align="center"><b><font size="+1" color="#FFFBF0">Cruzamento</font></b></td>
				<td colspan="2" width="150" height="50" align="center"><b><font size="+1" color="#FFFBF0">Operação</font></b></td>
			</tr>
		</thead>
		<tbody>
			<%
				for (int i = 0; i < lista.size(); i++) {
			%>
			<tr>
				<td width="150" height="50" align="center"><b><font size="+1" color="#FFFBF0"><%=lista.get(i).getLatitude()%></font></b></td>
				<td width="150" height="50" align="center"><b><font size="+1" color="#FFFBF0"><%=lista.get(i).getLongitude()%></font></b></td>
				<td width="150" height="50" align="center"><b><font size="+1" color="#FFFBF0"><%=lista.get(i).getSentido()%></font></b></td>
				<td width="150" height="50" align="center"><b><font size="+1" color="#FFFBF0"><%=lista.get(i).getCruzamento()%></font></b></td>
				<td><a href="alterarSemaforo.jsp?latitude=<%=lista.get(i).getLatitude() %>&longitude=<%=lista.get(i).getLongitude() %>"><font size="+1" color="#FFFBF0" >Alterar</font></a></td>
				<td><a href="javascript:confirmExclusao('<%=lista.get(i).getLatitude()%>','<%=lista.get(i).getLongitude()%>')"><font size="+1" color="#FFFBF0" >Excluir</font></a></td>
			</tr>
			<%
				}
			%>
		</tbody>
	
	</table>
	<font size="+1" color="#FFFBF0" ><%="Foram encontrados "+cont+" registros" %></font>
	<br>
	<br>
	<a href="/ProjetoWeb/cadastrarSemaforo.jsp"><font size="+1" color="#FFFBF0" >Novo Cadastro</font></a>
	</div>
	</div>
	<div id="copyright" class="container">
		<p>
			Developed By: UppSoftware (c) 2013 UppSoftware.ltda . Todos os
			direitos reservados. | Design by <a
				href="http://www.facebook.com.br/diego.vaz.gomes" rel="nofollow">Diêgo
				Vaz Gomes</a>.
		</p>
	</div>
	
</body>
</html>