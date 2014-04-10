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
	public String cadastrarMotorista(Motorista motorista);
	public String excluirMotorista(Motorista motorista);
	public ArrayList<Motorista> listarMotorista();
	public String alterarMotorista(Motorista motorista);
	public Motorista pesquisarMotoristaID(Motorista motorista);
	// SEMAFORO
	public String cadastrarSemaforo(Semaforo semaforo);
	public String excluirSemaforo(Semaforo semaforo);
	public ArrayList<Semaforo> listarSemaforo();
	public Semaforo pequisarSemaforoLatLong(Semaforo semaforo);
	// USUARIO
	public String cadastrarUsuario(Usuario usuario);
	public String excluirUsuario(Usuario usuario);
	public ArrayList<Usuario>listarUsuario();
	public String verificaUsuario(Usuario usuario);
	public String alterarUsuario(Usuario usuario);
	public Usuario pesquisarID(Usuario usuario);
	// VEICULO
	public String cadastrarVeiculo(Veiculo veiculo);
	public String excluirVeiculo(Veiculo veiculo);
	public String alterarVeiculo(Veiculo veiculo);
	public Veiculo pesquisaVeiculo(Veiculo veiculo);
	public ArrayList<Veiculo> listaVeiculo();
	

}
