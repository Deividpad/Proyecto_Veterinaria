<%@page import="models.Mascota"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="encabezado.jsp" />
<jsp:include page="menu.jsp" />
<!-- start: content -->
<div id="content">
    <div class="panel box-shadow-none content-header">
        <div class="panel-body">
            <div class="col-md-12">
                <h3 class="animated fadeInLeft">Registrar Mascota</h3>
                <p class="animated fadeInDown">
                    Form <span class="fa-angle-right fa"></span> Form Element
                </p>
            </div>
        </div>
    </div>


    <div class="col-md-10">
        <div class="col-md-12 panel">
            <div class="col-md-12 panel-heading">
                <h4>Ingrese los datos</h4>
            </div>
            <div class="col-md-12 panel-body" style="padding-bottom:30px;">
                <div class="col-md-12">
                    
                    <% Mascota SActualizar = (Mascota) request.getAttribute("mascota"); %>
                    <form class="cmxform" id="signupForm" method="POST" action="MascotasController?action=update&id=<%= SActualizar.getIdMascotas()%>">
                        <div class="col-md-6">
                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                <input type="text" class="form-text" id="nombre" name="nombre" required value="<%= SActualizar.getNombre()%>">
                                <span class="bar"></span>
                                <label>Nombre</label>
                            </div>

                           

                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                <input type="number" class="form-text" id="peso" name="peso" required value="<%= SActualizar.getPeso()%>">
                                <span class="bar"></span>
                                <label>Peso</label>
                            </div>

                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                <input type="number" class="form-text" data-val-regex-pattern="^3[0-9]+$" onkeyup="return runScriptel(this.value)" id="condicion" name="condicion" required value="<%= SActualizar.getCondicionCorporal()%>">
                                <span class="bar"></span>
                                <label>Condicion Corporal</label>
                            </div>
                                
                                <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                <input type="text" class="form-text" id="color" onkeyup="return runScript(this.value)" name="color" required value="<%= SActualizar.getColor()%>"> 
                                <span class="bar"></span>
                                <label>Color</label>
                            </div>
                            
                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                <select class="form-text" name="especie">
                                    <option value="Canino">Canino</option>
                                    <option value="Felino">Felino</option>
                                </select>
                            </div>
                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                <input type="text" class="form-text" id="raza" onkeyup="return runScript(this.value)" name="raza" required  value="<%= SActualizar.getRaza()%>">
                                <span class="bar"></span>
                                <label>Raza</label>
                            </div>
                            
                        </div>

                        <div class="col-md-6">
                            
                            
                            
                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                <select class="form-text" name="sexo">
                                    <option value="Hembra">Hembra</option>
                                    <option value="Macho">Macho</option>
                                </select>
                            </div>
                            
                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                <input type="text" class="form-text" id="alimentacion" onkeyup="return runScript(this.value)" name="alimentacion" required value="<%= SActualizar.getAlimentacion()%>">
                                <span class="bar"></span>
                                <label>Alimentacion</label>
                            </div>
                            
                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                <input type="text" class="form-text" id="medicamentos" onkeyup="return runScript(this.value)" name="medicamentos" required value="<%= SActualizar.getMedicamentos()%>">
                                <span class="bar"></span>
                                <label>Medicamentos</label>
                            </div>
                           
                            <div class="form-group form-animate-text" style="margin-top:40px !important;" >
                                <select  name="propietario" class="form-text" >
                                    
                                    <c:forEach var="pro" items="${requestScope.ArrayPropietarios}">
                                        <option value="${pro.idPropietario}">${pro.nombres}</option>
                                    </c:forEach>

                                </select>
                            </div>
                            
                            
                            
                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                <input type="text" class="form-text" id="observaciones" onkeyup="return runScript(this.value)" name="observaciones" required value="<%= SActualizar.getObservaciones()%>">
                                <span class="bar"></span>
                                <label>Observaciones</label>
                            </div>
                            
                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                <select class="form-text" name="estado">
                                    <option>option one</option>
                                    <option value="Activa">Activa</option>
                                    <option value="Inactiva">Inactiva</option>
                                    
                                </select>
                            </div>
                        </div>  

                        <div class="col-md-12">
                            <div class="form-group form-animate-text" style="margin-top:20px !important;">
                                <input type="file" class="form-text" id="foto" onkeyup="return runScript(this.value)" name="foto" required value="<%= SActualizar.getFoto()%>">
                                <span class="bar"></span>
                                <br>
                               
                            </div>
                        </div>

                        <div class="col-md-12">
                            <input class="submit btn btn-primary" type="submit" value="Guardar" > &nbsp
                            <input class="submit btn btn-danger" type="button" value="Cancelar" onclick="location.href = 'AdminClientes.jsp'">
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>

</div>
<!-- end: content -->
<script>
    function runScript(e) {
        var nit;
        try {
            nit = parseInt(e);

        } catch (e) {
            nit = 0;
        }
        document.getElementById("nit").value = nit;
    }
    function runScriptel(e) {
        var nit;
        try {
            if (e != null) {
                nit = parseInt(e);
            }

        } catch (e) {
            nit = 0;
        }
        document.getElementById("telefono").value = nit;
    }
</script>
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
<script src="asset/js/plugins/jquery.knob.js"></script>
<script src="asset/js/plugins/ion.rangeSlider.min.js"></script>
<script src="asset/js/plugins/bootstrap-material-datetimepicker.js"></script>
<script src="asset/js/plugins/jquery.nicescroll.js"></script>
<script src="asset/js/plugins/jquery.mask.min.js"></script>
<script src="asset/js/plugins/select2.full.min.js"></script>
<script src="asset/js/plugins/nouislider.min.js"></script>
<script src="asset/js/plugins/jquery.validate.min.js"></script>


<!-- custom -->
<script src="asset/js/main.js"></script>
<script type="text/javascript">
    $(document).ready(function () {

        $("#signupForm").validate({
            errorElement: "em",
            errorPlacement: function (error, element) {
                $(element.parent("div").addClass("form-animate-error"));
                error.appendTo(element.parent("div"));
            },
            success: function (label) {
                $(label.parent("div").removeClass("form-animate-error"));
            },
            rules: {
                razonsocial: "required",
                ciudad: "required",
                direccion: "required",
                nit: {
                    required: true,
                    min: 1,
                    minlength: 7,
                    maxlength: 10
                },
                telefono: {
                    required: true,
                    min: 1,
                    minlength: 10,
                    maxlength: 10
                },
                contrasena: {
                    required: true,
                    minlength: 5
                },
                confirmar_contrasena: {
                    required: true,
                    minlength: 5,
                    equalTo: "#contrasena"
                },
                validate_agree: "required"
            },
            messages: {
                razonsocial: "Por favor, introduzca Razon social",
                ciudad: "Por favor, introduzca la ciudad",
                direccion: "por favor, introduzca su direccion",
                nit: {
                    required: "Nit invalido",
                    min: "Nit valido",
                    minlength: "No valido",
                    maxlength: "No valido"
                },
                telefono: {
                    required: "Proporcione un numero de telefono",
                    min: "No valido",
                    minlength: "su telefono debe tener almenos 10 caracteres",
                    maxlength: "No valido"
                },
                contrasena: {
                    required: "Proporcione una contraseña",
                    minlength: "Su contraseña debe tener al menos 5 caracteres"
                },
                confirmar_contrasena: {
                    required: "Proporcione una contraseña",
                    minlength: "Su contraseña debe tener al menos 5 caracteres",
                    equalTo: "Ingrese la misma contraseña que la anterior"
                },
            }

        });


    });
</script>
<!-- end: Javascript -->
</body>
</html>