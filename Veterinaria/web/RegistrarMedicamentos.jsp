<%
    String user = (String) session.getAttribute("perfil");
    if (user==null || user.equals("Auxiliar")) {
        response.sendRedirect("LoginPersona.jsp?error=permisos");//Se pierde la información       
        return;
    }    
%>
<jsp:include page="encabezado.jsp" />
<jsp:include page="menu.jsp" />
<!-- start: content -->
<div id="content">
    <div class="panel box-shadow-none content-header">
        <div class="panel-body">
            <div class="col-md-12">
                <h3 class="animated fadeInLeft">Registrar Medicamento</h3>
                <p class="animated fadeInDown">
                    <!--Form <span class="fa-angle-right fa"></span> Form Element-->
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
                    <form class="cmxform" id="signupForm" method="POST" action="MedicamentosController?action=create">
                        <div class="col-md-6">
                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                <input type="text" class="form-text" id="nombre" name="nombre" required>
                                <span class="bar"></span>
                                <label>Nombre</label>
                            </div>

                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                <input type="text" class="form-text" id="laboratorio" onkeyup="return runScript(this.value)" name="laboratorio" required>
                                <span class="bar"></span>
                                <label>Laboratorio</label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                <input type="text"   class="form-text" id="lote" name="lote" required>
                                <span class="bar"></span>
                                <label>Lote</label>
                            </div>

                          
                        </div>  


                        <div class="col-md-12">
                            <input class="submit btn btn-primary" type="submit" value="Guardar" > &nbsp
                            <% String idcita = request.getSession().getAttribute("idcita").toString(); %>
                            <input class="submit btn btn-danger" type="button" value="Cancelar" onclick="location.href = 'MedicamentosController?action=admin&idcita=<%= idcita%>'">
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>

</div>
<!-- end: content -->
<script>
//    function runScript(e) {
//        var nit;
//        try {
//            nit = parseInt(e);
//
//        } catch (e) {
//            nit = 0;
//        }
//        document.getElementById("nit").value = nit;
//    }
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
                nombre: {
                    required: true,
                    minlength: 2,
                    maxlength: 40
                },
                laboratorio: {
                    required: true,
                    minlength: 2,
                    maxlength: 45
                },
                lote: {
                    required: true,
                    minlength: 2,
                    maxlength: 45
                },
                validate_agree: "required"
            },
            messages: {
                razonsocial: "Por favor, introduzca Razon social",
                ciudad: "Por favor, introduzca la ciudad",
                direccion: "por favor, introduzca su direccion",
                nombre: {
                    required: "Nombre invalido",
                    minlength: "Por favor, digite al menos 2 caracteres.",
                    maxlength: "Por favor, ingrese no más de 40 caracteres."
                },
                laboratorio: {
                     required: "Nombre invalido",
                    minlength: "Por favor, digite al menos 2 caracteres.",
                    maxlength: "Por favor, ingrese no más de 45 caracteres."
                },
                lote: {
                    required: "Nombre invalido",
                    minlength: "Por favor, digite al menos 2 caracteres.",
                    maxlength: "Por favor, ingrese no más de 45 caracteres."
                }
               
            }

        });


    });
</script>
<script>

    $(document).ready(function () {
        $(".select2-A").select2({
            placeholder: "Select a state",
            allowClear: true
        });
    });

</script>
<!-- end: Javascript -->
</body>
</html>