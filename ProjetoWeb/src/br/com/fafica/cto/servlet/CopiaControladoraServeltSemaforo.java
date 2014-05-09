package br.com.fafica.cto.servlet;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import br.com.fafica.cto.modelo.Semaforo;
import br.com.fafica.cto.persistencia.SemaforoDAO;

/**
 * Servlet implementation class ControladorSemaforo
 */
public class CopiaControladoraServeltSemaforo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CopiaControladoraServeltSemaforo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("usuarioLogado") == null) {
			 response.sendRedirect("index.jsp");
		} else {
    	String cmd = request.getParameter("cmd");
    	PrintWriter resposta = response.getWriter();
		
		if (cmd.equalsIgnoreCase("excluir")) { //Efetuar exclusão
			Semaforo semaforo = new Semaforo(request.getParameter("latitude"), request.getParameter("longitude"));
			String status = new SemaforoDAO().Excluir(semaforo);
			if (status.equalsIgnoreCase("ok")){
				resposta.write("<html><head><body>");
				resposta.write("<script language='javascript' type='text/javascript'>alert('Semaforo excluido!');"
								+ "window.location.href='/ProjetoWeb/listarSemaforo.jsp';</script>");			
				resposta.write("</html></head></body>");
			} else {
				resposta.write("<html><head><body>");
				resposta.write("Erro ao tentar cadastrar - "+status+"<br><br><a href=listarSemaforo.jsp>Voltar</a>");
				resposta.write("</html></head></body>");
			}
			
		}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cmd = request.getParameter("cmd");
		PrintWriter resposta = response.getWriter();
		
		if (cmd.equalsIgnoreCase("cadastrar")) { //Efetuar Cadastro
			Semaforo semaforo = new Semaforo(request.getParameter("latitude"), request.getParameter("longitude"));
			semaforo.setSentido(request.getParameter("sentido"));
			semaforo.setCruzamento(request.getParameter("cruzamento"));
			
			String status = new SemaforoDAO().Inserir(semaforo);

			if (status.equalsIgnoreCase("ok")){
				
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
				
				FileWriter writeFile = null;

				try {
					String dirName = request.getServletContext().getRealPath("/");
					
					File f = new File(dirName + "js/pontos.json"); 
					f.delete();
					System.out.println(dirName);
					writeFile = new FileWriter(dirName + "js/pontos.json");
					writeFile.write(jsonObject.toJSONString());
					writeFile.close();
					System.out.println(array.toJSONString());
				} catch (IOException e) {
					System.out.println(e.getMessage());
					e.printStackTrace();
				}
				
				System.out.println(jsonObject);
				
					
				request.setAttribute("mensagem","Semaforo cadastrado com sucesso!");
				RequestDispatcher dispache = request.getRequestDispatcher("/CopyofcadastrarSemaforo.jsp");
				dispache.forward(request, response);
			} else {
				resposta.write("<html><head><body>");
				resposta.write("Erro ao tentar cadastrar - "+status+"<br><br><a href=cadastrarSemaforo.jsp>Voltar</a>");
				resposta.write("</html></head></body>");
			}
			
		}
		else if (cmd.equalsIgnoreCase("alterar")){ // Efetuar alteração
			Semaforo semaforo = new Semaforo(request.getParameter("latitude"), request.getParameter("longitude"));
			
			
			semaforo.setSentido(request.getParameter("sentido"));
			semaforo.setCruzamento(request.getParameter("cruzamento"));
			
			String status = new SemaforoDAO().Alterar(semaforo);
			if (status.equalsIgnoreCase("ok")){
				resposta.write("<html><head><body>");
				resposta.write("<script language='javascript' type='text/javascript'>alert('Semaforo alterado com sucesso!');"
								+ "window.location.href='/ProjetoWeb/listarSemaforo.jsp';</script>");			
				resposta.write("</html></head></body>");
			} else {
				resposta.write("<html><head><body>");
				resposta.write("Erro ao tentar cadastrar - "+status+"<br><br><a href=listarSemaforo.jsp>Voltar</a>");
				resposta.write("</html></head></body>");
			}
		}

	}
	}

