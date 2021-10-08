<%-- 
    Document   : menu
    Created on : 29/09/2021, 8:17:46 p. m.
    Author     : GENESIS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu</title>
        <!-- CSS only -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="principal.jsp">MiBarrio.com</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="nav justify-content-end navbar-nav">
                    <li class="nav-item ">
                        <a class="nav-link" href="principal.jsp">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item dropdown active">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Administrar
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="registroProducto.jsp">Registro producto</a>
                            <a class="dropdown-item" href="categoria.jsp">Categoria</a>

                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Factura.jsp">Registro de venta</a>
                    </li>

                </ul>
                <ul class="navbar-nav">

                    <li class="nav-item">
                        <a class="nav-link" href="usuario.jsp" >Usuario</a>
                    </li>
                </ul>
            </div>
            <div class="dropdown">
                <button style="border: none" class="btn btn-outline-light dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Usuario Ingresado
                </button>
                <div class="dropdown-menu text-center">
                    <a class="dropdown-item" href="#">Usuario</a>
                    <a class="dropdown-item" href="#">usuario@gamil.com</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="index.jsp">Salir</a>
                </div>
            </div>
        </nav>  
        <h1 class="display-4">Registro producto</h1>
    </body> 


</html>