/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Citas;
import models.HibernateUtil;
import models.Mascota;
import models.Persona;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Samsung
 */
public class CitasController extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("admin")) {
            Admin(request, response);
        } else if (action.equalsIgnoreCase("create")) {
            Registrar(request, response);
        }
        /*else if (action.equalsIgnoreCase("update")) {
            Actualizar(request, response);
        } else if (action.equalsIgnoreCase("eliminar")) {
            Eliminar(request, response);
        }*/
    }

    private void Registrar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Session sesion = HibernateUtil.getSessionFactory().openSession();        
        Mascota mascota = (Mascota) sesion.get(Mascota.class, Integer.parseInt(request.getParameter("mascota")));
        Persona persona = (Persona) sesion.get(Persona.class, 1);       
        java.util.Date fechaentrada = new java.util.Date(request.getParameter("fechaentrada"));
        java.util.Date fechasalida = new java.util.Date(request.getParameter("fechasalida"));
        String tipo = request.getParameter("tipo"); 
        SimpleDateFormat formatter = new SimpleDateFormat("EEEE, MMM dd, yyyy HH:mm:ss a");        
        PrintWriter out = response.getWriter();
        Date date;
        
            out.print("Fecha entrada: "+ fechaentrada);            
        
            
            
        /*SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MMM-dd");
        String dateInString = "7-Jun-2013";
        Date date = null;
        try {
            date = formatter.parse(dateInString);
            

        } catch (ParseException e) {
            e.printStackTrace();
        }*/
        
        
        
        
        /*Citas cita = new Citas(mascota,persona,fechaentrada, fechasalida,tipo,"Programada");
        //GUARDAMOS EBJETO EN BD
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(cita);
        session.getTransaction().commit();
        session.close();

        
        try {
            response.sendRedirect("CitasController?action=admin");
        } catch (IOException ex) {
            Logger.getLogger(CitasController.class.getName()).log(Level.SEVERE, null, ex);
        }*/
       

    }

    private void Admin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        /*try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code.
            out.println("Entro al metodo");
            
        }*/
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Query qcitas = sesion.createQuery("FROM Citas");
        //Query q = sesion.createQuery("FROM Odontologos WHERE especialidad = 'General'"); Con el WHERE para condición
        ArrayList listaObjetos = (ArrayList) qcitas.list();

        ArrayList<Citas> Arraycitas = new ArrayList<>();
        //PrintWriter out = response.getWriter();
        for (Object Obj : listaObjetos) {
            Citas cita = (Citas) Obj;
            Arraycitas.add(cita);

        }
        request.setAttribute("ArrayCitas", Arraycitas);

        // Array Mascotas
        Query qmascotas = sesion.createQuery("FROM Mascota");
        //Query q = sesion.createQuery("FROM Odontologos WHERE especialidad = 'General'"); Con el WHERE para condición
        ArrayList listaMascotas = (ArrayList) qmascotas.list();
        sesion.close();
        ArrayList<Mascota> ArrayMascotas = new ArrayList<>();
        //PrintWriter out = response.getWriter();
        for (Object Obj : listaMascotas) {
            Mascota mascota = (Mascota) Obj;
            ArrayMascotas.add(mascota);
        }
        request.setAttribute("ArrayMascotas", ArrayMascotas);

        try {
            request.getRequestDispatcher("RegistrarCita.jsp").forward(request, response);//Redirecionar                    
        } catch (ServletException ex) {
            Logger.getLogger(CitasController.class.getName()).log(Level.SEVERE, null, ex);
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

}