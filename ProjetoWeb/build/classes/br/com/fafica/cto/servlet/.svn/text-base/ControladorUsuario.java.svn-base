package br.com.fafica.cto.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.fafica.cto.modelo.Usuario;
import br.com.fafica.cto.persistencia.UsuarioDAO;

/**
 * Servlet implementation class ControladorUsuario
 */
public class ControladorUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ControladorUsuario() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("usuarioLogado") == null) {
			response.sendRedirect("index.jsp");
		} else {
			String cmd = request.getParameter("cmd");
			PrintWriter resposta = response.getWriter();

			if (cmd.equalsIgnoreCase("excluir")) { // Efetuar exclusão
				int id = Integer.parseInt(request.getParameter("id"));
				Usuario usuario = new Usuario("", "");
				usuario.setCodigo(id);
				String status = new UsuarioDAO().Excluir(usuario);
				;
				if (status.equalsIgnoreCase("ok")) {

					resposta.write("<html><head><body>");
					resposta.write("<script language='javascript' type='text/javascript'>alert('Usuario excluido!');"
							+ "window.location.href='/ProjetoWeb/listarUsuario.jsp';</script>");
					resposta.write("</html></head></body>");
				} else {
					resposta.write("<html><head><body>");
					resposta.write("Erro ao tentar excluir - " + status
							+ "<br><br><a href=listarUsuario.jsp>Voltar</a>");
					resposta.write("</html></head></body>");
				}

			}else if (cmd.equalsIgnoreCase("logout")) { // Efetuar alteração
				
					// remove o atributo da sessão
					session.removeAttribute("usuarioLogado");
					// finaliza a sessão
					session.invalidate();
					response.sendRedirect("index.jsp");
			} 
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getParameter("cmd");
		PrintWriter resposta = response.getWriter();

		if (cmd.equalsIgnoreCase("login")) { // Efetuar Login
			Usuario usuario = new Usuario(request.getParameter("login"),
					request.getParameter("senha"));
			String status = new UsuarioDAO().Verificar(usuario);
			if (status.equalsIgnoreCase("ok")) {
				// Redirecione para paginal principal
				HttpSession session = request.getSession();
				session.setAttribute("usuarioLogado", usuario);
				response.sendRedirect("/ProjetoWeb/home.jsp");

			} else if (status.equals("vazio")) {

				request.setAttribute("mensagem",
						"Login e/ou senha incorretos...");
				RequestDispatcher dispache = request
						.getRequestDispatcher("/index.jsp");
				dispache.forward(request, response);

			} else {

				resposta.write("<html><head><body>");
				resposta.write("Erro ao tentar realizar o login - " + status
						+ "<br><br><a href=index.jsp>Voltar</a>");
				resposta.write("</html></head></body>");

			}
		} else if (cmd.equalsIgnoreCase("cadastrar")) { // Efetuar Cadastro
			HttpSession session = request.getSession(false);
			if (session == null
					|| session.getAttribute("usuarioLogado") == null) {
				response.sendRedirect("index.jsp");
			} else {
				Usuario usuario = new Usuario(request.getParameter("login"),
						request.getParameter("senha"));
				usuario.setNome(request.getParameter("nome"));
				usuario.setCPF(request.getParameter("cpf"));
				String status = new UsuarioDAO().Inserir(usuario);
				
				if (status.equalsIgnoreCase("ok")) {
					request.setAttribute("mensagem",
							"Usuario cadastrado com sucesso!");
					RequestDispatcher dispache = request
							.getRequestDispatcher("/cadastrarUsuario.jsp");
					dispache.forward(request, response);
				} else {
					resposta.write("<html><head><body>");
					resposta.write("Erro ao tentar cadastrar - " + status
							+ "<br><br><a href=cadastrarUsuario.jsp>Voltar</a>");
					resposta.write("</html></head></body>");
				}
			}
		} else if (cmd.equalsIgnoreCase("alterar")) { // Efetuar alteração
			HttpSession session = request.getSession(false);
			if (session == null
					|| session.getAttribute("usuarioLogado") == null) {
				response.sendRedirect("index.jsp");
			} else {
				int id = Integer.parseInt(request.getParameter("id"));
				Usuario usuario = new Usuario(request.getParameter("login"),
						request.getParameter("senha"));
				usuario.setCodigo(id);
				usuario.setNome(request.getParameter("nome"));
				usuario.setCPF(request.getParameter("cpf"));
				String status = new UsuarioDAO().Alterar(usuario);
				if (status.equalsIgnoreCase("ok")) {
					resposta.write("<html><head><body>");
					resposta.write("<script language='javascript' type='text/javascript'>alert('Usuario alterado com sucesso!');"
							+ "window.location.href='/ProjetoWeb/listarUsuario.jsp';</script>");
					resposta.write("</html></head></body>");
				} else {
					resposta.write("<html><head><body>");
					resposta.write("Erro ao tentar cadastrar - " + status
							+ "<br><br><a href=listarUsuario.jsp>Voltar</a>");
					resposta.write("</html></head></body>");
				}
			}
		} else {
			response.sendRedirect("index.jsp");
		}
	}

}
