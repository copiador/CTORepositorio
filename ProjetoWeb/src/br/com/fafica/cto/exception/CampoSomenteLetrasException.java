package br.com.fafica.cto.exception;

public class CampoSomenteLetrasException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public CampoSomenteLetrasException(String campo){
		super("O campo " + campo + " não pode conter numeros ou caracteres especiais");
	}
	
	
	
}
