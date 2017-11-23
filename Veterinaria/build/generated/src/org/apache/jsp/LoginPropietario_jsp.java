package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class LoginPropietario_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("    <head>\r\n");
      out.write("\r\n");
      out.write("        <meta charset=\"utf-8\">\r\n");
      out.write("        <meta name=\"description\" content=\"Miminium Admin Template v.1\">\r\n");
      out.write("        <meta name=\"author\" content=\"Isna Nur Azis\">\r\n");
      out.write("        <meta name=\"keyword\" content=\"\">\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("        <title>Miminium</title>\r\n");
      out.write("\r\n");
      out.write("        <!-- start: Css -->\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"asset/css/bootstrap.min.css\">\r\n");
      out.write("\r\n");
      out.write("        <!-- plugins -->\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"asset/css/plugins/font-awesome.min.css\"/>\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"asset/css/plugins/simple-line-icons.css\"/>\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"asset/css/plugins/animate.min.css\"/>\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"asset/css/plugins/icheck/skins/flat/aero.css\"/>\r\n");
      out.write("        <link href=\"asset/css/style.css\" rel=\"stylesheet\">\r\n");
      out.write("        <!-- end: Css -->\r\n");
      out.write("\r\n");
      out.write("        <link rel=\"shortcut icon\" href=\"asset/img/logomi.png\">\r\n");
      out.write("        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->\r\n");
      out.write("        <!--[if lt IE 9]>\r\n");
      out.write("          <script src=\"https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js\"></script>\r\n");
      out.write("          <script src=\"https://oss.maxcdn.com/respond/1.4.2/respond.min.js\"></script>\r\n");
      out.write("          <![endif]-->\r\n");
      out.write("    </head>\r\n");
      out.write("\r\n");
      out.write("    <body id=\"mimin\" class=\"dashboard form-signin-wrapper\">\r\n");
      out.write("\r\n");
      out.write("        <div class=\"container\">\r\n");
      out.write("\r\n");
      out.write("            <form class=\"form-signin\" method=\"POST\" action=\"LoginController?action=intopropietario\" >\r\n");
      out.write("                <div class=\"panel periodic-login\">\r\n");
      out.write("                    <span class=\"atomic-number\">28</span>\r\n");
      out.write("                    <div class=\"panel-body text-center\">\r\n");
      out.write("                        <h1 class=\"atomic-symbol\">Mi</h1>\r\n");
      out.write("                        <p class=\"atomic-mass\">14.072110</p>\r\n");
      out.write("                        <p class=\"element-name\">Miminium</p>\r\n");
      out.write("\r\n");
      out.write("                        <i class=\"icons icon-arrow-down\"></i>\r\n");
      out.write("                        <div class=\"form-group form-animate-text\" style=\"margin-top:40px !important;\">\r\n");
      out.write("                            <input type=\"text\" class=\"form-text\" name=\"correo\" required>\r\n");
      out.write("                            <span class=\"bar\"></span>\r\n");
      out.write("                            <label>Username</label>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"form-group form-animate-text\" style=\"margin-top:40px !important;\">\r\n");
      out.write("                            <input type=\"password\" class=\"form-text\" name=\"contrasena\" required>\r\n");
      out.write("                            <span class=\"bar\"></span>\r\n");
      out.write("                            <label>Password</label>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <label class=\"pull-left\">\r\n");
      out.write("                            <input type=\"checkbox\" class=\"icheck pull-left\" name=\"checkbox1\"/> Remember me\r\n");
      out.write("                        </label>\r\n");
      out.write("                        <input type=\"submit\" class=\"btn col-md-12\" value=\"SignIn\"/>\r\n");
      out.write("                        <input class=\"submit btn btn-danger\" type=\"button\" value=\"Inicio\" onclick=\"location.href = 'Inicio.jsp'\">\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"text-center\" style=\"padding:5px;\">\r\n");
      out.write("                        <a href=\"forgotpass.html\">Forgot Password </a>\r\n");
      out.write("                        <a href=\"reg.html\">| Signup</a>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </form>\r\n");
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <!-- end: Content -->\r\n");
      out.write("        <!-- start: Javascript -->\r\n");
      out.write("        <script src=\"asset/js/jquery.min.js\"></script>\r\n");
      out.write("        <script src=\"asset/js/jquery.ui.min.js\"></script>\r\n");
      out.write("        <script src=\"asset/js/bootstrap.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("        <script src=\"asset/js/plugins/moment.min.js\"></script>\r\n");
      out.write("        <script src=\"asset/js/plugins/icheck.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("        <!-- custom -->\r\n");
      out.write("        <script src=\"asset/js/main.js\"></script>\r\n");
      out.write("        <script type=\"text/javascript\">\r\n");
      out.write("            $(document).ready(function () {\r\n");
      out.write("                $('input').iCheck({\r\n");
      out.write("                    checkboxClass: 'icheckbox_flat-aero',\r\n");
      out.write("                    radioClass: 'iradio_flat-aero'\r\n");
      out.write("                });\r\n");
      out.write("            });\r\n");
      out.write("        </script>\r\n");
      out.write("        <!-- end: Javascript -->\r\n");
      out.write("             <link rel=\"stylesheet\" href=\"asset/Mensajes/themes/alertify.default.css\" />       \r\n");
      out.write("        \r\n");
      out.write("        <script type=\"text/javascript\" src=\"asset/Mensajes/lib/alertify.js\"></script>\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"asset/Mensajes/themes/alertify.core.css\" />\r\n");
      out.write("\r\n");
      out.write("        <!-- Le javascript\r\n");
      out.write("        ================================================== -->\r\n");
      out.write("        <!-- Placed at the end of the document so the pages load faster -->\r\n");
      out.write("        <script>\r\n");
      out.write("            /*\r\n");
      out.write("             --------------------------------------------------------------------------------\r\n");
      out.write("             | EJEMPLO Y SCRIPT ADAPTADO AL ESPA?OL POR http://blog.reaccionestudio.com/    |\r\n");
      out.write("             --------------------------------------------------------------------------------\r\n");
      out.write("             |\tVIS?TANOS !!!                                                              |\r\n");
      out.write("             --------------------------------------------------------------------------------\r\n");
      out.write("             */\r\n");
      out.write("            function error() {\r\n");
      out.write("                alertify.error(\"Usuario o constraseña incorrecto/a.\");\r\n");
      out.write("                return false;\r\n");
      out.write("            }\r\n");
      out.write("        </script>   \r\n");
      out.write("        ");

            String get = request.getParameter("error");
            if (get != null && get.equals("true")) { 
      out.write("\r\n");
      out.write("        <script language='JavaScript' type='text/javascript'>\r\n");
      out.write("            error();</script>\r\n");
      out.write("            ");
 } 
      out.write("\r\n");
      out.write("    </body>\r\n");
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
