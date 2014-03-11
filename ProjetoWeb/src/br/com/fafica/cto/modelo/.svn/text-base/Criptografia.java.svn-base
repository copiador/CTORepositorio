package br.com.fafica.cto.modelo;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Realiza a criptografia atraves do metodo Criptografar()
 * @see {@link #Criptografar(String)}
 * 
 */

public class Criptografia {

	/**
	 * Usa a criptografia SHA-1 e retorna a senha criptografada 
	 * @param Senha
	 * @return String
	 */
	public String Criptografar(String Senha){
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-1");  
			BigInteger hash = new BigInteger(1, md.digest(Senha.getBytes()));  
			String SenhaNova = hash.toString(16);  
			return SenhaNova;
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}  
		  
	}
	
}
