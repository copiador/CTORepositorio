<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastro de Usuário</title>

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
	function VerificaCPF(cpf) {
		var form = document.getElementById("cadastrousuario");
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
function up(lstr){ // converte minusculas em maiusculas
	var str=lstr.value; //obtem o valor
	lstr.value=str.toUpperCase(); //converte as strings e retorna ao campo
}
	$(function() {
		//$.mask.definitions['~'] = "[+-]";
		$("#cpf").mask("999.999.999-99",{placeholder:" "}, {
			completed : function() {
				var alerta = VerificaCPF(this.val());
				return alerta;
			}
		});
	});
</script>
</head>
<body>

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
		<h2 align="center"><font size="+4" color="#FFFBF0">Cadastro de Usuário</font></h2>
		<form id="cadastrousuario" style="background-color: #069"
			action="ControladorUsuarioADM?cmd=cadastrar"
			onsubmit="return CadastroUsuario()" method="post">
			<table align="center">
				<tr>
					<td width="150" height="50" align="center"><b><font size="+1" color="#FFFBF0">Nome :*</font></b></td>
					<td width="163" align="center"><input type="text" name="nome"
						maxlength="40" onchange="up(this)"/></td>
				</tr>
				<tr>
					<td width="150" height="50" align="center"><b><font size="+1" color="#FFFBF0">CPF :*</font></b></td>
					<td width="163" align="center"><input type="text" name="cpf"
						maxlength="14" id="cpf" onblur="return VerificaCPF(cpf.value)"/></td>
				</tr>
				<tr>
					<td width="150" height="50" align="center"><b><font size="+1" color="#FFFBF0">Login :*</font></b></td>
					<td width="163" align="center"><input type="text" name="login"
						maxlength="20" id="login" onchange="up(this)"/></td>
				</tr>
				<tr>
					<td width="150" height="50" align="center"><b><font size="+1" color="#FFFBF0">Senha :*</font></b></td>
					<td width="163" align="center"><input type="password"
						name="senha" maxlength="40" /></td>
				</tr>
				<tr>
					<td width="150" height="50" align="center"><b><font size="+1" color="#FFFBF0">Confirme a Senha :*</font></b></td>
					<td width="163" align="center"><input type="password"
						name="teste_senha" maxlength="40" /></td>
				</tr>
			</table>
			<br></br>
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
