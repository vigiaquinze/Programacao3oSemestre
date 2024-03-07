package webapp.newletterjdbc.connection;

import webapp.newletterjdbc.connection.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class IndexDAO {
     // atributo
     private Connection connection;

     // construtor
     public IndexDAO() {
         this.connection = ConnectionFactory.getConnection();
     }
     //criar Tabela
     public void criaTabela() {
 
         String sql = "CREATE TABLE IF NOT EXISTS newsletter_spring (ID SERIAL PRIMARY KEY, NOME VARCHAR(255), EMAIL VARCHAR(255), SENHA VARCHAR(255))";
         try (Statement stmt = this.connection.createStatement()) {
             stmt.execute(sql);
             System.out.println("Tabela criada com sucesso.");
         } catch (SQLException e) {
             throw new RuntimeException("Erro ao criar a tabela: " + e.getMessage(), e);
         } finally {
             ConnectionFactory.closeConnection(this.connection);
         }
     }
     //Cadastrar e-mail no banco
     public void cadastrar(String nome, String email, String senha) {
         PreparedStatement stmt = null;
         // Define a instrução SQL parametrizada para cadastrar na tabela
         String sql = "INSERT INTO newsletter_spring (nome, email, senha) VALUES (?, ?, ?)";
         try {
             stmt = connection.prepareStatement(sql);
             stmt.setString(1, nome);
             stmt.setString(2, email);
             stmt.setString(3, senha);
             stmt.executeUpdate();
             System.out.println("Dados inseridos com sucesso");
            
         } catch (SQLException e) {
             throw new RuntimeException("Erro ao inserir dados no banco de dados.", e);
         } finally {
             ConnectionFactory.closeConnection(connection,stmt);
         }
     }
}
