package br.com.fafica.cto.modelo;

public class Usuario {

	private int Codigo;
	private String Nome;
	private String CPF;
	private String Login;
	private String Senha;

	/**
	 * A senha ja é criptografada na criação do objeto
	 * 
	 * @param login
	 * @param senha
	 */
	public Usuario(String login, String senha) {

		this.Login = login;
		this.Senha = new Criptografia().Criptografar(senha);

	}

	public int getCodigo() {
		return Codigo;
	}

	public void setCodigo(int codigo) {
		Codigo = codigo;
	}

	public String getNome() {
		return Nome;
	}

	public void setNome(String nome) {
		Nome = nome;
	}

	public String getCPF() {
		return CPF;
	}

	public void setCPF(String cPF) {
		CPF = cPF;
	}

	public String getLogin() {
		return Login;
	}

	public void setLogin(String login) {
		Login = login;
	}

	public String getSenha() {
		return Senha;
	}

	public void setSenha(String senha) {
		Senha = senha;
	}

}
