<%@page import="br.com.fafica.cto.persistencia.MarcaDAO"%>
<%@page import="br.com.fafica.cto.modelo.Marca"%>

<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fafica.cto.persistencia.UsuarioDAO"%>
<%@page import="br.com.fafica.cto.modelo.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista de Marcas</title>
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />
<script>     
function confirmExclusao(id) {     
   if (confirm("Tem certeza que deseja excluir o marca?")) {
	   location.href="ControladorMarca?cmd=excluir&id="+id;
   }
        
}     
</script>
</head>
<body>
	<%
	ArrayList<Marca> lista = new ArrayList<Marca>();		
	lista = new MarcaDAO().Listar();
	int cont = lista.size();
	%>
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
					<li class="current_page_item"><a href="sistema.jsp" accesskey="2"
						title="">Sistema</a></li>
					
					
					
					<li><a href="ControladorUsuario?cmd=logout" accesskey="4" title="">Sair</a></li>
				</ul>
			</div>
		</div>
		<div style="background-color: #069; text-align: center">
			<h2 align="center">
				<font size="+4" color="#FFFBF0">Lista de Marcas</font>
			</h2>
	<table align="center">
		<thead>
			<tr>
				<td width="150" height="50" align="center"><b><font size="+1" color="#FFFBF0">Codigo</font></b></td>
				<td width="150" height="50" align="center"><b><font size="+1" color="#FFFBF0">Descrição</font></b></td>
				<td colspan="2" width="150" height="50" align="center"><b><font size="+1" color="#FFFBF0">Operação</font></b></td>
			</tr>
		</thead>
		<tbody>
			<%
				for (int i = 0; i < lista.size(); i++) {
			%>
			<tr>
				<td width="150" height="50" align="center"><b><font size="+1" color="#FFFBF0"><%=lista.get(i).getNumero()%></font></b></td>
				<td width="150" height="50" align="center"><b><font size="+1" color="#FFFBF0"><%=lista.get(i).getDescricao()%></font></b></td>
				<td><a href="alterarMarca.jsp?id=<%=lista.get(i).getNumero() %>"><font size="+1" color="#FFFBF0">Alterar</font></a></td>
				<td><a href="javascript:confirmExclusao('<%=lista.get(i).getNumero()%>')"><font size="+1" color="#FFFBF0">Excluir</font></a></td>
			</tr>
			<%
				}
			%>
		</tbody>
	
	</table>
	<font size="+1" color="#FFFBF0"><%="Foram encontrados "+cont+" registros" %></font>
	<br>
	<br>
	<a href="/ProjetoWeb/cadastrarMarca.jsp"><font size="+1" color="#FFFBF0">Novo Cadastro</font></a>
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