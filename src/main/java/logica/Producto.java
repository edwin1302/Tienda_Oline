
package logica;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import persistencia.ConexionBD;


public class Producto {
    
    private int idProducto;
    private int idUsuario;
    private int idCategoria;
    private String nombre;
    private int cantidad;
    private String categoria;
    private double precio;
    private String estado = "Activo";
    private Date fechaCaptura;
    // private LocalDate hoy = LocalDate.now();

    public Producto() {
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }
    
    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Date getFechaCaptura() {
        return fechaCaptura;
    }

    public void setFechaCaptura(Date fechaCaptura) {
        this.fechaCaptura = fechaCaptura;
    }
    
    public void llenarProducto(int idUsuario, int idCategoria, String nombre, int cantidad, String categoria, double precio, String estado){
        this.idUsuario = idUsuario;
        this.idCategoria = idCategoria;
        this.nombre = nombre;
        this.cantidad = cantidad;
        this.categoria = categoria;
        this.precio = precio;
        this.estado = estado;

    }
    
    public boolean guardarProducto(){
        ConexionBD conexion = new ConexionBD();
        String sentencia = "INSERT INTO productos (id_usuario, "
                + "id_categoria, "
                + "nombreProducto, "
                + "cantidad, "
                + "precio, "
                + "estado, "
                + "fechaCaptura ) VALUES ('"+this.idUsuario+"',"
                + "'"+this.idCategoria+"',"
                + "'"+this.nombre+"',"
                + "'"+this.cantidad+"',"
                + "'"+this.precio+"',"
                + "'"+this.estado+"',"
                + "'"+this.fechaCaptura+"',)";
        
        if(conexion.setAutoCommitBD(false)){
            if(conexion.insertarBD(sentencia)){
                conexion.commitBD();
                conexion.cerrarConexion();
                return true;
            }else{
                conexion.rollbackBD();
                conexion.cerrarConexion();
                return false;
            }
        }else{
            conexion.cerrarConexion();
            return false;
        }
    }
    
    public boolean borrarProducto(int idProducto){
        ConexionBD conexion = new ConexionBD();
        String sentencia = "DELETE FROM productos WHERE idProducto = '"+idProducto+"'";
        
        if(conexion.setAutoCommitBD(false)){
            if(conexion.actualizarBD(sentencia)){
                conexion.commitBD();
                conexion.cerrarConexion();
                return true;
            }else{
                conexion.rollbackBD();
                conexion.cerrarConexion();
                return false;
            }
        }else{
            conexion.cerrarConexion();
            return false;
        }
    }
    
    public boolean actualizarProducto(){
        ConexionBD conexion = new ConexionBD();
        String sentencia = "UPDATE productos SET id_usuario='"+this.idUsuario+"', "
                + "id_categoria='"+this.idCategoria+"', "
                + "nombreProducto='"+this.nombre+"', "
                + "cantidad='"+this.cantidad+"', "
                + "precio='"+this.precio+"', "
                + "estado='"+this.estado+"'";
        
        if(conexion.setAutoCommitBD(false)){
            if(conexion.actualizarBD(sentencia)){
                conexion.commitBD();
                conexion.cerrarConexion();
                return true;
            }else{
                conexion.rollbackBD();
                conexion.cerrarConexion();
                return false;
            }
        }else{
            conexion.cerrarConexion();
            return false;
        }
    }
    
    public List<Producto> listarProductos() throws SQLException{
        ConexionBD conexion = new ConexionBD();
        List<Producto> listaProductos = new ArrayList<>();
        String sql = " SELECT * FROM productosORDER BY nombreProducto asc";
        ResultSet rs = conexion.consultarBD(sql);
        Producto c;
        while(rs.next()){
            c = new Producto();
            c.setIdProducto(rs.getInt("id_producto"));
            c.setIdUsuario(rs.getInt("id_usuario"));
            c.setCategoria(rs.getString("id_categoria"));
            c.setNombre(rs.getString("nombre"));
            c.setCantidad(rs.getInt("cantidad"));
            c.setPrecio(rs.getInt("precio"));
            c.setEstado(rs.getString("estado"));
            listaProductos.add(c);
        }
        conexion.cerrarConexion();
        return listaProductos;
    }

    @Override
    public String toString() {
        return "Producto{" + "idProducto=" + idProducto + ", idUsuario=" + idUsuario + ", idCategoria=" + idCategoria + ", nombre=" + nombre + ", cantidad=" + cantidad + ", categoria=" + categoria + ", precio=" + precio + ", estado=" + estado + ", fechaCaptura=" + fechaCaptura + '}';
    }
    
    
}
