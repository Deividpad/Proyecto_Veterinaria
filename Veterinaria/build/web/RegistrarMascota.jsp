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
                    
                    <form class="cmxform" id="signupForm" method="POST" action="MascotasController?action=create">
                        <div class="col-md-6">
                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                <input type="text" class="form-text" id="nombre" name="nombre" required>
                                <span class="bar"></span>
                                <label>Nombre</label>
                            </div>

                            

                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                <input type="number" class="form-text" id="peso" name="peso" required>
                                <span class="bar"></span>
                                <label>Peso (Kg)</label>
                            </div>

                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                <input type="number" class="form-text" data-val-regex-pattern="^3[0-9]+$" onkeyup="return runScriptel(this.value)" id="condicion" name="condicion" required>
                                <span class="bar"></span>
                                <label>Condicion Corporal</label>
                            </div>
                            
                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                <input type="text" class="form-text" id="color" name="color" required>
                                <span class="bar"></span>
                                <label>Color</label>
                            </div>
                            
                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                <!--<input type="" class="form-text" data-val-regex-pattern="^3[0-9]+$" onkeyup="return runScriptel(this.value)" id="telefono" name="telefono" required>-->

                                <select class="form-text" name="especie" id="especie">
                                    <option value="" selected="selected">Seleccione...</option>
                                    <option value="Femenino">Canino</option>
                                    <option value="Masculino">Felino</option>
                                </select>
                                <span class="bar" ></span>
                                <label>Especie</label> 
                            </div>
                            
                            
                            
                             
                            
                        </div>

                        <div class="col-md-6">
                            
                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                <input type="text" class="form-text" id="raza" onkeyup="return runScript(this.value)" name="raza" required>
                                <span class="bar"></span>
                                <label>Raza</label>
                            </div>
                            
                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                <!--<input type="" class="form-text" data-val-regex-pattern="^3[0-9]+$" onkeyup="return runScriptel(this.value)" id="telefono" name="telefono" required>-->

                                <select class="form-text" name="genero" id="genero">
                                    <option value="" selected="selected">Seleccione...</option>
                                    <option value="Hembra">Hembra</option>
                                    <option value="Macho">Macho</option>
                                </select>
                                <span class="bar" ></span>
                                <label>Genero</label> 
                            </div>
                            
                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                <input type="text" class="form-text" id="alimentacion" onkeyup="return runScript(this.value)" name="alimentacion" required>
                                <span class="bar"></span>
                                <label>Alimentacion</label>
                            </div>
                            
                           
                            
                            <div class="form-group form-animate-text" style="margin-top:40px !important;" class="bar" required >
                                <select  name="propietario" class="form-text"id="propietario" >
                                    <option value="" selected="selected">Seleccione...</option>
                                    <c:forEach var="pro" items="${requestScope.ListarPropietario}">
                                        <option value="${pro.idPropietario}">${pro.nombres}</option>
                                    </c:forEach>
                                </select>
                                <span class="bar"></span>
                                <label>Propietario</label> 
                            </div>
                            
                            
                            
                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                <!--<input type="" class="form-text" data-val-regex-pattern="^3[0-9]+$" onkeyup="return runScriptel(this.value)" id="telefono" name="telefono" required>-->

                                <select class="form-text" name="estado" id="estado">
                                    <option value="" selected="selected">Seleccione...</option>
                                    <option value="Activa">Activa</option>
                                    <option value="Inactiva">Inactiva</option>
                                </select>
                                <span class="bar" ></span>
                                <label>Estado</label> 
                            </div>
                        </div>  
                         <div class="col-md-12">
                             
                              <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                <input type="text" class="form-text" id="observaciones" onkeyup="return runScript(this.value)" name="observaciones" value=""  >
                                <span class="bar"></span>
                                <label>Observaciones (No obligatorio) </label>
                            </div>
                             
                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                <input type="text" class="form-text" id="medicamentos" onkeyup="return runScript(this.value)" name="medicamentos" value="">
                                <span class="bar"></span>
                                <label>Medicamentos (No obligatorio)</label>
                            </div>
                             <div class="form-group form-animate-text" style="margin-top:20px !important;"   <label>Foto 
                               
                                <input type="file" class="form-text" id="foto" onkeyup="return runScript(this.value)" name="foto" required>
                                <span class="bar"></span>
                                <br>
                               
                            </div>
                             
                             </div>
                        
                        <div class="col-md-12">
                            <input class="submit btn btn-primary" type="submit" value="Guardar" > &nbsp
                            <input class="submit btn btn-danger" type="button" value="Cancelar" onclick="location.href = 'MascotasController?action=admin'">
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
        //document.getElementById("telefono").value = nit;
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
                alimentacion: "required",
                foto: "required",
               
                nombre: {
                    required: true,
                    minlength: 3,
                    maxlength: 60
                },
                peso: {
                    required: true,
                    min: 0.5,
                    max: 70
                },
                condicion: {
                    required: true,
                    min: 1,
                    max: 5
                    
                },
                color: {
                    required: true,
                    minlength: 3,
                    maxlength: 100
                    
                },
                raza: {
                    required: true,
                    minlength: 3,
                    maxlength: 45
                },
                
                contrasena: {
                    required: true,
                    minlength: 5
                },
                especie: {
                    required: true
                },
                genero: {
                    required: true
                },
                propietario: {
                    required: true
                },
                estado: {
                    required: true,
                },
                confirmar_contrasena: {
                    required: true,
                    minlength: 5,
                    equalTo: "#contrasena"
                },
                validate_agree: "required"
            },
            messages: {
                
                foto: "Por favor, inserte una foto.",
                
                alimentacion: "Por favor, digite la alimentaci�n.",
                propietario:"Por favor, seleecione",
                nombre: {
                    required: "Por favor, digite un nombre",
                    minlength: "N�mero min�mo de caracteres (3).",
                    maxlength: "N�mero m�ximo de caracteres (60)."
                },
                peso: {
                    required: "Por favor, digite el peso",
                    min: "Por favor ingrese un valor mayor o igual a 0.5.",
                    max: "Por favor, introduzca un valor inferior o igual a 70."
                },
                condicion: {
                    required: "Por favor, digite la condici�n corporal",
                    min: "Por favor ingrese un valor mayor o igual que 1.",
                    max: "Por favor ingrese un valor menor o igual a 5."
                    
                },
                color: {
                    required: "Por favor, digite un nombre",
                    minlength: "Por favor, digite al menos 3 caracteres.",
                    maxlength: "Por favor, ingrese no m�s de 100 caracteres."
                },
                raza: {
                    required: "Por favor, digite la raza.",
                    minlength: "Por favor, digite al menos 3 caracteres.",
                    maxlength: "No valido"
                },
                contrasena: {
                    required: "Proporcione una contrase�a",
                    minlength: "Su contrase�a debe tener al menos 5 caracteres"
                },
                especie: {
                    required: "Por favor, seleccione una opcion"
                },
                genero: {
                    required: "Por favor, seleccione una opcion"
                },
                 estado: {
                    required: "Por favor, seleccione una opcion"
                },
                confirmar_contrasena: {
                    required: "Proporcione una contrase�a",
                    minlength: "Su contrase�a debe tener al menos 5 caracteres",
                    equalTo: "Ingrese la misma contrase�a que la anterior"
                },
            }

        });


    });
</script>
<!-- end: Javascript -->
</body>
</html>