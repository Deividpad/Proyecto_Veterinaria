/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

/*import Models.Carreras;
import Modleo.NewHibernateUtil;
import Modleo.Usuarios;*/
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
//import org.apache.commons.codec.digest.DigestUtils;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Samsung
 */
public class LoginController extends HttpServlet {

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
        HttpSession session = request.getSession();
        session.invalidate();
        if (action.equalsIgnoreCase("intoemple")) {
            ingresarClientes(request, response);
        } /*else if (action.equalsIgnoreCase("intoemple")) {
            ingresarEmpleados(request, response);
        } else if (action.equalsIgnoreCase("exitclient")) {
            exitClient(request, response);
        } else if (action.equalsIgnoreCase("exitemple")) {
            exitEmpleados(request, response);
        } */
    }

    private void ingresarClientes(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Query q = sesion.createQuery("FROM Persona WHERE correo =? AND contrasena =? ");
        q.setString(0, request.getParameter("correo"));
        String contrasenaencriptada = (request.getParameter("contrasena"));
        //String contrasenaencriptada = DigestUtils.md5Hex(request.getParameter("contrasena"));
        q.setString(1, contrasenaencriptada);
        ArrayList listaObjetos = (ArrayList) q.list();
        //Verifica contraseña
        if (listaObjetos.size() >= 1) {
            out.print("Entro");
            /*HttpSession session = request.getSession();
            Clientes cliente = (Clientes) listaObjetos.get(0);
            session.setAttribute("User", "Cliente");
            String idcliente = cliente.getIdCliente().toString();
            session.setAttribute("id", idcliente);
            session.setAttribute("razon_social", cliente.getRazonSocial());*/
            response.sendRedirect("CotizacionesController?action=admin");//Se pierde la información          
            sesion.close();
        } else {
            out.print("No entro");
            /*try {
                response.sendRedirect("LoginClientes.jsp?error=true");//Se pierde la información
            } catch (IOException ex) {
                Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
            }*/
        }
    }

    /*private void ingresarEmpleados(HttpServletRequest request, HttpServletResponse response) {

        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Query q = sesion.createQuery("FROM Empleados WHERE correo =? AND contrasena=? ");
        q.setString(0, request.getParameter("correo"));
        String contrasenaencriptada = DigestUtils.md5Hex(request.getParameter("contrasena"));
        q.setString(1, contrasenaencriptada);

        //Query q = sesion.createQuery("FROM Odontologos WHERE especialidad = 'General'"); Con el WHERE para condición        
        ArrayList listaObjetos = (ArrayList) q.list();

        if (listaObjetos.size() >= 1) {
            HttpSession session = request.getSession();
            Empleados empleado = (Empleados) listaObjetos.get(0);
            session.setAttribute("User", "Empleado");
            session.setAttribute("Rol", empleado.getPerfil());
            session.setAttribute("Correo", empleado.getCorreo());
            session.setAttribute("idempleado", empleado.getIdEmpleado());

            try {
                response.sendRedirect("CotizacionesController?action=admin");//Se pierde la información
            } catch (IOException ex) {
                Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
            }
            sesion.close();
        } else {

            try {
                response.sendRedirect("LoginEmpleado.jsp?error=true");//Se pierde la información
            } catch (IOException ex) {
                Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

    }

    private void exitClient(HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession();
        session.invalidate();
        try {
            response.sendRedirect("LoginClientes.jsp");//Se pierde la información
        } catch (IOException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void exitEmpleados(HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession();
        session.invalidate();

        try {
            response.sendRedirect("LoginEmpleado.jsp");//Se pierde la información
        } catch (IOException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }*/

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
