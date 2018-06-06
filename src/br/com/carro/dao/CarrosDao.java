package br.com.carro.dao;

import br.com.carro.entidade.Carro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CarrosDao {

    public ArrayList<Carro> getTodos() throws SQLException, ClassNotFoundException {
        ArrayList<Carro> carros = new ArrayList<>();
        Connection connection = ConexaoDao.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(SELECTALL);
        ResultSet resultSet = preparedStatement.executeQuery();

        while (resultSet.next()) {
            Carro carro = new Carro();
            carro.setIdCarro(resultSet.getInt("id"));
            carro.setFabricante(resultSet.getString("fabricante"));
            carro.setModelo(resultSet.getString("modelo"));
            carro.setPlaca(resultSet.getString("placa"));
            carro.setValor(resultSet.getDouble("valor"));
            carro.setAno(resultSet.getInt("ano"));
            carros.add(carro);
        }

        connection.close();
        return carros;
    }

    public Carro getCarro(int idCarro) throws SQLException, ClassNotFoundException {
        Carro carro = null;
        Connection connection = ConexaoDao.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(SELECT);
        preparedStatement.setInt(1, idCarro);
        ResultSet resultSet = preparedStatement.executeQuery();

        if (resultSet.next()) {
            carro = new Carro();
            carro.setIdCarro(resultSet.getInt("id"));
            carro.setFabricante(resultSet.getString("fabricante"));
            carro.setModelo(resultSet.getString("modelo"));
            carro.setPlaca(resultSet.getString("placa"));
            carro.setValor(resultSet.getDouble("valor"));
            carro.setAno(resultSet.getInt("ano"));
        }
        connection.close();
        return carro;
    }

    public void getFabricante() throws SQLException, ClassNotFoundException {
        Carro carro = null;
        Connection connection = ConexaoDao.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(SELECT_NOME_FABRICANTE);
        ResultSet resultSet = preparedStatement.executeQuery();

        if (resultSet.next()) {
            carro = new Carro();
            carro.setFabricante(resultSet.getString("fabricante"));
        }
        connection.close();
    }

    public Carro getCarroByFabricante(String fabricante) throws SQLException, ClassNotFoundException {
        Carro carro = null;
        Connection connection = ConexaoDao.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(SELECT_FABRICANTE);
        preparedStatement.setString(1, fabricante);
        ResultSet resultSet = preparedStatement.executeQuery();

        if (resultSet.next()) {
            carro = new Carro();
            carro.setFabricante(resultSet.getString("fabricante"));
            carro.setModelo(resultSet.getString("modelo"));
            carro.setPlaca(resultSet.getString("placa"));
            carro.setValor(resultSet.getDouble("valor"));
            carro.setAno(resultSet.getInt("ano"));
        }
        connection.close();
        return carro;
    }


    public Boolean excluirCarro(Carro carro) throws Exception {
        Connection conexao = ConexaoDao.getConnection();
        try {
            PreparedStatement statement = conexao.prepareStatement(DELETE);
            statement.setInt(1, carro.getIdCarro());
            statement.execute();
            if (statement.getUpdateCount()!=0) {
                System.out.println("Carro excluído com sucesso!");
                return true;
            } else {
                return false;
            }

        } catch (Exception e) {
            System.out.println("Erro de SQL " + e.getMessage());
            System.out.println("Erro ao excluir carro!");
        }
        conexao.close();
        return false;
    }
    public String addCarro (Carro carro) throws Exception{
            String msg = "";
        Connection conexao = ConexaoDao.getConnection();
        try {
            PreparedStatement statement = conexao.prepareStatement(INSERT);
            statement.setString(1, carro.getFabricante());
            statement.setString(2, carro.getModelo());
            statement.setString(3, carro.getPlaca());
            statement.setDouble(4, carro.getValor());
            statement.setInt(5, carro.getAno());
            statement.execute();
            msg = "Carro inserido com sucesso!!";
        }catch (Exception e){
            System.out.println("Erro de SQL "+e.getMessage());
            msg = "Erro ao inserir carro";
        }
        conexao.close();
        return msg;
    }


    public String atualizaCarro (Carro carro) throws Exception{
        String msg = "";
        Connection conexao = ConexaoDao.getConnection();
        try {
            PreparedStatement statement = conexao.prepareStatement(UPDATE);
            statement.setString(1, carro.getFabricante());
            statement.setString(2, carro.getModelo());
            statement.setString(3, carro.getPlaca());
            statement.setDouble(4, carro.getValor());
            statement.setInt(5, carro.getAno());
            statement.setInt(6, carro.getIdCarro());
            statement.execute();
            msg = "Carro atualizado com sucesso!!";
        }catch (Exception e){
            System.out.println("Erro de SQL "+e.getMessage());
            msg = "Erro ao alterar carro";
        }
        conexao.close();
        return msg;
    }
    private final static String SELECT = "SELECT * FROM TB_CARROS WHERE ID = ?";
    private final static String SELECT_FABRICANTE = "SELECT * FROM TB_CARROS WHERE FRABRICANTE = ?";
    private final static String SELECT_NOME_FABRICANTE= "SELECT FABRICANTE FROM TB_CARROS";
    private final static String SELECTALL = "SELECT * FROM TB_CARROS";
    private final static String DELETE = "DELETE FROM TB_CARROS WHERE ID = ?";
    private final static String INSERT = "INSERT INTO TB_CARROS (FABRICANTE, MODELO, PLACA, VALOR, ANO) VALUES (?, ?, ?, ?, ?)";
    private final static String UPDATE = "UPDATE TB_CARROS SET FABRICANTE =?, MODELO=?, PLACA=?, VALOR=?, ANO=? WHERE ID = ?";
}
