/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Citas;
import models.HibernateUtil;
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
        }/* else if (action.equalsIgnoreCase("admin")) {
            Admin(request, response);
        } else if (action.equalsIgnoreCase("update")) {
            Actualizar(request, response);
        } else if (action.equalsIgnoreCase("eliminar")) {
            Eliminar(request, response);
        }*/
    }
    
    
    
        private void Admin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        /*try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code.
            out.println("Entro al metodo");
            
        }*/
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Query qemp = sesion.createQuery("FROM Citas");
        //Query q = sesion.createQuery("FROM Odontologos WHERE especialidad = 'General'"); Con el WHERE para condición
        ArrayList listaObjetos = (ArrayList) qemp.list();
        sesion.close();
        ArrayList<Citas> Arraycitas = new ArrayList<>();
        PrintWriter out = response.getWriter();
        for (Object Obj : listaObjetos) {
            Citas cita = (Citas) Obj;
            Arraycitas.add(cita);
            out.println(cita.getFechaEntrada());
            out.println(cita.getFechaSalida());
        }
        request.setAttribute("ArrayCitas", Arraycitas);
        
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
