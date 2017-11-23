<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : AdminPersonas
    Created on : 20/11/2017, 04:06:52 AM
    Author     : Erika N
--%>


<jsp:include page="encabezado.jsp" />
<jsp:include page="menu.jsp" />
<!-- start: content -->
<div id="content">
    <div class="panel box-shadow-none content-header">
        <div class="panel-body">
            <div class="col-md-12">
                <h3 class="animated fadeInLeft">Administrar Personas</h3>                
            </div>
        </div>
    </div>

    <div class="col-md-12 top-20 padding-0">
        <div class="col-md-12">
            <div class="panel">
                <div id="colortable" class="panel-heading"><h3 id="tlttable">Personas</h3></div>
                <div class="panel-body">
                    <div class="responsive-table">
                        <table id="datatables-example" class="table table-striped table-bordered" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>Documento</th>
                                    <th>Nombres</th>
                                    <th>Apellidos</th>
                                    <th>Telefono</th>                                        
                                    <th>Correo</th>
                                    <th>Perfil</th>
                                    <th>Especialidad</th>
                                    <th>Estado</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>  
                                <c:forEach var="person" items="${requestScope.ArrayPersonas}">              

                                    <tr>
                                        <td><c:out value="${person.documento}"/><!--</td>nombre clase-->
                                        <td><c:out value="${person.nombres}"/></td>
                                        <td><c:out value="${person.apellidos}"/></td>
                                        <td><c:out value="${person.telefono}"/></td>
                                        <td><c:out value="${person.correo}"/></td>
                                        <td><c:out value="${person.perfil}"/></td>
                                        <td><c:out value="${person.especialidad}"/></td>
                                        <td><c:out value="${person.estado}"/></td>
                                        <td>
                                             
                                        <button class=" btn btn-circle btn-mn btn-primary" type="button" autofocus  placheader="" onclick="location.href = 'PersonasController?action=update&id=${person.idVeterinario}'">
                                            <span class="fa fa-edit"></span>
                                        </button>
                                            
                                        <button class=" btn btn-circle btn-mn btn-danger"  onclick="location.href = 'PersonasController?action=eliminar&id=${person.idVeterinario}'">
                                            <span class="fa fa-trash"></span>
                                        </button> 
                                        </td>
                                    </tr>                                  

                                </c:forEach>  
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