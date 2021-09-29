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
        <title>JSP Page</title>
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
    </head>
    <body>
        <br><br><br><br><br><br>
        <div class="container">
            <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-4">
                    <div class="panel panel-success">
                        <div class="panel panel-heading" align="center">Sistema Tienda Oline</div>
                        <div class="panel panel-body">
                            <p>
                            <center><img src="img/login.png" width="100%"></center>
                            </p>
                            <form id="frmLogin">
                                <label>Usuario</label>
                                <input type="text" class="form-control input-sm" name="usuario" id="usuario">
                                <label>Contraseña</label>
                                <input type="password" name="password" id="password" class="form-control input-sm">
                                <p></p>
                                <span class="btn btn-success btn-sm" id="entrarSistema">Entrar</span>
                                <a href="" class="btn btn-default btn-sm">Registrar</a>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4"></div>
            </div>
        </div>
    </body>
</html>
