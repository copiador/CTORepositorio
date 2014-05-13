<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fafica.cto.persistencia.UsuarioDAO"%>
<%@page import="br.com.fafica.cto.modelo.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista Usuario</title>
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900"
	rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="menu_jquery.js"></script>
<link href="styles.css" rel="stylesheet" type="text/css" />
<script>     
function confirmExclusao(id) {     
   if (confirm("Tem certeza que deseja excluir o usuario?")) {
	   location.href="ControladorUsuario?cmd=excluir&id="+id;
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
				<font size="+4" color="#FFFBF0">Lista de Usu�rios</font>
			</h2>
	<%
	ArrayList<Usuario> lista = new ArrayList<Usuario>();		
	lista = new UsuarioDAO().Listar();
	int cont = lista.size();
	%>

	<table align="center">
		<thead>
			<tr>
				<td width="150" height="50" align="center"><b><font size="+1" color="#FFFBF0">Codigo</font></b></td>
				<td width="150" height="50" align="center"><b><font size="+1" color="#FFFBF0">Nome</font></b></td>
				<td width="150" height="50" align="center"><b><font size="+1" color="#FFFBF0">CPF</font></b></td>
				<td width="150" height="50" align="center"><b><font size="+1" color="#FFFBF0">Login</font></b></td>
				<td colspan="2" width="150" height="50" align="center"><b><font size="+1" color="#FFFBF0">Opera��o</font></b></td>
			</tr>
		</thead>
		<tbody>
			<%
				for (int i = 0; i < lista.size(); i++) {
			%>
			<tr>
				<td width="150" height="50" align="center"><b><font size="+1" color="#FFFBF0"><%=lista.get(i).getCodigo()%></font></b></td>
				<td width="150" height="50" align="center"><b><font size="+1" color="#FFFBF0"><%=lista.get(i).getNome()%></font></b></td>
				<td width="150" height="50" align="center"><b><font size="+1" color="#FFFBF0"><%=lista.get(i).getCPF()%></font></b></td>
				<td width="150" height="50" align="center"><b><font size="+1" color="#FFFBF0"><%=lista.get(i).getLogin()%></font></b></td>
				<td><a href="alterarUsuario.jsp?id=<%=lista.get(i).getCodigo() %>"><font size="+1" color="#FFFBF0" >Alterar</font></a></td>
				<td><a href="javascript:confirmExclusao(<%=lista.get(i).getCodigo()%>)"><font size="+1" color="#FFFBF0" >Excluir</font></a></td>
			</tr>
			<%
				}
			%>
		</tbody>
	
	</table>
	<font size="+1" color="#FFFBF0" ><%="Foram encontrados "+cont+" registros" %></font>
	<br>
	<br>
	<a href="/ProjetoWeb/cadastrarUsuario.jsp"><font size="+1" color="#FFFBF0" >Novo Cadastro</font></a>
	</div>
	</div>
	<div id="copyright" class="container">
		<p>
			Developed By: UppSoftware (c) 2013 UppSoftware.ltda . Todos os
			direitos reservados. | Design by <a
				href="http://www.facebook.com.br/diego.vaz.gomes" rel="nofollow">Di�go
				Vaz Gomes</a>.
		</p>
	</div>
</body>
</html>