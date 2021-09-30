package logica;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import persistencia.ConexionBD;

public class Usuario {

    private int idUsuario;
    private String nombre;
    private String email;

    private String password;
    private Date fecha;

    public Usuario() {
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public void llenarUsuario(String nombre, String email, String password) {
        this.nombre = nombre;
        this.email = email;
        this.password = password;
    }

    public boolean guardarUsuario() {
        ConexionBD conexion = new ConexionBD();
        String sentencia = "INSERT INTO usuarios (nombreUsuario, "
                + "email, "
                + "password, "
                + "fechaCaptura ) VALUES ('" + this.nombre + "',"
                + "'" + this.email + "',"
                + "'" + this.password + "',"
                + "'" + this.fecha + "')";

        if (conexion.setAutoCommitBD(false)) {
            if (conexion.insertarBD(sentencia)) {
                conexion.commitBD();
                conexion.cerrarConexion();
                return true;
            } else {
                conexion.rollbackBD();
                conexion.cerrarConexion();
                return false;
            }
        } else {
            conexion.cerrarConexion();
            return false;
        }
    }

    public boolean borrarUsuario(int idUsuario) {
        ConexionBD conexion = new ConexionBD();
        String sentencia = "DELETE FROM usuarios WHERE idUsaurio = '" + idUsuario + "'";

        if (conexion.setAutoCommitBD(false)) {
            if (conexion.actualizarBD(sentencia)) {
                conexion.commitBD();
                conexion.cerrarConexion();
                return true;
            } else {
                conexion.rollbackBD();
                conexion.cerrarConexion();
                return false;
            }
        } else {
            conexion.cerrarConexion();
            return false;
        }
    }

    public boolean actualizarUsuario() {
        ConexionBD conexion = new ConexionBD();
        String sentencia = "UPDATE usuarios SET nombre='" + this.nombre + "', "
                + "email='" + this.email + "', "
                + "password='" + this.password + "'";

        if (conexion.setAutoCommitBD(false)) {
            if (conexion.actualizarBD(sentencia)) {
                conexion.commitBD();
                conexion.cerrarConexion();
                return true;
            } else {
                conexion.rollbackBD();
                conexion.cerrarConexion();
                return false;
            }
        } else {
            conexion.cerrarConexion();
            return false;
        }
    }

    public List<Usuario> listarUsuario() throws SQLException {
        ConexionBD conexion = new ConexionBD();
        List<Usuario> listaUsuarios = new ArrayList<>();
        String sql = "SELECT * FROM usuarios ORDER BY nombreUsuario asc";
        ResultSet rs = conexion.consultarBD(sql);
        Usuario u;
        while (rs.next()) {
            u = new Usuario();
            u.setIdUsuario(rs.getInt("id_usuario"));
            u.setNombre(rs.getString("nombreUsuario"));
            u.setEmail(rs.getString("email"));
            u.setPassword(rs.getString("password"));
            listaUsuarios.add(u);
        }
        conexion.cerrarConexion();
        return listaUsuarios;
    }

    @Override
    public String toString() {
        return "Usuario{" + "nombre=" + nombre + ", email=" + email + ", password=" + password + ", fecha=" + fecha + '}';
    }

}
