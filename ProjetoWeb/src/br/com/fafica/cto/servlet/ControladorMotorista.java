package br.com.fafica.cto.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.fafica.cto.modelo.Motorista;
import br.com.fafica.cto.persistencia.MotoristaDAO;

/**
 * Servlet implementation class ControladorMotorista
 */
public class ControladorMotorista extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControladorMotorista() {
        super();
       
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
			String id = request.getParameter("id");
			Motorista motorista = new Motorista();
			motorista.setCPF(id);
			String status = new MotoristaDAO().Excluir(motorista);
			if (status.equalsIgnoreCase("ok")){

				resposta.write("<html><head><body>");
				resposta.write("<script language='javascript' type='text/javascript'>alert('Motorista excluido!');"
								+ "window.location.href='/ProjetoWeb/listarMotorista.jsp';</script>");			
				resposta.write("</html></head></body>");
			} else {
				resposta.write("<html><head><body>");
				resposta.write("Erro ao tentar excluir - "+status+"<br><br><a href=listarMotorista.jsp>Voltar</a>");
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
			Motorista motorista =  new Motorista();
			motorista.setNome(request.getParameter("nome"));
			motorista.setCPF(request.getParameter("cpf"));
			System.out.println(motorista.getCPF());
			motorista.setNascimento(request.getParameter("nascimento"));
			motorista.setCNH(request.getParameter("cnh"));
			motorista.setLogradouro(request.getParameter("logradouro"));
			motorista.setNumero(Integer.parseInt(request.getParameter("numero")));
			motorista.setBairro(request.getParameter("bairro"));
			motorista.setComplemento(request.getParameter("complemento"));
			motorista.setMunicipio(request.getParameter("municipio"));
			motorista.setUF(request.getParameter("uf"));
			
			String status = new MotoristaDAO().Inserir(motorista);
		
			if (status.equalsIgnoreCase("ok")){
				request.setAttribute("mensagem","Motorista cadastrado com sucesso!");
				RequestDispatcher dispache = request.getRequestDispatcher("/cadastrarMotorista.jsp");
				dispache.forward(request, response);
			} else {
				resposta.write("<html><head><body>");
				resposta.write("Erro ao tentar cadastrar - "+status+"<br><br><a href=cadastrarMotorista.jsp>Voltar</a>");
				resposta.write("</html></head></body>");
			}
			
		}
		else if (cmd.equalsIgnoreCase("alterar")){ // Efetuar alteração
			String id = request.getParameter("id");
			Motorista motorista =  new Motorista();
			motorista.setNome(request.getParameter("nome"));
			motorista.setCPF(id);
			motorista.setNascimento(request.getParameter("nascimento"));
			motorista.setCNH(request.getParameter("cnh"));
			motorista.setLogradouro(request.getParameter("logradouro"));
			motorista.setNumero(Integer.parseInt(request.getParameter("numero")));
			motorista.setBairro(request.getParameter("bairro"));
			motorista.setComplemento(request.getParameter("complemento"));
			motorista.setMunicipio(request.getParameter("municipio"));
			motorista.setUF(request.getParameter("uf"));
			
			String status = new MotoristaDAO().Alterar(motorista);
			if (status.equalsIgnoreCase("ok")){
				resposta.write("<html><head><body>");
				resposta.write("<script language='javascript' type='text/javascript'>alert('Motorista alterado com sucesso!');"
								+ "window.location.href='/ProjetoWeb/listarMotorista.jsp';</script>");			
				resposta.write("</html></head></body>");
			} else {
				resposta.write("<html><head><body>");
				resposta.write("Erro ao tentar cadastrar - "+status+"<br><br><a href=listarMotorista.jsp>Voltar</a>");
				resposta.write("</html></head></body>");
			}
		}
	}
	}
}
