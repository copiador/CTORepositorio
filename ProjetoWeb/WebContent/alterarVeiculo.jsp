<%@page import="br.com.fafica.cto.modelo.Marca"%>
<%@page import="br.com.fafica.cto.persistencia.MarcaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fafica.cto.persistencia.VeiculoDAO"%>
<%@page import="br.com.fafica.cto.modelo.Veiculo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Alterar de Veiculos</title>
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="ValidaCampos.js"></script>
<script type="text/javascript" src="jquery-1.8.3.min.js" charset="utf-8"></script>
<script type="text/javascript" src="jquery.maskedinput.min.js"></script>
<script type="text/javascript">
	function up(lstr) { // converte minusculas em maiusculas
		var str = lstr.value; //obtem o valor
		lstr.value = str.toUpperCase(); //converte as strings e retorna ao campo
	}

	$(function() {
		//$.mask.definitions['~'] = "[+-]";
		$("#renavam").mask("999999999",{placeholder:" "});
		$("#placa").mask("aaa-9999",{placeholder:" "});
		$("#numero").mask("9?99999",{placeholder:" "});

	});
</script>
</head>
<body>
<jsp:scriptlet> 
if (session == null || session.getAttribute("usuarioLogado") == null) {
 response.sendRedirect("index.jsp");
}</jsp:scriptlet>
	<%
	int numero = Integer.parseInt(request.getParameter("num"));
	Veiculo veiculo = new Veiculo();
	veiculo.setNumero(numero);
	veiculo = new VeiculoDAO().PesquisarNum(veiculo);
     %>
     <%
    ArrayList<Marca> lista = new ArrayList<Marca>();		
 	lista = new MarcaDAO().Listar(); //Marcas que estão no banco
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
		<h2 align="center"><font size="+4" color="#FFFBF0">Alterar de Veículos</font></h2>
		<form id="cadastroveiculo" style="background-color:#069"
			action="ControladorVeiculo?cmd=alterar&num=<%=veiculo.getNumero()%>"
			onsubmit="return CadastroVeiculo()" method="post">
			<table align="center">
		<!--  		<tr>
					<td width="150" height="50" align="center"><b><font size="+1" color="#FFFBF0">Número :*</font></b></td>
					<td width="163" align="center"><input type="text"
						name="numero" id="numero" maxlength="6"
						value="<%=veiculo.getNumero()%>" /></td>
				</tr>
	-->
				<tr>
					<td width="150" height="50" align="center"><b><font size="+1" color="#FFFBF0">Modelo:*</font></b></td>
					<td align="center" width="163"><input type="text"
						name="modelo" maxlength="20" value="<%=veiculo.getModelo()%>"
						onchange="up(this)" /></td>
				</tr>

				<tr>
					<td width="150" height="50" align="center"><b><font size="+1" color="#FFFBF0">Marca:*</font></b></td>
					<td align="center" width="163"><select name="marca">
							<%
								for (int i = 0; i < lista.size(); i++) {
									if (lista.get(i).getNumero() == veiculo.getNumero()){
							%>
								
								<option value="<%=lista.get(i).getNumero()%>" selected="selected"><%=lista.get(i).getDescricao() %></option>
							
							<%		} else { %>
							
								<option value="<%=lista.get(i).getNumero()%>"><%=lista.get(i).getDescricao() %></option>
							<%    } %>	
							<% }	%>
					</select></td>
				</tr>

				<tr>
					<td width="150" height="50" align="center"><b><font size="+1" color="#FFFBF0">Chassi:*</font></b></td>
					<td align="center" width="163"><input type="text"
						name="chassi" maxlength="17" value="<%=veiculo.getChassi()%>"
						onchange="up(this)" /></td>
				</tr>

				<tr>
					<td width="150" height="50" align="center"><b><font size="+1" color="#FFFBF0">RENAVAM :*</font></b></td>
					<td align="center" width="163"><input type="text"
						name="renavam" id="renavam" maxlength="9"
						value="<%=veiculo.getRenavam()%>" /></td>
				</tr>

				<tr>
					<td width="150" height="50" align="center"><b><font size="+1" color="#FFFBF0">Placa :*</font></b></td>
					<td align="center" width="163"><input type="text" name="placa"
						id="placa" maxlength="8" value="<%=veiculo.getPlaca()%>"
						onchange="up(this)" /></td>
				</tr>

				<tr>
					<td width="150" height="50" align="center"><b><font size="+1" color="#FFFBF0">Tipo :*</font></b></td>
					<td align="center" width="163">
						<% if (veiculo.getTipo().equals("AMBULANCIA")){ %>
							<input type="radio" name="tipo" value="AMBULANCIA" width="300px" checked="checked" /><font size="+1" color="#FFFBF0">Ambulância</font><br />
							<input type="radio" name="tipo" value="BOMBEIRO" width="300px" /><font size="+1" color="#FFFBF0">Bombeiros</font><br /> 
							<input type="radio" name="tipo" value="POLICIA" width="300px" /><font size="+1" color="#FFFBF0">Polícia</font><br />
						<%} else if(veiculo.getTipo().equals("BOMBEIRO")){ %>
							<input type="radio" name="tipo" value="AMBULANCIA" width="300px"  /><font size="+1" color="#FFFBF0">Ambulância</font><br />
							<input type="radio" name="tipo" value="BOMBEIRO" width="300px" checked="checked" /><font size="+1" color="#FFFBF0">Bombeiros</font><br /> 
							<input type="radio" name="tipo" value="POLICIA" width="300px" /><font size="+1" color="#FFFBF0">Polícia</font><br />
						<%} else { %>
							<input type="radio" name="tipo" value="AMBULANCIA" width="300px"  /><font size="+1" color="#FFFBF0">Ambulância</font><br />
							<input type="radio" name="tipo" value="BOMBEIRO" width="300px"  /><font size="+1" color="#FFFBF0">Bombeiros</font><br /> 
							<input type="radio" name="tipo" value="POLICIA" width="300px" checked="checked" /><font size="+1" color="#FFFBF0">Polícia</font><br />
						<%} %>
						</td>
				</tr>
			</table>
			<table align="center">
				<tr>
					<td align="justify"><input type="submit" value="Alterar" /> <input
						type="reset" value="Cancelar" /></td>
				</tr>
			</table>
		</form>
		</div>
		<p align="center">
			<b><font color="red">${mensagem }</font></b>
		<p>
	</div>

</body>
</html>

