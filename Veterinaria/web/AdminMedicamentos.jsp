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
    <div class="panel box-shadow-none content-header">
        <div class="panel-body">
            <div class="col-md-12">
                <h3 class="animated fadeInLeft">Administrar Clientes</h3>                
            </div>
        </div>
    </div>

    <div class="col-md-12 top-20 padding-0">
        <div class="col-md-12">
            <div class="panel">
                <div id="colortable" class="panel-heading"><h3 id="tlttable">Clientes</h3>
                    <button type="button"  class="btn btn-primary btn-lg" onclick="location.href = 'MedicamentosCitas.jsp'">
                        <span class="fa fa-bars"></span>Datos Cita
                    </button>     
                    <button type="button"  class="btn btn-primary btn-lg" onclick="location.href = 'ProductosControllers?action=admin&id='">
                        <span class="fa fa-bars"></span>Medicamentos
                    </button>                                      
                </div>
                <div class="panel-body">
                    <div class="responsive-table">
                        <table id="datatables-example" class="table table-striped table-bordered" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>Nombre</th>
                                    <th>Laboratorio</th>
                                    <th>Lote</th>                                    
                                    <th>Aciones</th>                                        
                                </tr>
                            </thead>
                            <tbody>                                
                                <tr>
                                    <c:forEach var="medi" items="${requestScope.listaM}">                                        
                                        <td><c:out value="${medi.nombre}"/></td>
                                        <td><c:out value="${medi.laboratorio}"/></td>
                                        <td><c:out value="${medi.lote}"/></td>
                                        <td>
                                            <button type="button" class="btn ripple-infinite btn-round btn-3d btn-default" onclick="myFunction(${p.idProducto},${p.valor}, '${p.nombre}')" data-toggle="modal" data-target="#mimodalejemplo">
                                                <div>
                                                    <span style="color: red;">Agregar Medicamento</span>
                                                </div>
                                            </button> 
                                            <button class=" btn btn-circle btn-mn btn-primary" type="button" onclick="location.href = 'ProductosControllers?action=update&id=${p.idProducto}'">
                                                <span class="fa fa-edit"></span>
                                            </button>
                                            <button class=" btn btn-circle btn-mn btn-danger" onclick="location.href = 'ProductosControllers?action=delete&id=${p.idProducto}'">
                                                <span class="fa fa-trash"></span>
                                            </button>                                            
                                        </td>
                                    </tr>                                  
                                </c:forEach>
                            </tbody>
                        </table>
                        <div style="text-align: right; color: white;">                          
                            <button class="btn ripple btn-3d btn-primary" style="width: 8%;" onclick="location.href = 'CitasController?action=admin&param=2'">
                                <div>
                                    <span class="icon-action-undo"></span>  Volver
                                </div>
                            </button>   
                        </div>
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
    /*
     --------------------------------------------------------------------------------
     | EJEMPLO Y SCRIPT ADAPTADO AL ESPA?OL POR http://blog.reaccionestudio.com/    |
     --------------------------------------------------------------------------------
     |	VIS?TANOS !!!                                                              |
     --------------------------------------------------------------------------------
     */
    function error() {
        alertify.error("Asegurese de que no este registrado en otra tabla");
        return false;
    }
    function ok() {
        alertify.success("Cambios guardados correctamente");
        return false;
    }
    function ok2() {
        alertify.success("Se ha registrado correctamente");
        return false;
    }
</script>   
<%
    String get = request.getParameter("error");
    if (get != null && get.equals("true")) { %>
<script language='JavaScript' type='text/javascript'>
    error();</script>
    <% } else if (get != null && get.equals("ok")) {%>
<script language='JavaScript' type='text/javascript'>
    ok();</script>
    <% } else if (get != null && get.equals("registro")) {%>
<script language='JavaScript' type='text/javascript'>
    ok2();</script>
    <% }%>
</body>
</html>