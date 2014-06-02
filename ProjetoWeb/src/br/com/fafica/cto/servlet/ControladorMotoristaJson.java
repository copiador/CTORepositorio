package br.com.fafica.cto.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import br.com.fafica.cto.modelo.Motorista;
import br.com.fafica.cto.modelo.Semaforo;
import br.com.fafica.cto.persistencia.MotoristaDAO;
import br.com.fafica.cto.persistencia.SemaforoDAO;

/**
 * Servlet implementation class ControladorMotoristaJson
 */
public class ControladorMotoristaJson extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControladorMotoristaJson() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Motorista> arrayListMotorista = new ArrayList<Motorista>();
		arrayListMotorista = new MotoristaDAO().Listar();

		JSONObject jsonObject = null;
		JSONArray array = new JSONArray();

		for (Motorista motorista : arrayListMotorista) {

			jsonObject = new JSONObject();

			jsonObject.put("cpf", motorista.getCPF());
			
			array.add(jsonObject);

		}

		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.print(array);
	}

}
