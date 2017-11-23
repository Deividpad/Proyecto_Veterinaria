/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.DataInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import models.HibernateUtil;
import models.Persona;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Erika N
 */
public class PersonasController extends HttpServlet {

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

        // out = response.getWriter();
        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("create")) {
            Registrar(request, response);
        } else if (action.equalsIgnoreCase("admin")) {
            Admin(request, response);
        } else if (action.equalsIgnoreCase("update")) {
            Actualizar(request, response);
        } else if (action.equalsIgnoreCase("eliminar")) {
            Eliminar(request, response);
        }
    }

    private void Registrar(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        /*
        Formulario Registrar: Falta que 
        confirme la contraseña y en el formulario editar
        que los select aparezcan selecionado segun el que viene de la base de datos
        */
        long documento = Long.parseLong(request.getParameter("documento"));
        String nombres = request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos");
        String genero = request.getParameter("genero");
        long telefono = Long.parseLong(request.getParameter("telefono"));
        String correo = request.getParameter("correo");
        String direccion = request.getParameter("direccion");
        String ciudad = request.getParameter("ciudad");
        String perfil = request.getParameter("perfil");
        String especialidad = request.getParameter("especialidad");
        String foto = request.getParameter("foto");
        String contrasena = request.getParameter("contrasena");
        String estado = request.getParameter("estado");

//        Part fotoPart = request.getPart("foto");
//        int fotoSize=(int)fotoPart.getSize(); //si no tiene tamaño, no hay foto
//        byte[] foto = null; //el buffer
//        if (fotoSize > 0) {
//            foto = new byte[fotoSize];
//            try (DataInputStream dis = new DataInputStream(fotoPart.getInputStream())) {
//                dis.readFully(foto);
//            }
//        } 
        Persona perso = new Persona(documento, nombres, apellidos, genero, telefono, correo, direccion, ciudad, perfil, foto, contrasena, estado);
        perso.setEspecialidad(especialidad);
//        if (fotoSize>0){
//        perso.setFoto(foto);}

        Session sesion = HibernateUtil.getSessionFactory().openSession();
        sesion.beginTransaction();
        sesion.save(perso);
        sesion.getTransaction().commit();
        sesion.close();

        try {
            response.sendRedirect("PersonasController?action=admin");
        } catch (IOException ex) {
            Logger.getLogger(PersonasController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void Admin(HttpServletRequest request, HttpServletResponse response) throws IOException {

        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Query q = sesion.createQuery("FROM Persona");

        ArrayList listaPersonas = (ArrayList) q.list();

        ArrayList<Persona> person = new ArrayList<Persona>();

        for (Object per : listaPersonas) {
            Persona persona = (Persona) per;
            person.add(persona);
        }

        request.setAttribute("ArrayPersonas", person);
        try {
            request.getRequestDispatcher("AdminPersona.jsp").forward(request, response);

        } catch (ServletException ex) {
            Logger.getLogger(PersonasController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void Actualizar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Persona perso = (Persona) sesion.get(Persona.class, Integer.parseInt(request.getParameter("id")));

        if (request.getMethod().equalsIgnoreCase("GET")) {
            request.setAttribute("persona", perso);
            try {
                request.getRequestDispatcher("EditarPersona.jsp").forward(request, response);
            } catch (ServletException ex) {
                Logger.getLogger(PersonasController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(PersonasController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            
            perso.setDocumento(Long.parseLong(request.getParameter("documento")));
            perso.setNombres(request.getParameter("nombres"));
            perso.setApellidos(request.getParameter("apellidos"));
            perso.setGenero(request.getParameter("genero"));
            perso.setTelefono(Long.parseLong(request.getParameter("telefono")));
            perso.setCorreo(request.getParameter("perfil"));
            perso.setDireccion(request.getParameter("direccion"));
            perso.setCiudad(request.getParameter("ciudad"));
            perso.setPerfil(request.getParameter("perfil"));
            perso.setEspecialidad(request.getParameter("especialidad"));
            perso.setFoto(request.getParameter("foto"));
            perso.setContrasena(request.getParameter("contrasena"));
            perso.setEstado(request.getParameter("estado"));
            sesion.beginTransaction();
            sesion.saveOrUpdate(perso);
            sesion.getTransaction().commit();
            sesion.close();
            try {
                response.sendRedirect("PersonasController?action=admin");
            } catch (Exception ex) {
                Logger.getLogger(PersonasController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        
    }

    private void Eliminar(HttpServletRequest request, HttpServletResponse response) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Persona emple = (Persona) sesion.get(Persona.class, Integer.parseInt(request.getParameter("id")));
        sesion.beginTransaction();
        sesion.delete(emple);
        sesion.getTransaction().commit();
        sesion.close();

        try {
            response.sendRedirect("PersonasController?action=admin");
        } catch (IOException ex) {
            Logger.getLogger(PersonasController.class.getName()).log(Level.SEVERE, null, ex);
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
