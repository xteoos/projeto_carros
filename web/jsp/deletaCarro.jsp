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
    <meta http-equiv="refresh" content="5; listaCarros.jsp">
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

<p ><%=msg%></p>


</body>
</html>
