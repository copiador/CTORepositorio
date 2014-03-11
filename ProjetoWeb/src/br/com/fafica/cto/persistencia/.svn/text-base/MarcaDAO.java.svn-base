package br.com.fafica.cto.persistencia;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.com.fafica.cto.modelo.ConectaBanco;
import br.com.fafica.cto.modelo.Marca;

public class MarcaDAO {
	private PreparedStatement ps;
	private ResultSet resultado;
	
	public String Inserir(Marca marca) {
		String status;
		try {
			ps = ConectaBanco.IniciarConexao().prepareStatement("insert into marca (descricao)" +
																					  " values (?)");
			ps.setString(1, marca.getDescricao());			

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
	public ArrayList<Marca> Listar() {
		try {
			ps = ConectaBanco.IniciarConexao().prepareStatement("select" +
																	" * " +
																"from " +
																	"marca");
			
			ps.executeQuery();
			resultado = ps.executeQuery();
			Marca marca;
			ArrayList<Marca> lista = new ArrayList<Marca>();
			while (resultado.next()) {
				marca = new Marca();
				marca.setNumero(resultado.getInt(1));
				marca.setDescricao(resultado.getString(2));
				
				lista.add(marca);
			}
			ps.close();
			resultado.close();
			return lista;
		} catch (SQLException erro) {
			System.out.println(erro.getMessage()+"\nCodigo - "+erro.getErrorCode());
			return null;
		}

	}
	public String Excluir(Marca marca) {
		String status;
		try {
			ps = ConectaBanco.IniciarConexao().prepareStatement("delete from " +
																		"marca " +
																"where " +
																		"codigo = ?");
			ps.setInt(1, marca.getNumero());
			ps.executeUpdate();

			ps.close();
			status = "ok";
			return status;
		} catch (SQLException erro) {
			status = erro.getMessage()+"\nCodigo - "+erro.getErrorCode();
			
			return status;
		}

	}
	public String Alterar(Marca marca) {
		String status;
		try {
			ps = ConectaBanco.IniciarConexao().prepareStatement("update marca " +
																	"set descricao = ?," +
																" where codigo=?");
			ps.setString(1, marca.getDescricao());
			ps.setInt(2, marca.getNumero());

			ps.executeUpdate();

			ps.close();
			status = "ok";
			return status;
			
		} catch (SQLException erro) {
			status = erro.getMessage()+"\nCodigo - "+erro.getErrorCode();
			
			return status;
		}

	}




}
