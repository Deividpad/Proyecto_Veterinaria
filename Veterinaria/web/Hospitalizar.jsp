<%@page import="models.Hospitalizacion"%>
<%@page import="models.Citas"%>
<%@page import="org.hibernate.Session"%>
<%@page import="models.HibernateUtil"%>
<%
    String user = (String) session.getAttribute("perfil");
    if (user==null || user.equals("Auxiliar")) {
        response.sendRedirect("LoginPersona.jsp?error=permisos");//Se pierde la información       
        return;
    }    
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="encabezado.jsp" />
<jsp:include page="menu.jsp" />
<!-- start: content -->
<div id="content">
    <% 
        String idhospi = (String) session.getAttribute("idhospi").toString();
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        String id = (String) session.getAttribute("delaz").toString();
        Hospitalizacion hospitalizacion = (Hospitalizacion) sesion.get(Hospitalizacion.class, Integer.parseInt(idhospi));        
        Citas cita = (Citas) sesion.get(Citas.class, Integer.parseInt(id));        
    %>
    <div class="panel box-shadow-none content-header">
        <div class="panel-body">
            <div class="col-md-12">
                <h3 class="animated fadeInLeft">Hospitalizacion</h3><div style=" color: white;">
                    <% if(!cita.getEstado().equals("Programada")) {%>
                    <h5 style="color: gray">Fecha Entrada: <span style="color: #085"><%= cita.getFechaEntrada() %></span></h5>
                    <h5 style="color: gray">Fecha Entrada: <span style="color: #085"><%= hospitalizacion.getFechaSalida() %></span></h5>
                    <% } %>
                            <button class="btn ripple btn-3d btn-primary" style="width: 8%;" onclick="location.href = 'DetallesCita.jsp'">
                                <div>
                                    <span class="icon-action-undo"></span>  Volver
                                </div>
                            </button>   
                        </div>             
            </div>
        </div>
    </div>
    
                    <input value="<%= idhospi%>" style="display: none" id="idhospi">
    
    <div class="col-md-12 top-20 padding-0">
        <div class="col-md-12">
            <div class="panel">
                <div id="colortable" class="panel-heading"><h3 id="tlttable">Observaciones</h3>
                    <% if(cita.getEstado().equals("Programada")) {%>
                    <button class="submit btn btn-primary" type="submit" id="btnagrobser" onclick="Showformobser()" value="Guardar" >Agregar<span class="icons icon-plus"></span></button></div>
                    <% } %>
                <div class="panel-body">
                    <div class="col-md-12" id="frmobser" style="display: none">
                        <div class="col-md-12 panel">
                            <div class="col-md-12 panel-heading">
                                <h4>Ingrese los datos</h4>
                            </div>
                            <div class="col-md-12 panel-body" style="padding-bottom:30px;">
                                <div class="col-md-12">
                                    <!--<form class="cmxform" id="signupForm" method="POST" action="ClientesController?action=create">-->
                                    <div class="col-md-6">
                                        <input type="text" style="display: none" id="idmedi">
                                        <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                            <input type="text" maxlength="30" class="form-text" disabled="disabled" id="nombre" name="nombre" required>
                                            <input type="text" style="display: none" id="obserid">
                                            <textarea name="observaciones" style=" width: 100%;" id="observaciones" rows="5"  required="required"  rows="4" placeholder="Observaciones de la Hospitalizacion"></textarea>
                                            <span class="bar"></span>
                                            <label>Observacion</label>
                                        </div>
                                    </div>                                                         
                                    <div class="col-md-12">
                                        <input class="submit btn btn-primary" type="submit" id="btnobser" onclick="Observaciones()" value="Guardar" > &nbsp
                                        <input class="submit btn btn-primary" type="submit" id="btnobseredi" onclick="Observacionesedi(2)" value="Editar" > &nbsp
                                        <input class="submit btn btn-danger" type="button" value="Cancelar" onclick="Showformobser()">
                                    </div>
                                    <!--</form>-->

                                </div>
                            </div>
                        </div>
                    </div>     
                    <div class="responsive-table">
                        <table class="table">
                            <thead>
                                <tr style="color: #000000">
                                    <th>Observacion Diaria</th>
                                    <% if(cita.getEstado().equals("Programada")) {%>
                                    <th>Aciones</th>                                
                                    <% } %>
                                </tr>
                            </thead>
                            <tbody id="lsobser">                                

                            </tbody>
                        </table>
                        
                    </div>
                </div>
            </div>
        </div>  
    </div>
</div>
<!-- end: content -->


<button id="mimin-mobile-menu-opener" class="animated rubberBand btn btn-circle btn-danger">
    <span class="fa fa-bars"></span>
</button>
<!-- end: Mobile -->

<!-- start: Javascript -->
<script src="asset/js/jquery.min.js"></script>
<script src="asset/js/jquery.ui.min.js"></script>
<script src="asset/js/bootstrap.min.js"></script>


<!-- plugins -->

<script src="asset/js/plugins/moment.min.js"></script>
<script src="asset/js/plugins/jquery.datatables.min.js"></script>
<script src="asset/js/plugins/datatables.bootstrap.min.js"></script>
<script src="asset/js/plugins/jquery.nicescroll.js"></script>


<!-- custom -->
<script src="asset/js/main.js"></script>
<script type="text/javascript">
                                $(document).ready(function () {
                                    $('#datatables-example').DataTable();
                                });
</script>
<!-- end: Javascript -->
<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script>
    $(document).ready(function () {
        $.ajax({
            type: 'POST',
            data: {idhospi: $('#idhospi').val()},
            url: 'HospitalizacionController?action=adminobser',
            success: function (result) {
                $('#lsobser').html(result);
            }
        });
////        $("#btnclpro").hide();
    });


</script>
<script>

    function Showformobser() {
        $("#frmobser").toggle("slow");
        $("#btnobseredi").hide();
        $("#btnobser").show();
        document.getElementById('observaciones').value = "";
    }

//    Medoto para registrar
    function Observaciones() {
//        alert();
        var obser = $('#observaciones').val();
        if (obser === "") {
            alert("Esta vacio");
        } else {
//            alert("se fue");
            $.ajax({
                type: 'POST',
                data: {observaciones: $('#observaciones').val(), idhospi: $('#idhospi').val()},
                url: 'HospitalizacionController?action=createobser',
                success: function (result) {
                    $('#lsobser').html(result);
                    $("#frmobser").toggle("slow");
                    $("#btnobseredi").hide();
                    $("#btnobser").show();
                    document.getElementById('observaciones').value = "";
                }
            });
        }
    }

//    Metodo para editar
    function Observacionesedi(opc, id, obser) {
        if (opc === 1) {
            document.getElementById('obserid').value = id;
            document.getElementById('observaciones').value = obser;
            $("#frmobser").toggle("slow");
            $("#btnobseredi").show();
            $("#btnobser").hide();
        } else {
            if (document.getElementById('observaciones').value === "") {
                alert("Campo vacio");
            } else {
                $.ajax({
                    type: 'POST',
                    data: {observaciones: $('#observaciones').val(), idobser: $('#obserid').val(), idhospi: $('#idhospi').val()},
                    url: 'HospitalizacionController?action=updateobser',
                    success: function (result) {
                        $('#lsobser').html(result);
                        $("#frmobser").toggle("slow");
                        $("#btnobseredi").hide();
                        $("#btnobser").show();
                        document.getElementById('observaciones').value = "";
                    }
                });
            }


        }

    }

    function Eliminarobser(id) {
        $.ajax({
            type: 'POST',
            data: {idobser: id, idhospi: $('#idhospi').val()},
            url: 'HospitalizacionController?action=eliminarobser',
            success: function (result) {
                $('#lsobser').html(result);
            }
        });
    }

    function goBack() {
        window.history.back();
    }
//     window.onbeforeunload = function() {
////      return "¿Estás seguro que deseas salir de la actual página?"
////return alert("si aca");
//         return location.href ="Inicio.jsp";
//  };
</script>

</body>
</html>