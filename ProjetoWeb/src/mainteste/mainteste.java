package mainteste;

import br.com.fafica.cto.controladora.Controladora;
import br.com.fafica.cto.modelo.Marca;
import br.com.fafica.cto.persistencia.MarcaDAO;

public class mainteste {

	public static void main(String[] args) {
		
		Marca marca2 = new Marca();
		marca2.setNumero(2);
		marca2.setDescricao("é a");
		
		
		Controladora controladora = new Controladora();
		String teste = controladora.excluirMarca(marca2);
		System.out.println(teste);
		
		
		

	}

}
