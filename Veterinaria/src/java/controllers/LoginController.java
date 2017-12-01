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
import models.Persona;
import org.apache.commons.codec.digest.DigestUtils;
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
        if (action.equalsIgnoreCase("intoerpsona")) {
            ingresarPersona(request, response);
        }else if (action.equalsIgnoreCase("exitpersona")) {
            exitPersona(request, response);
        }
    }

    private void ingresarPersona(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Query q = sesion.createQuery("FROM Persona WHERE correo =? AND contrasena =? ");
        q.setString(0, request.getParameter("correo"));
//        String contrasenaencriptada = (request.getParameter("contrasena"));
        String contrasenaencriptada = DigestUtils.md5Hex(request.getParameter("contrasena"));
        q.setString(1, contrasenaencriptada);
        ArrayList listaObjetos = (ArrayList) q.list();
        //Verifica contraseña
        if (listaObjetos.size() >= 1) {

            HttpSession session = request.getSession();
            Persona persona = (Persona) listaObjetos.get(0);
            String idpersona = persona.getIdVeterinario().toString();
            session.setAttribute("idpersona", idpersona);
            session.setAttribute("perfil", persona.getPerfil());
            if (persona.getPerfil().equals("Veterinario")) {
                response.sendRedirect("CitasController?action=admin&param=1");
            } else {
                response.sendRedirect("PropietarioController?action=admin");
            }

//            response.sendRedirect("AdminClientes.jsp?error=ok");//Se pierde la información          
            sesion.close();
        } else {

            try {
                response.sendRedirect("LoginPersona.jsp?error=true");//Se pierde la información
            } catch (IOException ex) {
                Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

//    private void ingresarPropietario(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        PrintWriter out = response.getWriter();
//        Session sesion = HibernateUtil.getSessionFactory().openSession();
//        Query q = sesion.createQuery("FROM Propietario WHERE correo =? AND contrasena =? ");
//        q.setString(0, request.getParameter("correo"));
////        String contraseña = (request.getParameter("contrasena"));
//        String contrasenaencriptada = DigestUtils.md5Hex(request.getParameter("contrasena"));
//
//        q.setString(1, contrasenaencriptada);
//        ArrayList listaObjetos = (ArrayList) q.list();
//        //Verifica contraseña
//        if (listaObjetos.size() >= 1) {
//
//            /*HttpSession session = request.getSession();
//            Clientes cliente = (Clientes) listaObjetos.get(0);
//            session.setAttribute("User", "Cliente");
//            String idcliente = cliente.getIdCliente().toString();
//            session.setAttribute("id", idcliente);
//            session.setAttribute("razon_social", cliente.getRazonSocial());*/
//            response.sendRedirect("AdminClientes.jsp?error=ok");//Se pierde la información          
//            sesion.close();
//        } else {
//
//            try {
//                response.sendRedirect("LoginPropietario.jsp?error=true");//Se pierde la información
//            } catch (IOException ex) {
//                Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
//            }
//        }
//
//    }

    private void exitPersona(HttpServletRequest request, HttpServletResponse response) throws IOException {

//        HttpSession session = request.getSession();
//        session.invalidate();
        PrintWriter out = response.getWriter();
        out.print("Estoy en exitpersona");
            response.sendRedirect("RegistrarPersona.jsp?error=no");//Se pierde la información        

    }
//
//    private void exitEmpleados(HttpServletRequest request, HttpServletResponse response) {
//
//        HttpSession session = request.getSession();
//        session.invalidate();
//
//        try {
//            response.sendRedirect("LoginEmpleado.jsp");//Se pierde la información
//        } catch (IOException ex) {
//            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
//        }
//
//    }
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
