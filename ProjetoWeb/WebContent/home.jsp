<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>CTO</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<script type="text/javascript" src="jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="jquery.slidertron-1.3.js"></script>
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="menu_jquery.js"></script>
<link href="styles.css" rel="stylesheet" type="text/css" />


<!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->

</head>
<body>
<jsp:scriptlet> 
if (session == null || session.getAttribute("usuarioLogado") == null) {
 response.sendRedirect("index.jsp");
}</jsp:scriptlet>

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
<div id="header-featured"> </div>
<div id="banner-wrapper">
	<div id="banner" class="container">
		<p>Este é o <strong>CTO</strong>, um sistema de controle para tráfego urbano. Tendo em vista viabilizar atendimentos de emergência. Utilizando a tecnologia GPS.</p>
	</div>
</div>
<div id="copyright" class="container">
	<p>Developed By: UppSoftware (c) 2013 UppSoftware.ltda . Todos os direitos reservados.</p>
</div></body>
</html>
