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
import models.HibernateUtil;
import models.Propietario;
import org.apache.commons.codec.digest.DigestUtils;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author juli-
 */
public class PropietarioController extends HttpServlet {

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
            case "update":
                actualizar(request, response);
                break;
            case "eliminar":
                eliminar(request, response);
                break;
        }
    }

    private void registrar(HttpServletRequest request, HttpServletResponse response) {
        /*
        Formulario Registrar: Falta que 
        confirme la contraseña y en el formulario editar
        que los select aparezcan selecionado segun el que viene de la base de datos
        Y verificar las validaciones javascript que algunos input faltan por validar
        */
        long documento = Long.parseLong(request.getParameter("documento"));
        String nombre = request.getParameter("nombres");
        String apellido = request.getParameter("apellidos");
        String genero = request.getParameter("genero");
        long telefono = Long.parseLong(request.getParameter("telefono"));
        String correo = request.getParameter("correo");
        String direccion = request.getParameter("direccion");
        String ciudad = request.getParameter("ciudad");
//        String contra = request.getParameter("contrasena");
        String contrasenaencriptada = DigestUtils.md5Hex(request.getParameter("contrasena"));
        String estado = request.getParameter("estado");

        Propietario pro = new Propietario(documento, nombre, apellido, genero, telefono, correo, direccion, ciudad, contrasenaencriptada, estado);
        Session sesion = models.HibernateUtil.getSessionFactory().openSession();
        sesion.beginTransaction();
        sesion.save(pro);
        sesion.getTransaction().commit();
        sesion.close();

        try {
            response.sendRedirect("PropietarioController?action=admin");
        } catch (IOException ex) {

        }

    }

    public void admin(HttpServletRequest request, HttpServletResponse response) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();

        Query q = sesion.createQuery("FROM Propietario");
        ArrayList Propietario = (ArrayList) q.list();

        ArrayList<Propietario> pro = new ArrayList<>();

        for (Object prop : Propietario) {

            Propietario propi = (Propietario) prop;
            pro.add(propi);

        }

        request.setAttribute("listaP", Propietario);//listado de datos que esta en la bd 
        try {
            request.getRequestDispatcher("AdminPropietario.jsp").forward(request, response);//envia informacion a admin jsp
        } catch (ServletException ex) {
            Logger.getLogger(PropietarioController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(PropietarioController.class.getName()).log(Level.SEVERE, null, ex);
        }
        sesion.close();
    }

    public void actualizar(HttpServletRequest request, HttpServletResponse response) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Propietario pro = (Propietario) sesion.get(Propietario.class, Integer.parseInt(request.getParameter("id")));
        if (request.getMethod().equalsIgnoreCase("GET")) {

            request.setAttribute("prop", pro);

            try {
                request.getRequestDispatcher("EditarPropietario.jsp").forward(request, response);
            } catch (ServletException ex) {
                Logger.getLogger(PropietarioController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(PropietarioController.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else {
            pro.setDocumento(Long.parseLong(request.getParameter("documento")));
            pro.setNombres(request.getParameter("nombres"));
            pro.setApellidos(request.getParameter("apellidos"));
            pro.setGenero(request.getParameter("genero"));
            pro.setTelefono(Long.parseLong(request.getParameter("telefono")));
            pro.setCorreo(request.getParameter("correo"));
            pro.setDireccion(request.getParameter("direccion"));
            pro.setCiudad(request.getParameter("ciudad"));
          //  pro.setContrasena(request.getParameter("contrasena"));
            pro.setEstado(request.getParameter("estado"));

            sesion.beginTransaction();
            sesion.saveOrUpdate(pro);
            sesion.getTransaction().commit();
            try {
                response.sendRedirect("PropietarioController?action=admin");
            } catch (IOException ex) {
                Logger.getLogger(PropietarioController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        sesion.close();

    }

    private void eliminar(HttpServletRequest request, HttpServletResponse response) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Propietario propiet = (Propietario) sesion.get(Propietario.class, Integer.parseInt(request.getParameter("id")));

        sesion.beginTransaction();
        sesion.delete(propiet);
        sesion.getTransaction().commit();
        sesion.close();

        try {
            response.sendRedirect("PropietarioController?action=admin");
        } catch (IOException ex) {

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
