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
import models.Mascota;
import models.Persona;
import org.hibernate.HibernateException;
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

        /*
         Pagina para comprar computadores
         https://www.ebay.com/sch/i.html?_nkw=rbay%20es
        
         */
        PrintWriter out = response.getWriter();

        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("admin")) {
            Admin(request, response);
        } else if (action.equalsIgnoreCase("create")) {
            Registrar(request, response);
        }
        /*else if (action.equalsIgnoreCase("update")) {
         Actualizar(request, response);
         } else if (action.equalsIgnoreCase("eliminar")) {
         Eliminar(request, response);
         }*/
    }

    private void Registrar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        Citas cita;
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date fechaentrada = null;
        Date fechasalida = null;
        //Fecha Entrada
        String fechaen = request.getParameter("fhentrada");
        String tmentrada = request.getParameter("tmentrada");
        String fhentrada = fechaen + " " + tmentrada;

        //Fecha Salida
        String fechasal = request.getParameter("fhsalida");
        String tmsalida = request.getParameter("tmsalida");
        String fhsalida = fechasal + " " + tmsalida;
        try {
            fechaentrada = formatter.parse(fhentrada);
            fechasalida = formatter.parse(fhsalida);
            //out.print("En el try" + fechaentrada);

        } catch (ParseException | HibernateException e) {
            fechaentrada = null;
            fechasalida = null;
        }

        Session session = HibernateUtil.getSessionFactory().openSession();
        Query q = session.createQuery("From Citas where Fecha_Entrada between ? and ? or Fecha_Salida between ? and ?");
        q.setString(0, fhentrada);
        q.setString(1, fhsalida);
        q.setString(2, fhentrada);
        q.setString(3, fhsalida);
        ArrayList listaCitas = (ArrayList) q.list();
        if (listaCitas.size() >= 1) {            
            for (Object pro : listaCitas) {
                cita = (Citas) pro;
                //Valida hora de entrada del formulario con hora de salida de BD
                int hourent = cita.getFechaSalida().getHours();
                int minent = cita.getFechaSalida().getMinutes();
                String hourentrada = Integer.toString(hourent);
                String minentrada = Integer.toString(minent);
                String horabdentrada = hourentrada + ":" + minentrada;
                
                //Validar hora de salida del formulario con hora de entra de BD
                int hoursld = cita.getFechaEntrada().getHours();
                int minsld = cita.getFechaEntrada().getMinutes();                
                String hoursalida = Integer.toString(hoursld);
                String minsalida = Integer.toString(minsld);
                if(hoursld < 10){
                    hoursalida = "0"+hoursalida;
                }
                if(minsld < 10){
                    minsalida = "0"+minsalida;
                }                
                String horabdsalida = hoursalida + ":" + minsalida; 
                out.print("Hora entrada BD: "+horabdsalida+" hora salida frm: "+tmsalida);
                if (horabdentrada.equals(tmentrada) || horabdsalida.equals(tmsalida)) {
                    out.print("Fecha de entrada igual a la de salida dentro del segundo if");
//                    Mascota mascota = (Mascota) session.get(Mascota.class, Integer.parseInt(request.getParameter("mascota")));
//                    Persona persona = (Persona) session.get(Persona.class, 1);
//                    String Proposito = "";
//                    String Observaciones = "";
//                    String tipo = request.getParameter("tipo");
//                    cita = new Citas(mascota, persona, fechaentrada, fechasalida, Proposito, tipo, "Programada");
//                    cita.setObservaciones(Observaciones);
//                    session.beginTransaction();
//                    session.save(cita);
//                    session.getTransaction().commit();
//                    session.close();
//                    try {
//                        response.sendRedirect("CitasController?action=admin");
//                    } catch (IOException ex) {
//                        Logger.getLogger(CitasController.class.getName()).log(Level.SEVERE, null, ex);
//                    }
                }else{
                    out.print("!Cita interferida¡ Selecione otra hora");
                }
            }
        } else {
            out.print("Noooo hay ningun between ");
//            Mascota mascota = (Mascota) session.get(Mascota.class, Integer.parseInt(request.getParameter("mascota")));
//            Persona persona = (Persona) session.get(Persona.class, 1);
//            String Proposito = "";
//            String Observaciones = "";
//            String tipo = request.getParameter("tipo");
//            cita = new Citas(mascota, persona, fechaentrada, fechasalida, Proposito, tipo, "Programada");
//            cita.setObservaciones(Observaciones);
//            session.beginTransaction();
//            session.save(cita);
//            session.getTransaction().commit();
//            session.close();
//            try {
//                response.sendRedirect("CitasController?action=admin");
//            } catch (IOException ex) {
//                Logger.getLogger(CitasController.class.getName()).log(Level.SEVERE, null, ex);
//            }
        }
//        Mascota mascota = (Mascota) session.get(Mascota.class, Integer.parseInt(request.getParameter("mascota")));
//        Persona persona = (Persona) session.get(Persona.class, 1);
//        String Proposito = "";
//        String Observaciones = "";
//        String tipo = request.getParameter("tipo");
//        PrintWriter out = response.getWriter();
//
//        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
//        Date fechaentrada = null;
//        Date fechasalida = null;
//        //Fecha Entrada
//        String fechaen = request.getParameter("fhentrada");
//        String tmentrada = request.getParameter("tmentrada");
//        String fhentrada = fechaen + " " + tmentrada;
//
//        //Fecha Salida
//        String fechasal = request.getParameter("fhsalida");
//        String tmsalida = request.getParameter("tmsalida");
//        String fhsalida = fechasal + " " + tmsalida;
//        try {
//            fechaentrada = formatter.parse(fhentrada);
//            fechasalida = formatter.parse(fhsalida);
//            out.print("sfadsfdsf" + fhsalida);
//
//            Citas cita = new Citas(mascota, persona, fechaentrada, fechasalida, Proposito, tipo, "Programada");
//            cita.setObservaciones(Observaciones);
//            //GUARDAMOS EBJETO EN BD
//
//            //            session.beginTransaction();
//            //            session.save(cita);
//            //            session.getTransaction().commit();
//            //            session.close();
//        } catch (ParseException | HibernateException e) {
//            fechaentrada = null;
//            fechasalida = null;
//        }
////        try {
////            response.sendRedirect("CitasController?action=admin");
////        } catch (IOException ex) {
////            Logger.getLogger(CitasController.class.getName()).log(Level.SEVERE, null, ex);
////        }
    }

    private void Admin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        /*try (PrintWriter out = response.getWriter()) {
         /* TODO output your page here. You may use following sample code.
         out.println("Entro al metodo");
            
         }*/
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Query qcitas = sesion.createQuery("FROM Citas");
        //Query q = sesion.createQuery("FROM Odontologos WHERE especialidad = 'General'"); Con el WHERE para condición
        ArrayList listaObjetos = (ArrayList) qcitas.list();

        ArrayList<Citas> Arraycitas = new ArrayList<>();
        //PrintWriter out = response.getWriter();
        for (Object Obj : listaObjetos) {
            Citas cita = (Citas) Obj;
            Arraycitas.add(cita);

        }
        request.setAttribute("ArrayCitas", Arraycitas);

        // Array Mascotas
        Query qmascotas = sesion.createQuery("FROM Mascota");
        //Query q = sesion.createQuery("FROM Odontologos WHERE especialidad = 'General'"); Con el WHERE para condición
        ArrayList listaMascotas = (ArrayList) qmascotas.list();
        sesion.close();
        ArrayList<Mascota> ArrayMascotas = new ArrayList<>();
        //PrintWriter out = response.getWriter();
        for (Object Obj : listaMascotas) {
            Mascota mascota = (Mascota) Obj;
            ArrayMascotas.add(mascota);
        }
        request.setAttribute("ArrayMascotas", ArrayMascotas);

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
