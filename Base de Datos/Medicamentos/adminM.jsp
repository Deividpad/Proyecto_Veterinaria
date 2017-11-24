<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : adminM
    Created on : 23-nov-2017, 16:26:06
    Author     : juli-
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="row">
            <div class="col-12">                    
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Data Table</h4>
                        <h6 class="card-subtitle">Data table example</h6>
                        <div class="table-responsive m-t-40">
                            <table id="myTable" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>Persona</th>
                                        <th>Cita</th>
                                        <th>Hospitalizacion</th>     
                                        <th>Nombre</th>   
                                        <th>Laboratorio</th> 
                                        <th>Lote</th> 
                                        <th>Fecha</th> 
                                    </tr>
                                </thead>
                                <c:forEach var="M" items="${requestScope.listaM}">
                                    <tr>
                                        <td><c:out value="${M.persona.nombres}"/></td>
                                        <td><c:out value="${M.citas.tipo}"/></td>
                                        <td><c:out value="${M.hospitalizacion.proposito}"/></td>
                                        <td><c:out value="${M.nombre}"/></td>
                                        <td><c:out value="${M.laboratorio}"/></td>
                                        <td><c:out value="${M.lote}"/></td>
                                        <td><c:out value="${M.fecha}"/></td>


                                    </tr>
                                </c:forEach>

                            </table>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </body>
</html>
