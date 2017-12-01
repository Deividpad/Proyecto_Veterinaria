/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
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
import models.Hospitalizacion;
import models.Mascota;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author juli-
 */
public class HospitalizacionController extends HttpServlet {

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
        } else if (action.equalsIgnoreCase("admin")) {
            Admin(request, response);

        } else if (action.equalsIgnoreCase("select")) {
            Select(request, response);
        }
    }

    private void Registrar(HttpServletRequest request, HttpServletResponse response) {
        Session sesion = models.HibernateUtil.getSessionFactory().openSession();

        String proposito = request.getParameter("proposito");
        String diagnostico = request.getParameter("diagnostico");
        String observaciones = request.getParameter("observaciones");
        Mascota masc = (Mascota) sesion.get(Mascota.class, 1);

        int masco = masc.getIdMascotas();
        Citas cit = (Citas) sesion.get(Citas.class, 1);
        int cita = cit.getIdCitasMedicas();
        Date fechaSalida = new Date();

        Session session = HibernateUtil.getSessionFactory().openSession();

//        Hospitalizacion hospi = new Hospitalizacion(cit, masc,fechaSalida,proposito, diagnostico, observaciones);
        //hospi.setFechaSalida(fechaSalida);
//        session.beginTransaction();
//        session.save(hospi);
//        session.getTransaction().commit();
//        session.close();
        try {

            response.sendRedirect("HospitalizacionController?action=admin");
        } catch (IOException ex) {
            Logger.getLogger(HospitalizacionController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void Admin(HttpServletRequest request, HttpServletResponse response) throws IOException {

        Session sesion = HibernateUtil.getSessionFactory().openSession();

        Query qhospi = sesion.createQuery("FROM Hospitalizacion");

        ArrayList listaHospitalizacion = (ArrayList) qhospi.list();
        ArrayList<Hospitalizacion> hospitalizacion = new ArrayList<Hospitalizacion>();

        for (Object mas : listaHospitalizacion) {
            Hospitalizacion hospit = (Hospitalizacion) mas;
            hospitalizacion.add(hospit);
        }

        request.setAttribute("ArrayHospitalizacion", hospitalizacion);

        try {
            request.getRequestDispatcher("AdminHospitalizacion.jsp").forward(request, response);

        } catch (ServletException ex) {
            Logger.getLogger(HospitalizacionController.class.getName()).log(Level.SEVERE, null, ex);
        }
        sesion.close();
    }

    public void Select(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Query q = sesion.createQuery("FROM Citas");
        ArrayList listaObjetos = (ArrayList) q.list();
        ArrayList<Citas> ArrayC = new ArrayList<Citas>();

        for (Object Obj : listaObjetos) {
            Citas cit = (Citas) Obj;
            ArrayC.add(cit);
        }
        request.setAttribute("ArrayC", ArrayC);

        Query m = sesion.createQuery("FROM Mascota");
        ArrayList listaO = (ArrayList) m.list();
        ArrayList<Mascota> ArrayM = new ArrayList<Mascota>();

        for (Object Obj : listaO) {
            Mascota mas = (Mascota) Obj;
            ArrayM.add(mas);
        }
        request.setAttribute("ArrayM", ArrayM);

        sesion.close();
        try {
            request.getRequestDispatcher("RegistrarHospitalizacion.jsp").forward(request, response);
        } catch (IOException ex) {
            Logger.getLogger(HospitalizacionController.class.getName()).log(Level.SEVERE, null, ex);
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
