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
        } else if (action.equalsIgnoreCase("update")) {
            Actualizar(request, response);
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
                if (hourent < 10) {
                    hourentrada = "0" + hourentrada;
                }
                if (minent < 10) {
                    minentrada = "0" + minentrada;
                }
                String horabdentrada = hourentrada + ":" + minentrada;
                //Validar hora de salida del formulario con hora de entra de BD
                int hoursld = cita.getFechaEntrada().getHours();
                int minsld = cita.getFechaEntrada().getMinutes();
                String hoursalida = Integer.toString(hoursld);
                String minsalida = Integer.toString(minsld);
                if (hoursld < 10) {
                    hoursalida = "0" + hoursalida;
                }
                if (minsld < 10) {
                    minsalida = "0" + minsalida;
                }
                String horabdsalida = hoursalida + ":" + minsalida;
//                HttpServletRequest request, HttpServletResponse responseout.print("Hora entrada BD: " + horabdsalida + " hora salida frm: " + tmsalida);
                if (horabdentrada.equals(tmentrada) || horabdsalida.equals(tmsalida)) {
                    out.print("");
                    Mascota mascota = (Mascota) session.get(Mascota.class, Integer.parseInt(request.getParameter("mascota")));
                    String idpersona = request.getSession().getAttribute("idpersona").toString();
                    Persona persona = (Persona) session.get(Persona.class, idpersona);
                    String Proposito = "";
                    String Observaciones = "";
                    String tipo = request.getParameter("tipo");
                    cita = new Citas(mascota, persona, fechaentrada, fechasalida, Proposito, tipo, "Programada");
                    cita.setObservaciones(Observaciones);
                    session.beginTransaction();
                    session.save(cita);
                    session.getTransaction().commit();

                    if (tipo.equals("Urgencia")) {
                        //sesion los datos de la cita creada
                        HttpSession sesion = request.getSession();
                        sesion.setAttribute("delaz",cita.getIdCitasMedicas());
                        out.print("urgencia");
                    }

//                    try {
//                        response.sendRedirect("CitasController?action=admin");
//                    } catch (IOException ex) {
//                        Logger.getLogger(CitasController.class.getName()).log(Level.SEVERE, null, ex);
//                    }
                } else {
                    out.print("!Cita interferida¡ Selecione otra hora o Verifique su calendario");
                }
            }
        } else {
            out.print("");
            Mascota mascota = (Mascota) session.get(Mascota.class, Integer.parseInt(request.getParameter("mascota")));
            String idpersona = request.getSession().getAttribute("idpersona").toString();
            Persona persona = (Persona) session.get(Persona.class, Integer.parseInt(idpersona));
            String Proposito = "";
            String Observaciones = "";
            String tipo = request.getParameter("tipo");
            cita = new Citas(mascota, persona, fechaentrada, fechasalida, Proposito, tipo, "Programada");
            cita.setObservaciones(Observaciones);
            session.beginTransaction();
            session.save(cita);
            session.getTransaction().commit();
            
            if (tipo.equals("Urgencia")) {
                //sesion los datos de la cita creada
                HttpSession sesion = request.getSession();
                sesion.setAttribute("delaz",cita.getIdCitasMedicas());
                out.print("urgencia");
            }
//               
//            try {
//                response.sendRedirect("CitasController?action=admin");
//            } catch (IOException ex) {
//                Logger.getLogger(CitasController.class.getName()).log(Level.SEVERE, null, ex);
//            }
        }

        session.close();

    }

    private void Admin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        /*try (PrintWriter out = response.getWriter()) {
         /* TODO output your page here. You may use following sample code.
         out.println("Entro al metodo");
            
         }*/
        try {
            Session sesion = HibernateUtil.getSessionFactory().openSession();
            String idpersona = request.getSession().getAttribute("idpersona").toString();
            Query qcitas = sesion.createQuery("FROM Citas WHERE persona =?");
            qcitas.setString(0, idpersona);
//        qcitas.setString(0, request.getParameter("idpersona"));
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

            ArrayList<Mascota> ArrayMascotas = new ArrayList<>();
            //PrintWriter out = response.getWriter();
            for (Object Obj : listaMascotas) {
                Mascota mascota = (Mascota) Obj;
                ArrayMascotas.add(mascota);
            }
            request.setAttribute("ArrayMascotas", ArrayMascotas);
            if (request.getParameter("param").equals("1")) {
                try {
                    request.getRequestDispatcher("RegistrarCita.jsp").forward(request, response);//Redirecionar                    
                } catch (ServletException ex) {
                    Logger.getLogger(CitasController.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else if (request.getParameter("param").equals("2")) {
                try {
                    request.getRequestDispatcher("AdminCitas.jsp").forward(request, response);//Redirecionar                    
                } catch (ServletException ex) {
                    Logger.getLogger(CitasController.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                try {
                    request.getRequestDispatcher("AdminCitas.jsp").forward(request, response);//Redirecionar                    
                } catch (ServletException ex) {
                    Logger.getLogger(CitasController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

            sesion.close();
        } catch (Exception e) {
            response.sendRedirect("LoginPersona.jsp?error=permisos");//Se pierde la información       
        }

    }

    private void Actualizar(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        try {
        Session session = HibernateUtil.getSessionFactory().openSession();
        PrintWriter out = response.getWriter();

        if (request.getParameter("pro") != null) {

            if (request.getParameter("pro").equals("true")) {
                String idcita = request.getParameter("idcita");
                Citas cita = (Citas) session.get(Citas.class, Integer.parseInt(idcita));
                if (request.getParameter("observaciones").equals("")) {
//                    if (request.getParameter("proposito").equals("")) {
                        cita.setProposito(request.getParameter("proposito"));
                        out.print(cita.getProposito());
//                    }
                } else if (request.getParameter("proposito").equals("")) {
//                    if (request.getParameter("observaciones").equals("")) {
                        cita.setObservaciones(request.getParameter("observaciones"));
                        out.print(cita.getObservaciones());
//                    }
                }
                session.beginTransaction();
                session.saveOrUpdate(cita);
                session.getTransaction().commit();
                session.close();
//                try {
//                    response.sendRedirect("MedicamentosController?action=admin&idcita=" + idcita);
//                } catch (IOException ex) {
//                }

            } else if (request.getParameter("pro").equals("false")) {
                Citas citaestado = (Citas) session.get(Citas.class, Integer.parseInt(request.getParameter("idcita2")));
                if (request.getParameter("Estado").equals("Cancelada")) {
                    citaestado.setEstado("Cancelada");
                    session.beginTransaction();
                    session.saveOrUpdate(citaestado);
                    session.getTransaction().commit();

                    try {
                        response.sendRedirect("CitasController?action=admin&param=2");
                    } catch (IOException ex) {
                    }
                    session.close();
                } else {
                    citaestado.setEstado("Atendida");
                    session.beginTransaction();
                    session.saveOrUpdate(citaestado);
                    session.getTransaction().commit();

                    try {
                        response.sendRedirect("CitasController?action=admin&param=2");
                    } catch (IOException ex) {
                    }
                    session.close();
                }
            }
        } else {
            Citas cita = (Citas) session.get(Citas.class, Integer.parseInt(request.getParameter("idcita")));
//            Citas cita = (Citas) session.get(Citas.class, Integer.parseInt(idcita));
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

            Query q = session.createQuery("From Citas where Fecha_Entrada between ? and ? or Fecha_Salida between ? and ?");
            q.setString(0, fhentrada);
            q.setString(1, fhsalida);
            q.setString(2, fhentrada);
            q.setString(3, fhsalida);
            ArrayList listaCitas = (ArrayList) q.list();
            if (listaCitas.size() >= 1) {

                for (Object pro : listaCitas) {
                    Citas cita2 = (Citas) pro;
                    //Valida hora de entrada del formulario con hora de salida de BD
                    int hourent = cita2.getFechaSalida().getHours();
                    int minent = cita2.getFechaSalida().getMinutes();
                    String hourentrada = Integer.toString(hourent);
                    String minentrada = Integer.toString(minent);
                    if (hourent < 10) {
                        hourentrada = "0" + hourentrada;
                    }
                    if (minent < 10) {
                        minentrada = "0" + minentrada;
                    }
                    String horabdentrada = hourentrada + ":" + minentrada;

                    //Validar hora de salida del formulario con hora de entra de BD
                    int hoursld = cita2.getFechaEntrada().getHours();
                    int minsld = cita2.getFechaEntrada().getMinutes();
                    String hoursalida = Integer.toString(hoursld);
                    String minsalida = Integer.toString(minsld);
                    if (hoursld < 10) {
                        hoursalida = "0" + hoursalida;
                    }
                    if (minsld < 10) {
                        minsalida = "0" + minsalida;
                    }
                    String horabdsalida = hoursalida + ":" + minsalida;
//                HttpServletRequest request, HttpServletResponse responseout.print("Hora entrada BD: " + horabdsalida + " hora salida frm: " + tmsalida);
                    if (horabdentrada.equals(tmentrada) || horabdsalida.equals(tmsalida)) {
                        out.print("");
                        Mascota mascota = (Mascota) session.get(Mascota.class, Integer.parseInt(request.getParameter("mascota")));
                        //Persona persona = (Persona) session.get(Persona.class, 1);
                        String Proposito = "";
                        String Observaciones = "";
                        String tipo = request.getParameter("tipo");
                        cita.setMascota(mascota);
                        //cita.setPersona(persona);
                        cita.setFechaEntrada(fechaentrada);
                        cita.setFechaSalida(fechasalida);
                        cita.setProposito(Proposito);
                        cita.setTipo(tipo);
//                    cita = new Citas(mascota, persona, fechaentrada, fechasalida, Proposito, tipo, "Programada");
                        cita.setObservaciones(Observaciones);
                        session.beginTransaction();
                        session.saveOrUpdate(cita);
                        session.getTransaction().commit();
                        session.close();
//                    try {
//                        response.sendRedirect("CitasController?action=admin");
//                    } catch (IOException ex) {
//                        Logger.getLogger(CitasController.class.getName()).log(Level.SEVERE, null, ex);
//                    }
                    } else {
                        out.print("!Cita interferida¡ Selecione otra hora o Verifique su calendario");
                    }
                }
            } else {
                out.print("");
                Mascota mascota = (Mascota) session.get(Mascota.class, Integer.parseInt(request.getParameter("mascota")));
//            Persona persona = (Persona) session.get(Persona.class, 1);
                String Proposito = "";
                String Observaciones = "";
                String tipo = request.getParameter("tipo");
                cita.setMascota(mascota);
//            cita.setPersona(persona);
                cita.setFechaEntrada(fechaentrada);
                cita.setFechaSalida(fechasalida);
                cita.setProposito(Proposito);
                cita.setTipo(tipo);
//                    cita = new Citas(mascota, persona, fechaentrada, fechasalida, Proposito, tipo, "Programada");
                cita.setObservaciones(Observaciones);
                session.beginTransaction();
                session.saveOrUpdate(cita);
                session.getTransaction().commit();
                session.close();
//            try {
//                response.sendRedirect("CitasController?action=admin");
//            } catch (IOException ex) {
//                Logger.getLogger(CitasController.class.getName()).log(Level.SEVERE, null, ex);
//            }
            }
        }
//        } catch (Exception e) {
//            PrintWriter out = response.getWriter();
//            out.print("try");
//        }
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
