package br.com.fafica.cto.exception;

public class CampoVasioExpection extends Exception {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public CampoVasioExpection(String campo){
		super("O campo" + campo + "está vazio");
	}

}
