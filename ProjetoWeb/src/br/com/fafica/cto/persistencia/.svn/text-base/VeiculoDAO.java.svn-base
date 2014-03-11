package br.com.fafica.cto.persistencia;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.com.fafica.cto.modelo.ConectaBanco;
import br.com.fafica.cto.modelo.Veiculo;

public class VeiculoDAO {
	
	private PreparedStatement ps;
	private ResultSet resultado;
	
	public String Inserir(Veiculo veiculo) {
		String status;
		try {
			ps = ConectaBanco.IniciarConexao().prepareStatement("insert into veiculo (modelo," +
																					  "marca," +
																					  "chassi," +
																					  "renavam," +
																					  "placa," +
																					  "tipo) " +
																					  "values (?,?,?,?,?,?)");
			//ps.setInt   (1, veiculo.getNumero());
			ps.setString(1, veiculo.getModelo());
			ps.setInt	(2, veiculo.getIDMarca());
			ps.setString(3, veiculo.getChassi());
			ps.setInt   (4, veiculo.getRenavam());
			ps.setString(5, veiculo.getPlaca());
			ps.setString(6, veiculo.getTipo());
			

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
	
	public ArrayList<Veiculo> Listar() {
		try {
			ps = ConectaBanco.IniciarConexao().prepareStatement("SELECT" +
																	" V.NUMERO,   " +
																	" V.MODELO,   " +
																	" V.MARCA,	  " +
																	" M.DESCRICAO," +
																	" V.CHASSI,   " +
																	" V.RENAVAM,  " +
																	" V.PLACA,    " +
																	" V.TIPO      " +
																" FROM        " +
																	" VEICULO V,  " +
																	" MARCA M     " +
																" WHERE 	  " +
																	" V.MARCA = M.CODIGO");
  
			ps.executeQuery();
			resultado = ps.executeQuery();
			Veiculo veiculo;
			ArrayList<Veiculo> lista = new ArrayList<Veiculo>();
			while (resultado.next()) {
				veiculo = new Veiculo();
				veiculo.setNumero (resultado.getInt("V.NUMERO"));
				veiculo.setModelo (resultado.getString("V.MODELO"));
				veiculo.setIDMarca(resultado.getInt("V.MARCA"));
				veiculo.setMarca  (resultado.getString("M.DESCRICAO"));
				veiculo.setChassi (resultado.getString("V.CHASSI"));
				veiculo.setRenavam(resultado.getInt("V.RENAVAM"));
				veiculo.setPlaca  (resultado.getString("V.PLACA"));
				veiculo.setTipo   (resultado.getString("V.TIPO"));

				lista.add(veiculo);
			}
			ps.close();
			resultado.close();
			return lista;
		} catch (SQLException erro) {
			System.out.println(erro.getMessage()+"\nCodigo - "+erro.getErrorCode());
			return null;
		}

	}
	public Veiculo PesquisarNum(Veiculo veiculo) {
		try {
			ps = ConectaBanco.IniciarConexao().prepareStatement("SELECT " +
																	" * " +
																" FROM  " +
																	" VEICULO " +
																" WHERE " +
																	" NUMERO = ?");
			ps.setInt(1, veiculo.getNumero());
			ps.executeQuery();
			resultado = ps.executeQuery();

			if (resultado.next()) {
				veiculo.setModelo (resultado.getString("MODELO"));
				veiculo.setIDMarca(resultado.getInt("MARCA"));
				veiculo.setChassi (resultado.getString("CHASSI"));
				veiculo.setRenavam(resultado.getInt("RENAVAM"));
				veiculo.setPlaca  (resultado.getString("PLACA"));
				veiculo.setTipo   (resultado.getString("TIPO"));
				
				ps.close();
				resultado.close();
				
				return veiculo;
			} else {
				ps.close();
				resultado.close();
				return null;
			}

		} catch (SQLException erro) {
			return null;
		}
	}
	public String Excluir(Veiculo veiculo) {
		String status;
		try {
			ps = ConectaBanco.IniciarConexao().prepareStatement("delete from " +
																		"veiculo " +
																"where " +
																		"numero = ?");
			ps.setInt(1, veiculo.getNumero());
			ps.executeUpdate();

			ps.close();
			status = "ok";
			return status;
		} catch (SQLException erro) {
			status = erro.getMessage()+"\nCodigo - "+erro.getErrorCode();
			
			return status;
		}

	}
	public String Alterar(Veiculo veiculo) {
		String status;
		try {
			ps = ConectaBanco.IniciarConexao().prepareStatement("update veiculo " +
																	"set modelo = ?," +
																	" marca = ?," +
																	" chassi = ?," +
																	" renavam = ?," +
																	" placa = ?," +
																	" tipo = ?" +
																" where numero=?");
			ps.setString(1, veiculo.getModelo());
			ps.setInt   (2, veiculo.getIDMarca());
			ps.setString(3, veiculo.getChassi());
			ps.setInt   (4, veiculo.getRenavam());
			ps.setString(5, veiculo.getPlaca());
			ps.setString(6, veiculo.getTipo());
			ps.setInt   (7, veiculo.getNumero());

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
