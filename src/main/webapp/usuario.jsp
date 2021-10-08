<%-- 
    Document   : usuario
    Created on : 30/09/2021, 6:08:07 p. m.
    Author     : GENESIS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Usuarios</title>
        <!-- CSS only -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
        <!-- Angular -->
        <script src = "http://ajax.googleapis.com/ajax/libs/angularjs/1.2.15/angular.min.js"></script> 
    </head>
    <style type="text/css">
        .messages {
            color: #FA787E;
        }
        form.ng-submitted input.ng-invalid{
            border-color: #FA787E;
        }
        form input.ng-invalid.ng-touched {
            border-color: #FA787E;
        }
    </style>
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
                    <li class="nav-item dropdown">
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

                    <li class="nav-item active">
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
        <br><br><br><br>
        <div class="container" ng-app="Usuario" ng-controller="usuarioController as us">
            <h2>Administrar usuarios</h2>
            <div class="row">
                <div class="col-sm-4">
                    <form name="userForm" novalidate onSubmit="this.reset()">
                        <label>Nombre</label>
                        <input type="text" class="form-control input-sm" ng-model="us.nombre" ng-model-options="{updateOn: 'blur'}" required>
                        <label>Email</label>
                        <input type="email" class="form-control input-sm" ng-model="us.email" ng-model-options="{updateOn: 'blur'}" required>
                        <label>Password</label>
                        <input type="password" class="form-control input-sm" ng-model="us.password" ng-model-options="{updateOn: 'blur'}" required>
                        <p></p>
                        <button class="btn btn-primary" ng-click="us.guardarUsuario()">guardar</button>
                    </form>
                </div>
                <div class="col-sm-7" ng-app="Usuario" ng-controller="usuarioController as us">
                    <caption><label>Usuarios :)</label></caption>
                    <p></p>
                    <button  class="btn btn-primary" ng-click="us.listarUsuario()">Listar Usuarios</button>
                    <p></p>
                    <table class="table table-hover table-condensed table-bordered" id="myTable" style="text-align: center;">
                        <thead>
                            <tr style="background: #0DF205">
                                <td>Nombre</td>
                                <td>Email</td>
                                <td>Password</td>
                                <td>Editar</td>
                                <td>Eliminar</td>
                            </tr>
                        </thead>

                        <tbody>

                            <tr ng-repeat="usuario in us.usuarios" >
                                <td>{{ usuario.nombre}}</td>
                                <td>{{ usuario.email}}</td>
                                <td>{{ usuario.password}}</td>
                                <td>
                                    <button class="btn btn-primary">A</button>
                                </td>
                                <td>
                                    <<button class="btn btn-primary" >E</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
    <script>
        angular.module('Usuario', []).controller('usuarioController', ['$scope', function ($scope) {
                $scope.user = {};

                $scope.update = function () {
                    console.log($scope.user);
                };

                $scope.reset = function (form) {
                    $scope.user = {};
                    if (form) {
                        form.$setPristine();
                        form.$setUntouched();
                    }
                };
                $scope.reset();
            }]);

        var app = angular.module('Usuario', []);
        app.controller('usuarioController', ['$http', controladorUsuario]);

        function validar() {
            return true;
        }

        function controladorUsuario($http) {
            var us = this;

            us.listarUsuario = function () {
                console.log('Si ingresa al Angular listar');
                var url = "PeticionesUsuario.jsp";
                var params = {
                    proceso: "listarUsuario"
                };
                $http({
                    method: 'POST',
                    url: 'PeticionesUsuario.jsp',
                    params: params
                }).then(function (res) {
                    us.usuarios = res.data.Usuarios;
                });
            };

            us.guardarUsuario = function () {
                var usuario = {
                    proceso: "guardarUsuario",
                    nombre: us.nombre,
                    email: us.email,
                    password: us.password

                };
                $http({
                    method: 'POST',
                    url: 'PeticionesUsuario.jsp',
                    params: usuario
                }).then(function (res) {
                    if (res.data.ok === true) {
                        if (res.data[usuario.proceso] === true) {
                            alert("Guardado con exito");
                        } else {
                            alert("Por favor verificar los datos");
                        }
                    } else {
                        alert(res.data.errorMsg);
                    }
                });
            };

            us.eliminarUsuario = function () {
                var usuario = {
                    proceso: "eliminarUsuario",
                    idUsuario: us.idUsuario
                };
                $http({
                    method: 'POST',
                    url: 'PeticionesUsuario.jsp',
                    params: usuario
                }).then(function (res) {
                    if (res.data.ok === true) {
                        if (res.data[usuario.proceso] === true) {
                            alert("Eliminado con exito");
                        } else {
                            alert("Por favor verificar los datos");
                        }
                    } else {
                        alert(res.data.errorMsg);
                    }
                });
            };

            us.actualizarUsuario = function () {
                var usuario = {
                    proceso: "actualizarUsuario",
                    nombre: us.nombre,
                    email: us.email,
                    password: us.password
                };
                $http({
                    method: 'POST',
                    url: 'PeticionesUsuario.jsp',
                    params: usuario
                }).then(function (res) {
                    if (res.data.ok === true) {
                        if (res.data[usuario.proceso] === true) {
                            alert("Guardado con exito");
                        } else {
                            alert("Por favor verificar los datos");
                        }
                    } else {
                        alert(res.data.errorMsg);
                    }
                });
            };
        }
    </script>
</html>
