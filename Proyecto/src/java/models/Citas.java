package models;
// Generated 15/11/2017 02:18:11 PM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Citas generated by hbm2java
 */
public class Citas  implements java.io.Serializable {


     private Integer idCitasMedicas;
     private Mascota mascota;
     private Veterinario veterinario;
     private Date fechaEntrada;
     private Date fechaSalida;
     private String tipo;
     private String estado;
     private Set hospitalizacions = new HashSet(0);
     private Set medicamentoses = new HashSet(0);

    public Citas() {
    }

	
    public Citas(Mascota mascota, Veterinario veterinario, Date fechaEntrada, String tipo, String estado) {
        this.mascota = mascota;
        this.veterinario = veterinario;
        this.fechaEntrada = fechaEntrada;
        this.tipo = tipo;
        this.estado = estado;
    }
    public Citas(Mascota mascota, Veterinario veterinario, Date fechaEntrada, Date fechaSalida, String tipo, String estado, Set hospitalizacions, Set medicamentoses) {
       this.mascota = mascota;
       this.veterinario = veterinario;
       this.fechaEntrada = fechaEntrada;
       this.fechaSalida = fechaSalida;
       this.tipo = tipo;
       this.estado = estado;
       this.hospitalizacions = hospitalizacions;
       this.medicamentoses = medicamentoses;
    }
   
    public Integer getIdCitasMedicas() {
        return this.idCitasMedicas;
    }
    
    public void setIdCitasMedicas(Integer idCitasMedicas) {
        this.idCitasMedicas = idCitasMedicas;
    }
    public Mascota getMascota() {
        return this.mascota;
    }
    
    public void setMascota(Mascota mascota) {
        this.mascota = mascota;
    }
    public Veterinario getVeterinario() {
        return this.veterinario;
    }
    
    public void setVeterinario(Veterinario veterinario) {
        this.veterinario = veterinario;
    }
    public Date getFechaEntrada() {
        return this.fechaEntrada;
    }
    
    public void setFechaEntrada(Date fechaEntrada) {
        this.fechaEntrada = fechaEntrada;
    }
    public Date getFechaSalida() {
        return this.fechaSalida;
    }
    
    public void setFechaSalida(Date fechaSalida) {
        this.fechaSalida = fechaSalida;
    }
    public String getTipo() {
        return this.tipo;
    }
    
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    public String getEstado() {
        return this.estado;
    }
    
    public void setEstado(String estado) {
        this.estado = estado;
    }
    public Set getHospitalizacions() {
        return this.hospitalizacions;
    }
    
    public void setHospitalizacions(Set hospitalizacions) {
        this.hospitalizacions = hospitalizacions;
    }
    public Set getMedicamentoses() {
        return this.medicamentoses;
    }
    
    public void setMedicamentoses(Set medicamentoses) {
        this.medicamentoses = medicamentoses;
    }




}


