package br.com.fafica.cto.persistencia;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.com.fafica.cto.modelo.ConectaBanco;
import br.com.fafica.cto.modelo.Semaforo;


public class SemaforoDAO {
	
	private PreparedStatement ps;
	private ResultSet resultado;
	
	public String Inserir(Semaforo semaforo) {
		String status;
		try {
			ps = ConectaBanco.IniciarConexao().prepareStatement("insert into semaforo values (?,?,?,?)");
			ps.setString(1, semaforo.getLatitude());
			ps.setString(2, semaforo.getLongitude());
			ps.setString(3, semaforo.getSentido());
			ps.setString(4, semaforo.getCruzamento());

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

	public ArrayList<Semaforo> Listar() {
		try {
			ps = ConectaBanco.IniciarConexao().prepareStatement("select" +
																	" * " +
																"from " +
																	"semaforo");
			ps.executeQuery();
			resultado = ps.executeQuery();
			Semaforo semaforo;
			ArrayList<Semaforo> lista = new ArrayList<Semaforo>();
			while (resultado.next()) {
				semaforo = new Semaforo(resultado.getString(1),resultado.getString(2));
				semaforo.setSentido(resultado.getString(3));
				semaforo.setCruzamento(resultado.getString(4));
				lista.add(semaforo);
			}
			ps.close();
			resultado.close();
			return lista;
		} catch (SQLException erro) {
			System.out.println(erro.getMessage()+"\nCodigo - "+erro.getErrorCode());
			return null;
		}

	}
	
	public String Alterar(Semaforo semaforo) {
		String status;
		try {
			ps = ConectaBanco.IniciarConexao()
					.prepareStatement("update semaforo set sentido=?, cruzamento=? where latitude = ? and longitude = ?");
			ps.setString(1, semaforo.getSentido());
			ps.setString(2, semaforo.getCruzamento());
			ps.setString(3, semaforo.getLatitude());
			ps.setString(4, semaforo.getLongitude());

			ps.executeUpdate();

			ps.close();
			status = "ok";
			return status;
		} catch (SQLException erro) {
			status = erro.getMessage()+"\nCodigo - "+erro.getErrorCode();
			
			return status;
		}

	}
	public Semaforo PesquisaUnica(Semaforo semaforo) {
		try {
			ps = ConectaBanco.IniciarConexao().prepareStatement("select * from semaforo where latitude = ? and longitude = ?");
			ps.setString(1, semaforo.getLatitude());
			ps.setString(2, semaforo.getLongitude());
			ps.executeQuery();
			resultado = ps.executeQuery();

			if (resultado.next()) {
				semaforo.setSentido(resultado.getString(3));			
				semaforo.setCruzamento(resultado.getString(4));
				
				ps.close();
				resultado.close();
				
				return semaforo;
			} else {
				ps.close();
				resultado.close();
				return null;
			}

		} catch (SQLException erro) {
			return null;
		}
	}
	
	public String Excluir(Semaforo semaforo) {
		String status;
		try {
			ps = ConectaBanco.IniciarConexao().prepareStatement("delete from semaforo where latitude = ? and longitude = ?");
			ps.setString(1, semaforo.getLatitude());
			ps.setString(2, semaforo.getLongitude());
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
