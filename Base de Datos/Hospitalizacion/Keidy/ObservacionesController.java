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
import javax.servlet.http.HttpSession;
import models.HibernateUtil;
import models.Hospitalizacion;
import models.Observaciones;
import models.Persona;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author juli-
 */
public class ObservacionesController extends HttpServlet {

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
        switch (action) {
            case "create":
                registrar(request, response);
                break;
            case "admin":
                admin(request, response);
                break;
//            case "update":
//                actualizar(request, response);
//                break;
//            case "eliminar":
//                eliminar(request, response);
//                break;
        }
    }

    private void registrar(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        try {
        Session sesion = models.HibernateUtil.getSessionFactory().openSession();
        String obser = request.getParameter("observacionDiaria");
        String idob = request.getSession().getAttribute("idob").toString();
        Hospitalizacion hospitalizacion = (Hospitalizacion) sesion.get(Hospitalizacion.class, Integer.parseInt(idob));
        String personas = request.getSession().getAttribute("idpersona").toString();
        Persona persona = (Persona) sesion.get(Persona.class, Integer.parseInt(personas));
        Observaciones ob = new Observaciones(hospitalizacion, persona, obser);        
        sesion.beginTransaction();
        sesion.save(ob);
        sesion.getTransaction().commit();
        sesion.close();
        try {
            response.sendRedirect("ObservacionesController?action=admin&idob="+idob);
        } catch (IOException ex) {

        }
//        } catch (Exception e) {
//            response.sendRedirect("LoginPersona.jsp?error=permisos");
//        }

    }

    public void admin(HttpServletRequest request, HttpServletResponse response) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        HttpSession session = request.getSession();
        session.setAttribute("idob", request.getParameter("idob"));
//        String idob = request.getSession().getAttribute("idob").toString();

        Query q = sesion.createQuery("FROM Observaciones");
        ArrayList Observacioness = (ArrayList) q.list();

        ArrayList<Observaciones> o = new ArrayList<>();

        for (Object ob : Observacioness) {
            Observaciones obs = (Observaciones) ob;
            o.add(obs);

        }

        request.setAttribute("listaO", o);
        try {
            request.getRequestDispatcher("AdminObser.jsp").forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(PropietarioController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(PropietarioController.class.getName()).log(Level.SEVERE, null, ex);
        }
        sesion.close();
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
