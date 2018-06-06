<%@ page import="br.com.carro.dao.CarrosDao" %>
<%@ page import="br.com.carro.entidade.Carro" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %><%--
  Created by IntelliJ IDEA.
  User: mayane.de.mesquita
  Date: 24/05/2018
  Time: 18:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Inserir Carro</title>
    <meta http-equiv="refresh" content="0; listaCarros.jsp">
</head>
<body>
<%
    NumberFormat format = NumberFormat.getInstance(Locale.FRANCE);
    Number number = format.parse(request.getParameter("valor"));
    double valor = number.doubleValue();
    CarrosDao carrosDao = new CarrosDao();
    Carro carro = new Carro();
    carro.setFabricante(request.getParameter("fabricante"));
    carro.setModelo(request.getParameter("modelo"));
    carro.setPlaca(request.getParameter("placa"));
    carro.setValor(valor);
    carro.setAno(Integer.parseInt(request.getParameter("ano")));
    carrosDao.addCarro(carro);
%>
</body>
</html>
