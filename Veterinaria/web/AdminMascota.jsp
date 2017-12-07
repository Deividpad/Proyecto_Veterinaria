<%
    String user = (String) session.getAttribute("perfil");
    if (user == null) {
        response.sendRedirect("LoginPersona.jsp?error=true");//Se pierde la informaci�n       
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
                <h3 class="animated fadeInLeft">Administrar Mascotas</h3>                

            </div>
        </div>
    </div>

    <div class="col-md-12 top-20 padding-0">
        <div class="col-md-12">
            <div class="panel">
                <div id="colortable" class="panel-heading"><h3 id="tlttable">Mascotas</h3></div>
                <div class="panel-body">
                    <div class="responsive-table">
                        <table id="datatables-example" class="table table-striped table-bordered" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>Nombre</th>                                    
                                    <th>Peso</th>
                                    <th>Condici�n Corporal</th>
                                    <th>Color</th>
                                    <th>Especie</th>
                                    <th>Raza</th>                                        
                                    <th>G�nero</th>                                                                            
                                    <th>Propietario</th>                                  
                                    <th>Estado</th>                                    
                                    <th>Acciones</th>                                                                                                                                               
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="Mascota" items="${requestScope.ArrayMascota}">

                                    <tr>

                                        <td><c:out value="${Mascota.nombre}"/></td>                                        
                                        <td><c:out value="${Mascota.peso}"/></td>
                                        <td><c:out value="${Mascota.condicionCorporal}"/></td>
                                        <td><c:out value="${Mascota.color}"/></td>
                                        <td><c:out value="${Mascota.especie}"/></td>
                                        <td><c:out value="${Mascota.raza}"/></td>
                                        <td><c:out value="${Mascota.genero}"/></td>                                        
                                        <td><c:out value="${Mascota.propietario.nombres}"/></td>
                                        <td><c:out value="${Mascota.estado}"/></td>                                        
                                        <td>                                             
                                            <button title="Editar" class=" btn btn-circle btn-mn btn-primary" type="button" onclick="location.href = 'MascotasController?action=update&id=${Mascota.idMascotas}'">
                                                <span class="fa fa-edit"></span>
                                            </button>
                                            <button class=" btn btn-circle btn-mn btn-danger" onclick="location.href = 'MascotasController?action=eliminar&id=${Mascota.idMascotas}'">
                                                <span class="fa fa-trash"></span>
                                            </button>                                            
                                            <button class="btn ripple btn-3d btn-primary" style="width: 50%;" onclick="location.href = 'CitasController?action=adminh&idmas=${Mascota.idMascotas}'">
                                                <div>
                                                    <span class="icon-arrow-right"></span>H.Clinico
                                                </div>
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