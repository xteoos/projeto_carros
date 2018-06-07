package br.com.usuario.dao;


import br.com.carro.dao.ConexaoDao;
import br.com.usuario.entidade.Usuario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UsuarioDao {

    public String addUsuario(Usuario usuario) throws Exception {
        String msg = "";
        Connection conexao = ConexaoDao.getConnection();
        try {
            PreparedStatement statement = conexao.prepareStatement(INSERT);
            statement.setString(1, usuario.getNome());
            statement.setString(2, usuario.getEmail());
            statement.setString(3, usuario.getSenha());
            statement.execute();
            msg = "Usuário inserido com sucesso!!";
        } catch (Exception e) {
            System.out.println("Erro de SQL " + e.getMessage());
            msg = "Erro ao inserir usuario";
        }
        conexao.close();
        return msg;
    }

    public boolean loginUsuario(String email, String senha) throws Exception {
        Connection connection = ConexaoDao.getConnection();

        try {

            PreparedStatement login = connection.prepareStatement(SELECTLOGIN);
            login.setString(1, email);
            login.setString(2, senha);
            ResultSet result = login.executeQuery();

            if (result.next()) {
                return true;
            }

        } catch (Exception e) {
            System.out.println("Erro de SQL ");
        }
        return false;
    }

    private final static String INSERT = "INSERT INTO USUARIO (NOME, EMAIL, SENHA) VALUES (?, ?, ?)";
    private final static String SELECTLOGIN = "SELECT * FROM USUARIO WHERE EMAIL=? AND SENHA = ?";


}