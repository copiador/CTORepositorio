<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastro de Marca</title>
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
	function up(lstr) { // converte minusculas em maiusculas
		var str = lstr.value; //obtem o valor
		lstr.value = str.toUpperCase(); //converte as strings e retorna ao campo
	}
</script>
</head>
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
	   			<li class='last'><a href='CopyofcadastrarSemaforo.jsp'><span>Mapa</span></a></li>
   				<li><a href="ControladorUsuario?cmd=logout">Sair</a></li>
			</ul>
		</div>
		<div style="background-color: #069; text-align: center">
			<h2 align="center">
				<font size="+4" color="#FFFBF0">Cadastro de Marca</font>
			</h2>
			<form id="cadastromarca" style="background-color: #069"
				action="ControladorMarca?cmd=cadastrar"
				onsubmit="return CadastroMarca()" method="post">
				<table align="center">
					<tr>
						<td width="150" height="50" align="center"><b><font
								size="+1" color="#FFFBF0">Marca :*</font></b></td>
						<td width="250" align="center"><input type="text" name="marca"
							onchange="up(this)" /></td>
					</tr>
				</table>
				
				<table align="center">
					<tr>
						<td align="justify"><input type="submit" class="buttons" value="Cadastrar" />
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
