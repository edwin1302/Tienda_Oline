<%-- 
    Document   : index
    Created on : 27/09/2021, 6:18:39 p. m.
    Author     :EDWIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <!-- CSS only -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
        <!-- Angular -->
        <script src = "http://ajax.googleapis.com/ajax/libs/angularjs/1.2.15/angular.min.js"></script>
    </head>
    <body style="background-color: #EAEDED">
        <br><br><br><br>
        <div class="container">
            <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-4">
                    <div class="card border-dark">
                        <div class="card-header bg-secondary" align="center"><h3>Sistema Tienda Oline</h3></div>
                        <div class="card-body">
                            <p>
                            <center><img src="img/logo1.png" width="80%"></center>
                            </p>
                            <form id="frmLogin">
                                <label>Usuario</label>
                                <input type="text" class="form-control input-sm" name="usuario" id="usuario">
                                <label>Contraseña</label>
                                <input type="password" name="password" id="password" class="form-control input-sm">
                                <p></p>
                                <span class="btn btn-success btn-sm" id="entrarSistema">Entrar</span>
                                <a href="registroUsuario.jsp" class="btn btn-dark btn-sm">Registrar</a>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4"></div>
            </div>
        </div>
    </body>
</html>
