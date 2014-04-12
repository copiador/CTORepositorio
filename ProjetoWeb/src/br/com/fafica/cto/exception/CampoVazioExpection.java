package br.com.fafica.cto.exception;

public class CampoVazioExpection extends Exception {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public CampoVazioExpection(String campo){
		super("O campo " + campo + " está vazio");
	}

}
