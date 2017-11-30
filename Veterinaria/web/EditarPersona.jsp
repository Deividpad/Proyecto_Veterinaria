<%
    String user = (String) session.getAttribute("perfil");
    if (user==null || user.equals("Auxiliar")) {
        response.sendRedirect("LoginPersona.jsp?error=permisos");//Se pierde la información       
        return;
    }    
%>

<%@page import="models.Persona"%>
<jsp:include page="encabezado.jsp" />
<jsp:include page="menu.jsp" />

<title>Editar Persona</title>
<!-- start: content -->
<div id="content">
     <% Persona PerActualiza = (Persona) request.getAttribute("persona");%>   
      <form class="cmxform" id="signupForm" method="POST" action="PersonasController?action=update&id=<%= PerActualiza.getIdVeterinario()%>">
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


    <div class="col-md-9">
        <div class="col-md-12 panel">
            <div class="col-md-12 panel-heading">
                    
                <h4>Edite los datos <%=PerActualiza.getNombres()%></h4>
            </div>
            <div class="col-md-12 panel-body" style="padding-bottom:30px;">
                <div class="col-md-12">
                   
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
                                <select class="form-text" name="genero" id="genero">
                                    <option <% if (PerActualiza.getGenero().equals("Femenino")){ out.print("selected");}%> value="Femenino">Femenino</option>
                                     <option <% if (PerActualiza.getGenero().equals("Masculino")){ out.print("selected");}%> value="Masculino">Masculino</option>
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
                                <input type="email" class="form-text" id="correo" name="correo" required value="<%=PerActualiza.getCorreo()%>">
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
                                <select class="form-text" name="perfil" id="perfil">
                                    <option  <% if (PerActualiza.getPerfil().equals("Administrador")){ out.print("selected");}%> value="Administrador">Administrador</option>
                                  <option  <% if (PerActualiza.getPerfil().equals("Veterinario")){ out.print("selected");}%> value="Veterinario">Veterinario</option>
          
                                  <option  <% if (PerActualiza.getPerfil().equals("Auxiliar")){ out.print("selected");}%> value="Auxiliar">Auxiliar</option></select>
                                
                                <span class="bar" ></span>
                                <label>Perfil</label>
                            </div>

                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                <input type="text" class="form-text" id="Nombres" name="especialidad" required value="<%=PerActualiza.getEspecialidad()%>">
                                <span class="bar"></span>
                                <label>Especialidad</label>
                            </div>

<!--                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                <input type="password" class="form-text" id="contrasena" onkeyup="return runScript(this.value)" name="contrasena" required value="<%=PerActualiza.getContrasena()%>">
                                <span class="bar"></span>
                                <label>Contraseña</label>
                            </div>-->



                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                <!--<input type="" class="form-text" data-val-regex-pattern="^3[0-9]+$" onkeyup="return runScriptel(this.value)" id="telefono" name="telefono" required>-->
                                <select class="form-text" name="estado" id="estado">
                                    <option  <% if(PerActualiza.getEstado().equals("Activo")){ out.print("selected");}%> value="Activo">Activo</option>
                                    <option  <% if(PerActualiza.getEstado().equals("Inactivo")){ out.print("selected");}%> value="Inactivo">Inactivo</option>
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

                        <!--                           <div class="col-md-12">
                                                    <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                                        <input type="text" class="form-text" id="Nombres" onkeyup="return runScript(this.value)" name="foto" required value="<%=PerActualiza.getFoto()%>">
                                                        <span class="bar"></span>
                                                        <label>Foto</label>
                                                    </div>
                                                   </div>         -->


                        <div class="col-md-12">
                            <input class="submit btn btn-primary" type="submit" value="Guardar" > &nbsp
                            <input class="submit btn btn-danger" type="button" value="Cancelar" onclick="location.href = 'PersonasController?action=admin'">
                        </div>
                  

                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-3"> <h1>Imagen</h1>

        <div class="col-md-12">
            <input type="file" class="form-text" id="foto" name="foto" required>
        </div>
        
        <div class="card-avatar">
            <a href="#pablo">
                <div class="img" id="vista_previa"><label for="foto"></label>Vista previa</div>
            </a>
        </div>
    </div>
  </form>
</div>
                                                        
                                                        
                                                        <script>
    document.getElementById('vista_previa').innerHTML = '<img src="images/avatar_circle_blue_512dp.png" alt="" width="250" />';
    if (window.FileReader) {
        function seleccionArchivo(evt) {
            var files = evt.target.files;
            var f = files[0];
            var leerArchivo = new FileReader();
            document.getElementById('resetear').style.display = 'block';
            leerArchivo.onload = (function (elArchivo) {
                return function (e) {
                    document.getElementById('vista_previa').innerHTML = '<img src="' + e.target.result + '" alt="" width="250" />';
                };
            })(f);
            leerArchivo.readAsDataURL(f);
        }
    } else {
        document.getElementById('vista_previa').innerHTML = "El navegador no soporta vista previa";
    }
    document.getElementById('foto').addEventListener('change', seleccionArchivo, false);
    function cancela(elForm) {
        document.getElementById(elForm).reset();
        if (window.FileReader) {
            document.getElementById('vista_previa').innerHTML = "Vista Previa";
        } else {
            document.getElementById('vista_previa').innerHTML = "El navegador no soporta vista previa";
        }
        document.getElementById('resetear').style.display = 'none';
    }
</script>

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
                selected: "required",
                razonsocial: "required",

                documento: {
                    required: true,
                    min: 1,
                    minlength: 10,
                    maxlength: 10
                },
                nombres: {
                    required: true,
                    maxlength: 10
                },
                apellidos: {
                    required: true,
                    maxlength: 60,
                },
                correo: {
                    required: true,
                    maxlength: 45,
                },
                telefono: {
                    required: true,
                    min: 1,
                    minlength: 10,
                    maxlength: 10
                },
                direccion: {
                    required: true,
                    maxlength: 120,
                },
                ciudad: {
                    required: true,
                    maxlength: 45,
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
                genero: {
                    required: true,
                },
                estado: {
                    required: true,
                },

                validate_agree: "required"
            },
            messages: {

                genero: "Por favor, Seleccione el Genero.",
                perfil: "Por favor, Seleccione un Perfil.",
                estado: "Por favor, Seleccione un Estado.",
                foto: "Por favor, Seleccione una Foto.",
//                especialidad: "Por favor, Digite una Especialidad",

                documento: {
                    required: "Por favor, digite su documento.",
                    min: "Documento valido.",
                    minlength: "Documento valido.",
                    maxlength: "Documento valido."
                },
                correo: {
                    required: "Por favor,digite un correo.",
                    minlength: "Número minimo de caracteres 1.",
                    maxlength: "Número maximo de caracteres 100."
                },
                nombres: {
                    required: "Por favor, digite un nombre.",
                    minlength: "Número minimo de caracteres 1.",
                    maxlength: "Número maximo de caracteres 60."
                },
                apellidos: {
                    required: "Por favor, digite un Apellido.",
                    minlength: "Número minimo de caracteres 1.",
                    maxlength: "Número maximo de caracteres 60."
                },
                telefono: {
                    required: "Por favor, digite un número de teléfono.",
                    min: "No valido.",
                    minlength: "Su teléfono debe tener almenos 10 caracteres.",
                    maxlength: "No valido."
                },
                direccion: {
                    required: "Por favor, digite su dirección.",
                    minlength: "Número minimo de caracteres 1.",
                    maxlength: "Número maximo de caracteres 120."
                },
                ciudad: {
                    required: "Por favor, digite la ciudad.",
                    minlength: "Numero minimo de caracteres 1.",
                    maxlength: "Numero maximo de caracteres 45."
                },
                contrasena: {
                    required: "Por favor, Digite una contraseña.",
                    minlength: "Su contraseña debe tener al menos 5 caracteres."
                },
                confirmar_contrasena: {
                    required: "Por favor, Digite la misma contraseña.",
                    minlength: "Su contraseña debe tener al menos 5 caracteres.",
                    equalTo: "Ingrese la misma contraseña que la anterior."
                },
            }

        });

    });
</script>

<!-- end: Javascript -->
</body>
</html>
