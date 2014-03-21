package br.com.fafica.cto.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.fafica.cto.modelo.Marca;
import br.com.fafica.cto.persistencia.MarcaDAO;

/**
 * Servlet implementation class ControladorMarca
 */
public class ControladorMarca extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControladorMarca() {
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
			int num = Integer.parseInt(request.getParameter("id"));
			Marca marca = new Marca();
			marca.setNumero(num);
			
			String status = new MarcaDAO().Excluir(marca);
			
			if (status.equalsIgnoreCase("ok")){

				resposta.write("<html><head><body>");
				resposta.write("<script language='javascript' type='text/javascript'>alert('Marca excluida!');"
								+ "window.location.href='/ProjetoWeb/listarMarca.jsp';</script>");			
				resposta.write("</html></head></body>");
			} else {
				resposta.write("<html><head><body>");
				resposta.write("Erro ao tentar excluir - "+status+"<br><br><a href=listarMarca.jsp>Voltar</a>");
				resposta.write("</html></head></body>");
			}
			
		}
		}
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("usuarioLogado") == null) {
			 response.sendRedirect("index.jsp");
		} else {
		String cmd = request.getParameter("cmd");
		PrintWriter resposta = response.getWriter();
		
		if (cmd.equalsIgnoreCase("cadastrar")) { //Efetuar Cadastro
			Marca marca = new Marca();
			marca.setDescricao(request.getParameter("marca"));
			
			String status = new MarcaDAO().Inserir(marca);
			
			if (status.equalsIgnoreCase("ok")){
				request.setAttribute("mensagem","Marca cadastrada com sucesso!");
				RequestDispatcher dispache = request.getRequestDispatcher("/cadastrarMarca.jsp");
				dispache.forward(request, response);
			} else {
				resposta.write("<html><head><body>");
				resposta.write("Erro ao tentar cadastrar - "+status+"<br><br><a href=cadastrarMarca.jsp>Voltar</a>");
				resposta.write("</html></head></body>");
			}
			
		}else if (cmd.equalsIgnoreCase("alterar")){ // Efetuar alteração
			Marca marca = new Marca();
			marca.setNumero(Integer.parseInt(request.getParameter("id")));
			marca.setDescricao(request.getParameter("marca"));
			System.out.println(marca.getNumero());
			System.out.println(marca.getDescricao());
			String status = new MarcaDAO().Alterar(marca);
			
			if (status.equalsIgnoreCase("ok")){
				resposta.write("<html><head><body>");
				resposta.write("<script language='javascript' type='text/javascript'>alert('Marca alterada com sucesso!');"
								+ "window.location.href='/ProjetoWeb/listarMarca.jsp';</script>");			
				resposta.write("</html></head></body>");
			} else {
				resposta.write("<html><head><body>");
				resposta.write("Erro ao tentar cadastrar - "+status+"<br><br><a href=listarMarca.jsp>Voltar</a>");
				resposta.write("</html></head></body>");
			}
		}
		
	}
	}

}
