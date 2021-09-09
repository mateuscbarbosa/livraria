package br.com.alura.livraria.factory;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionFactory {

	public Connection getConnection() {
		try {
			String url = "jdbc:mysql://localhost:3306/livraria";
			String usuario = "teste";
			String senha = "Teste*senh4";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection conexao = DriverManager.getConnection(url,usuario,senha);
			
			return conexao;
			
		}catch(Exception e) {
			System.out.println("Ocorreu um erro na conexão: " + e.getMessage());
			throw new RuntimeException(e);
		}
	}
	
}
