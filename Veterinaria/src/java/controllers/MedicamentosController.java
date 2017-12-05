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
import javax.servlet.http.HttpSession;
import models.Citas;
import models.HibernateUtil;
import models.Hospitalizacion;
import models.Medicamentos;
import models.Persona;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author juli-
 */
public class MedicamentosController extends HttpServlet {

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
            case "Select":
                Select(request, response);
                break;
            case "update":
                actualizar(request, response);
                break;
            case "eliminar":
                Eliminar(request, response);
                break;
        }
    }

    private void registrar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Session sesion = models.HibernateUtil.getSessionFactory().openSession();
        String nombre = request.getParameter("nombre");
        String laboratorio = request.getParameter("laboratorio");
        String lote = request.getParameter("lote");
        java.util.Date fecha = new java.util.Date();
        String persona = request.getSession().getAttribute("idpersona").toString();
        Persona per = (Persona) sesion.get(Persona.class, Integer.parseInt(persona));
        String idcita = request.getParameter("idcita");
        PrintWriter out = response.getWriter();
        Citas cita = (Citas) sesion.get(Citas.class, Integer.parseInt(idcita));
        Medicamentos Medi = new Medicamentos(per, nombre, laboratorio, lote, fecha);
        Medi.setCitas(cita);
        sesion.beginTransaction();
        sesion.save(Medi);
        sesion.getTransaction().commit();
        try {
            response.sendRedirect("MedicamentosController?action=admin&idcita=" + idcita);
        } catch (IOException ex) {
            Logger.getLogger(MedicamentosController.class.getName()).log(Level.SEVERE, null, ex);
        }
        sesion.close();
    }

    public void admin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        String id = request.getParameter("idcita");
        HttpSession session = request.getSession();
        session.setAttribute("delaz", id);
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Citas cita = (Citas) sesion.get(Citas.class, Integer.parseInt(id));
        Query q = sesion.createQuery("FROM Medicamentos WHERE citas.idCitasMedicas =?");
        q.setString(0, request.getParameter("idcita"));
        ArrayList ListaMedicamentos = (ArrayList) q.list();
//        ArrayList medicamentos = (ArrayList) request.getSession().getAttribute("ArrayMedicamentos");
        for (Object med : ListaMedicamentos) {
            Medicamentos medi = (Medicamentos) med;
            out.println("<tr>");
            out.println("<td>" + medi.getNombre() + "</td>");
            out.println("<td>" + medi.getLaboratorio() + "</td>");
            out.println("<td>" + medi.getLote() + "</td>");
            out.println("<td>" + medi.getFecha() + "</td>");
            out.println("<td>");
            out.println("<button class=\" btn btn-circle btn-mn btn-primary\" type=\"button\" onclick=\"Medicamentosedi("+1+"," + medi.getIdMedicamento() + ",'" + medi.getNombre() + "','" + medi.getLaboratorio() + "','" + medi.getLote() + "')\">");
            out.println("<span class=\"fa fa-edit\"></span>");
            out.println("</button>");
//            onclick="location.href = 'PropietarioController?action=update&id=${propi.idPropietario}'
            out.println("<button class=\" btn btn-circle btn-mn btn-danger\" onclick=\"Eliminarmedi("+medi.getIdMedicamento()+")\">");
            out.println("<span class=\"fa fa-trash\"></span>"); 
            out.println("</button>");
            out.println("</td>");
            out.println("</tr>");
        }

        sesion.close();
    }

    public void actualizar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Medicamentos medicamento = (Medicamentos) sesion.get(Medicamentos.class, Integer.parseInt(request.getParameter("idmedi")));
        medicamento.setNombre(request.getParameter("nombre"));
        medicamento.setLaboratorio(request.getParameter("laboratorio"));
        medicamento.setLote(request.getParameter("lote"));
        sesion.beginTransaction();
        sesion.save(medicamento);
        sesion.getTransaction().commit();
//        PrintWriter out = response.getWriter();
        String idcita = request.getParameter("idcita");
        try {
            response.sendRedirect("MedicamentosController?action=admin&idcita=" + idcita);
        } catch (IOException ex) {
            Logger.getLogger(MedicamentosController.class.getName()).log(Level.SEVERE, null, ex);
        }

        sesion.close();
    }

    private void Eliminar(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        PrintWriter out = response.getWriter();
        
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Medicamentos medicamento = (Medicamentos) sesion.get(Medicamentos.class, Integer.parseInt(request.getParameter("idmedi")));
        sesion.beginTransaction();
        sesion.delete(medicamento);
        sesion.getTransaction().commit();
        sesion.close();    
        String idcita = request.getParameter("idcita");
        try {
            response.sendRedirect("MedicamentosController?action=admin&idcita=" + idcita);
        } catch (IOException ex) {
            Logger.getLogger(MedicamentosController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void Select(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Query q = sesion.createQuery("FROM Persona");
        ArrayList listaObjetos = (ArrayList) q.list();
        ArrayList<Persona> ArrayP = new ArrayList<Persona>();

        for (Object Obj : listaObjetos) {
            Persona med = (Persona) Obj;
            ArrayP.add(med);
        }
        request.setAttribute("ArrayP", ArrayP);

        Query c = sesion.createQuery("FROM Citas");
        ArrayList listaO = (ArrayList) c.list();
        ArrayList<Citas> ArrayC = new ArrayList<Citas>();

        for (Object Obj : listaO) {
            Citas ci = (Citas) Obj;
            ArrayC.add(ci);
        }
        request.setAttribute("ArrayC", ArrayC);

        Query H = sesion.createQuery("FROM Hospitalizacion");
        ArrayList lista = (ArrayList) H.list();
        ArrayList<Hospitalizacion> ArrayH = new ArrayList<Hospitalizacion>();

        for (Object Obj : lista) {
            Hospitalizacion ho = (Hospitalizacion) Obj;
            ArrayH.add(ho);
        }
        request.setAttribute("ArrayH", ArrayH);

        sesion.close();
        try {
            request.getRequestDispatcher("registrar.jsp").forward(request, response);
        } catch (IOException ex) {
            Logger.getLogger(MedicamentosController.class.getName()).log(Level.SEVERE, null, ex);
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
