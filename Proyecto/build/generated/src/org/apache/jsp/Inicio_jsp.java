package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Inicio_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta name=\"description\" content=\"Miminium Admin Template v.1\">\n");
      out.write("        <meta name=\"author\" content=\"Isna Nur Azis\">\n");
      out.write("        <meta name=\"keyword\" content=\"\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <title>Miminium</title>\n");
      out.write("\n");
      out.write("        <!-- start: Css -->\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"asset/css/bootstrap.min.css\">\n");
      out.write("\n");
      out.write("        <!-- plugins -->\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"asset/css/plugins/font-awesome.min.css\"/>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"asset/css/plugins/simple-line-icons.css\"/>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"asset/css/plugins/animate.min.css\"/>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"asset/css/plugins/icheck/skins/flat/aero.css\"/>\n");
      out.write("        <link href=\"asset/css/style.css\" rel=\"stylesheet\">\n");
      out.write("        <!-- end: Css -->\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <link rel=\"shortcut icon\" href=\"asset/img/logomi.png\">\n");
      out.write("        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->\n");
      out.write("        <!--[if lt IE 9]>\n");
      out.write("          <script src=\"https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js\"></script>\n");
      out.write("          <script src=\"https://oss.maxcdn.com/respond/1.4.2/respond.min.js\"></script>\n");
      out.write("          <![endif]-->\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body id=\"mimin\" class=\"dashboard form-signin-wrapper\">\n");
      out.write("\n");
      out.write("        <div class=\"container\" > \n");
      out.write("            <form class=\"form-signin\" method=\"POST\" action=\"\" >\n");
      out.write("                <div class=\"panel periodic-login\">\n");
      out.write("                    <span class=\"atomic-number\">28</span>\n");
      out.write("                    <div class=\"panel-body text-center\">\n");
      out.write("                        <h1 class=\"atomic-symbol\">Mi</h1>\n");
      out.write("                        <p class=\"atomic-mass\">14.072110</p>\n");
      out.write("                        <p class=\"element-name\">Miminium</p>\n");
      out.write("\n");
      out.write("                        <i class=\"icons icon-arrow-down\"></i>\n");
      out.write("                        <div class=\"form-group form-animate-text\" style=\"margin-top:40px !important;\">\n");
      out.write("                            <input class=\"btn col-md-12\" type=\"button\" onclick=\"location.href = 'LoginEmpleado.jsp'\" value=\"Empleado\"/>                            \n");
      out.write("                            <span class=\"bar\"></span>                            \n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"form-group form-animate-text\" style=\"margin-top:40px !important;\">\n");
      out.write("                            <input class=\"btn col-md-12\" type=\"button\" onclick=\"location.href = 'LoginClientes.jsp'\" value=\"Cliente\"/>\n");
      out.write("                            <span class=\"bar\"></span>                           \n");
      out.write("                        </div>\n");
      out.write("                        \n");
      out.write("                        \n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"text-center\" style=\"padding:5px;\">\n");
      out.write("                        \n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </form>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <!-- end: Content -->\n");
      out.write("        <!-- start: Javascript -->\n");
      out.write("        <script src=\"asset/js/jquery.min.js\"></script>\n");
      out.write("        <script src=\"asset/js/jquery.ui.min.js\"></script>\n");
      out.write("        <script src=\"asset/js/bootstrap.min.js\"></script>\n");
      out.write("\n");
      out.write("        <script src=\"asset/js/plugins/moment.min.js\"></script>\n");
      out.write("        <script src=\"asset/js/plugins/icheck.min.js\"></script>        \n");
      out.write("\n");
      out.write("        <!-- custom -->\n");
      out.write("        <script src=\"asset/js/main.js\"></script>\n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("            $(document).ready(function () {\n");
      out.write("                $('input').iCheck({\n");
      out.write("                    checkboxClass: 'icheckbox_flat-aero',\n");
      out.write("                    radioClass: 'iradio_flat-aero'\n");
      out.write("                });\n");
      out.write("            });\n");
      out.write("        </script>\n");
      out.write("        <!-- end: Javascript -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"asset/Mensajes/themes/alertify.default.css\" />       \n");
      out.write("        \n");
      out.write("        <script type=\"text/javascript\" src=\"asset/Mensajes/lib/alertify.js\"></script>\n");
      out.write("        <link rel=\"stylesheet\" href=\"asset/Mensajes/themes/alertify.core.css\" />\n");
      out.write("\n");
      out.write("        <!-- Le javascript\n");
      out.write("        ================================================== -->\n");
      out.write("        <!-- Placed at the end of the document so the pages load faster -->\n");
      out.write("        <script>\n");
      out.write("            /*\n");
      out.write("             --------------------------------------------------------------------------------\n");
      out.write("             | EJEMPLO Y SCRIPT ADAPTADO AL ESPA?OL POR http://blog.reaccionestudio.com/    |\n");
      out.write("             --------------------------------------------------------------------------------\n");
      out.write("             |\tVIS?TANOS !!!                                                              |\n");
      out.write("             --------------------------------------------------------------------------------\n");
      out.write("             */\n");
      out.write("            function error() {\n");
      out.write("                alertify.error(\"Usuario o constraseña incorrecto/a.\");\n");
      out.write("                return false;\n");
      out.write("            }\n");
      out.write("        </script>   \n");
      out.write("        ");

            String get = request.getParameter("error");
            if (get != null && get.equals("true")) { 
      out.write("\n");
      out.write("        <script language='JavaScript' type='text/javascript'>\n");
      out.write("            error();</script>\n");
      out.write("            ");
 } 
      out.write("\n");
      out.write("    </body>\n");
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
