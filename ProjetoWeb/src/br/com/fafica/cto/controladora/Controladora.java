package br.com.fafica.cto.controladora;

import java.util.ArrayList;

import br.com.fafica.cto.exception.CampoVasioExpection;
import br.com.fafica.cto.exception.Validacao;
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
	private Validacao validacao;

	public Controladora(){
		this.repositorioMarcaVeiculo = new MarcaDAO();
		this.repositorioMotorista = new MotoristaDAO();
		this.repositorioSemaforo = new SemaforoDAO();
		this.repositorioUsuario = new UsuarioDAO();
		this.repositorioVeiculo = new VeiculoDAO();
		this.validacao = new Validacao();
	}
	
	
	//MARCA
	@Override
	public String cadastrarMarca(Marca marca) {
		
		String campo = marca.getDescricao();
		
		if(validacao.validaCampoVazio(campo)){
			new CampoVasioExpection("descrição");
		}
		
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
	public String cadastrarMotorista(Motorista motorista) {
		return repositorioMotorista.Inserir(motorista);
		
	}

	@Override
	public String excluirMotorista(Motorista motorista) {
		return repositorioMotorista.Excluir(motorista);
		
	}

	@Override
	public ArrayList<Motorista> listarMotorista() {
		
		return repositorioMotorista.Listar();
	}

	@Override
	public String alterarMotorista(Motorista motorista) {
		return repositorioMotorista.Alterar(motorista);
		
	}

	@Override
	public Motorista pesquisarMotoristaID(Motorista motorista) {
		
		return repositorioMotorista.PesquisarID(motorista);
	}
	
	//SEMAFORO

	@Override
	public String cadastrarSemaforo(Semaforo semaforo) {
		return repositorioSemaforo.Inserir(semaforo);
		
	}

	@Override
	public String excluirSemaforo(Semaforo semaforo) {
		return repositorioSemaforo.Excluir(semaforo);
		
	}

	@Override
	public ArrayList<Semaforo> listarSemaforo() {
		
		return repositorioSemaforo.Listar();
	}

	@Override
	public Semaforo pequisarSemaforoLatLong(Semaforo semaforo) {
		
		return repositorioSemaforo.PesquisaUnica(semaforo);
	}

	//USUARIO
	
	@Override
	public String cadastrarUsuario(Usuario usuario) {
		return repositorioUsuario.Inserir(usuario);
		
	}

	@Override
	public String excluirUsuario(Usuario usuario) {
		return repositorioUsuario.Excluir(usuario);
		
	}

	@Override
	public ArrayList<Usuario> listarUsuario() {
	
		return repositorioUsuario.Listar();
	}

	@Override
	public String verificaUsuario(Usuario usuario) {
		
		return repositorioUsuario.Verificar(usuario);
	}

	@Override
	public String alterarUsuario(Usuario usuario) {
		return repositorioUsuario.Alterar(usuario);
		
	}

	@Override
	public Usuario pesquisarID(Usuario usuario) {
		return repositorioUsuario.PesquisarID(usuario);
		
	}

	//VEICULO
	@Override
	public String cadastrarVeiculo(Veiculo veiculo) {
		return repositorioVeiculo.Inserir(veiculo);
		
	}

	@Override
	public String excluirVeiculo(Veiculo veiculo) {
		return repositorioVeiculo.Excluir(veiculo);
		
	}

	@Override
	public String alterarVeiculo(Veiculo veiculo) {
		return repositorioVeiculo.Alterar(veiculo);
		
	}

	@Override
	public Veiculo pesquisaVeiculo(Veiculo veiculo) {
		return repositorioVeiculo.PesquisarNum(veiculo);
		
	}

	@Override
	public ArrayList<Veiculo> listaVeiculo() {
		
		return repositorioVeiculo.Listar();
	}

}
