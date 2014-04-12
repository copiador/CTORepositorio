package br.com.fafica.cto.exception;

public class Validacao {
	
	public boolean validaCampoVazio(String campo){
		
		String campoValida = campo;
		
		if(campoValida.equals("")){
			return true;
		}
				
		return false;
		
	}
	
	public boolean validaLetras(String campo){
		
		String campoValida = campo;
		
		if(campoValida.matches("^[[ ]|\\p{L}*]+$")){
			return false;
		}
		
		
		return true;
		
	}

}
