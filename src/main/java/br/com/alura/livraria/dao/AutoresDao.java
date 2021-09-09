package br.com.alura.livraria.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.alura.livraria.modelo.Autor;

public class AutoresDao {

	private Connection conexao;

	public AutoresDao(Connection conexao) {
		this.conexao = conexao;
	}
	
	public void cadastrar(Autor autor) {
		try {
			String sql = "INSERT INTO autor (nome,email,dataNascimento,miniCurriculo) VALUES (?,?,?,?)";
			
			PreparedStatement ps = conexao.prepareStatement(sql);
			ps.setString(1, autor.getNome());
			ps.setString(2, autor.getEmail());
			ps.setDate(3, Date.valueOf(autor.getDataNascimento()));
			ps.setString(4, autor.getMiniCurriculo());
			
			ps.execute();
			
//			conexao.close();
			
		}catch(SQLException e) {
			System.out.println("Ocorreu um erro ao inserir no Banco de Dados: " + e.getMessage());
			throw new RuntimeException(e);
		}
		
	}
	
	public List<Autor> listar(){
		try {
			String sql = "SELECT * FROM autor";
			
			PreparedStatement ps = conexao.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			
			List<Autor> autores = new ArrayList<>();
			
			while(rs.next()) {
				Autor a = new Autor();
				a.setNome(rs.getString("nome"));
				a.setEmail(rs.getString("email"));
				a.setDataNascimento(rs.getDate("dataNascimento").toLocalDate());
				a.getDataFormatada();
				a.setMiniCurriculo(rs.getString("miniCurriculo"));
				
				autores.add(a);
			}
			
//			conexao.close();
			
			return autores;
			
		}catch(SQLException e) {
			System.out.println("Ocorreu um erro ao buscar no Banco de Dados " +e.getMessage());
			throw new RuntimeException(e);
		}
	}
}
