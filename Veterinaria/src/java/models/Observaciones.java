package models;
// Generated 18/11/2017 02:45:07 PM by Hibernate Tools 4.3.1



/**
 * Observaciones generated by hbm2java
 */
public class Observaciones  implements java.io.Serializable {


     private Integer idObservaciones;
     private Hospitalizacion hospitalizacion;
     private Persona persona;
     private String observacionDiaria;

    public Observaciones() {
    }

    public Observaciones(Hospitalizacion hospitalizacion, Persona persona, String observacionDiaria) {
       this.hospitalizacion = hospitalizacion;
       this.persona = persona;
       this.observacionDiaria = observacionDiaria;
    }
   
    public Integer getIdObservaciones() {
        return this.idObservaciones;
    }
    
    public void setIdObservaciones(Integer idObservaciones) {
        this.idObservaciones = idObservaciones;
    }
    public Hospitalizacion getHospitalizacion() {
        return this.hospitalizacion;
    }
    
    public void setHospitalizacion(Hospitalizacion hospitalizacion) {
        this.hospitalizacion = hospitalizacion;
    }
    public Persona getPersona() {
        return this.persona;
    }
    
    public void setPersona(Persona persona) {
        this.persona = persona;
    }
    public String getObservacionDiaria() {
        return this.observacionDiaria;
    }
    
    public void setObservacionDiaria(String observacionDiaria) {
        this.observacionDiaria = observacionDiaria;
    }




}


