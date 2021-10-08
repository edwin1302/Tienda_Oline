<%-- 
    Document   : PeticionesUsuario
    Created on : 27/09/2021, 9:17:10 p. m.
    Author     : EDWIN
--%>

<%@page  import="java.util.logging.Logger" %> // para los mensajes del try cahth
<%@page  import="java.util.logging.Level" %>
<%@page  import="java.sql.SQLException" %>
<%@page  import="logica.Usuario" %>
<%@page  import="com.google.gson.Gson" %>
<%@page  import="java.util.ArrayList" %>
<%@page  import="java.util.Arrays" %>
<%@page  import="java.util.List" %>
<%@page contentType="application/json;charset=iso-8859-1" pageEncoding="iso-8859-1" session="true"%>

<%
    // iniciando respuesta json
    Usuario u1 = new Usuario();
    String respuesta = "{";

    // lista de procesos
    List<String> tareas = Arrays.asList(new String[]{
        "actualizarUsuario",
        "eliminarUsuario",
        "listarUsuario",
        "guardarUsuario"
    });

    String proceso = "" + request.getParameter("proceso");

    // validacion de parametros rio u = new Usuario();
    if (tareas.contains(proceso)) {
        respuesta += "\"ok\": true,";
        
        // inicio de proceso
        if (proceso.equals("guardarUsuario")) {
            String nombre = request.getParameter("nombre");
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            Usuario u = new Usuario();
            u.llenarUsuario(nombre, email, password);
            if (u.guardarUsuario()) {
                respuesta += "\"" + proceso + "\" : true";
            } else {
                respuesta += "\"" + proceso + "\" : false";
            }
            
        } else if (proceso.equals("eliminarUsuario")) {
            Usuario u = new Usuario();
            int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
            if (u.borrarUsuario(idUsuario)) {
                respuesta += "\"" + proceso + "\" : true";
            } else {
                respuesta += "\"" + proceso + "\" : false";
            }
            
        } else if (proceso.equals("listarUsuario")) {
            Usuario u = new Usuario();
            try {
                List<Usuario> lista = u.listarUsuario();
                respuesta += "\"" + proceso + "\" : true,\"Usuarios\":" + new Gson().toJson(lista);
            } catch (SQLException ex) {
                respuesta += "\"" + proceso + "\" : true,\"Usuarios\":[]";
                Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        } else if (proceso.equals("actualizarProducto")) {
            String nombre = request.getParameter("nombre");
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            Usuario u = new Usuario();
            u.llenarUsuario(nombre, email, password);
            if (u.actualizarUsuario()) {
                respuesta += "\"" + proceso + "\" : true";
            } else {
                respuesta += "\"" + proceso + "\" : false";
            }
        }

    } else {
        respuesta += "\"ok\" : false,";
        respuesta += "\"error\" : \"INVALID\",";
        respuesta += "\"errorMsg\" : \" Lo sentimos los datos que envio son invalidos. Por favor corrijalos y vuelva intentarlo";

    }

    respuesta += "}";
    response.setContentType("application/json;charset=iso-8859-1");
    out.print(respuesta);

%>

