package br.com.fafica.cto.controladora;

import java.util.ArrayList;

import br.com.fafica.cto.inter.InterfaceControladora;
import br.com.fafica.cto.modelo.Marca;
import br.com.fafica.cto.modelo.Motorista;
import br.com.fafica.cto.modelo.Semaforo;
import br.com.fafica.cto.modelo.Usuario;
import br.com.fafica.cto.modelo.Veiculo;
import br.com.fafica.cto.persistencia.MarcaDAO;
import br.com.fafica.cto.persistencia.MotoristaDAO;
import br.com.fafica.cto.persistencia.SemaforoDAO;
import br.com.fafica.cto.persistencia.UsuarioDAO;
import br.com.fafica.cto.persistencia.VeiculoDAO;

public class Controladora implements InterfaceControladora{
	
	private MarcaDAO repositorioMarcaVeiculo;
	private MotoristaDAO repositorioMotorista;
	private SemaforoDAO repositorioSemaforo;
	private UsuarioDAO repositorioUsuario;
	private VeiculoDAO repositorioVeiculo;

	public Controladora(){
		this.repositorioMarcaVeiculo = new MarcaDAO();
		this.repositorioMotorista = new MotoristaDAO();
		this.repositorioSemaforo = new SemaforoDAO();
		this.repositorioUsuario = new UsuarioDAO();
		this.repositorioVeiculo = new VeiculoDAO();
	}
	
	
	//MARCA
	@Override
	public String cadastrarMarca(Marca marca) {
		return repositorioMarcaVeiculo.Inserir(marca);
		
	}

	@Override
	public String excluirMarca(Marca marca) {
		return repositorioMarcaVeiculo.Excluir(marca);
		
	}

	@Override
	public ArrayList<Marca> listarMarca() {
		
		return repositorioMarcaVeiculo.Listar();
	}

	@Override
	public String alterarMarca(Marca marca) {
		return repositorioMarcaVeiculo.Alterar(marca);
		
	}

	@Override
	public Marca pesquisarMarca(Marca marca) {
		return repositorioMarcaVeiculo.pesquisarMarca(marca);
	}
	
	//MOTORISTA

	@Override
	public void cadastrarMotorista(Motorista motorista) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void excluirMotorista(Motorista motorista) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ArrayList<Motorista> listarMotorista() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void alterarMotorista(Motorista motorista) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Motorista pesquisarMotoristaID(Motorista motorista) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//SEMAFORO

	@Override
	public void cadastrarSemaforo(Semaforo semaforo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void excluirSemaforo(Semaforo semaforo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ArrayList<Semaforo> listarSemaforo() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Semaforo pequisarSemaforoLatLong(Semaforo semaforo) {
		// TODO Auto-generated method stub
		return null;
	}

	//USUARIO
	
	@Override
	public void cadastrarUsuario(Usuario usuario) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void excluirUsuario(Usuario usuario) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ArrayList<Usuario> listarUsuario() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String verificaUsuario(Usuario usuario) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void alterarUsuario(Usuario usuario) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void pesquisarID(Usuario usuario) {
		// TODO Auto-generated method stub
		
	}

	//VEICULO
	@Override
	public void cadastrarVeiculo(Veiculo veiculo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void excluirVeiculo(Veiculo veiculo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void alterarVeiculo(Veiculo veiculo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void pesquisaVeiculo(Veiculo veiculo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ArrayList<Veiculo> listaVeiculo() {
		// TODO Auto-generated method stub
		return null;
	}

}
