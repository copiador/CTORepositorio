package br.com.fafica.cto.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import br.com.fafica.cto.modelo.Usuario;
import br.com.fafica.cto.persistencia.UsuarioDAO;

/**
 * Servlet implementation class ControladorUsuarioADM
 */
public class ControladorUsuarioADM extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ControladorUsuarioADM() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String cmd = request.getParameter("cmd");
		PrintWriter resposta = response.getWriter();

		if (cmd.equalsIgnoreCase("cadastrar")) { // Efetuar Cadastro

			Usuario usuario = new Usuario(request.getParameter("login"),
					request.getParameter("senha"));
			usuario.setNome(request.getParameter("nome"));
			usuario.setCPF(request.getParameter("cpf"));
			String status = new UsuarioDAO().Inserir(usuario);

			if (status.equalsIgnoreCase("ok")) {
				request.setAttribute("mensagem",
						"Usuario cadastrado com sucesso!");
				RequestDispatcher dispache = request
						.getRequestDispatcher("/cadastrarUsuarioADM.jsp");
				dispache.forward(request, response);
			} else {
				resposta.write("<html><head><body>");
				resposta.write("Erro ao tentar cadastrar - " + status
						+ "<br><br><a href=cadastrarUsuarioADM.jsp>Voltar</a>");
				resposta.write("</html></head></body>");
			}

		}
	}
}
