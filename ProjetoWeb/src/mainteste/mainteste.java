package mainteste;

import br.com.fafica.cto.modelo.Marca;
import br.com.fafica.cto.persistencia.MarcaDAO;

public class mainteste {

	public static void main(String[] args) {
		Marca marca = new Marca();
		marca.setNumero(1);
		
		MarcaDAO dadosMarca = new MarcaDAO();
		
		
		marca.setDescricao("ADFSDFDSFDS");
		dadosMarca.Alterar(marca);
		

	}

}
