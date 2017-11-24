<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : registrar
    Created on : 23-nov-2017, 16:11:12
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
                                <h4 class="card-title">Formulario</h4>
                                <form action="MedicamentosController?action=create" class="m-t-40" novalidate method="post">
                                    <div class="form-group">
                                    <label for="job">Persona<span class="text-danger">*</span></label> 
                                    <select class="controls" name="idVeterinario">
                                      <c:forEach var="perso" items="${requestScope.ArrayP}">
                                             <option value="${perso.idVeterinario}"><c:out value="${perso.nombres}"/></option>  
                                        </c:forEach>
                                      </select>
                                    </div>
                                     <div class="form-group">
                                    <label for="job">Cita<span class="text-danger"></span></label> 
                                    <select class="controls" name="idCitasMedicas">
                                        <c:forEach var="cit" items="${requestScope.ArrayC}">
                                            <option value="${cit.idCitasMedicas}"><c:out value="${cit.tipo}"/></option> 
                                        </c:forEach>
                                     
                                      </select>
                                    </div>
                                     <div class="form-group">
                                    <label for="job">Hospitalizacion<span class="text-danger">*</span></label> 
                                    <select class="controls" name="idHospitalizacion">
                                        <c:forEach var="hos" items="${requestScope.ArrayH}">
                                              <option value="${hos.idHospitalizacion}"><c:out value="${hos.proposito}"/></option> 
                                        </c:forEach>
                                      
                                      </select>
                                    </div>
                                    <div class="form-group">
                                        <h5>Nombre<span class="text-danger">*</span></h5>
                                        <div class="controls">
                                            <input type="text" name="nombre" class="form-control" required data-validation-required-message="This field is required"> </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <h5>Laboratorio<span class="text-danger">*</span></h5>
                                        <div class="controls">
                                            <input type="text" name="laboratorio" class="form-control" required data-validation-required-message="This field is required"> </div>
                                    </div>
                                    
                                  <div class="form-group">
                                        <h5>Lote<span class="text-danger">*</span></h5>
                                        <div class="controls">
                                            <input type="text" name="lote" class="form-control" required data-validation-required-message="This field is required"> </div>
                                    </div>
                                    <div class="text-xs-right">
                                        <button type="submit" class="btn btn-info">Registrar</button>
                                        <button type="reset" class="btn btn-inverse" onclick="javascript:history.go(-1)">Cancelar</button>
                                    </div>
                                </form>
                            
                        </div>
                    </div>
                </div>
            
            
            <!-- ============================================================== 
            
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <footer class="footer"> © 2017 Admin Pro by wrappixel.com </footer>
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
    </body>
</html>
