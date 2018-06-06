<%@ page import="br.com.carro.dao.CarrosDao" %>
<%@ page import="br.com.carro.entidade.Carro" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: mayane.de.mesquita
  Date: 24/05/2018
  Time: 18:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lista de Carros</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body class="body">
<%
    CarrosDao carrosDao = new CarrosDao();
    ArrayList<Carro> carros = carrosDao.getTodos();
%>
    <div class="well well-sm clearfix ls-table-group-actions">
        <h3>Sistema de Gerencimento de Carros</h3>
        <div class="actions pull-right">
            <div class="btn-group">
                <a href="../adicionaCarro.html" class="btn btn-success">Incluir Registro</a>
                <a href="#" class="btn btn-default">Gerar Relatório</a>
            </div>
            <button type="button" class="btn badge-danger">
                <span class="">Excluir Todos</span>
            </button>
        </div>
    </div>
<div class="">
    <h4 style="text-align:center;">Lista de Carros no Sistema</h4>
</div>
    <table class="table table-striped">
        <thead class="table-info">
        <tr class="">
            <th class="">Fabricante</th>
            <th class="">Modelo</th>
            <th class="">Placa</th>
            <th class="">Valor</th>
            <th class="">Ano</th>
            <th class="">Ações</th>
        </tr>
        </thead>
        <tbody>
        <tr>
    <% for (Carro carro: carros) { %>
            <tr>
            <td><%=carro.getFabricante()%></td>
            <td><%=carro.getModelo()%></td>
            <td><%=carro.getPlaca()%></td>
            <td><%=carro.getValor()%></td>
            <td><%=carro.getAno()%></td>
             <td>
                <a href="atualizaCarro.jsp?idCarro=<%=carro.getIdCarro()%>" class="font-weight-bold">Editar</a>
                <a href="deletaCarro.jsp?idCarro=<%=carro.getIdCarro()%>" data-toggle="modal"  data-target="#myModal" class="text-danger font-weight-bold">Excluir</a>
             </td>
        </tr>
     <%}%>
    </tr>
 </tbody>
</table>

<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
            </div>
            <div class="modal-body">
                <p></p>
            </div>

        </div>
    </div>
</div>

</body>
</html>
