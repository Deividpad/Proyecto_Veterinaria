<%-- 
    Document   : EditarPersona
    Created on : 20/11/2017, 05:00:12 AM
    Author     : Erika N
--%>

<%@page import="models.Persona"%>
<jsp:include page="encabezado.jsp" />
<jsp:include page="menu.jsp" />

 <title>Editar Persona</title>
<!-- start: content -->
<div id="content">
    <div class="panel box-shadow-none content-header">
        <div class="panel-body">
            <div class="col-md-12">
                <h3 class="animated fadeInLeft">Editar Persona</h3>
<!--                <p class="animated fadeInDown">
                    Form <span class="fa-angle-right fa"></span> Form Element
                </p>-->
            </div>
        </div>
    </div>


    <div class="col-md-10">
        <div class="col-md-12 panel">
            <div class="col-md-12 panel-heading">
                 <% Persona PerActualiza = (Persona) request.getAttribute("persona"); %>        
                 <h4>Edite los datos <%=PerActualiza.getNombres()%></h4>
            </div>
            <div class="col-md-12 panel-body" style="padding-bottom:30px;">
                <div class="col-md-12">
                    <form class="cmxform" id="signupForm" method="POST" action="PersonasController?action=update&id=<%= PerActualiza.getIdVeterinario()%>">
                        <div class="col-md-6">
                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                <input type="number" class="form-text" id="Documento" name="documento" required value="<%=PerActualiza.getDocumento()%>">
                                <span class="bar"></span>
                                <label>Documento</label>
                            </div>

                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                <input type="text" class="form-text" id="Nombres" onkeyup="return runScript(this.value)" name="nombres" required value="<%=PerActualiza.getNombres()%>">
                                <span class="bar"></span>
                                <label>Nombres</label>
                            </div>

                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                <input type="text" class="form-text" id="ciudad" name="apellidos" required value="<%=PerActualiza.getApellidos()%>">
                                <span class="bar"></span>
                                <label>Apellidos</label>
                            </div>

                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                               <!--<input type="" class="form-text" data-val-regex-pattern="^3[0-9]+$" onkeyup="return runScriptel(this.value)" id="telefono" name="telefono" required>-->
                               
                               <select class="form-text" name="genero" required value="<%=PerActualiza.getGenero()%>">
                                                         <option>Seleccione...</option>
                                                        <option value="Femenino">Femenino</option>
                                                        <option value="Masculino">Masculino</option>
                               </select>
                                <span class="bar" ></span>
                                <label>Genero</label> 
                            </div>
                                                         
                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                   <input type="number" class="form-text" id="telefono" name="telefono" required value="<%=PerActualiza.getTelefono()%>">
                                   <span class="bar"></span>
                                   <label>Telefono</label>
                               </div>

                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                   <input type="email" class="form-text" id="email" name="correo" required value="<%=PerActualiza.getCorreo()%>">
                                   <span class="bar"></span>
                                   <label>Correo</label>
                            </div>
                        </div>

                        <div class="col-md-6">
                          

                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                <input type="text" class="form-text" id="direccion" name="direccion" required value="<%=PerActualiza.getDireccion()%>">
                                <span class="bar"></span>
                                <label>Direccion</label>
                            </div>
                            
                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                <input type="text" class="form-text" id="ciudad" name="ciudad" required value="<%=PerActualiza.getCiudad()%>">
                                <span class="bar"></span>
                                <label>Ciudad</label>
                            </div>
                            
                            <div   class="form-group form-animate-text" style="margin-top:40px !important;">
                               <!--<input type="" class="form-text" data-val-regex-pattern="^3[0-9]+$" onkeyup="return runScriptel(this.value)" id="telefono" name="telefono" required>-->
                              
                               <select class="form-text" id="perfil" name="perfil" required value="<%=PerActualiza.getPerfil()%>">
                                    <option>Seleccione...</option>
                                    <option value="Administrador">Administrador</option>
                                    <option value="Veterinario">Veterinario</option>
                                    <option value="Auxiliar">Auxiliar</option>
                               </select>
                                <span class="bar" ></span>
                                <label>Perfil</label>
                            </div>
                            
                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                <input type="text" class="form-text" id="Nombres" name="especialidad" required value="<%=PerActualiza.getEspecialidad()%>">
                                <span class="bar"></span>
                                <label>Especialidad</label>
                            </div>
                           
                             <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                <input type="password" class="form-text" id="contrasena" onkeyup="return runScript(this.value)" name="contrasena" required value="<%=PerActualiza.getContrasena()%>">
                                <span class="bar"></span>
                                <label>Contraseņa</label>
                            </div>
                            
                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                               <!--<input type="" class="form-text" data-val-regex-pattern="^3[0-9]+$" onkeyup="return runScriptel(this.value)" id="telefono" name="telefono" required>-->
                              
                               <select class="form-text" name="estado" required value="<%=PerActualiza.getEstado()%>">
                                    <option>Seleccione...</option>
                                    <option value="Activo">Activo</option>
                                    <option value="Inactivo">Inactivo</option>
                                   
                               </select>
                                <span class="bar" ></span>
                                <label>Estado</label>
                            </div>
<!--                            <div class="col-sm-12 padding-0">
                                <select class="form-control">
                                    <option>option one</option>
                                    <option>option two</option>
                                    <option>option three</option>
                                    <option>option four</option>
                                </select>
                            </div>-->

                        </div>  
                        
                           <div class="col-md-12">
                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                <input type="text" class="form-text" id="Nombres" onkeyup="return runScript(this.value)" name="foto" required value="<%=PerActualiza.getFoto()%>">
                                <span class="bar"></span>
                                <label>Foto</label>
                            </div>
                           </div>         
                                    
                 
                        <div class="col-md-12">
                            <input class="submit btn btn-primary" type="submit" value="Guardar" > &nbsp
                            <input class="submit btn btn-danger" type="button" value="Cancelar" onclick="location.href = 'PersonasController?action=admin'">
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
                perfil: {
                    required: true,
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
                    required: "Proporcione una contraseņa",
                    minlength: "Su contraseņa debe tener al menos 5 caracteres"
                },
                confirmar_contrasena: {
                    required: "Proporcione una contraseņa",
                    minlength: "Su contraseņa debe tener al menos 5 caracteres",
                    equalTo: "Ingrese la misma contraseņa que la anterior"
                },
            }

        });


    });
</script>
<!-- end: Javascript -->
</body>
</html>
