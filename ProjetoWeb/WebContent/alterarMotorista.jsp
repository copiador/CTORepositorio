<%@page import="br.com.fafica.cto.persistencia.MotoristaDAO"%>
<%@page import="br.com.fafica.cto.modelo.Motorista"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastro de Motorista</title>
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900"
	rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="menu_jquery.js"></script>
<link href="styles.css" rel="stylesheet" type="text/css" />
<link href="buttons.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="ValidaCampos.js"></script>
<script type="text/javascript" src="jquery-1.8.3.min.js" charset="utf-8"></script>
<script type="text/javascript" src="jquery.maskedinput.min.js"></script>
<script type="text/javascript">
	function VerificaCPF(cpf) {
		var form = document.getElementById("cadastromotorista");
		cpf = cpf.replace(/[^\d]+/g, '');

		// Elimina CPFs invalidos conhecidos
		if (cpf == '' || cpf.length != 11 || cpf == "00000000000"
				|| cpf == "11111111111" || cpf == "22222222222"
				|| cpf == "33333333333" || cpf == "44444444444"
				|| cpf == "55555555555" || cpf == "66666666666"
				|| cpf == "77777777777" || cpf == "88888888888"
				|| cpf == "99999999999") {

			alert("CPF invalido");
			form.cpf.focus();
		} else {
			// Valida 1o digito
			add = 0;
			for ( var i = 0; i < 9; i++)
				add += parseInt(cpf.charAt(i)) * (10 - i);
			rev = 11 - (add % 11);
			if (rev == 10 || rev == 11) {
				rev = 0;
			} else if (rev != parseInt(cpf.charAt(9))) {
				alert("CPF invalido");
				form.cpf.focus();
			}
			// Valida 2o digito
			add = 0;
			for (i = 0; i < 10; i++)
				add += parseInt(cpf.charAt(i)) * (11 - i);
			rev = 11 - (add % 11);
			if (rev == 10 || rev == 11) {
				rev = 0;
			} else if (rev != parseInt(cpf.charAt(10))) {
				alert("CPF invalido");
				form.cpf.focus();
			}
			return true;

		}

	}
</script>
<script type="text/javascript">
	function up(lstr) { // converte minusculas em maiusculas
		var str = lstr.value; //obtem o valor
		lstr.value = str.toUpperCase(); //converte as strings e retorna ao campo
	}
	$(function() {
		//$.mask.definitions['~'] = "[+-]";
		$("#nascimento").mask("99/99/9999");
		$("#cpf").mask("999.999.999-99", {
			placeholder : " "
		}, {
			completed : function() {
				var alerta = VerificaCPF(this.val());
				return alerta;
			}
		});
	});
</script>
</head>
</head>

<body>
<jsp:scriptlet> 
if (session == null || session.getAttribute("usuarioLogado") == null) {
 response.sendRedirect("index.jsp");
}</jsp:scriptlet>
	<%
		Motorista motorista = new Motorista();
		motorista.setCPF(request.getParameter("id"));
		motorista = new MotoristaDAO().PesquisarID(motorista);
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
	   			<li class='last'><a href='CopyofcadastrarSemaforo.jsp'><span>Mapa</span></a></li>
   				<li><a href="ControladorUsuario?cmd=logout">Sair</a></li>
			</ul>
		</div>
		<div style="background-color: #069; text-align: center">
			<h2 align="center">
				<font size="+4" color="#FFFBF0">Cadastro de Motorista</font>
			</h2>
			<form id="cadastromotorista" style="background-color: #069"
				action="ControladorMotorista?cmd=alterar&id=<%=motorista.getCPF()%>"
				onsubmit="return CadastroMotorista()" method="post">
				<table align="center">
					<tr>
						<td width="150" height="50" align="center"><b><font
								size="+1" color="#FFFBF0">Nome :*</font></b></td>
						<td width="250" align="center"><input type="text" name="nome"
							onchange="up(this)" value="<%=motorista.getNome()%>" /></td>
					</tr>
					<tr>
						<td width="150" height="50" align="center"><b><font
								size="+1" color="#FFFBF0">CPF :*</font></b></td>
						<td width="250" align="center"><input type="text" name="cpf"
							maxlength="14" id="cpf" onblur="return VerificaCPF(cpf.value)"
							onchange="up(this)" value="<%=motorista.getCPF()%>" /></td>
					</tr>
					<tr>
						<td width="150" height="50" align="center"><b><font
								size="+1" color="#FFFBF0">Data de Nascimento:*</font></b></td>
						<td width="250" align="center"><input type="text"
							name="nascimento" onchange="up(this)"
							value="<%=motorista.getNascimento()%>" /></td>
					</tr>

					<tr>
						<td width="150" height="50" align="center"><b><font
								size="+1" color="#FFFBF0">Número CNH:*</font></b></td>
						<td width="250" align="center"><input type="text" name="cnh"
							onchange="up(this)" value="<%=motorista.getCNH()%>" /></td>
					</tr>
				</table>

				<table align="center">
					<tr>
						<td width="150" height="50" align="center"><b><font
								size="+1" color="#FFFBF0">Logradouro:*</font></b></td>
						<td width="250" align="center"><input type="text"
							name="logradouro" onchange="up(this)"
							value="<%=motorista.getLogradouro()%>" /></td>
					</tr>
					<tr>
						<td width="150" height="50" align="center"><b><font
								size="+1" color="#FFFBF0">Número:*</font></b></td>
						<td width="250" align="center"><input type="text"
							name="numero" onchange="up(this)"
							value="<%=motorista.getNumero()%>" /></td>
					</tr>
					<tr>
						<td width="150" height="50" align="center"><b><font
								size="+1" color="#FFFBF0">Bairro:*</font></b></td>
						<td width="250" align="center"><input type="text"
							name="bairro" onchange="up(this)"
							value="<%=motorista.getBairro()%>" /></td>
					</tr>
					<tr>
						<td width="150" height="50" align="center"><b><font
								size="+1" color="#FFFBF0">Complemento:*</font></b></td>
						<td width="250" align="center"><input type="text"
							name="complemento" onchange="up(this)"
							value="<%=motorista.getComplemento()%>" /></td>
					</tr>

					<tr>
						<td width="150" height="50" align="center"><b><font
								size="+1" color="#FFFBF0">Município:*</font></b></td>
						<td width="250" align="center"><input type="text"
							name="municipio" onchange="up(this)"
							value="<%=motorista.getMunicipio()%>" /></td>
					</tr>

					<tr>
						<td width="150" height="50" align="center"><b><font
								size="+1" color="#FFFBF0">UF:*</font></b></td>
						<td width="250" align="center"><input type="text" name="uf"
							onchange="up(this)" value="<%=motorista.getUF()%>" /></td>
					</tr>
				</table>

				<table align="center">
					<tr>
						<td align="justify"><input type="submit" class="buttons" value="Alterar" />
							<input type="Reset" class="buttons" value="Cancelar" />
				</table>


			</form>
			<p align="center">
				<b><font color="white">${mensagem }</font></b>
			<p>
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
