<%@page import="org.hibernate.Session"%>
<%@page import="models.HibernateUtil"%>
<%@page import="models.Citas"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Medicamentos"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
   <% Session sesion = HibernateUtil.getSessionFactory().openSession();
        String id = (String) session.getAttribute("delaz").toString();
        Citas cita = (Citas) sesion.get(Citas.class, Integer.parseInt(id));        
    %>
    
    <h3 class="animated fadeInLeft">Detalles Cita Mascota: <span style="color: red"><%= cita.getMascota().getNombre() %></span></h3>
                <p class="animated fadeInDown" style="color: #0F9E5E">
                    Propietario <span class="fa-angle-right fa"></span> <%= cita.getMascota().getPropietario().getNombres() %> &nbsp;&nbsp;
                    Estado Cita: <span class="fa-angle-right fa"></span> <%= cita.getEstado() %>
                </p>
                        <div class="btn-group" role="group">
                            <button type="button" class="btn  dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                              <span class="fa fa-pencil-square-o"></span> Mas Opciones
                              <span class="fa fa-angle-down"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <% String idhospi = (String) session.getAttribute("idhospi").toString(); 
                if(idhospi.equals("nohave")){ 
                if(cita.getEstado().equals("Programada")) { %>
                              <li><a href="HospitalizacionController?action=create&idcita=<%= id %>">Crear Hospitalizacion</a></li>                              
                              <li><a style="color: #20b426;" onClick="confirmar()">Marcar como cita atendita</a></li>
                              <% }else{ %><li><a href="">Cita Sin Hospitalizacion</a></li><% } %>
                              
                              <% } else { %>
                              <li><a href="Hospitalizar.jsp">Mostrar Hospitalizacion</a></li>
                              <% if(cita.getEstado().equals("Programada")){ %>
                              <li><a style="color: #20b426;" onClick="confirmar()">Marcar como cita atendita</a></li> <% } %>
                              
                              
                              <% } %>
                            </ul>
                          </div>
                            <br><br><div style=" color: white;">                          
                            <button class="btn ripple btn-3d btn-primary" style="width: 8%;" onclick="location.href = 'CitasController?action=admin&param=1'">
                                <div>
                                    <span class="icon-action-undo"></span>  Volver
                                </div>
                            </button>   
                        </div>
                            
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
                    <!--if para validar si la cita esta programa-->
                    <% if(cita.getEstado().equals("Programada")) {%>
                    <div id="showpro" style="display: none">
                        <ul  class="timeline" style="width: 200%; padding-top: 0px;">
                            <li>
                                <div class=" info" style="padding-left: 47%; ">
                                    <div class="timeline-badge"> 
                                        <!--Boton para aditar proposito-->
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
                                        <!--<p id="resultpro">Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis porris, paradis. Paisis, filhis, espiritis santis. Mé faiz elementum girarzis, nisi eros vermeio, in elementis mé pra quem é amistosis quis leo. Manduma pindureta quium dia nois paga. Sapien in monti palavris qui num significa nadis i pareci latim. Interessantiss quisso pudia ce receita de bolis, mais bolis eu num gostis.</p>-->
                                        <p id="resultpro"></p>
                                        <hr>                            
                                    </div>
                                </div>
                            </li>
                        </ul>                        
                    </div>
                    <div class="form-group form-animate-text" id="tareapro" style="margin-top:40px !important; ">                                                              
                        <textarea name="textpro" id="textpro" style="display: none" ></textarea>
                        <textarea  id="loc1" style="display: none" placeholder="loco1"></textarea>
                        <textarea name="proposito" id="proposito" style="resize: none; width: 100%;" required="required" rows="4" placeholder="Proposito de la cita"><%= cita.getProposito() %></textarea>                        
                        <span class="bar"></span>
                        <label></label>
                        <div class="col-md-12">
                            <button class="btn btn-round btn-primary" type="submit" onclick="Proposito(1)">Actualizar</button>
                            <!--<button class="btn btn-round btn-danger" type="reset" id="btnclpro" onclick="Proposito(5)">Cancelar</button>-->
                        </div>
                    </div>
                        <!--esle para validar si la cita esta atendida-->
                        <% }else{ %>
                        <div>
                        <ul  class="timeline" style="width: 200%; padding-top: 0px;">
                            <li>
                                <div class=" info" style="padding-left: 47%; ">
                                    <div class="timeline-badge"> 
                                        <!--Boton para aditar proposito-->
                                        
                                    </div>
                                </div>
                                <div class="timeline-panel">
                                    <div class="timeline-heading">
                                        <h4 class="timeline-title">Datos cita (Proposito)</h4>
                                    </div>
                                    <div class="timeline-body">
                                        <!--<p id="resultpro">Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis porris, paradis. Paisis, filhis, espiritis santis. Mé faiz elementum girarzis, nisi eros vermeio, in elementis mé pra quem é amistosis quis leo. Manduma pindureta quium dia nois paga. Sapien in monti palavris qui num significa nadis i pareci latim. Interessantiss quisso pudia ce receita de bolis, mais bolis eu num gostis.</p>-->
                                        <p><%= cita.getProposito() %></p>
                                        <hr>                            
                                    </div>
                                </div>
                            </li>
                        </ul>                        
                    </div>
                        <% } %>
                        
                </div>
                <!--fin proposito-->

                <!--Div Observaciones-->
                <br><br><div class="panel panel-success">
                    <div class="panel-heading">
                        <h4 class="panel-title">Observaciones</h4>
                    </div>
                    <% if(cita.getEstado().equals("Programada")) {%>
                    <div style="display: none" id="showobv">
                        <ul  class="timeline" style="width: 200%; padding-top: 0px;">
                            <li>
                                <div class=" info" style="padding-left: 47%; ">
                                    <div class="timeline-badge">
                                        <!--Boton para editar observaciones-->
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
                                        <!--<p>Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis porris, paradis. Paisis, filhis, espiritis santis. Mé faiz elementum girarzis, nisi eros vermeio, in elementis mé pra quem é amistosis quis leo. Manduma pindureta quium dia nois paga. Sapien in monti palavris qui num significa nadis i pareci latim. Interessantiss quisso pudia ce receita de bolis, mais bolis eu num gostis.</p>-->
                                        <hr>                            
                                    </div>
                                </div>
                            </li>
                        </ul>                        
                    </div>
                    <div class="form-group form-animate-text" id="tareaobv" style="margin-top:40px !important;">                                            
                       <textarea name="textobv" id="textobv" style="display: none" ></textarea>
                       <textarea name="textobv" id="loc2" style="display: none"  placeholder="loco 2"></textarea>
                        <textarea  style="resize: none; width: 100%;" id="observaciones" required="required"  rows="4" placeholder="Observaciones de la cita"><%= cita.getObservaciones() %></textarea>
                        <span class="bar"></span>
                        <label></label>
                        <div class="col-md-12">
                            <button class=" btn btn-round btn-primary" type="submit" onclick="Proposito(3)">Actualizar</button>
                            <!--<button class=" btn btn-round btn-danger" type="reset" onclick="Proposito(6)">Cancelar</button>-->
                        </div>
                    </div>
                     <% }else{ %>
                     <div>
                        <ul  class="timeline" style="width: 200%; padding-top: 0px;">
                            <li>
                                <div class=" info" style="padding-left: 47%; ">
                                    <div class="timeline-badge">
                                        <!--Boton para editar observaciones-->                                       
                                    </div>
                                </div>
                                <div class="timeline-panel">
                                    <div class="timeline-heading">
                                        <h4 class="timeline-title">Datos cita(Observaciones)</h4>
                                    </div>
                                    <div class="timeline-body">                                        
                                        <p><%= cita.getObservaciones() %></p>
                                        <!--<p>Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis porris, paradis. Paisis, filhis, espiritis santis. Mé faiz elementum girarzis, nisi eros vermeio, in elementis mé pra quem é amistosis quis leo. Manduma pindureta quium dia nois paga. Sapien in monti palavris qui num significa nadis i pareci latim. Interessantiss quisso pudia ce receita de bolis, mais bolis eu num gostis.</p>-->
                                        <hr>                            
                                    </div>
                                </div>
                            </li>
                        </ul>                        
                    </div>
                     <% } %>
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
                <% if(cita.getEstado().equals("Programada")) {%>
                <button class="submit btn btn-primary" type="submit" id="btnagrmedi" onclick="Showformedi()" value="Guardar" >Agregar<span class="icons icon-plus"></span></button> &nbsp
                <% } %>
            </div>
            <div class="panel-body">
                <div class="col-md-12" id="frmmedi" style="display: none">
        <div class="col-md-12 panel">
            <div class="col-md-12 panel-heading">
                <h4>Ingrese los datos</h4>
            </div>
            <div class="col-md-12 panel-body" style="padding-bottom:30px;">
                <div class="col-md-12">
                    <!--<form class="cmxform" id="signupForm" method="POST" action="ClientesController?action=create">-->
                        <div class="col-md-6">
                            <input type="text" style="display: none" id="idmedi">
                            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                                <input type="text" maxlength="30" class="form-text" id="nombre" name="nombre" required>
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
                            <input class="submit btn btn-primary" type="submit" id="btnmedi" onclick="Medicamentos()" value="Guardar" > &nbsp
                            <input class="submit btn btn-primary" type="submit" id="btnmediedi" onclick="Medicamentosedi(2)" value="Editar" > &nbsp
                            <input class="submit btn btn-danger" type="button" value="Cancelar" onclick="Showformedi()">
                        </div>
                    <!--</form>-->

                </div>
            </div>
        </div>
    </div>                
</div>

            <!-- Table -->
            <table class="table">
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Laboratorio</th>
                        <th>Lote</th>
                        <th>Fecha de Aplicacion</th>
                        <% if(cita.getEstado().equals("Programada")) {%>
                        <th>Acciones</th>
                        <% } %>
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
     $(document).ready(function () {
    $.ajax({
            type: 'POST',
            data: {idcita: $('#idcita').val()},
            url: 'MedicamentosController?action=admin',
            success: function (result) {                
                $('#lsmedi').html(result);
            }
        });
        $("#btnclpro").hide();
    });
    function Proposito(int) {
        if(int === 1){
            document.getElementById('loc2').value = document.getElementById('observaciones').value;
            document.getElementById('observaciones').value = "";
        }else if(int === 3){
            document.getElementById('loc1').value = document.getElementById('proposito').value;
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
//                    Update en Citas proposito
                    $("#showpro").toggle("slow");
                    $("#tareapro").hide();
                    document.getElementById('textpro').value = result;
                    $('#resultpro').html(result);
                    if(document.getElementById('textpro').value === ""){
                        $("#datospro").show();
                    }else{
                        $("#datospro").hide();
                    }
                    document.getElementById('observaciones').value = document.getElementById('loc2').value;
                } else if (int === 2) {
//                    Muestra texttarea para editar
                    $("#showpro").hide();//           
                    $("#tareapro").toggle("slow");
                    var edit = document.getElementById('textpro').value;
                    document.getElementById('proposito').value = edit;
                    $('#resultpro').html(result);
                } else if (int === 3) {
//                    Update en observaciones
                    $("#showobv").toggle("slow");
                    $("#tareaobv").hide();
                    document.getElementById('textobv').value = result;
                    $('#resultobv').html(result);
                    if(document.getElementById('textobv').value === ""){
                        $("#datosobv").show();
                    }else{
                        $("#datosobv").hide();
                    }
                    document.getElementById('proposito').value = document.getElementById('loc1').value;
                } else if (int === 4) {
//                    Muestra textarea para editar observaciones
                    $("#showobv").hide();//           
                    $("#tareaobv").toggle("slow");
                    var edit = document.getElementById('textobv').value;
                    document.getElementById('observaciones').value = edit;
                }else if(int === 5){
//                    Boton cancelar Propostio
                    $("#showpro").toggle("slow");
                    $("#tareapro").hide();
                }else if(int === 6){
//                    Boton cancelar Observaciones
                    $("#showobv").toggle("slow");
                    $("#tareaobv").hide();
                }

            }
        });
            }
        } 
    }
    
    function Medicamentos(){
        var nombre = $('#nombre').val();
        var labo = $('#laboratorio').val();
        var lote = $('#lote').val();
//        Validar el formulario de medicamentos
        if(nombre === "" || labo === "" || lote === ""){
        alert("Por favor verifique que todos los campos esten completos");                         
        }else{    
//            Insertar y ocluta el formulario
           $.ajax({
            type: 'POST',
            data: {idcita: $('#idcita').val(), nombre: $('#nombre').val(), laboratorio: $('#laboratorio').val(), lote:$('#lote').val()},
            url: 'MedicamentosController?action=create',
            success: function (result) {       
                $('#lsmedi').html(result);
             document.getElementById('idmedi').value = "";
             document.getElementById('nombre').value = "";
             document.getElementById('laboratorio').value = "";
             document.getElementById('lote').value = "";
             $("#frmmedi").slideUp();
            }
        });            
        }            
      
           
    }
    function Medicamentosedi(opc,id,nombre,labo,lote){    
//        Opcion para cargar los input con los datos
        if(opc === 1){
             document.getElementById('idmedi').value = id;
             document.getElementById('nombre').value = nombre;
             document.getElementById('laboratorio').value = labo;
             document.getElementById('lote').value = lote;
             $("#frmmedi").toggle("slow");
             $("#btnmedi").hide();
             $("#btnmediedi").show();
//             Opción para envar a editar
        }else if(opc === 2){
        var nombre = $('#nombre').val();
        var labo = $('#laboratorio').val();
        var lote = $('#lote').val();
//        Validar el formulario de medicamentos
        if(nombre === "" || labo === "" || lote === ""){
        alert("Por favor verifique que todos los campos esten completos");                         
        }else{    
            $.ajax({
            type: 'POST',
            data: {idmedi: $('#idmedi').val(), nombre: $('#nombre').val(), laboratorio: $('#laboratorio').val(), lote:$('#lote').val(), idcita:$('#idcita').val()},
            url: 'MedicamentosController?action=update',
            success: function (result) {       
                $('#lsmedi').html(result);
             document.getElementById('idmedi').value = "";
             document.getElementById('nombre').value = "";
             document.getElementById('laboratorio').value = "";
             document.getElementById('lote').value = "";
             $("#frmmedi").slideUp();
            }
        });
        }
            
        }
        
          
    }
    function Showformedi(){
        $("#frmmedi").toggle("slow");
        $("#btnmediedi").hide();
        $("#btnmedi").show();
        document.getElementById('idmedi').value = "";
        document.getElementById('nombre').value = "";
        document.getElementById('laboratorio').value = "";
        document.getElementById('lote').value = "";
    }
    function Eliminarmedi(id){
        $.ajax({
            type: 'POST',
            data: {idmedi: id, idcita:$('#idcita').val()},
            url: 'MedicamentosController?action=eliminar',
            success: function (result) {                       
                $('#lsmedi').html(result);
                $('#lsmedi').slideDown()
            }
        });
    }

    function confirmar(){
				//un confirm
				alertify.confirm("<p>¡Atencion!.<br><br>Una vez marque la cita como<b> Atendida</b> No prodra modificar sus datos; ni aun en la <b>Hospitalizacion</b></p>", function (e) {
					if (e) {
                                            var idcita = document.getElementById('idcita').value;
                                            alert("Id de la cita: "+idcita);
                                            location.href ="CitasController?action=update&idcita2="+idcita+"&pro=false&Estado=Atendida";
//						alertify.success("Has pulsado '" + alertify.labels.ok + "'");
					} else { 
//                                            alertify.error("Has pulsado '" + alertify.labels.cancel + "'");
					}
				}); 
				return false
			}
</script>
<!-- end: Javascript -->
<% sesion.close(); %>
</body>
</html>