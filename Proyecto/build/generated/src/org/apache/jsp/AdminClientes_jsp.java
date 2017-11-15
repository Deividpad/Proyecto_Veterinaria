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

      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "encabezado.jsp", out, false);
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "menu.jsp", out, false);
      out.write("\n");
      out.write("<!-- start: content -->\n");
      out.write("<div id=\"content\">\n");
      out.write("    <div class=\"panel box-shadow-none content-header\">\n");
      out.write("        <div class=\"panel-body\">\n");
      out.write("            <div class=\"col-md-12\">\n");
      out.write("                <h3 class=\"animated fadeInLeft\">Administrar Clientes</h3>                \n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <div class=\"col-md-12 top-20 padding-0\">\n");
      out.write("        <div class=\"col-md-12\">\n");
      out.write("            <div class=\"panel\">\n");
      out.write("                <div id=\"colortable\" class=\"panel-heading\"><h3 id=\"tlttable\">Clientes</h3></div>\n");
      out.write("                <div class=\"panel-body\">\n");
      out.write("                    <div class=\"responsive-table\">\n");
      out.write("                        <table id=\"datatables-example\" class=\"table table-striped table-bordered\" width=\"100%\" cellspacing=\"0\">\n");
      out.write("                            <thead>\n");
      out.write("                                <tr>\n");
      out.write("                                    <th>Razon social</th>\n");
      out.write("                                    <th>Nit</th>\n");
      out.write("                                    <th>Ciudad</th>\n");
      out.write("                                    <th>Direccion</th>\n");
      out.write("                                    <th>Telefono</th>                                        \n");
      out.write("                                    <th>Aciones</th>                                        \n");
      out.write("                                </tr>\n");
      out.write("                            </thead>\n");
      out.write("                            <tbody>                                \n");
      out.write("                                <tr>\n");
      out.write("                                    <td>Plantilla</td>\n");
      out.write("                                    <td>Plantilla</td>\n");
      out.write("                                    <td>Plantilla</td>\n");
      out.write("                                    <td>Plantilla</td>\n");
      out.write("                                    <td>Plantilla</td>\n");
      out.write("                                    <td>Plantilla</td>\n");
      out.write("                                </tr>                                  \n");
      out.write("                            </tbody>\n");
      out.write("                        </table>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>  \n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("<!-- end: content -->\n");
      out.write("\n");
      out.write("\n");
      out.write("<button id=\"mimin-mobile-menu-opener\" class=\"animated rubberBand btn btn-circle btn-danger\">\n");
      out.write("    <span class=\"fa fa-bars\"></span>\n");
      out.write("</button>\n");
      out.write("<!-- end: Mobile -->\n");
      out.write("\n");
      out.write("<!-- start: Javascript -->\n");
      out.write("<script src=\"asset/js/jquery.min.js\"></script>\n");
      out.write("<script src=\"asset/js/jquery.ui.min.js\"></script>\n");
      out.write("<script src=\"asset/js/bootstrap.min.js\"></script>\n");
      out.write("\n");
      out.write("\n");
      out.write("<!-- plugins -->\n");
      out.write("\n");
      out.write("<script src=\"asset/js/plugins/moment.min.js\"></script>\n");
      out.write("<script src=\"asset/js/plugins/jquery.datatables.min.js\"></script>\n");
      out.write("<script src=\"asset/js/plugins/datatables.bootstrap.min.js\"></script>\n");
      out.write("<script src=\"asset/js/plugins/jquery.nicescroll.js\"></script>\n");
      out.write("\n");
      out.write("\n");
      out.write("<!-- custom -->\n");
      out.write("<script src=\"asset/js/main.js\"></script>\n");
      out.write("<script type=\"text/javascript\">\n");
      out.write("    $(document).ready(function () {\n");
      out.write("        $('#datatables-example').DataTable();\n");
      out.write("    });\n");
      out.write("</script>\n");
      out.write("<!-- end: Javascript -->\n");
      out.write("<!-- Le javascript\n");
      out.write("================================================== -->\n");
      out.write("<!-- Placed at the end of the document so the pages load faster -->\n");
      out.write("<script>\n");
      out.write("    /*\n");
      out.write("     --------------------------------------------------------------------------------\n");
      out.write("     | EJEMPLO Y SCRIPT ADAPTADO AL ESPA?OL POR http://blog.reaccionestudio.com/    |\n");
      out.write("     --------------------------------------------------------------------------------\n");
      out.write("     |\tVIS?TANOS !!!                                                              |\n");
      out.write("     --------------------------------------------------------------------------------\n");
      out.write("     */\n");
      out.write("    function error() {\n");
      out.write("        alertify.error(\"Asegurese de que no este registrado en otra tabla\");\n");
      out.write("        return false;\n");
      out.write("    }\n");
      out.write("    function ok() {\n");
      out.write("        alertify.success(\"Cambios guardados correctamente\");\n");
      out.write("        return false;\n");
      out.write("    }\n");
      out.write("    function ok2() {\n");
      out.write("        alertify.success(\"Se ha registrado correctamente\");\n");
      out.write("        return false;\n");
      out.write("    }\n");
      out.write("</script>   \n");

    String get = request.getParameter("error");
    if (get != null && get.equals("true")) { 
      out.write("\n");
      out.write("<script language='JavaScript' type='text/javascript'>\n");
      out.write("    error();</script>\n");
      out.write("    ");
 } else if (get != null && get.equals("ok")) {
      out.write("\n");
      out.write("<script language='JavaScript' type='text/javascript'>\n");
      out.write("    ok();</script>\n");
      out.write("    ");
 } else if (get != null && get.equals("registro")) {
      out.write("\n");
      out.write("<script language='JavaScript' type='text/javascript'>\n");
      out.write("    ok2();</script>\n");
      out.write("    ");
 }
      out.write("\n");
      out.write("</body>\n");
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
