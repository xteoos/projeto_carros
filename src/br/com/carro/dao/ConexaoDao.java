package br.com.carro.dao;

import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexaoDao {

    public static java.sql.Connection getConnection() throws SQLException, ClassNotFoundException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection("jdbc:mysql://localhost:3306/carros_db", "root", "root");
        } catch (SQLException e) {
            System.out.println("Erro de SQL " + e.getMessage());
        }
        return null;
    }
}
