<%@ page import="br.com.carro.dao.CarrosDao" %>
<%@ page import="br.com.carro.entidade.Carro" %><%--
  Created by IntelliJ IDEA.
  User: mayane.de.mesquita
  Date: 24/05/2018
  Time: 18:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Excluir Carro</title>
    <meta http-equiv="refresh" content="200; listaCarros.jsp">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="bootstrap/css/style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<%
    String msg = "";
    CarrosDao carrosDao = new CarrosDao();
    Carro carro = new Carro();
    carro.setIdCarro(Integer.parseInt(request.getParameter("idCarro")));
    carrosDao.excluirCarro(carro);

    if (!carrosDao.excluirCarro(carro)) {
        msg = "Carro  excluído com  sucesso!!!";
    } else {
        msg = "Erro ao excluir carro!";
    }
%>

<p style=" width: 300px; height: 90px; color: red; text-align: center; padding-top: 25px;
    padding-left: 20px; font-size: large;  border-color: #1c7430;"><%=msg%></p>


</body>
</html>
