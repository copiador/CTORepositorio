<%@page import="br.com.fafica.cto.modelo.Marca"%>
<%@page import="br.com.fafica.cto.persistencia.MarcaDAO"%>
<%@page import="br.com.fafica.cto.modelo.Veiculo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fafica.cto.persistencia.VeiculoDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastro de Veiculos</title>
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="menu_jquery.js"></script>
<link href="styles.css" rel="stylesheet" type="text/css" />
<link href="buttons.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="ValidaCampos.js"></script>
<script type="text/javascript" src="jquery-1.8.3.min.js" charset="utf-8"></script>
<script type="text/javascript" src="jquery.maskedinput.min.js"></script>
<script type="text/javascript">
	function up(lstr){ // converte minusculas em maiusculas
		var str=lstr.value; //obtem o valor
		lstr.value=str.toUpperCase(); //converte as strings e retorna ao campo
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
ArrayList<Marca> lista = new ArrayList<Marca>();		
lista = new MarcaDAO().Listar(); //Marcas que estão no banco
%>
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
<div style="background-color:#069; text-align: center">
		<h2 align="center"><font size="+4" color="#FFFBF0">Cadastro de Veículos</font></h2>
		<form id="cadastroveiculo" style="background-color:#069"
			action="ControladorVeiculo?cmd=cadastrar" onsubmit="return CadastroVeiculo()" method="post">
			<table align="center">
			<tr>
					<td width="150" height="50" align="center"><b><font size="+1" color="#FFFBF0">Modelo: *</font></b></td>
					<td align="center" width="163"><input type="text"
						name="modelo" maxlength="20" onchange="up(this)"/></td>
				</tr>

				<tr>
					<td width="150" height="50" align="center"><b><font size="+1" color="#FFFBF0">Marca :*</font></b></td>
					<td align="center" width="163">
					<select name="marca">
							<%
								for (int i = 0; i < lista.size(); i++) {
							%>
								<option value="<%=lista.get(i).getNumero()%>"><%=lista.get(i).getDescricao() %></option>
							<%
								}
							%>
					</select>
					<a href="cadastrarMarca.jsp"><b><font size="+1" color="#FFFBF0">Nova</font></b></a>
					</td>
					
				</tr>

				<tr>
					<td width="150" height="50" align="center"><b><font size="+1" color="#FFFBF0">Chassi :*</font></b></td>
					<td align="center" width="163"><input type="text"
						name="chassi" maxlength="17" onchange="up(this)"/></td>
				</tr>

				<tr>
					<td width="150" height="50" align="center"><b><font size="+1" color="#FFFBF0">RENAVAM :*</font></b></td>
					<td align="center" width="163"><input type="text"
						name="renavam" id="renavam" maxlength="9"/></td>
				</tr>

				<tr>
					<td width="150" height="50" align="center"><b><font size="+1" color="#FFFBF0">Placa :*</font></b></td>
					<td align="center" width="163"><input type="text" name="placa" id="placa"
						maxlength="8" onchange="up(this)" /></td>
				</tr>

				<tr>
					<td width="150" height="50" align="center"><b><font size="+1" color="#FFFBF0">Tipo :*</font></b></td>
					<td align="center" width="163">
						<input type="radio" name="tipo"	value="AMBULANCIA" width="300px" />
						<b><font size="+1" color="#FFFBF0">Ambulância</font></b><br />
						<input type="radio" name="tipo" value="BOMBEIRO" width="300px" /><b><font size="+1" color="#FFFBF0">Bombeiros</font></b><br /> 
						<input type="radio" name="tipo" value="POLICIA" width="300px"  />
						<b><font size="+1" color="#FFFBF0">Polícia</font></b><br /></td>
				</tr>
			</table>
			<table align="center">
				<tr>
					<td align="justify"><input type="submit" class="buttons" value="Cadastrar" />
						<input type="reset" class="buttons" value="Cancelar" /></td>
				</tr>
			</table>
		</form>
		<p align="center"><b><font color="white">${mensagem }</font></b><p>   
	<div id="copyright" class="container">
	<p>Developed By: UppSoftware (c) 2013 UppSoftware.ltda . Todos os direitos reservados. | Design by <a href="http://www.facebook.com.br/diego.vaz.gomes" rel="nofollow">Diêgo Vaz Gomes</a>.</p>
		</div>
		</div>
	</div>

</body>
</html>

