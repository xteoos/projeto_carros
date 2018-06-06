<%@ page import="br.com.carro.dao.CarrosDao" %>
<%@ page import="br.com.carro.entidade.Carro" %><%--
  Created by IntelliJ IDEA.
  User: mayane.de.mesquita
  Date: 24/05/2018
  Time: 18:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Consultar de  Carro</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>


<%
    Integer id = Integer.parseInt(request.getParameter("id"));
    CarrosDao carrosDao = new CarrosDao();
    Carro carro = carrosDao.getCarro(id);

    if (carro != null) {%>
<div class="">
    <h4 style="text-align:center;">Consulta de Carro</h4>
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

        <td><%=carro.getFabricante()%>
        </td>
        <td><%=carro.getModelo()%>
        </td>
        <td><%=carro.getPlaca()%>
        </td>
        <td><%=carro.getValor()%>
        </td>
        <td><%=carro.getAno()%>
        </td>
        <td>
            <a href="atualizaCarro.jsp?idCarro=<%=carro.getIdCarro()%>" data-action-modal="edit">Editar</a>
            <a href="deletaCarro.jsp" data-confirm-text="Confirma exclusão do item?" class="text-danger">Excluir</a>
        </td>
    </tr>
    </tbody>
</table>
<% } else {%>
<h3>Código Inexistente</h3>
<%}%>


</body>
</html>
