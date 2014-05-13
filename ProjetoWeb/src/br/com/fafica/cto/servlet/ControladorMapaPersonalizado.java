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

import br.com.fafica.cto.modelo.Semaforo;
import br.com.fafica.cto.persistencia.SemaforoDAO;

/**
 * Servlet implementation class ControladoraMapaPersonalizado
 */
public class ControladorMapaPersonalizado extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControladorMapaPersonalizado() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Semaforo> arrayListSemaforo = new ArrayList<Semaforo>();
		arrayListSemaforo = new SemaforoDAO().Listar();

		JSONObject jsonObject = null;
		JSONArray array = new JSONArray();

		for (Semaforo semaforo2 : arrayListSemaforo) {

			jsonObject = new JSONObject();

			jsonObject.put("latitude", semaforo2.getLatitude());
			jsonObject.put("longitude", semaforo2.getLongitude());
			array.add(jsonObject);

		}

		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.print(array);
	}

}
