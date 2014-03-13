package br.com.fafica.cto.modelo;
import java.sql.*;
import javax.swing.JOptionPane;

/**
 * Classe de conexao com a banco de dados.
 */

public class ConectaBanco {

             private static String status;
             private static Connection connection;          
            
/**
 * Tenta fazer a conexao com o banco de dados, para saber o estado da conexao use o metodo EstadoConexao() 
 * @see {@link #EstadoConexao()}
 * @return connection
 */
public static Connection IniciarConexao() {
        
try {

/** Carregando o JDBC Driver padrao. */

Class.forName("com.mysql.jdbc.Driver");

/** Configurando a nossa conexao com um banco de dados. */
        
            String url = "jdbc:mysql://localhost:3306/cto";
            String username = "root";        //nome de um usuario de seu BD      
            String password = "";      //sua senha de acesso

            connection = DriverManager.getConnection(url, username, password);

            /**Testa sua conexao. */  

            if (connection != null) {

                status = "Banco de dados conectado com sucesso!";
                return connection;
                
            } else {

                status = "Nao foi possivel realizar conexao com o banco de dados!\n"
                		+"Verifique usuario, senha ou url";
                System.exit(0); //Saia do sistema
                return null;
            }

        } catch (ClassNotFoundException e) {  //Driver nao encontrado

            JOptionPane.showMessageDialog(null,"O driver expecificado nao foi encontrado.\n\n"+e,"Erro do BD", JOptionPane.ERROR_MESSAGE);
            System.exit(0); //Saia do sistema
            return null;

        } catch (SQLException e) { //Dados informados sao invalidos

            JOptionPane.showMessageDialog(null,"Nao foi possivel conectar ao Banco de Dados.\n\n"+e,"Erro do BD", JOptionPane.ERROR_MESSAGE);
            System.exit(0); //Saia do sistema
            return null;

        }

    }

    /**Retorna o estado da conexao com o banco de dados. 
     * @return String
     * */

    public static String EstadoConexao() {
    	JOptionPane.showMessageDialog(null, status);
        return status;

     }
 
}