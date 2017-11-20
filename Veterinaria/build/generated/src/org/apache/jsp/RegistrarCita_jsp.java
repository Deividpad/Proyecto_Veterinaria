package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import models.Citas;

public final class RegistrarCita_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_forEach_var_items;
  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_out_value_nobody;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_c_forEach_var_items = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _jspx_tagPool_c_out_value_nobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_c_forEach_var_items.release();
    _jspx_tagPool_c_out_value_nobody.release();
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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "encabezado.jsp", out, false);
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "menu.jsp", out, false);
      out.write("\n");
      out.write("<!-- start: content -->\n");
      out.write("<div id=\"content\">\n");
      out.write("    <div class=\"panel box-shadow-none content-header\">\n");
      out.write("        <div class=\"panel-body\">\n");
      out.write("            <div class=\"col-md-12\">\n");
      out.write("                <h3 class=\"animated fadeInLeft\">Crear Cita</h3>                \n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div> \n");
      out.write("\n");
      out.write("    <!-- Modal -->\n");
      out.write("    <div class=\"modal fade\" id=\"mimodalejemplo\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"myModalLabel\">        \n");
      out.write("        <div class=\"modal-dialog\" role=\"document\">\n");
      out.write("            <div class=\"modal-content\">\n");
      out.write("                <div class=\"col-md-10\">\n");
      out.write("                    <div class=\"col-md-12 panel\">\n");
      out.write("                        <div class=\"col-md-12 panel-heading\">\n");
      out.write("                            <h4>Crear Cita</h4>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-md-12 panel-body\" style=\"padding-bottom:30px;\">\n");
      out.write("                            <div class=\"col-md-12\">\n");
      out.write("                                <form class=\"cmxform\" id=\"signupForm\" method=\"POST\" action=\"CitasController?action=create\">\n");
      out.write("                                    <div class=\"col-md-6\">                                        \n");
      out.write("                                        <div class=\"form-group form-animate-text\">\n");
      out.write("                                            <input type=\"text\" name=\"fechaentrada\" class=\"form-text min-date\" required>\n");
      out.write("                                            <span class=\"bar\"></span>\n");
      out.write("                                            <label><span class=\"fa fa-calendar\"></span> Fecha Entrada</label>\n");
      out.write("                                        </div>                                        \n");
      out.write("\n");
      out.write("                                        <div class=\"col-sm-12 padding-0\">                                                                                      \n");
      out.write("                                            <span class=\"bar\"></span>\n");
      out.write("                                            <label>Mascota</label>\n");
      out.write("                                            <select class=\"form-control\" name=\"mascota\">\n");
      out.write("                                                ");
      if (_jspx_meth_c_forEach_0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("                                                \n");
      out.write("                                            </select>                                            \n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"col-md-6\">\n");
      out.write("                                        <!--div class=\"form-group \" style=\"margin-top:40px !important;\">\n");
      out.write("                                            <label style=\"color: #090;\">Total</label>\n");
      out.write("                                            <input id=\"scriptBox\" type=\"text\" disabled=\"disabled\"/>\n");
      out.write("                                        </div> \n");
      out.write("                                        <div class=\"form-group\">\n");
      out.write("                                            <select class=\"select2-A\">       \n");
      out.write("                                                <option value=\"AK\">Alaska</option>\n");
      out.write("                                                <option value=\"HI\">Hawaii</option>                      \n");
      out.write("                                            </select>                       \n");
      out.write("                                        </div-->\n");
      out.write("\n");
      out.write("                                        <div class=\"form-group form-animate-text\">\n");
      out.write("                                            <input type=\"text\" class=\"form-text min-date\" name=\"fechasalida\" required>\n");
      out.write("                                            <span class=\"bar\"></span>\n");
      out.write("                                            <label><span class=\"fa fa-calendar\"></span> Fecha Salida</label>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"col-sm-12 padding-0\">\n");
      out.write("                                            <span class=\"bar\"></span>\n");
      out.write("                                            <label>Tipo Cita</label>\n");
      out.write("                                            <select class=\"form-control\" name=\"tipo\">\n");
      out.write("                                                <option value=\"Programada\">Programadaa</option>\n");
      out.write("                                                <option value=\"Urgencia\">Urgencia</option>                                                \n");
      out.write("                                            </select>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"col-md-12\" style=\"padding-top: 20px;\">\n");
      out.write("                                        <input class=\"submit btn btn-success\" id=\"myBtn1\" type=\"submit\" value=\"Modificar\">\n");
      out.write("                                        <input type=\"submit\" class=\"submit btn btn-danger\" value=\"Volver\" onclick=\"reset()\" data-dismiss=\"modal\">\n");
      out.write("                                    </div>\n");
      out.write("\n");
      out.write("                                </form>\n");
      out.write("\n");
      out.write("                            </div>\n");
      out.write("                        </div> \n");
      out.write("                    </div>\n");
      out.write("                </div>         \n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>    \n");
      out.write("\n");
      out.write("    <div id='top'>\n");
      out.write("\n");
      out.write("        <div class='left'>\n");
      out.write("\n");
      out.write("            <div id='theme-system-selector' class='selector' style=\"color: #098ddf;\">\n");
      out.write("                Estyle Calendar:\n");
      out.write("\n");
      out.write("                <select style=\"color: #080808;\">                    \n");
      out.write("                    <option value='jquery-ui'>jQuery UI</option>                    \n");
      out.write("                </select>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div data-theme-system=\"bootstrap3\" class='selector' style='display:none'>\n");
      out.write("                Theme Name:\n");
      out.write("\n");
      out.write("                <select>\n");
      out.write("                    <option value='' >Default</option>\n");
      out.write("                    <option value='cosmo'>Cosmo</option>\n");
      out.write("                    <option value='cyborg'>Cyborg</option>\n");
      out.write("                    <option value='darkly'>Darkly</option>\n");
      out.write("                    <option value='flatly'>Flatly</option>\n");
      out.write("                    <option value='journal'>Journal</option>\n");
      out.write("                    <option value='lumen'>Lumen</option>\n");
      out.write("                    <option value='paper'>Paper</option>\n");
      out.write("                    <option value='readable'>Readable</option>\n");
      out.write("                    <option value='sandstone'>Sandstone</option>\n");
      out.write("                    <option value='simplex'>Simplex</option>\n");
      out.write("                    <option value='slate'>Slate</option>\n");
      out.write("                    <option value='solar'>Solar</option>\n");
      out.write("                    <option value='spacelab'>Spacelab</option>\n");
      out.write("                    <option value='superhero'>Superhero</option>\n");
      out.write("                    <option value='united'>United</option>\n");
      out.write("                    <option value='yeti'>Yeti</option>\n");
      out.write("                </select>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div data-theme-system=\"jquery-ui\" class='selector' style='display:none'>\n");
      out.write("                Theme Name:\n");
      out.write("\n");
      out.write("                <select>\n");
      out.write("                    <option value='black-tie'>Black Tie</option>\n");
      out.write("                    <option value='blitzer'>Blitzer</option>\n");
      out.write("                    <option value='cupertino' selected>Cupertino</option>\n");
      out.write("                    <option value='dark-hive'>Dark Hive</option>\n");
      out.write("                    <option value='dot-luv'>Dot Luv</option>\n");
      out.write("                    <option value='eggplant'>Eggplant</option>\n");
      out.write("                    <option value='excite-bike'>Excite Bike</option>\n");
      out.write("                    <option value='flick'>Flick</option>\n");
      out.write("                    <option value='hot-sneaks'>Hot Sneaks</option>\n");
      out.write("                    <option value='humanity'>Humanity</option>\n");
      out.write("                    <option value='le-frog'>Le Frog</option>\n");
      out.write("                    <option value='mint-choc'>Mint Choc</option>\n");
      out.write("                    <option value='overcast'>Overcast</option>\n");
      out.write("                    <option value='pepper-grinder'>Pepper Grinder</option>\n");
      out.write("                    <option value='redmond' selected>Redmond</option>\n");
      out.write("                    <option value='smoothness'>Smoothness</option>\n");
      out.write("                    <option value='south-street'>South Street</option>\n");
      out.write("                    <option value='start'>Start</option>\n");
      out.write("                    <option value='sunny'>Sunny</option>\n");
      out.write("                    <option value='swanky-purse'>Swanky Purse</option>\n");
      out.write("                    <option value='trontastic'>Trontastic</option>\n");
      out.write("                    <option value='ui-darkness'>UI Darkness</option>\n");
      out.write("                    <option value='ui-lightness'>UI Lightness</option>\n");
      out.write("                    <option value='vader'>Vader</option>\n");
      out.write("                </select>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <span id='loading' style='display:none'></span>\n");
      out.write("            <button class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#mimodalejemplo\">Agregar Cita</button>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <div class='clear'></div>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <div id='calendar'></div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<!-- end: content -->\n");
      out.write("\n");
      out.write("<button id=\"mimin-mobile-menu-opener\" class=\"animated rubberBand btn btn-circle btn-danger\">\n");
      out.write("    <span class=\"fa fa-bars\"></span>\n");
      out.write("</button>\n");
      out.write("<!-- end: Mobile -->\n");
      out.write("\n");
      out.write("<!-- start: Javascript -->\n");
      out.write("\n");
      out.write("<script src=\"fullcalendar-3.7.0/lib/moment.min.js\"></script>\n");
      out.write("<script src='fullcalendar-3.7.0/lib/jquery.min.js'></script>\n");
      out.write("<!--script src=\"asset/js/jquery.min.js\"></script-->\n");
      out.write("<script src=\"asset/js/jquery.ui.min.js\"></script>\n");
      out.write("<script src=\"asset/js/bootstrap.min.js\"></script>\n");
      out.write("\n");
      out.write("\n");
      out.write("<!-- plugins -->\n");
      out.write("\n");
      out.write("<script src=\"asset/js/plugins/jquery.knob.js\"></script>\n");
      out.write("<script src=\"asset/js/plugins/ion.rangeSlider.min.js\"></script>\n");
      out.write("<script src=\"asset/js/plugins/bootstrap-material-datetimepicker.js\"></script>\n");
      out.write("<script src=\"asset/js/plugins/jquery.nicescroll.js\"></script>\n");
      out.write("<script src=\"asset/js/plugins/jquery.mask.min.js\"></script>\n");
      out.write("<script src=\"asset/js/plugins/select2.full.min.js\"></script>\n");
      out.write("<script src=\"asset/js/plugins/nouislider.min.js\"></script>\n");
      out.write("<script src=\"asset/js/plugins/jquery.validate.min.js\"></script>\n");
      out.write("<script src='fullcalendar-3.7.0/fullcalendar.min.js'></script>\n");
      out.write("<script src='fullcalendar-3.7.0/demos/js/theme-chooser.js'></script>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!-- custom -->\n");
      out.write("<script src=\"asset/js/main.js\"></script>\n");
      out.write("\n");
      out.write("\n");
      out.write("<script>\n");
      out.write("\n");
      out.write("                                            $(document).ready(function () {\n");
      out.write("\n");
      out.write("                                                initThemeChooser({\n");
      out.write("\n");
      out.write("                                                    init: function (themeSystem) {\n");
      out.write("                                                        $('#calendar').fullCalendar({\n");
      out.write("                                                            themeSystem: themeSystem,\n");
      out.write("                                                            header: {\n");
      out.write("                                                                left: 'prev,next today',\n");
      out.write("                                                                center: 'title',\n");
      out.write("                                                                right: 'month,agendaWeek,agendaDay,listMonth'\n");
      out.write("                                                            },\n");
      out.write("                                                            defaultDate: new Date,\n");
      out.write("                                                            weekNumbers: true,\n");
      out.write("                                                            navLinks: true, // can click day/week names to navigate views\n");
      out.write("                                                            editable: true,\n");
      out.write("                                                            eventLimit: true, // allow \"more\" link when too many events\n");
      out.write("                                                            events: [\n");
      out.write("    ");
 ArrayList listar = (ArrayList) request.getAttribute("ArrayCitas");
        for (Object Obj : listar) {
            Citas cita = (Citas) Obj;
      out.write("\n");
      out.write("                                                                {\n");
      out.write("                                                                    title: 'All Day Event',\n");
      out.write("                                                                    start: '");
      out.print( cita.getFechaEntrada());
      out.write("',\n");
      out.write("                                                                    end: '");
      out.print( cita.getFechaSalida());
      out.write("'\n");
      out.write("                                                                },\n");
      out.write("    ");
 }
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                                                            ]\n");
      out.write("                                                        });\n");
      out.write("                                                    },\n");
      out.write("                                                    change: function (themeSystem) {\n");
      out.write("                                                        $('#calendar').fullCalendar('option', 'themeSystem', themeSystem);\n");
      out.write("                                                    }\n");
      out.write("\n");
      out.write("                                                });\n");
      out.write("                                            });\n");
      out.write("\n");
      out.write("</script>\n");
      out.write("<!-- end: Javascript \n");
      out.write("<script>\n");
      out.write("    \n");
      out.write("  $('#calendar').fullCalendar({\n");
      out.write("    dayClick: function(date, jsEvent, view) {\n");
      out.write("\n");
      out.write("        alert('Clicked on: ' + date.format());\n");
      out.write("\n");
      out.write("        alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);\n");
      out.write("\n");
      out.write("        alert('Current view: ' + view.name);\n");
      out.write("\n");
      out.write("        // change the day's background color just for fun\n");
      out.write("        $(this).css('background-color', 'red');\n");
      out.write("\n");
      out.write("    }\n");
      out.write("});\n");
      out.write("</script>\n");
      out.write("-->\n");
      out.write("<script>\n");
      out.write("\n");
      out.write("    $(document).ready(function () {\n");
      out.write("        $(\".select2-A\").select2({\n");
      out.write("            placeholder: \"Select a state\",\n");
      out.write("            allowClear: true\n");
      out.write("        });\n");
      out.write("    });\n");
      out.write("    $('.min-date').bootstrapMaterialDatePicker({format: 'DD/MM/YYYY HH:mm', minDate: new Date()});\n");
      out.write("\n");
      out.write("</script>\n");
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

  private boolean _jspx_meth_c_forEach_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_forEach_0 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _jspx_tagPool_c_forEach_var_items.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    _jspx_th_c_forEach_0.setPageContext(_jspx_page_context);
    _jspx_th_c_forEach_0.setParent(null);
    _jspx_th_c_forEach_0.setVar("mascota");
    _jspx_th_c_forEach_0.setItems((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${requestScope.ArrayMascotas}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    int[] _jspx_push_body_count_c_forEach_0 = new int[] { 0 };
    try {
      int _jspx_eval_c_forEach_0 = _jspx_th_c_forEach_0.doStartTag();
      if (_jspx_eval_c_forEach_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\n");
          out.write("                                                    <option value=\"");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${mascota.idMascotas}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write('"');
          out.write('>');
          if (_jspx_meth_c_out_0((javax.servlet.jsp.tagext.JspTag) _jspx_th_c_forEach_0, _jspx_page_context, _jspx_push_body_count_c_forEach_0))
            return true;
          out.write("</option>                                                ");
          int evalDoAfterBody = _jspx_th_c_forEach_0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_forEach_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_c_forEach_0[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_c_forEach_0.doCatch(_jspx_exception);
    } finally {
      _jspx_th_c_forEach_0.doFinally();
      _jspx_tagPool_c_forEach_var_items.reuse(_jspx_th_c_forEach_0);
    }
    return false;
  }

  private boolean _jspx_meth_c_out_0(javax.servlet.jsp.tagext.JspTag _jspx_th_c_forEach_0, PageContext _jspx_page_context, int[] _jspx_push_body_count_c_forEach_0)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:out
    org.apache.taglibs.standard.tag.rt.core.OutTag _jspx_th_c_out_0 = (org.apache.taglibs.standard.tag.rt.core.OutTag) _jspx_tagPool_c_out_value_nobody.get(org.apache.taglibs.standard.tag.rt.core.OutTag.class);
    _jspx_th_c_out_0.setPageContext(_jspx_page_context);
    _jspx_th_c_out_0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_forEach_0);
    _jspx_th_c_out_0.setValue((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${mascota.nombre}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    int _jspx_eval_c_out_0 = _jspx_th_c_out_0.doStartTag();
    if (_jspx_th_c_out_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_out_value_nobody.reuse(_jspx_th_c_out_0);
      return true;
    }
    _jspx_tagPool_c_out_value_nobody.reuse(_jspx_th_c_out_0);
    return false;
  }
}
