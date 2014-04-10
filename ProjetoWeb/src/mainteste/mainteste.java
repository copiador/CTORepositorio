package mainteste;

import br.com.fafica.cto.controladora.Controladora;
import br.com.fafica.cto.modelo.Marca;


public class mainteste {

	public static void main(String[] args) {
		
		Marca marca2 = new Marca();
	
		marca2.setDescricao("test3e");
		
		
		Controladora controladora = new Controladora();
		String teste = controladora.cadastrarMarca(marca2);
		System.out.println(teste);
		
		

	}

}
