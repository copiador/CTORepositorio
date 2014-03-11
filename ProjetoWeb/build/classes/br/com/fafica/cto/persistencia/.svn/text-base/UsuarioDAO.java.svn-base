package br.com.fafica.cto.persistencia;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.com.fafica.cto.modelo.ConectaBanco;
import br.com.fafica.cto.modelo.Usuario;

/**
 * Persistencia dos usuarios do sistema, inserir, alterar, excluir ou
 * selecionar.
 * 
 * @see {@link #Verificar(String, String)}
 */
public class UsuarioDAO {

	private PreparedStatement ps;
	private ResultSet resultado;

	/**
	 * Busca no banco de dados o usuario para se autentificar no sistema.
	 * 
	 * @param
	 * @return boolean
	 */
	public String Verificar(Usuario usuario) {
		String status;
		try {
			ps = ConectaBanco.IniciarConexao().prepareStatement("select " +
																	"login," +
																	"senha" +
																" from" +
																	" usuario" +
																" where" +
																	" login = ? " +
																	" and senha = ?");
			ps.setString(1, usuario.getLogin());
			ps.setString(2, usuario.getSenha());
			ps.executeQuery();
			resultado = ps.executeQuery();

			if (resultado.next()) {
				ps.close();
				resultado.close();
				return status = "ok";
			} else {
				ps.close();
				resultado.close();
				status = "vazio";
				return status;
			}

		} catch (SQLException erro) {
			status = erro.getMessage()+"\nCodigo - "+erro.getErrorCode();
			
			return status;
		}

	}

	/**
	 * Busca todos os usuario do banco de dados.
	 * 
	 * @return ArrayList<Usuario>
	 */
	public ArrayList<Usuario> Listar() {
		try {
			ps = ConectaBanco.IniciarConexao().prepareStatement("select" +
																	" * " +
																"from " +
																	"usuario");
			ps.executeQuery();
			resultado = ps.executeQuery();
			Usuario usuario;
			ArrayList<Usuario> lista = new ArrayList<Usuario>();
			while (resultado.next()) {
				usuario = new Usuario(resultado.getString(4),resultado.getString(5));
				usuario.setCodigo(resultado.getInt(1));
				usuario.setNome(resultado.getString(2));
				usuario.setCPF(resultado.getString(3));
				lista.add(usuario);
			}
			ps.close();
			resultado.close();
			return lista;
		} catch (SQLException erro) {
			System.out.println(erro.getMessage()+"\nCodigo - "+erro.getErrorCode());
			return null;
		}

	}

	public String Inserir(Usuario usuario) {
		String status;
		try {
			ps = ConectaBanco.IniciarConexao().prepareStatement("insert into usuario (nome,cpf,login,senha) values (?,?,?,?)");
			ps.setString(1, usuario.getNome());
			ps.setString(2, usuario.getCPF());
			ps.setString(3, usuario.getLogin());
			ps.setString(4, usuario.getSenha());

			ps.executeUpdate();

			ps.close();
			status = "ok";
			return status;
		} catch (SQLException erro) {
			if(erro.getErrorCode() == 1062){
				status = erro.getMessage()+"- Registro já existi!";
			}else{
			status = erro.getMessage()+"\nCodigo - "+erro.getErrorCode();
			}
			
			return status;
		}

	}
	public String Alterar(Usuario usuario) {
		String status;
		try {
			ps = ConectaBanco.IniciarConexao().prepareStatement("update usuario set nome=?, cpf=?, login=?, senha = ? where codigo = ?");
			ps.setString(1, usuario.getNome());
			ps.setString(2, usuario.getCPF());
			ps.setString(3, usuario.getLogin());
			ps.setString(4, usuario.getSenha());
			ps.setInt(5, usuario.getCodigo());

			ps.executeUpdate();

			ps.close();
			status = "ok";
			return status;
		} catch (SQLException erro) {
			status = erro.getMessage()+"\nCodigo - "+erro.getErrorCode();
			
			return status;
		}

	}
	public String Excluir(Usuario usuario) {
		String status;
		try {
			ps = ConectaBanco.IniciarConexao().prepareStatement("delete from usuario where codigo = ?");
			ps.setInt(1, usuario.getCodigo());
			ps.executeUpdate();

			ps.close();
			status = "ok";
			return status;
		} catch (SQLException erro) {
			status = erro.getMessage()+"\nCodigo - "+erro.getErrorCode();
			
			return status;
		}

	}
	public Usuario PesquisarID(Usuario usuario) {
		try {
			ps = ConectaBanco.IniciarConexao().prepareStatement("select * from usuario where codigo = ?");
			ps.setInt(1, usuario.getCodigo());
			ps.executeQuery();
			resultado = ps.executeQuery();

			if (resultado.next()) {
				usuario.setNome(resultado.getString(2));
				usuario.setCPF(resultado.getString(3));
				usuario.setLogin(resultado.getString(4));
				usuario.setSenha(resultado.getString(5));
				
				ps.close();
				resultado.close();
				
				return usuario;
			} else {
				ps.close();
				resultado.close();
				return null;
			}

		} catch (SQLException erro) {
			return null;
		}
	}

}
