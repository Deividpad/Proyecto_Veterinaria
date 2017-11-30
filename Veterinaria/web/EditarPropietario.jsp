<%
    String user = (String) session.getAttribute("perfil");
    if (user==null || user.equals("Veterinario")) {
        response.sendRedirect("LoginPersona.jsp?error=permisos");//Se pierde la información       
        return;
    }    
%>

<%@page import="models.Propietario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>


    <body>
        <jsp:include page="encabezado.jsp" />
        <jsp:include page="menu.jsp" />
        <div id="content">
            <div class="panel box-shadow-none content-header">
                <div class="panel-body">
                    <div class="col-md-12">
                        <h3 class="animated fadeInLeft">Registrar Cliente</h3>
                       
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
                            <% Propietario sActualizar = (Propietario) request.getAttribute("prop");%>
                            <h2> Actualizar propietario - <%= sActualizar.getNombres()%></h2>
                            <form class="cmxform" id="signupForm" method="POST" action="PropietarioController?action=update&id=<%=sActualizar.getIdPropietario()%>">
                                <div class="col-md-6">

                                    <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                        <input type="number" class="form-text" id="documento" value="<%=sActualizar.getDocumento()%>"onkeyup="return runScript(this.value)" name="documento" required>
                                        <span class="bar"></span>
                                        <label>Documento</label>
                                    </div>
                                    <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                        <input type="text" class="form-text" id="nombres" value="<%=sActualizar.getNombres()%>" name="nombres" required>
                                        <span class="bar"></span>
                                        <label>Nombres</label>
                                    </div>
                                    <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                        <input type="text" class="form-text" id="apellidos" value="<%=sActualizar.getApellidos()%>" name="apellidos" required>
                                        <span class="bar"></span>
                                        <label>Apellidos</label>
                                    </div>
                                    <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                        <select class="form-text" name="genero" id="genero">
                                            <option <% if (sActualizar.getGenero().equals("Femenino")){ out.print("selected");}%> value="Femenino">Femenino</option>
                                            <option <% if (sActualizar.getGenero().equals("Masculino")){ out.print("selected");}%> value="Masculino">Masculino</option>
                                        </select>
                                        <span class="bar"></span>
                                        <label>Genero</label>
                                    </div>
                                    <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                        <input type="text" class="form-text"  id="telefono" value="<%=sActualizar.getTelefono()%>" name="telefono" required>
                                        <span class="bar"></span>
                                        <label>Telefono</label>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                        <input type="text" class="form-text" id="correo" value="<%=sActualizar.getCorreo()%>" name="correo" required>
                                        <span class="bar"></span>
                                        <label>Correo</label>
                                    </div>

                                    <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                        <input type="text" class="form-text" id="direccion" value="<%=sActualizar.getDireccion()%>" name="direccion" required>
                                        <span class="bar"></span>
                                        <label>Direccion</label>
                                    </div>

                                    <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                        <input type="text" class="form-text" id="ciudad"  value="<%=sActualizar.getCiudad()%>" name="ciudad" required>
                                        <span class="bar"></span>
                                        <label>Ciudad</label>
                                    </div>
                                    

                                    <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                        
                                        <select class="form-text" name="estado" id="estado">
                                            <option <% if ( sActualizar.getEstado().equals("Activo")){ out.print("selected");}%> value="Activo">Activo</option>
                                            <option <% if ( sActualizar.getEstado().equals("Inactivo")){ out.print("selected");}%> value="Inactivo">Inactivo</option>
                                        </select>
                                         <span class="bar"></span>
                                        <label>Estado</label>
                                    </div>

                                </div>

                                <div class="col-md-12">
                                    <button class="submit btn btn-primary" type="submit">Actualizar</button>
                                    <button class="submit btn btn-danger" type="reset" onclick="javascript:history.go(-1)">Cancelar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>


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
                      
                        documento: {
                            required: true,
                            min: 1,
                            minlength: 10,
                            maxlength: 10,
                        },
                        nombres: {
                            required: true,
                            maxlength: 60,
                        },
                         apellidos: {
                            required: true,
                            maxlength: 60,
                        },
                        telefono: {
                            required: true,
                            min: 1,
                            minlength: 10,
                            maxlength: 10,
                        },
                         correo: {
                            required: true,
                            maxlength: 45,
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
                            minlength: 5,
                        },
                        confirmar_contrasena: {
                            required: true,
                            minlength: 5,
                            equalTo: "#contrasena",
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
                        genero: "Por favor, seleccione su genero.",
                        estado: "Por favor, seleccione un estado.",
                        
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
                        documento: {
                            required: "Por favor, digite su documento.",
                            min: "Documento valido.",
                            minlength: "Documento valido.",
                            maxlength: "Documento valido."
                        },
                         correo: {
                            required:  "Por favor,digite un correo.",
                            minlength: "Número minimo de caracteres 1.",
                            maxlength: "Número maximo de caracteres 45."
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
                        telefono: {
                            required: "Por favor, digite un numero de teléfono.",
                            min: "No valido.",
                            minlength: "Su teléfono debe tener almenos 10 caracteres.",
                            maxlength: "No valido."
                        },
                        contrasena: {
                            required: "Proporcione una contraseña.",
                            minlength: "Su contraseña debe tener al menos 5 caracteres."
                        },
                        confirmar_contrasena: {
                            required: "Proporcione una contraseña.",
                            minlength: "Su contraseña debe tener al menos 5 caracteres.",
                            equalTo: "Ingrese la misma contraseña que la anterior."
                        },
                    }

                });


            });
        </script>
    </body>
</html>
