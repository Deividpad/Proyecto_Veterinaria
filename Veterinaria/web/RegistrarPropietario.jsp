<%-- 
    Document   : RegistrarPropietario
    Created on : 19-nov-2017, 20:31:18
    Author     : juli-
--%>
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
                            <form class="cmxform" id="signupForm" method="POST" action="PropietarioController?action=create">
                                <div class="col-md-6">

                                    <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                        <input type="number"  class="form-text" id="documento" onkeyup="return runScript(this.value)" name="documento" required>
                                        <span class="bar"></span>
                                        <label>Documento</label>
                                    </div>
                                    <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                        <input type="text" class="form-text" id="nombres" name="nombres" required>
                                        <span class="bar"></span>
                                        <label>Nombres</label>
                                    </div>
                                    <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                        <input type="text" class="form-text" id="apellidos" name="apellidos" required>
                                        <span class="bar"></span>
                                        <label>Apellidos</label>
                                    </div><br>
                                    <div class="col-sm-12 padding-0">
                                        <label class="control-label col-lg-4">Genero</label>
                                        <select class="form-control" name="genero">
                                            <option value="Femenino">femenino</option>
                                            <option value="Masculino">Masculino</option>
                                        </select>
                                    </div>
                                    <br>
                                    <br>
                                    <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                        <input type="number" class="form-text"  id="telefono" name="telefono" required>
                                        <span class="bar"></span>
                                        <label>Telefono</label>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                        <input type="email" class="form-text" id="correo" name="correo" required>
                                        <span class="bar"></span>
                                        <label>Correo</label>
                                    </div>

                                    <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                        <input type="text" class="form-text" id="direccion" name="direccion" required>
                                        <span class="bar"></span>
                                        <label>Direccion</label>
                                    </div>

                                    <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                        <input type="text" class="form-text" id="ciudad" name="ciudad" required>
                                        <span class="bar"></span>
                                        <label>Ciudad</label>
                                    </div>
                                    <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                        <input type="password" class="form-text" id="contrasena" name="contrasena" required>
                                        <span class="bar"></span>
                                        <label>Contraseña</label>
                                    </div><br>



                                    <div class="col-sm-12 padding-0">
                                        <label class="control-label col-lg-4">Estados</label>
                                        <select class="form-control" name="estado">
                                            <option value="Activo">Activo</option>
                                            <option value="Inactivo">Inactivo</option>
                                        </select>
                                    </div>

                                </div>

                                <div class="col-md-12">
                                    <button class="submit btn btn-primary" type="submit">Registrar</button>
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
                        nombres: "required",
                        ciudad: "required",
                        direccion: "required",
                        apellidos:"required",
                        correo:"required",
                        
                        
                        documento: {
                            required: true,
                            min: 1,
                            minlength: 10,
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
                        nombres: "Por favor, Digite un  Nombre.",
                        apellidos: "Por favor, Digite un Apellido.",
                        ciudad: "Por favor, Digite la ciudad.",
                        direccion: "Por favor, Digite su direccion.",
                        correo: "Por favor,Digite un correo valido.",
                        documento: {
                            required: "Por favor,Digite su Documento",
                            min: "Documento valido",
                            minlength: "Documento valido",
                            maxlength: "Documento valido"
                        },
                        telefono: {
                            required: "Por favor,Digite un numero de telefono",
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
    </body>
</html>
