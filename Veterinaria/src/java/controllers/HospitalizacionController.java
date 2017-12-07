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
import javax.servlet.http.HttpSession;
import models.Citas;
import models.HibernateUtil;
import models.Hospitalizacion;
import models.Mascota;
import models.Observaciones;
import models.Persona;
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
        } else if (action.equalsIgnoreCase("update")) {
            Actualizar(request, response);
        } else if (action.equalsIgnoreCase("admin")) {
            Admin(request, response);
        } else if (action.equalsIgnoreCase("adminobser")) {
            Adminobser(request, response);
        } else if (action.equalsIgnoreCase("createobser")) {
            RegistrarObser(request, response);
        } else if (action.equalsIgnoreCase("updateobser")) {
            ActualizarObser(request, response);
        } else if (action.equalsIgnoreCase("eliminarobser")) {
            Eliminarobser(request, response);
        }
    }

    private void Registrar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Session session = models.HibernateUtil.getSessionFactory().openSession();
//        String pro = "Nada";
//        String obser = "Nada";
//        String diag = "Nada";
        String idcita = request.getParameter("idcita");
        PrintWriter out = response.getWriter();
        Citas cita = (Citas) session.get(Citas.class, Integer.parseInt(idcita));
        Mascota mascota = (Mascota) session.get(Mascota.class, cita.getMascota().getIdMascotas());
//        out.print("Esty en el metodo con la de la cita: " + mascota.getNombre());       
        java.util.Date datetime = new java.util.Date();
        Hospitalizacion hospi = new Hospitalizacion(cita, mascota, "", "", "");
        hospi.setFechaSalida(datetime);
        session.beginTransaction();
        session.save(hospi);
        session.getTransaction().commit();
        session.close();
        HttpSession seshos = request.getSession();
        seshos.setAttribute("idhospi", hospi.getIdHospitalizacion());
        try {

            response.sendRedirect("Hospitalizar.jsp");
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

    private void Actualizar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String idhospi = request.getSession().getAttribute("idhospi").toString();
//        PrintWriter out = response.getWriter();
//        out.print("aqui en update de hospi id : "+idhospi);
        if (!idhospi.equals("nohave")) {
            Session session = models.HibernateUtil.getSessionFactory().openSession();
            Hospitalizacion hospitalizacion = (Hospitalizacion) session.get(Hospitalizacion.class, Integer.parseInt(idhospi));
            java.util.Date datetime = new java.util.Date();
            hospitalizacion.setFechaSalida(datetime);
            session.beginTransaction();
            session.saveOrUpdate(hospitalizacion);
            session.getTransaction().commit();
            session.close();
        }
        try {
            response.sendRedirect("DetallesCita.jsp");
        } catch (IOException ex) {
        }
    }

    private void RegistrarObser(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        PrintWriter out = response.getWriter();
//        out.print("Aqui en create obser");
        Session session = models.HibernateUtil.getSessionFactory().openSession();
        String observa = request.getParameter("observaciones");
        String idhospi = request.getParameter("idhospi");
        Hospitalizacion hospi = (Hospitalizacion) session.get(Hospitalizacion.class, Integer.parseInt(idhospi));
        String idpersona = request.getSession().getAttribute("idpersona").toString();
        Persona persona = (Persona) session.get(Persona.class, Integer.parseInt(idpersona));
        Observaciones observacion = new Observaciones(hospi, persona, observa);
        session.beginTransaction();
        session.save(observacion);
        session.getTransaction().commit();

        response.sendRedirect("HospitalizacionController?action=adminobser&idhospi=" + idhospi);
        session.close();
    }

    private void ActualizarObser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Observaciones observacion = (Observaciones) session.get(Observaciones.class, Integer.parseInt(request.getParameter("idobser")));
        observacion.setObservacionDiaria(request.getParameter("observaciones"));
//        PrintWriter out = response.getWriter();
//        out.print("Aqui en create obser: "+request.getParameter("idobser"));
        session.beginTransaction();
        session.saveOrUpdate(observacion);
        session.getTransaction().commit();
//
        response.sendRedirect("HospitalizacionController?action=adminobser&idhospi=" + request.getParameter("idhospi"));
        session.close();

    }

    private void Adminobser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();

        Session sesion = HibernateUtil.getSessionFactory().openSession();
        String idcita = request.getSession().getAttribute("delaz").toString();
        Citas cita = (Citas) sesion.get(Citas.class, Integer.parseInt(idcita));
        Query q = sesion.createQuery("FROM Observaciones WHERE hospitalizacion.idHospitalizacion =?");
        q.setString(0, request.getParameter("idhospi"));
        ArrayList ListaObser = (ArrayList) q.list();
//        ArrayList medicamentos = (ArrayList) request.getSession().getAttribute("ArrayMedicamentos");
        for (Object obser : ListaObser) {
            Observaciones observacion = (Observaciones) obser;
//            out.println("Observacione: "+observacion.getObservacionDiaria());        
            out.println("<tr>");
            out.println("<td>" + observacion.getObservacionDiaria() + "</td>");
            if (cita.getEstado().equals("Programada")) {
                out.println("<td>");
                out.println("<button class=\" btn btn-circle btn-mn btn-primary\" type=\"button\" onclick=\"Observacionesedi(" + 1 + "," + observacion.getIdObservaciones() + ",'" + observacion.getObservacionDiaria() + "')\">");
                out.println("<span class=\"fa fa-edit\"></span>");
                out.println("</button>");
                out.println("<button class=\" btn btn-circle btn-mn btn-danger\" onclick=\"Eliminarobser(" + observacion.getIdObservaciones() + ")\">");
                out.println("<span class=\"fa fa-trash\"></span>");
                out.println("</button>");
                out.println("</td>");
            }
            out.println("</tr>");
        }

        sesion.close();
    }

    private void Eliminarobser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Observaciones observacion = (Observaciones) session.get(Observaciones.class, Integer.parseInt(request.getParameter("idobser")));
        session.beginTransaction();
        session.delete(observacion);
        session.getTransaction().commit();
//
        response.sendRedirect("HospitalizacionController?action=adminobser&idhospi=" + request.getParameter("idhospi"));
        session.close();

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
