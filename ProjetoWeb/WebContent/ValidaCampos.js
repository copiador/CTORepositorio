function Login() {
	window.onload;
	var form = document.getElementById("formLogin");
	
	if(form.login.value == "" || form.login.value == null){
		alert("Preencha o campo login");
		form.login.focus();
		return false;
	}else if(form.senha.value == "" || form.senha.value == null){
		alert("Preencha o campo senha");
		form.senha.focus();
		return false;
	}else{
		return true;
	}

}

function CadastroUsuario() {
	window.onload;
	var form = document.getElementById("cadastrousuario");
	
	if(form.nome.value == "" || form.nome.value == null){
		alert("Preencha o campo nome");
		form.nome.focus();
		return false;
	}else if(!isNaN(form.nome.value) ){
		alert("Preencha o campo com letras");
		form.nome.focus();
		return false;
	}else if(form.cpf.value == "" || form.cpf.value == null){
		alert("Preencha o campo CPF");
		form.cpf.focus();
		return false;
	}else if(form.login.value == "" || form.login.value == null){
		alert("Preencha o campo login");
		form.login.focus();
		return false;
	}else if(form.senha.value == "" || form.senha.value == null){
		alert("Preencha o campo senha");
		form.senha.focus();
		return false;
	}else if(form.teste_senha.value == "" || form.teste_senha.value == null){
		alert("Preencha o campo confirme a senha");
		form.teste_senha.focus();
		return false;
	}else if(form.senha.value != form.teste_senha.value){
		alert("Senhas diferentes digite novamente");
		form.teste_senha.value = "";
		form.senha.value = "";
		form.senha.focus();
		return false;
	}else {
		return true;
	}
}

function CadastroVeiculo() {
	window.onload;
	var form = document.getElementById("cadastroveiculo");
	
	if(form.modelo.value == "" || form.modelo.value == null){
		alert("Preencha o campo modelo");
		form.modelo.focus();
		return false;
	}else if(form.chassi.value == "" || form.chassi.value == null){
		alert("Preencha o campo chassi");
		form.chassi.focus();
		return false;
	}else if(form.renavam.value == "" || form.renavam.value == null){
		alert("Preencha o campo renavam");
		form.renavam.focus();
		return false;
	}else if(form.placa.value == "" || form.placa.value == null){
		alert("Preencha o campo placa");
		form.placa.focus();
		return false;
	}else if(form.tipo[0].checked == false && form.tipo[1].checked == false && form.tipo[2].checked == false){
		alert("Selecione um dos tipos");
		return false;
	}else {
		return true;
	}
}

function CadastroSemaforo() {
	window.onload;
	var form = document.getElementById("cadastrosemaforo");
	
	if(form.latitude.value == "" || form.latitude.value == null){
		alert("Preencha o campo latitude");
		form.latitude.focus();
		return false;
	}else if(isNaN(form.latitude.value)){
		alert("Preencha o campo latitude com numeros");
		form.latitude.focus();
		return false;
	}
	if(form.longitude.value == "" || form.longitude.value == null){
		alert("Preencha o campo longitude");
		form.longitude.focus();
		return false;
	}else if(isNaN(form.longitude.value)){
		alert("Preencha o campo longitude com numeros");
		form.longitude.focus();
		return false;
	}
	if(form.sentido[0].checked == false && form.sentido[1].checked == false){
		alert("Selecione o sentido");
		return false;	
	}
	else if(form.cruzamento[0].checked == false && form.cruzamento[1].checked == false){
			alert("Selecione o cruzamento");
			return false;	
	}else{
		return true;
	}
}

function CadastroMotorista() {
	window.onload;
	var form = document.getElementById("cadastromotorista");
	
	if(form.nome.value == "" || form.nome.value == null){
		alert("Preencha o campo nome");
		form.nome.focus();
		return false;
	}
	if(!isNaN(form.nome.value) ){
		alert("Preencha o campo com letras");
		form.nome.focus();
		return false;
	}
	else if(form.cpf.value == "" || form.cpf.value == null){
		alert("Preencha o campo CPF");
		form.cpf.focus();
		return false;
	}else if(form.nascimento.value == "" || form.nascimento.value == null){
		alert("Preencha o campo data nascimento");
		form.nascimento.focus();
		return false;
	}else if(form.cnh.value == "" || form.cnh.value == null){
		alert("Preencha o campo CNH");
		form.cnh.focus();
		return false;
	}else if(form.logradouro.value == "" || form.logradouro.value == null){
		alert("Preencha o campo logradouro");
		form.logradouro.focus();
		return false;
	}else if(form.numero.value == "" || form.numero.value == null){
		alert("Preencha o campo numero");
		form.numero.focus();
		return false;
	}else if(form.bairro.value == "" || form.bairro.value == null){
		alert("Preencha o campo bairro");
		form.bairro.focus();
		return false;
	}else if(form.municipio.value == "" || form.municipio.value == null){
		alert("Preencha o campo municipio");
		form.municipio.focus();
		return false;
	}else if(form.uf.value == "" || form.uf.value == null){
		alert("Preencha o campo UF");
		form.uf.focus();
		return false;
	}else {
		return true;
	}
}

function CadastroMarca() {
	window.onload;
	var form = document.getElementById("cadastromarca");
	
	if(form.marca.value == "" || form.marca.value == null){
		alert("Preencha o campo marca");
		form.marca.focus();
		return false;
	}else {
		return true;
	}
	
}
