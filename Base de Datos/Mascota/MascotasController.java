/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.HibernateUtil;
import models.Mascota;
import models.Propietario;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author yeimy
 */
public class MascotasController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("create")) {
            Registrar(request, response);
        }else if (action.equalsIgnoreCase("admin")) {
             Admin(request, response);

        }else if(action.equalsIgnoreCase("select")){
            Select(request, response);
        }else if(action.equalsIgnoreCase("eliminar")){
            Eliminar(request, response);
        }else if (action.equalsIgnoreCase("update")){
            Actualizar(request, response);
        }
        
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void Registrar(HttpServletRequest request, HttpServletResponse response) {
        String  nombre = request.getParameter("nombre");
        String  foto = request.getParameter("foto");
        float peso = Float.parseFloat((request.getParameter("peso")));
        int condicion = Integer.parseInt((request.getParameter("condicion")));
        String  color = request.getParameter("color");
        String  especie = request.getParameter("especie");
        String  raza = request.getParameter("raza");
        String  sexo = request.getParameter("sexo");
        Date  fecha = new Date();
//        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MMM-dd");
//        String dateInString = "fechaNacimiento";
//        Date date = null;
//        try {
//            date = formatter.parse(dateInString);
//        } catch (ParseException e) {
//            e.printStackTrace();
//        }
        String  alimentacion = request.getParameter("alimentacion");
        String  medicamentos = request.getParameter("medicamentos");
        int  propietario = Integer.parseInt(request.getParameter("propietario"));
        String  observaciones = request.getParameter("observaciones");
        String  estado= request.getParameter("estado");
        
        
        Session session = HibernateUtil.getSessionFactory().openSession();
      
      Propietario pro =(Propietario) session .get(Propietario.class, propietario);
      
     
       Mascota mascota = new Mascota(pro, nombre, foto, peso, condicion, color, especie, raza, sexo, fecha, alimentacion, estado);
       mascota.setMedicamentos(medicamentos);
       mascota.setObservaciones(observaciones);
       
        session.beginTransaction();
        session.save(mascota);
        session.getTransaction().commit();
        session.close();
        try {
            
            response.sendRedirect("MascotasController?action=admin");
        } catch (IOException ex) {
            Logger.getLogger(MascotasController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void Admin(HttpServletRequest request, HttpServletResponse response) throws IOException {
       Session sesion = HibernateUtil.getSessionFactory().openSession();
        
        Query qmascota = sesion.createQuery("FROM Mascota");
        
        ArrayList listaMascotas = (ArrayList) qmascota.list();
        ArrayList<Mascota> mascot =new ArrayList<Mascota>();
        
       for(Object mas : listaMascotas){
            Mascota mascota = (Mascota) mas;
            mascot.add(mascota);
        }
        
       request.setAttribute("ArrayMascota", mascot);
       
       
        try {                                                                                                                                           
            request.getRequestDispatcher("AdminMascota.jsp").forward(request, response);
            
        } catch (ServletException ex) {
            Logger.getLogger(MascotasController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void Select(HttpServletRequest request, HttpServletResponse response) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        
        Query mas = sesion.createQuery("from Mascota");
        ArrayList mascota = (ArrayList) mas.list();

        request.setAttribute("mascota", mascota);
        
        Query q = sesion.createQuery("FROM Propietario");
        ArrayList propietario = (ArrayList) q.list();
        ArrayList<Propietario> cl = new ArrayList<>();
        for (Object salone : propietario) {
            Propietario c = (Propietario) salone;
            cl.add(c);
        }
        request.setAttribute("ListarPropietario", cl);
        
        

        try {
            request.getRequestDispatcher("RegistrarMascota.jsp").forward(request, response);

        } catch (ServletException ex) {
            Logger.getLogger(MascotasController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(MascotasController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void Eliminar(HttpServletRequest request, HttpServletResponse response) {
        
         Session sesion = HibernateUtil.getSessionFactory().openSession();
            Mascota masco = (Mascota) sesion.get(Mascota.class, Integer.parseInt(request.getParameter("id")));

            sesion.beginTransaction();
            sesion.delete(masco);
            sesion.getTransaction().commit();
            sesion.close();

            try {
                response.sendRedirect("MascotasController?action=admin");
            } catch (IOException ex) {
                Logger.getLogger(MascotasController.class.getName()).log(Level.SEVERE, null, ex);
            }
        
    }

    private void Actualizar(HttpServletRequest request, HttpServletResponse response) {
       Session sesion = HibernateUtil.getSessionFactory().openSession();
        
        Query qpropietarios = sesion.createQuery("FROM Propietario");
        ArrayList listaPropietarios = (ArrayList) qpropietarios.list();
        
        
        
        ArrayList<Propietario> ArrayPropietarios = new ArrayList<>();
        for (Object Obj : listaPropietarios) {
            Propietario pro = (Propietario) Obj;
            ArrayPropietarios.add(pro);
        }
        
         request.setAttribute("ArrayPropietarios", ArrayPropietarios);
         
         
         Mascota mascota = (Mascota) sesion.get(Mascota.class, Integer.parseInt(request.getParameter("id")));
         
         if(request.getMethod().equalsIgnoreCase("GET")){
        request.setAttribute("mascota", mascota);
        try {
            request.getRequestDispatcher("EditarMascota.jsp").forward(request, response);
        } catch (ServletException ex) {
           Logger.getLogger(MascotasController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex){
            Logger.getLogger(MascotasController.class.getName()).log(Level.SEVERE, null, ex);
        }
              }else{
             
             
             Propietario prop = (Propietario) sesion.get(Propietario.class, Integer.parseInt(request.getParameter("propietario")));
             
             
             
                mascota.setNombre(request.getParameter("nombre"));
                mascota.setFoto(request.getParameter("foto"));
                mascota.setPeso(Float.parseFloat((request.getParameter("peso"))));
                mascota.setCondicionCorporal(Integer.parseInt((request.getParameter("condicion"))));
                mascota.setColor(request.getParameter("color"));
                mascota.setEspecie(request.getParameter("especie"));
                mascota.setRaza(request.getParameter("raza"));
                mascota.setGenero(request.getParameter("sexo"));
                mascota.getFechaNacimiento();
        //        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MMM-dd");
        //        String dateInString = "fechaNacimiento";
        //        Date date = null;
        //        try {
        //            date = formatter.parse(dateInString);
        //        } catch (ParseException e) {
        //            e.printStackTrace();
        //        }
                mascota.setAlimentacion(request.getParameter("alimentacion"));
                mascota.setMedicamentos(request.getParameter("medicamentos"));
                mascota.setPropietario(prop);
                mascota.setObservaciones(request.getParameter("observaciones"));
                mascota.setEstado(request.getParameter("estado"));
                sesion.beginTransaction();
                sesion.saveOrUpdate(mascota);
                sesion.getTransaction().commit();
        
         }
         
         try {
            response.sendRedirect("MascotasController?action=admin");
        } catch (IOException ex) {
            Logger.getLogger(MascotasController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
