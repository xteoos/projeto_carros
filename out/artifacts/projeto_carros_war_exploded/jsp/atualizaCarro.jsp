<%@ page import="br.com.carro.dao.CarrosDao" %>
<%@ page import="br.com.carro.entidade.Carro" %><%--
  Created by IntelliJ IDEA.
  User: mayane.de.mesquita
  Date: 01/06/2018
  Time: 16:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <title>Alteração de Registro</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">


</head>
<body>

<div class="container">
    <%
        CarrosDao carrosDao = new CarrosDao();
        Carro carro = carrosDao.getCarro(Integer.parseInt(request.getParameter("idCarro")));

    %>
    <h2>Alteração do Registro do Carro</h2>
    <form class="form-horizontal" action="atualizaCarroService.jsp" method="post">
        <div class="form-group">
            <label class="control-label col-sm-2" for="fabricante">Fabricante</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" value="<%=carro.getFabricante()%>" id="fabricante"
                       placeholder="" name="fabricante">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="modelo">Modelo</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" value="<%=carro.getModelo()%>" id="modelo" placeholder=""
                       name="modelo">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="placa">Placa</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="placa" value="<%=carro.getPlaca()%>" name="placa">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="valor">Valor</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="valor" value="<%=carro.getValor()%>" name="valor">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="ano">Ano</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="ano" value="<%=carro.getAno()%>" name="ano">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-10">
                <input type="hidden" class="form-control" id="id" value="<%=carro.getIdCarro()%>" name="idCarro">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-group-vertical">Enviar</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>

