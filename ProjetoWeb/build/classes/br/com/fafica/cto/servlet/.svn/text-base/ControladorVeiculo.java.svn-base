package br.com.fafica.cto.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.fafica.cto.modelo.Veiculo;
import br.com.fafica.cto.persistencia.VeiculoDAO;

/**
 * Servlet implementation class ControladorVeiculo
 */
public class ControladorVeiculo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControladorVeiculo() {
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
			int num = Integer.parseInt(request.getParameter("num"));
			Veiculo veiculo = new Veiculo();
			veiculo.setNumero(num);
			String status = new VeiculoDAO().Excluir(veiculo);
			if (status.equalsIgnoreCase("ok")){

				resposta.write("<html><head><body>");
				resposta.write("<script language='javascript' type='text/javascript'>alert('Veiculo excluido!');"
								+ "window.location.href='/ProjetoWeb/listarVeiculo.jsp';</script>");			
				resposta.write("</html></head></body>");
			} else {
				resposta.write("<html><head><body>");
				resposta.write("Erro ao tentar excluir - "+status+"<br><br><a href=listarVeiculo.jsp>Voltar</a>");
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
			//int numero = Integer.parseInt(request.getParameter("numero"));
			int renavam = Integer.parseInt(request.getParameter("renavam"));
			int idmarca = Integer.parseInt(request.getParameter("marca"));
			Veiculo veiculo = new Veiculo();
			//veiculo.setNumero(numero);
			veiculo.setModelo(request.getParameter("modelo"));
			veiculo.setIDMarca(idmarca);
			veiculo.setChassi(request.getParameter("chassi"));
			veiculo.setRenavam(renavam);
			veiculo.setPlaca(request.getParameter("placa"));
			veiculo.setTipo(request.getParameter("tipo"));
			
			String status = new VeiculoDAO().Inserir(veiculo);
			
			if (status.equalsIgnoreCase("ok")){
				request.setAttribute("mensagem","Veiculo cadastrado com sucesso!");
				RequestDispatcher dispache = request.getRequestDispatcher("/cadastrarVeiculo.jsp");
				dispache.forward(request, response);
			} else {
				resposta.write("<html><head><body>");
				resposta.write("Erro ao tentar cadastrar - "+status+"<br><br><a href=cadastrarVeiculo.jsp>Voltar</a>");
				resposta.write("</html></head></body>");
			}
			
		}else if (cmd.equalsIgnoreCase("alterar")){ // Efetuar alteração
			int num = Integer.parseInt(request.getParameter("num"));
			int renavam = Integer.parseInt(request.getParameter("renavam"));
			int idmarca = Integer.parseInt(request.getParameter("marca"));
			Veiculo veiculo = new Veiculo();
			veiculo.setNumero(num);
			veiculo.setModelo(request.getParameter("modelo"));
			veiculo.setIDMarca(idmarca);
			veiculo.setChassi(request.getParameter("chassi"));
			veiculo.setRenavam(renavam);
			veiculo.setPlaca(request.getParameter("placa"));
			veiculo.setTipo(request.getParameter("tipo"));
			String status = new VeiculoDAO().Alterar(veiculo);
			if (status.equalsIgnoreCase("ok")){
				resposta.write("<html><head><body>");
				resposta.write("<script language='javascript' type='text/javascript'>alert('Veiculo alterado com sucesso!');"
								+ "window.location.href='/ProjetoWeb/listarVeiculo.jsp';</script>");			
				resposta.write("</html></head></body>");
			} else {
				resposta.write("<html><head><body>");
				resposta.write("Erro ao tentar cadastrar - "+status+"<br><br><a href=listarVeiculo.jsp>Voltar</a>");
				resposta.write("</html></head></body>");
			}
		}
		
	}
	}
}
