<%-- 
    Document   : PeticionesProducto
    Created on : 27/09/2021, 6:21:50 p. m.
    Author     : EDWIN
--%>

<%@page  import="java.util.logging.Logger" %> // para los mensajes del try cahth
<%@page  import="java.util.logging.Level" %>
<%@page  import="java.sql.SQLException" %>
<%@page  import="logica.Producto" %>
<%@page  import="com.google.gson.Gson" %>
<%@page  import="java.util.ArrayList" %>
<%@page  import="java.util.Arrays" %>
<%@page  import="java.util.List" %>
<%@page contentType="application/json;charset=iso-8859-1" pageEncoding="iso-8859-1" session="true"%>

<%
    // iniciando respuesta json
    String respuesta = "{";

    // lista de procesos
    List<String> tareas = Arrays.asList(new String[]{
        "actualizarProducto",
        "eliminarProducto",
        "listarProducto",
        "guardarProducto"
    });

    String proceso = "" + request.getParameter("proceso");
    Producto p = new Producto();

    // validacion de parametros 
    if (tareas.contains(proceso)) {
        // inicio de proceso
        if (proceso.equals("guardarProducto")) {
            int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
            int idCategoria = Integer.parseInt(request.getParameter("idategoria"));
            String nombre = request.getParameter("nombre");
            int cantidad = Integer.parseInt(request.getParameter("cantidad"));
            String categoria = request.getParameter("categoria");
            double precio = Double.parseDouble(request.getParameter("precio"));
            String estado = request.getParameter("estado");
            //Date fechaCaptura;
            p.llenarProducto(idUsuario, idCategoria, nombre, cantidad, categoria, precio, estado);
            if (p.guardarProducto()) {
                respuesta += "\"" + proceso + "\" : true";
            } else {
                respuesta += "\"" + proceso + "\" : false";
            }
        } else if (proceso.equals("eliminarProducto")) {
            int idProducto = Integer.parseInt(request.getParameter("idProducto"));
            if (p.borrarProducto(idProducto)) {
                respuesta += "\"" + proceso + "\" : true";
            } else {
                respuesta += "\"" + proceso + "\" : false";
            }
        } else if (proceso.equals("listarProducto")) {
            try {
                List<Producto> lista = p.listarProductos();
                respuesta += "\"" + proceso + "\" : true,\"Productos\":" + new Gson().toJson(lista);
            } catch (SQLException ex) {
                respuesta += "\"" + proceso + "\" : true,\"Productos\":[]";
                Logger.getLogger(Producto.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (proceso.equals("actualizarProducto")) {
            int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
            int idCategoria = Integer.parseInt(request.getParameter("idategoria"));
            String nombre = request.getParameter("nombre");
            int cantidad = Integer.parseInt(request.getParameter("cantidad"));
            String categoria = request.getParameter("categoria");
            double precio = Double.parseDouble(request.getParameter("precio"));
            String estado = request.getParameter("estado");
            //Date fechaCaptura;
            p.llenarProducto(idUsuario, idCategoria, nombre, cantidad, categoria, precio, estado);
            
            if (p.actualizarProducto()) {
                respuesta += "\"" + proceso + "\" : true";
            } else {
                respuesta += "\"" + proceso + "\" : false";
            }
        }

    } else {
        respuesta += "\"ok\" : false,";
        respuesta += "\"ERROR\" : \"INVALIDO\",";
        respuesta += "\"errorMsg\" : \" Lo sentimos los datos que envio son invalidos. Por favor corrijalos y vuelva intentarlo";

    }

    respuesta += "}";
    response.setContentType("application/json;charset=iso-8859-1");
    out.print(respuesta);

%>

