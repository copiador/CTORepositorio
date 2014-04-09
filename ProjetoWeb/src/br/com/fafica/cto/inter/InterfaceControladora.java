package br.com.fafica.cto.inter;

import java.util.ArrayList;

import br.com.fafica.cto.modelo.Marca;
import br.com.fafica.cto.modelo.Motorista;
import br.com.fafica.cto.modelo.Semaforo;
import br.com.fafica.cto.modelo.Usuario;
import br.com.fafica.cto.modelo.Veiculo;

public interface InterfaceControladora {

	// MARCA
	public String cadastrarMarca(Marca marca);
	public String excluirMarca(Marca marca);
	public ArrayList<Marca> listarMarca();
	public String alterarMarca(Marca marca);
	public Marca pesquisarMarca(Marca marca);

	// MOTORISTA
	public void cadastrarMotorista(Motorista motorista);
	public void excluirMotorista(Motorista motorista);
	public ArrayList<Motorista> listarMotorista();
	public void alterarMotorista(Motorista motorista);
	public Motorista pesquisarMotoristaID(Motorista motorista);
	// SEMAFORO
	public void cadastrarSemaforo(Semaforo semaforo);
	public void excluirSemaforo(Semaforo semaforo);
	public ArrayList<Semaforo> listarSemaforo();
	public Semaforo pequisarSemaforoLatLong(Semaforo semaforo);
	// USUARIO
	public void cadastrarUsuario(Usuario usuario);
	public void excluirUsuario(Usuario usuario);
	public ArrayList<Usuario>listarUsuario();
	public String verificaUsuario(Usuario usuario);
	public void alterarUsuario(Usuario usuario);
	public void pesquisarID(Usuario usuario);
	// VEICULO
	public void cadastrarVeiculo(Veiculo veiculo);
	public void excluirVeiculo(Veiculo veiculo);
	public void alterarVeiculo(Veiculo veiculo);
	public void pesquisaVeiculo(Veiculo veiculo);
	public ArrayList<Veiculo> listaVeiculo();
	

}
