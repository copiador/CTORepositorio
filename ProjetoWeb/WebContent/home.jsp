<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<script type="text/javascript" src="jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="jquery.slidertron-1.3.js"></script>
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />

<!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->

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
			<span><a href="home.jsp	">Controle de Tráfego Online</a></span>
		</div>
		<div id="menu">
			<ul>
				<li class="current_page_item"><a href="home.jsp" accesskey="1" title="">Homepage</a></li>
				<li><a href="sistema.jsp" accesskey="2" title="">Sistema</a></li>
				<li><a href="CopyofcadastrarSemaforo.jsp" accesskey="3" title="">Google Maps - Caruaru</a></li>				
                <li><a href="ControladorUsuario?cmd=logout" accesskey="4" title="">Sair</a></li>
			</ul>
		</div>
	</div>
</div>
<div id="header-featured"> </div>
<div id="banner-wrapper">
	<div id="banner" class="container">
		<p>Este é o <strong>CTO</strong>, um sistema de controle para tráfego urbano. Tendo em vista viabilizar atendimentos de emergência. Utilizando altas tecnologias GPS.</p>
	</div>
</div>
<div id="copyright" class="container">
	<p>Developed By: UppSoftware (c) 2013 UppSoftware.ltda . Todos os direitos reservados. | Design by <a href="http://www.facebook.com.br/diego.vaz.gomes" rel="nofollow">Diêgo Vaz Gomes</a>.</p>
</div></body>
</html>
