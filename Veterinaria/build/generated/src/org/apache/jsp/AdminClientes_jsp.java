package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class AdminClientes_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write('\r');
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "encabezado.jsp", out, false);
      out.write('\r');
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "menu.jsp", out, false);
      out.write("\r\n");
      out.write("<!-- start: content -->\r\n");
      out.write("<div id=\"content\">\r\n");
      out.write("    <div class=\"panel box-shadow-none content-header\">\r\n");
      out.write("        <div class=\"panel-body\">\r\n");
      out.write("            <div class=\"col-md-12\">\r\n");
      out.write("                <h3 class=\"animated fadeInLeft\">Administrar Clientes</h3>                \r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <div class=\"col-md-12 top-20 padding-0\">\r\n");
      out.write("        <div class=\"col-md-12\">\r\n");
      out.write("            <div class=\"panel\">\r\n");
      out.write("                <div id=\"colortable\" class=\"panel-heading\"><h3 id=\"tlttable\">Clientes</h3></div>\r\n");
      out.write("                <div class=\"panel-body\">\r\n");
      out.write("                    <div class=\"responsive-table\">\r\n");
      out.write("                        <table id=\"datatables-example\" class=\"table table-striped table-bordered\" width=\"100%\" cellspacing=\"0\">\r\n");
      out.write("                            <thead>\r\n");
      out.write("                                <tr>\r\n");
      out.write("                                    <th>Razon social</th>\r\n");
      out.write("                                    <th>Nit</th>\r\n");
      out.write("                                    <th>Ciudad</th>\r\n");
      out.write("                                    <th>Direccion</th>\r\n");
      out.write("                                    <th>Telefono</th>                                        \r\n");
      out.write("                                    <th>Aciones</th>                                        \r\n");
      out.write("                                </tr>\r\n");
      out.write("                            </thead>\r\n");
      out.write("                            <tbody>                                \r\n");
      out.write("                                <tr>\r\n");
      out.write("                                    <td>Plantilla</td>\r\n");
      out.write("                                    <td>Plantilla</td>\r\n");
      out.write("                                    <td>Plantilla</td>\r\n");
      out.write("                                    <td>Plantilla</td>\r\n");
      out.write("                                    <td>Plantilla</td>\r\n");
      out.write("                                    <td>Plantilla</td>\r\n");
      out.write("                                </tr>                                  \r\n");
      out.write("                            </tbody>\r\n");
      out.write("                        </table>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>  \r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write("<!-- end: content -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<button id=\"mimin-mobile-menu-opener\" class=\"animated rubberBand btn btn-circle btn-danger\">\r\n");
      out.write("    <span class=\"fa fa-bars\"></span>\r\n");
      out.write("</button>\r\n");
      out.write("<!-- end: Mobile -->\r\n");
      out.write("\r\n");
      out.write("<!-- start: Javascript -->\r\n");
      out.write("<script src=\"asset/js/jquery.min.js\"></script>\r\n");
      out.write("<script src=\"asset/js/jquery.ui.min.js\"></script>\r\n");
      out.write("<script src=\"asset/js/bootstrap.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!-- plugins -->\r\n");
      out.write("\r\n");
      out.write("<script src=\"asset/js/plugins/moment.min.js\"></script>\r\n");
      out.write("<script src=\"asset/js/plugins/jquery.datatables.min.js\"></script>\r\n");
      out.write("<script src=\"asset/js/plugins/datatables.bootstrap.min.js\"></script>\r\n");
      out.write("<script src=\"asset/js/plugins/jquery.nicescroll.js\"></script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!-- custom -->\r\n");
      out.write("<script src=\"asset/js/main.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("    $(document).ready(function () {\r\n");
      out.write("        $('#datatables-example').DataTable();\r\n");
      out.write("    });\r\n");
      out.write("</script>\r\n");
      out.write("<!-- end: Javascript -->\r\n");
      out.write("<!-- Le javascript\r\n");
      out.write("================================================== -->\r\n");
      out.write("<!-- Placed at the end of the document so the pages load faster -->\r\n");
      out.write("<script>\r\n");
      out.write("    /*\r\n");
      out.write("     --------------------------------------------------------------------------------\r\n");
      out.write("     | EJEMPLO Y SCRIPT ADAPTADO AL ESPA?OL POR http://blog.reaccionestudio.com/    |\r\n");
      out.write("     --------------------------------------------------------------------------------\r\n");
      out.write("     |\tVIS?TANOS !!!                                                              |\r\n");
      out.write("     --------------------------------------------------------------------------------\r\n");
      out.write("     */\r\n");
      out.write("    function error() {\r\n");
      out.write("        alertify.error(\"Asegurese de que no este registrado en otra tabla\");\r\n");
      out.write("        return false;\r\n");
      out.write("    }\r\n");
      out.write("    function ok() {\r\n");
      out.write("        alertify.success(\"Cambios guardados correctamente\");\r\n");
      out.write("        return false;\r\n");
      out.write("    }\r\n");
      out.write("    function ok2() {\r\n");
      out.write("        alertify.success(\"Se ha registrado correctamente\");\r\n");
      out.write("        return false;\r\n");
      out.write("    }\r\n");
      out.write("</script>   \r\n");

    String get = request.getParameter("error");
    if (get != null && get.equals("true")) { 
      out.write("\r\n");
      out.write("<script language='JavaScript' type='text/javascript'>\r\n");
      out.write("    error();</script>\r\n");
      out.write("    ");
 } else if (get != null && get.equals("ok")) {
      out.write("\r\n");
      out.write("<script language='JavaScript' type='text/javascript'>\r\n");
      out.write("    ok();</script>\r\n");
      out.write("    ");
 } else if (get != null && get.equals("registro")) {
      out.write("\r\n");
      out.write("<script language='JavaScript' type='text/javascript'>\r\n");
      out.write("    ok2();</script>\r\n");
      out.write("    ");
 }
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
