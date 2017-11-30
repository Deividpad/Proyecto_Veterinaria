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
              case"update":
             actualizar(request, response);
             break;
//             case"eliminar":
//             eliminar(request, response);
//             break;
        }
    }

    private void registrar(HttpServletRequest request, HttpServletResponse response) {
        Session sesion = models.HibernateUtil.getSessionFactory().openSession();

        String nombre = request.getParameter("nombre");
        String laboratorio = request.getParameter("laboratorio");
        String lote = request.getParameter("lote");
        Date fecha = new Date();
//        Persona per = (Persona) sesion.get(Persona.class, Integer.parseInt(request.getParameter("idVeterinario")));
        Persona per = (Persona) sesion.get(Persona.class, Integer.parseInt("1"));
//        Hospitalizacion Ho = (Hospitalizacion) sesion.get(Hospitalizacion.class, Integer.parseInt(request.getParameter("idHospitalizacion")));
//        Citas Cit = (Citas) sesion.get(Citas.class, Integer.parseInt(request.getParameter("idCitasMedicas")));

//      Medicamentos Medi = new Medicamentos(per, nombre, laboratorio, lote, fecha);
        Medicamentos Medi = new Medicamentos(per, nombre, laboratorio, lote, fecha);
        sesion.beginTransaction();
        sesion.save(Medi);
        sesion.getTransaction().commit();
        sesion.close();

        try {
            response.sendRedirect("MedicamentosController?action=admin");
        } catch (IOException ex) {

        }

    }

    public void admin(HttpServletRequest request, HttpServletResponse response) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();

        Query q = sesion.createQuery("FROM Medicamentos");
        ArrayList Medicamentos = (ArrayList) q.list();

        ArrayList<Medicamentos> me = new ArrayList<>();

        for (Object med : Medicamentos) {

            Medicamentos medi = (Medicamentos) med;
            me.add(medi);
            request.setAttribute("listaM", me);
        }
        try {
            request.getRequestDispatcher("AdminMedicamentos.jsp").forward(request, response);//envia informacion a admin jsp
        } catch (ServletException ex) {
            Logger.getLogger(MedicamentosController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(MedicamentosController.class.getName()).log(Level.SEVERE, null, ex);
        }
        sesion.close();
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
     public void actualizar(HttpServletRequest request, HttpServletResponse response) {
          Session sesion = HibernateUtil.getSessionFactory().openSession();
           Query q = sesion.createQuery("FROM Persona");
        ArrayList listaObjetos = (ArrayList) q.list();
        ArrayList<Persona> ArrayPe = new ArrayList<Persona>();

        for (Object Obj : listaObjetos) {
            Persona med = (Persona) Obj;
            ArrayPe.add(med);
        }
        request.setAttribute("ArrayPe", ArrayPe);

        Query c = sesion.createQuery("FROM Citas");
        ArrayList listaO = (ArrayList) c.list();
        ArrayList<Citas> ArrayCi = new ArrayList<Citas>();

        for (Object Obj : listaO) {
            Citas ci = (Citas) Obj;
            ArrayCi.add(ci);
        }
        request.setAttribute("ArrayCi", ArrayCi);

        Query H = sesion.createQuery("FROM Hospitalizacion");
        ArrayList lista = (ArrayList) H.list();
        ArrayList<Hospitalizacion> ArrayHo = new ArrayList<Hospitalizacion>();

        for (Object Obj : lista) {
            Hospitalizacion ho = (Hospitalizacion) Obj;
            ArrayHo.add(ho);
        }
        request.setAttribute("ArrayHo", ArrayHo);
       Medicamentos me = (Medicamentos) sesion.get(Medicamentos.class, Integer.parseInt(request.getParameter("id")));
        if (request.getMethod().equalsIgnoreCase("GET")) {
            request.setAttribute("medi", me);

            try {
                request.getRequestDispatcher("actuaE.jsp").forward(request, response);
            } catch (ServletException ex) {
                Logger.getLogger(MedicamentosController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(MedicamentosController.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else {
           
           
            Date fecha = new Date();
           
            Persona p = (Persona) sesion.get(Persona.class, Integer.parseInt(request.getParameter("persona")));
            Citas clien = (Citas) sesion.get(Citas.class, Integer.parseInt(request.getParameter("citas")));
            Hospitalizacion h = (Hospitalizacion) sesion.get(Hospitalizacion.class, Integer.parseInt(request.getParameter("hospitalizacion")));
            
                       
            me.setPersona(p);
            me.setCitas(clien);
            me.setHospitalizacion(h);
           
            me.setNombre(request.getParameter("nombre"));
            me.setLaboratorio(request.getParameter("laboratorio"));
            me.setLote(request.getParameter("lote"));
            me.setFecha(fecha);

            sesion.beginTransaction();
            sesion.saveOrUpdate(me);
            sesion.getTransaction().commit();

            try {
                response.sendRedirect("MedicamentosController?action=admin");
            } catch (IOException ex) {
                Logger.getLogger(MedicamentosController.class.getName()).log(Level.SEVERE, null, ex);
            }
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
