
<jsp:include page="encabezado.jsp" />
<jsp:include page="menu.jsp" />
<!-- start: content -->
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
            <% String idcita = request.getSession().getAttribute("idcita").toString(); %>
            <div class="col-md-12 panel-body" style="padding-bottom:30px;">
                <div class="col-md-12">
                    <form class="cmxform" id="signupForm" method="POST" action="CitasController?action=update=<%= idcita %>">
                        <div class="col-md-6">
                            <div class="form-group form-animate-text" style="margin-top:40px !important;">                                            
                                <textarea name="proposito" id="proposito" rows="10" cols="60" placeholder="Proposito de la cita"></textarea>
                                <span class="bar"></span>
                                <label></label>
                            </div>
                            
                        </div>

                        <div class="col-md-6">
                            <div class="form-group form-animate-text" style="margin-top:40px !important;">                                            
                                <textarea name="observaciones" id="observaciones" rows="10" cols="60" placeholder="Observaciones de la cita"></textarea>
                                <span class="bar"></span>
                                <label></label>
                            </div>
                        </div>  


                        <div class="col-md-12">
                            <input class="submit btn btn-primary" type="submit" value="Guardar" > &nbsp                            
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
                    required: "Proporcione una contrase�a",
                    minlength: "Su contrase�a debe tener al menos 5 caracteres"
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