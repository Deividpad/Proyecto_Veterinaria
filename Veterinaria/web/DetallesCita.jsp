<%@page import="org.hibernate.Session"%>
<%@page import="models.HibernateUtil"%>
<%@page import="models.Citas"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Medicamentos"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="encabezado.jsp" />
<jsp:include page="menu.jsp" />
<!-- start: content -->
<div id="content">
    <div class="panel box-shadow-none content-header">
        <div class="panel-body">
            <div class="col-md-12">
                <h3 class="animated fadeInLeft">Detalles Cita </h3>
                <p class="animated fadeInDown">
                    Form <span class="fa-angle-right fa"></span> Form Element
                </p>
            </div>
        </div>
    </div>
    <% Session sesion = HibernateUtil.getSessionFactory().openSession();
        String id = (String) session.getAttribute("delaz").toString();
        Citas cita = (Citas) sesion.get(Citas.class, Integer.parseInt(id));
        sesion.close();
    %>
    <div class="col-md-5">
        <div class="panel">
            <div class="panel-body">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4 class="panel-title">Proposito</h4>
                    </div>                    

                    <div style="display: none" id="showpro">
                        <ul  class="timeline" style="width: 200%; padding-top: 0px;">
                            <li>
                                <div class=" info" style="padding-left: 47%; ">
                                    <div class="timeline-badge">                                
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-circle btn-gradient btn-primary" data-toggle="dropdown">
                                                <i class="glyphicon glyphicon-floppy-disk"></i> <span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu" role="menu">
                                                <li onclick="Propositio(2);"><a href="#">Action</a></li>
                                                <li><a href="#">Another action</a></li>
                                                <li><a href="#">Something else here</a></li>
                                                <li class="divider"></li>
                                                <li><a href="#">Separated link</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="timeline-panel">
                                    <div class="timeline-heading">
                                        <h4 class="timeline-title">Mussum ipsum cacilds</h4>
                                    </div>
                                    <div class="timeline-body">
                                        <p>Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis porris, paradis. Paisis, filhis, espiritis santis. Mé faiz elementum girarzis, nisi eros vermeio, in elementis mé pra quem é amistosis quis leo. Manduma pindureta quium dia nois paga. Sapien in monti palavris qui num significa nadis i pareci latim. Interessantiss quisso pudia ce receita de bolis, mais bolis eu num gostis.</p>
                                        <hr>                            
                                    </div>
                                </div>
                            </li>
                        </ul>                        
                    </div>
                    <div class="form-group form-animate-text" id="tareapro" style="margin-top:40px !important;">                                            
                        <textarea name="observaciones" id="observaciones" rows="10" cols="60" placeholder="Observaciones de la cita"></textarea>
                        <span class="bar"></span>
                        <label></label>
                        <div class="col-md-12">
                            <button class="submit btn btn-primary" type="submit" onclick="Propositio(1)">Actualizar</button>
                            <button class="submit btn btn-danger" type="reset" onclick="javascript:history.go(-1)">Cancelar</button>
                        </div>
                    </div>
                </div>

                <div class="panel panel-success">
                    <div class="panel-heading">
                        <h4 class="panel-title">Observaciones</h4>
                    </div>
                    <div class="panel-body" >
                        <div class="form-group form-animate-text" style="margin-top:40px !important;">                                            
                            <textarea name="observaciones" id="observaciones" rows="10" cols="60" placeholder="Observaciones de la cita"></textarea>
                            <span class="bar"></span>
                            <label></label>
                        </div>
                        <%--<%= cita.getObservaciones() %>--%>
                        <!--Some default Some default panel content here. Nulla vitae elit libero, a pharetra augue here. Nulla vitae elit libero, a pharetra augue. Aenean lacinia bibendum nulla sed consectetur.-->
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-7">
        <div class="panel panel-default">
            <!-- Default Some default Some default panel content here. Nulla vitae elit libero, a pharetra augue here. Nulla vitae elit libero, a pharetra augue. Aenean lacinia bibendum nulla sed consectetur.s -->
            <div class="panel-heading">
                <h4>Medicamentos</h4>
            </div>
            <div class="panel-body">
                <p>Some default Some default Some default panel content here. Nulla vitae elit libero, a pharetra augue here. Nulla vitae elit libero, a pharetra augue. Aenean lacinia bibendum nulla sed consectetur. here. Nulla vitae elit libero, a pharetra augue. Aenean lacinia bibendum nulla sed consectetur. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
            </div>

            <!-- Table -->
            <table class="table">
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Laboratorio</th>
                        <th>Lote</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>   
                    <% ArrayList medicamentos = (ArrayList) session.getAttribute("ArrayMedicamentos");
                        for (Object med : medicamentos) {
                            Medicamentos medi = (Medicamentos) med;%>
                    <tr style="color: red;">
                        <td><%= medi.getNombre()%></td>
                        <td><%= medi.getLaboratorio()%></td>
                        <td><%= medi.getLote()%></td>
                        <td>
                            <button class=" btn btn-circle btn-mn btn-primary" type="button" onclick="location.href = 'MedicamentosController?action=update&idmedi=${medi.idMedicamento}'">
                                <span class="fa fa-edit"></span>
                            </button>
                            <button class=" btn btn-circle btn-mn btn-danger" onclick="location.href = 'MedicamentosController?action=eliminar&idmedi=${medi.idMedicamento}'">
                                <span class="fa fa-trash"></span>
                            </button> 
                        </td>
                    </tr>                                  
                    <% }%> 


                </tbody>
            </table>                    
        </div>


    </div>
</div>  

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

    function Propositio(int) {        
//        alert("seguro "+int);
        if (int === 1) {
            $("#showpro").show();
            $("#tareapro").hide();
        }else{
            $("#showpro").hide();
            $("#tareapro").show();
        }

    }

</script>
<!-- end: Javascript -->
</body>
</html>