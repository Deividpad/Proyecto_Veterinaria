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
   <% Session sesion = HibernateUtil.getSessionFactory().openSession();
        String id = (String) session.getAttribute("delaz").toString();
        Citas cita = (Citas) sesion.get(Citas.class, Integer.parseInt(id));        
    %>
    <h3 class="animated fadeInLeft">Detalles Cita Mascota: <span style="color: red"><%= cita.getMascota().getNombre() %></span></h3><input type="button" value="Ultimo id" onclick="location.href = 'MedicamentosController?action=ultimo'">
                <p class="animated fadeInDown" style="color: #00BCD4">
                    Propietario <span class="fa-angle-right fa"></span> <%= cita.getMascota().getPropietario().getNombres() %>
                </p>
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="panel">
            <div class="panel-body">
                <!--div Proposito-->
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4 class="panel-title">Proposito</h4>
                    </div>                  
                    <input type="text" id="idcita" name="idcita" style="display: none"  value="<%= id%>">
                    <div id="showpro" style="display: none">
                        <ul  class="timeline" style="width: 200%; padding-top: 0px;">
                            <li>
                                <div class=" info" style="padding-left: 47%; ">
                                    <div class="timeline-badge">                                
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-circle btn-gradient btn-primary" data-toggle="dropdown">
                                                <i class="glyphicon glyphicon-floppy-disk"></i> <span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu" role="menu">
                                                <li onclick="Proposito(2);"><a href="#">Editar</a></li>                                                
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="timeline-panel">
                                    <div class="timeline-heading">
                                        <h4 class="timeline-title">Datos cita (Proposito)</h4><span style="color: red" id="datospro">Sin datos</span>
                                    </div>
                                    <div class="timeline-body">
                                        <!--<p id="resultpro">Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra l� , depois divoltis porris, paradis. Paisis, filhis, espiritis santis. M� faiz elementum girarzis, nisi eros vermeio, in elementis m� pra quem � amistosis quis leo. Manduma pindureta quium dia nois paga. Sapien in monti palavris qui num significa nadis i pareci latim. Interessantiss quisso pudia ce receita de bolis, mais bolis eu num gostis.</p>-->
                                        <p id="resultpro"></p>
                                        <hr>                            
                                    </div>
                                </div>
                            </li>
                        </ul>                        
                    </div>
                    <div class="form-group form-animate-text" id="tareapro" style="margin-top:40px !important; ">                                                              
                        <textarea name="textpro" id="textpro" style="display: none" ></textarea>
                        <textarea name="proposito" id="proposito" style="resize: none; width: 100%;" required="required" rows="4" placeholder="Proposito de la cita"></textarea>                        
                        <span class="bar"></span>
                        <label></label>
                        <div class="col-md-12">
                            <button class="btn btn-round btn-primary" type="submit" onclick="Proposito(1)">Actualizar</button>
                            <button class="btn btn-round btn-danger" type="reset" onclick="Proposito(5)">Cancelar</button>
                        </div>
                    </div>
                </div>
                <!--fin proposito-->

                <!--Div Observaciones-->
                <br><br><div class="panel panel-success">
                    <div class="panel-heading">
                        <h4 class="panel-title">Observaciones</h4>
                    </div>                                      
                    <div style="display: none" id="showobv">
                        <ul  class="timeline" style="width: 200%; padding-top: 0px;">
                            <li>
                                <div class=" info" style="padding-left: 47%; ">
                                    <div class="timeline-badge">                                
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-circle btn-gradient btn-primary" data-toggle="dropdown">
                                                <i class="glyphicon glyphicon-floppy-disk"></i> <span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu" role="menu">
                                                <li onclick="Proposito(4);"><a href="#">Editar</a></li>                                                
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="timeline-panel">
                                    <div class="timeline-heading">
                                        <h4 class="timeline-title">Datos cita(Observaciones)</h4><span style="color: red" id="datosobv">Sin datos</span>
                                    </div>
                                    <div class="timeline-body">                                        
                                        <p id="resultobv"></p>
                                        <!--<p>Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra l� , depois divoltis porris, paradis. Paisis, filhis, espiritis santis. M� faiz elementum girarzis, nisi eros vermeio, in elementis m� pra quem � amistosis quis leo. Manduma pindureta quium dia nois paga. Sapien in monti palavris qui num significa nadis i pareci latim. Interessantiss quisso pudia ce receita de bolis, mais bolis eu num gostis.</p>-->
                                        <hr>                            
                                    </div>
                                </div>
                            </li>
                        </ul>                        
                    </div>
                    <div class="form-group form-animate-text" id="tareaobv" style="margin-top:40px !important;">                                            
                       <textarea name="textobv" id="textobv" style="display: none" ></textarea>
                        <textarea name="observaciones" style="resize: none; width: 100%;" id="observaciones" required="required"  rows="4" placeholder="Observaciones de la cita"></textarea>
                        <span class="bar"></span>
                        <label></label>
                        <div class="col-md-12">
                            <button class=" btn btn-round btn-primary" type="submit" onclick="Proposito(3)">Actualizar</button>
                            <button class=" btn btn-round btn-danger" type="reset" onclick="Proposito(6)">Cancelar</button>
                        </div>
                    </div>
                </div>
                <!--Fin Observaciones-->

            </div>
        </div>
    </div>

    <div class="col-md-6">
        <div class="panel panel-default">
            <!-- Default Some default Some default panel content here. Nulla vitae elit libero, a pharetra augue here. Nulla vitae elit libero, a pharetra augue. Aenean lacinia bibendum nulla sed consectetur.s -->
            <div class="panel-heading">
                <h4>Medicamentos</h4>
            </div>
            <div class="panel-body">
                 <div class="col-md-12">
        <div class="col-md-12 panel">
            <div class="col-md-12 panel-heading">
                <h4>Ingrese los datos</h4>
            </div>
            <div class="col-md-12 panel-body" style="padding-bottom:30px;">
                <div class="col-md-12">
                    <!--<form class="cmxform" id="signupForm" method="POST" action="ClientesController?action=create">-->
                        <div class="col-md-6">
                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                <input type="text" class="form-text" id="nombre" name="nombre" required>
                                <span class="bar"></span>
                                <label>Nombre</label>
                            </div>

                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                <input type="text" class="form-text" id="laboratorio" name="laboratorio" required>
                                <span class="bar"></span>
                                <label>Laboratorio</label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                <input type="text" class="form-text" id="lote" name="lote" required>
                                <span class="bar"></span>
                                <label>Lote</label>
                            </div>
                        </div>                        
                        <div class="col-md-12">
                            <input class="submit btn btn-primary" type="submit" id="btnmedi" onclick="Medicamentos(id,$nombre='',$labo='',$lote='')" value="Guardar" > &nbsp
                            <input class="submit btn btn-danger" type="button" value="Cancelar" onclick="location.href = 'ClientesController?action=admin'">
                        </div>
                    <!--</form>-->

                </div>
            </div>
        </div>
    </div>
                <!--<p>Some default Some default Some default panel content here. Nulla vitae elit libero, a pharetra augue here. Nulla vitae elit libero, a pharetra augue. Aenean lacinia bibendum nulla sed consectetur. here. Nulla vitae elit libero, a pharetra augue. Aenean lacinia bibendum nulla sed consectetur. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>-->
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
                <tbody id="lsmedi">   
                   
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
<script>  

    function Proposito(int) {
        if(int === 1){
            document.getElementById('observaciones').value = "";
        }else if(int === 3){
            document.getElementById('proposito').value = "";
        }
        if(int === 1 && document.getElementById('proposito').value === ""){
            alert("Por favor digite el campo Proposito de la cita");
        }else{
            if(int === 3 &&  document.getElementById('observaciones').value === ""){
                alert("Por favor digite el campo Observaciones de la cita");
            }else{
            $.ajax({
            type: 'POST',
            data: {idcita: $('#idcita').val(), proposito: $('#proposito').val(), observaciones: $('#observaciones').val()},
            url: 'CitasController?action=update&pro=true',
            success: function (result) {                
                if (int === 1) {
//                    alert("1");
                    $("#showpro").toggle("slow");
                    $("#tareapro").hide();
                    document.getElementById('textpro').value = result;
                    $('#resultpro').html(result);
                    if(document.getElementById('textpro').value === ""){
                        $("#datospro").show();
                    }else{
                        $("#datospro").hide();
                    }
                } else if (int === 2) {
//                    alert("2");
                    $("#showpro").hide();//           
                    $("#tareapro").toggle("slow");
                    var edit = document.getElementById('textpro').value;
                    document.getElementById('proposito').value = edit;
                    $('#resultpro').html(result);
                } else if (int === 3) {
//                    alert("3");
                    $("#showobv").toggle("slow");
                    $("#tareaobv").hide();
                    document.getElementById('textobv').value = result;
                    $('#resultobv').html(result);
                    if(document.getElementById('textobv').value === ""){
                        $("#datosobv").show();
                    }else{
                        $("#datosobv").hide();
                    }
                } else if (int === 4) {
//                    alert("4");
                    $("#showobv").hide();//           
                    $("#tareaobv").toggle("slow");
                    var edit = document.getElementById('textobv').value;
                    document.getElementById('observaciones').value = edit;
                }else if(int === 5){
                    $("#showpro").toggle("slow");
                    $("#tareapro").hide();
                }else if(int === 6){
                    $("#showobv").toggle("slow");
                    $("#tareaobv").hide();
                }

            }
        });
            }
        } 
    }
    
    function Medicamentos(id,nombre,labo,lote){
        var action = "";
        if(nombre === "" && labo === "" && lote === ""){
             action = "create";
             $.ajax({
            type: 'POST',
            data: {idcita: $('#idcita').val(), nombre: $('#nombre').val(), laboratorio: $('#laboratorio').val(), lote:$('#lote').val()},
            url: 'MedicamentosController?action='+action,
            success: function (result) {       
                $('#lsmedi').html(result);
            }
        });
        }else{
             action = "update";
             alert("El id del medi: "+id);
             document.getElementById('nombre').value = nombre;
             document.getElementById('laboratorio').value = labo;
             document.getElementById('lote').value = lote;
        }            
//        alert("Este es el nombre "+nombre);
           
    }
    function Tre(nombre,labo,lote){
//        alert("Clicio servlet: "+nombre+" Y este es el laboratorio: "+labo+" Y este el el lote: "+lote);
    }

</script>
<!-- end: Javascript -->
<% sesion.close(); %>
</body>
</html>