package models;
// Generated 23/11/2017 10:21:32 AM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Propietario generated by hbm2java
 */
public class Propietario  implements java.io.Serializable {


     private Integer idPropietario;
     private long documento;
     private String nombres;
     private String apellidos;
     private String genero;
     private long telefono;
     private String correo;
     private String direccion;
     private String ciudad;
     private String contrasena;
     private String estado;
     private Set mascotas = new HashSet(0);

    public Propietario() {
    }

	
    public Propietario(long documento, String nombres, String apellidos, String genero, long telefono, String correo, String direccion, String ciudad, String contrasena, String estado) {
        this.documento = documento;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.genero = genero;
        this.telefono = telefono;
        this.correo = correo;
        this.direccion = direccion;
        this.ciudad = ciudad;
        this.contrasena = contrasena;
        this.estado = estado;
    }
    public Propietario(long documento, String nombres, String apellidos, String genero, long telefono, String correo, String direccion, String ciudad, String contrasena, String estado, Set mascotas) {
       this.documento = documento;
       this.nombres = nombres;
       this.apellidos = apellidos;
       this.genero = genero;
       this.telefono = telefono;
       this.correo = correo;
       this.direccion = direccion;
       this.ciudad = ciudad;
       this.contrasena = contrasena;
       this.estado = estado;
       this.mascotas = mascotas;
    }
   
    public Integer getIdPropietario() {
        return this.idPropietario;
    }
    
    public void setIdPropietario(Integer idPropietario) {
        this.idPropietario = idPropietario;
    }
    public long getDocumento() {
        return this.documento;
    }
    
    public void setDocumento(long documento) {
        this.documento = documento;
    }
    public String getNombres() {
        return this.nombres;
    }
    
    public void setNombres(String nombres) {
        this.nombres = nombres;
    }
    public String getApellidos() {
        return this.apellidos;
    }
    
    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }
    public String getGenero() {
        return this.genero;
    }
    
    public void setGenero(String genero) {
        this.genero = genero;
    }
    public long getTelefono() {
        return this.telefono;
    }
    
    public void setTelefono(long telefono) {
        this.telefono = telefono;
    }
    public String getCorreo() {
        return this.correo;
    }
    
    public void setCorreo(String correo) {
        this.correo = correo;
    }
    public String getDireccion() {
        return this.direccion;
    }
    
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    public String getCiudad() {
        return this.ciudad;
    }
    
    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }
    public String getContrasena() {
        return this.contrasena;
    }
    
    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }
    public String getEstado() {
        return this.estado;
    }
    
    public void setEstado(String estado) {
        this.estado = estado;
    }
    public Set getMascotas() {
        return this.mascotas;
    }
    
    public void setMascotas(Set mascotas) {
        this.mascotas = mascotas;
    }




}


