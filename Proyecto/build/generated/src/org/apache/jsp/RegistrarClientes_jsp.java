package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class RegistrarClientes_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("                <h3 class=\"animated fadeInLeft\">Registrar Cliente</h3>\n");
      out.write("                <p class=\"animated fadeInDown\">\n");
      out.write("                    Form <span class=\"fa-angle-right fa\"></span> Form Element\n");
      out.write("                </p>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("    <div class=\"col-md-10\">\n");
      out.write("        <div class=\"col-md-12 panel\">\n");
      out.write("            <div class=\"col-md-12 panel-heading\">\n");
      out.write("                <h4>Ingrese los datos</h4>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-md-12 panel-body\" style=\"padding-bottom:30px;\">\n");
      out.write("                <div class=\"col-md-12\">\n");
      out.write("                    <form class=\"cmxform\" id=\"signupForm\" method=\"POST\" action=\"ClientesController?action=create\">\n");
      out.write("                        <div class=\"col-md-6\">\n");
      out.write("                            <div class=\"form-group form-animate-text\" style=\"margin-top:40px !important;\">\n");
      out.write("                                <input type=\"text\" class=\"form-text\" id=\"razonsocial\" name=\"razonsocial\" required>\n");
      out.write("                                <span class=\"bar\"></span>\n");
      out.write("                                <label>Razon  social</label>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                            <div class=\"form-group form-animate-text\" style=\"margin-top:40px !important;\">\n");
      out.write("                                <input type=\"number\" class=\"form-text\" id=\"nit\" onkeyup=\"return runScript(this.value)\" name=\"nit\" required>\n");
      out.write("                                <span class=\"bar\"></span>\n");
      out.write("                                <label>Nit</label>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                            <div class=\"form-group form-animate-text\" style=\"margin-top:40px !important;\">\n");
      out.write("                                <input type=\"text\" class=\"form-text\" id=\"ciudad\" name=\"ciudad\" required>\n");
      out.write("                                <span class=\"bar\"></span>\n");
      out.write("                                <label>Ciudad</label>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                            <div class=\"form-group form-animate-text\" style=\"margin-top:40px !important;\">\n");
      out.write("                                <input type=\"number\" class=\"form-text\" data-val-regex-pattern=\"^3[0-9]+$\" onkeyup=\"return runScriptel(this.value)\" id=\"telefono\" name=\"telefono\" required>\n");
      out.write("                                <span class=\"bar\"></span>\n");
      out.write("                                <label>Telefono</label>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"col-md-6\">\n");
      out.write("                            <div class=\"form-group form-animate-text\" style=\"margin-top:40px !important;\">\n");
      out.write("                                <input type=\"password\" class=\"form-text\" id=\"contrasena\" name=\"contrasena\" required>\n");
      out.write("                                <span class=\"bar\"></span>\n");
      out.write("                                <label>Contraseña</label>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                            <div class=\"form-group form-animate-text\" style=\"margin-top:40px !important;\">\n");
      out.write("                                <input type=\"password\" class=\"form-text\" id=\"confirmar_contrasena\" name=\"confirmar_contrasena\" required>\n");
      out.write("                                <span class=\"bar\"></span>\n");
      out.write("                                <label>Confirma Contraseña</label>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                            <div class=\"form-group form-animate-text\" style=\"margin-top:40px !important;\">\n");
      out.write("                                <input type=\"text\" class=\"form-text\" id=\"direccion\" name=\"direccion\" required>\n");
      out.write("                                <span class=\"bar\"></span>\n");
      out.write("                                <label>Direccion</label>\n");
      out.write("                            </div>\n");
      out.write("                        </div>  \n");
      out.write("                        \n");
      out.write("\n");
      out.write("                        <div class=\"col-md-12\">\n");
      out.write("                            <input class=\"submit btn btn-primary\" type=\"submit\" value=\"Guardar\" > &nbsp\n");
      out.write("                            <input class=\"submit btn btn-danger\" type=\"button\" value=\"Cancelar\" onclick=\"location.href = 'ClientesController?action=admin'\">\n");
      out.write("                        </div>\n");
      out.write("                    </form>\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("</div>\n");
      out.write("<!-- end: content -->\n");
      out.write("<script>\n");
      out.write("    function runScript(e) {\n");
      out.write("        var nit;\n");
      out.write("        try {\n");
      out.write("            nit = parseInt(e);\n");
      out.write("\n");
      out.write("        } catch (e) {\n");
      out.write("            nit = 0;\n");
      out.write("        }\n");
      out.write("        document.getElementById(\"nit\").value = nit;\n");
      out.write("    }\n");
      out.write("    function runScriptel(e) {\n");
      out.write("        var nit;\n");
      out.write("        try {\n");
      out.write("            if (e != null) {\n");
      out.write("                nit = parseInt(e);\n");
      out.write("            }\n");
      out.write("\n");
      out.write("        } catch (e) {\n");
      out.write("            nit = 0;\n");
      out.write("        }\n");
      out.write("        document.getElementById(\"telefono\").value = nit;        \n");
      out.write("    }\n");
      out.write("</script>\n");
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
      out.write("<script src=\"asset/js/plugins/moment.min.js\"></script>\n");
      out.write("<script src=\"asset/js/plugins/jquery.knob.js\"></script>\n");
      out.write("<script src=\"asset/js/plugins/ion.rangeSlider.min.js\"></script>\n");
      out.write("<script src=\"asset/js/plugins/bootstrap-material-datetimepicker.js\"></script>\n");
      out.write("<script src=\"asset/js/plugins/jquery.nicescroll.js\"></script>\n");
      out.write("<script src=\"asset/js/plugins/jquery.mask.min.js\"></script>\n");
      out.write("<script src=\"asset/js/plugins/select2.full.min.js\"></script>\n");
      out.write("<script src=\"asset/js/plugins/nouislider.min.js\"></script>\n");
      out.write("<script src=\"asset/js/plugins/jquery.validate.min.js\"></script>\n");
      out.write("\n");
      out.write("\n");
      out.write("<!-- custom -->\n");
      out.write("<script src=\"asset/js/main.js\"></script>\n");
      out.write("<script type=\"text/javascript\">\n");
      out.write("    $(document).ready(function () {\n");
      out.write("\n");
      out.write("        $(\"#signupForm\").validate({\n");
      out.write("            errorElement: \"em\",\n");
      out.write("            errorPlacement: function (error, element) {\n");
      out.write("                $(element.parent(\"div\").addClass(\"form-animate-error\"));\n");
      out.write("                error.appendTo(element.parent(\"div\"));\n");
      out.write("            },\n");
      out.write("            success: function (label) {\n");
      out.write("                $(label.parent(\"div\").removeClass(\"form-animate-error\"));\n");
      out.write("            },\n");
      out.write("            rules: {\n");
      out.write("                razonsocial: \"required\",\n");
      out.write("                ciudad: \"required\",\n");
      out.write("                direccion: \"required\",\n");
      out.write("                nit: {\n");
      out.write("                    required: true,\n");
      out.write("                    min: 1,\n");
      out.write("                    minlength: 7,\n");
      out.write("                    maxlength: 10\n");
      out.write("                },\n");
      out.write("                telefono: {\n");
      out.write("                    required: true,\n");
      out.write("                    min: 1,\n");
      out.write("                    minlength: 10,\n");
      out.write("                    maxlength: 10\n");
      out.write("                },\n");
      out.write("                contrasena: {\n");
      out.write("                    required: true,\n");
      out.write("                    minlength: 5\n");
      out.write("                },\n");
      out.write("                confirmar_contrasena: {\n");
      out.write("                    required: true,\n");
      out.write("                    minlength: 5,\n");
      out.write("                    equalTo: \"#contrasena\"\n");
      out.write("                },\n");
      out.write("                validate_agree: \"required\"\n");
      out.write("            },\n");
      out.write("            messages: {\n");
      out.write("                razonsocial: \"Por favor, introduzca Razon social\",\n");
      out.write("                ciudad: \"Por favor, introduzca la ciudad\",\n");
      out.write("                direccion: \"por favor, introduzca su direccion\",\n");
      out.write("                nit: {\n");
      out.write("                    required: \"Nit invalido\",\n");
      out.write("                    min: \"Nit valido\",\n");
      out.write("                    minlength: \"No valido\",\n");
      out.write("                    maxlength: \"No valido\"\n");
      out.write("                },\n");
      out.write("                telefono: {\n");
      out.write("                    required: \"Proporcione un numero de telefono\",\n");
      out.write("                    min: \"No valido\",\n");
      out.write("                    minlength: \"su telefono debe tener almenos 10 caracteres\",\n");
      out.write("                    maxlength: \"No valido\"\n");
      out.write("                },\n");
      out.write("                contrasena: {\n");
      out.write("                    required: \"Proporcione una contraseña\",\n");
      out.write("                    minlength: \"Su contraseña debe tener al menos 5 caracteres\"\n");
      out.write("                },\n");
      out.write("                confirmar_contrasena: {\n");
      out.write("                    required: \"Proporcione una contraseña\",\n");
      out.write("                    minlength: \"Su contraseña debe tener al menos 5 caracteres\",\n");
      out.write("                    equalTo: \"Ingrese la misma contraseña que la anterior\"\n");
      out.write("                },\n");
      out.write("\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("        });\n");
      out.write("        \n");
      out.write("\n");
      out.write("    });\n");
      out.write("</script>\n");
      out.write("<!-- end: Javascript -->\n");
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
