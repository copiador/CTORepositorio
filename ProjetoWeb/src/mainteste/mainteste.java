package mainteste;

import br.com.fafica.cto.controladora.Controladora;
import br.com.fafica.cto.exception.CampoSomenteLetrasException;
import br.com.fafica.cto.exception.CampoVazioExpection;
import br.com.fafica.cto.modelo.Marca;



public class mainteste {

	public static void main(String[] args) {
		
		
		
		
		
		
		
		try {
			
			Controladora controladora = new Controladora();
			String dados = "dados";
			
			Marca marca = new Marca();
			marca.setDescricao("");
			
			
			controladora.cadastrarMarca(marca);
		
		
		} catch (CampoSomenteLetrasException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.getMessage());
		} catch (CampoVazioExpection e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		
		

	}

}
