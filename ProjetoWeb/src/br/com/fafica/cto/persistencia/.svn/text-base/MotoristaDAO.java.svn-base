package br.com.fafica.cto.persistencia;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.com.fafica.cto.modelo.ConectaBanco;
import br.com.fafica.cto.modelo.Motorista;
import br.com.fafica.cto.modelo.Usuario;

public class MotoristaDAO {
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
	public ArrayList<Motorista> Listar() {
		try {
			ps = ConectaBanco.IniciarConexao().prepareStatement("select" +
																	" * " +
																"from " +
																	"motorista");
			ps.executeQuery();
			resultado = ps.executeQuery();
			Motorista motorista;
			ArrayList<Motorista> lista = new ArrayList<Motorista>();
			while (resultado.next()) {
				motorista = new Motorista();
				motorista.setNome(resultado.getString(1));
				motorista.setCPF(resultado.getString(2));
				motorista.setNascimento(resultado.getString(3));
				motorista.setCNH(resultado.getString(4));
				motorista.setLogradouro(resultado.getString(5));
				motorista.setNumero(resultado.getInt(6));
				motorista.setBairro(resultado.getString(7));
				motorista.setComplemento(resultado.getString(8));
				motorista.setMunicipio(resultado.getString(9));
				motorista.setUF(resultado.getString(10));
				lista.add(motorista);
			}
			ps.close();
			resultado.close();
			return lista;
		} catch (SQLException erro) {
			System.out.println(erro.getMessage()+"\nCodigo - "+erro.getErrorCode());
			return null;
		}

	}

	public String Inserir(Motorista motorista) {
		String status;
		try {
			
			ps = ConectaBanco.IniciarConexao().prepareStatement("insert into motorista values (?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, motorista.getNome());
			ps.setString(2, motorista.getCPF());
			ps.setString(3, motorista.getNascimento());
			ps.setString(4, motorista.getCNH());
			ps.setString(5, motorista.getLogradouro());
			ps.setInt(6, motorista.getNumero());
			ps.setString(7, motorista.getBairro());
			ps.setString(8, motorista.getComplemento());
			ps.setString(9, motorista.getMunicipio());
			ps.setString(10, motorista.getUF());

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
	public String Alterar(Motorista motorista) {
		String status;
		try {
			ps = ConectaBanco.IniciarConexao().prepareStatement("update motorista set nome=?, nascimento=?," +
																					" cnh = ?," +
																					"logradouro = ?," +
																					"numero = ?," +
																					"bairro = ?," +
																					"complemento = ?," +
																					"municipio = ?,"+
																					"uf = ?"+
																					"where cpf = ?");
			ps.setString(1, motorista.getNome());
			ps.setString(2, motorista.getNascimento());
			ps.setString(3, motorista.getCNH());
			ps.setString(4, motorista.getLogradouro());
			ps.setInt	(5, motorista.getNumero());
			ps.setString(6, motorista.getBairro());
			ps.setString(7, motorista.getComplemento());
			ps.setString(8, motorista.getMunicipio());
			ps.setString(9, motorista.getUF());
			ps.setString(10, motorista.getCPF());

			ps.executeUpdate();

			ps.close();
			status = "ok";
			return status;
		} catch (SQLException erro) {
			status = erro.getMessage()+"\nCodigo - "+erro.getErrorCode();
			
			return status;
		}

	}
	public String Excluir(Motorista motorista) {
		String status;
		try {
			ps = ConectaBanco.IniciarConexao().prepareStatement("delete from motorista where cpf = ?");
			ps.setString(1, motorista.getCPF());
			ps.executeUpdate();
			
			ps.close();
			status = "ok";
			return status;
		} catch (SQLException erro) {
			status = erro.getMessage()+"\nCodigo - "+erro.getErrorCode();
			
			return status;
		}

	}
	public Motorista PesquisarID(Motorista motorista) {
		try {
			ps = ConectaBanco.IniciarConexao().prepareStatement("select * from motorista where cpf = ?");
			ps.setString(1, motorista.getCPF());
			ps.executeQuery();
			resultado = ps.executeQuery();

			if (resultado.next()) {
				
				motorista.setNome(resultado.getString(1));
				motorista.setNascimento(resultado.getString(3));
				motorista.setCNH(resultado.getString(4));
				motorista.setLogradouro(resultado.getString(5));
				motorista.setNumero(resultado.getInt(6));
				motorista.setBairro(resultado.getString(7));
				motorista.setComplemento(resultado.getString(8));
				motorista.setMunicipio(resultado.getString(9));
				motorista.setUF(resultado.getString(10));
				
				ps.close();
				resultado.close();
				
				return motorista;
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
