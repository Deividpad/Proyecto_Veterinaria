<%
    String user = (String) session.getAttribute("perfil");
    if (user==null || user.equals("Auxiliar")) {
        response.sendRedirect("LoginPersona.jsp?error=permisos");//Se pierde la información       
        return;
    }    
%>

<%@page import="java.util.ArrayList"%>
<%@page import="models.Citas"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="encabezado.jsp" />
<jsp:include page="menu.jsp" />
<!-- start: content -->
<div id="content">
    <div class="panel box-shadow-none content-header">
        <div class="panel-body">
            <div class="col-md-12">
                <h3 class="animated fadeInLeft">Crear Cita</h3>
            </div>         
            
        </div>
    </div> 
    
     
    <!-- Modal 1-->
    <div class="modal fade" id="mimodalejemplo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">        
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="col-md-10">
                    <div class="col-md-12 panel">
                        <div class="col-md-12 panel-heading">
                            <input type="text" id="at" name="at" style="display: none;"><h4><input id="title" style="border: none; background-color: #fbf7f7" disabled="" type="text"></h4><span style="color:red;" id="result1"></span>                            
                            <input type="button" style="display: none;" value="Hello" id="bttHello">        
                        </div>
                        <div class="col-md-12 panel-body" style="padding-bottom:30px;">                                                         
                            
                            <div class="col-md-12">
                                <!--action="CitasController?action=create" onsubmit="check(event, this)"-->
                                <!--<form class="cmxform" id="signupForm" method="POST"  >-->
                                    <div class="col-md-6">                                                                                 
                                        
                                        <div class="form-group form-animate-text">
                                            <input type="text" class="form-text dateAnimate" id="fhentrada" name="fhentrada" required>
                                            <span class="bar"></span>
                                            <label><span class="fa fa-calendar"></span> Fecha Entrada</label>
                                        </div>                                        
                                        <div class="form-group form-animate-text">
                                            <input type="text" class="form-text time" name="tmentrada" id="tmentrada" required>
                                            <span class="bar"></span>
                                            <label><span class="fa fa-clock-o"></span> Hora Entrada</label>
                                        </div>

                                        <div class="col-sm-12 padding-0">                                                                                      
                                            <span class="bar"></span>
                                            <label>Mascota</label><br>
                                            <select class="select2-A" style="width: 100%;" name="mascota" id="mascota">        
                                                <c:forEach var="mascota" items="${requestScope.ArrayMascotas}">
                                                    <option value="${mascota.idMascotas}"><c:out value="${mascota.nombre}"/></option>                         
                                                </c:forEach>

                                            </select>                       
                                        </div><br><br>

                                        <!--                                        <div class="form-group form-animate-text" style="margin-top:40px !important;">                                            
                                                                                    <textarea name="comentarios" rows="10" cols="40" placeholder="Proposito de la cita"></textarea>
                                                                                    <span class="bar"></span>
                                                                                    <label></label>
                                                                                </div>-->
                                    </div>
                                    <div class="col-md-6">  
                                        <div class="form-group form-animate-text">
                                            <input type="text" class="form-text dateAnimate" name="fhsalida" id="fhsalida" required>
                                            <span class="bar"></span>
                                            <label><span class="fa fa-calendar"></span> Fecha Salida</label>
                                        </div>                                        
                                        <div class="form-group form-animate-text">
                                            <input type="text" class="form-text time" name="tmsalida" id="tmsalida" required>
                                            <span class="bar"></span>
                                            <label><span class="fa fa-clock-o"></span> Hora Salida</label>
                                        </div>


                                        <div class="col-sm-12 padding-0">
                                            <span class="bar"></span>
                                            <label>Tipo Cita</label>
                                            <select class="form-control" name="tipo" id="tipo">
                                                <option value="Programada">Programada</option>
                                                <option value="Urgencia">Urgencia</option>                                                
                                            </select>
                                        </div>
                                        <input type="text" id="idcita" style="display: none;" name="idcita">
                                    </div>
                                    <div class="col-md-12" style="padding-top: 20px;">                                             
                                        <input class="submit btn btn-primary" id="myBtn1" type="submit" onclick="check()"  value="Registrar" >
                                        <input type="submit" class="submit btn btn-danger" value="Volver" onclick="reset()" data-dismiss="modal">
                                        <input type="submit" class="submit btn btn-success" id="dtlcitas"  data-dismiss="modal" >                                       
                                    </div>

                                <!--</form>-->

                            </div>
                        </div> 
                    </div>
                </div>         
            </div>
        </div>  
    </div>    
    <!--Termina modal 1-->
    
     
    <div id='top'>

        <div class='left'>

            <div id='theme-system-selector' class='selector' style="color: #098ddf;">
                Estyle Calendar:

                <select style="color: #080808;">                    
                    <option value='jquery-ui'>jQuery UI</option>                    
                </select>
            </div>

            <div data-theme-system="bootstrap3" class='selector' style='display:none'>
                Theme Name:

                <select>
                    <option value='' >Default</option>
                    <option value='cosmo'>Cosmo</option>
                    <option value='cyborg'>Cyborg</option>
                    <option value='darkly'>Darkly</option>
                    <option value='flatly'>Flatly</option>
                    <option value='journal'>Journal</option>
                    <option value='lumen'>Lumen</option>
                    <option value='paper'>Paper</option>
                    <option value='readable'>Readable</option>
                    <option value='sandstone'>Sandstone</option>
                    <option value='simplex'>Simplex</option>
                    <option value='slate'>Slate</option>
                    <option value='solar'>Solar</option>
                    <option value='spacelab'>Spacelab</option>
                    <option value='superhero'>Superhero</option>
                    <option value='united'>United</option>
                    <option value='yeti'>Yeti</option>
                </select>
            </div>

            <div data-theme-system="jquery-ui" class='selector' style='display:none'>
                Theme Name:

                <select>
                    <option value='black-tie'>Black Tie</option>
                    <option value='blitzer'>Blitzer</option>
                    <option value='cupertino' >Cupertino</option>
                    <option value='dark-hive'>Dark Hive</option>
                    <option value='dot-luv' selected>Dot Luv</option>
                    <option value='eggplant'>Eggplant</option>
                    <option value='excite-bike'>Excite Bike</option>
                    <option value='flick'>Flick</option>
                    <option value='hot-sneaks'>Hot Sneaks</option>
                    <option value='humanity'>Humanity</option>
                    <option value='le-frog'>Le Frog</option>
                    <option value='mint-choc'>Mint Choc</option>
                    <option value='overcast'>Overcast</option>
                    <option value='pepper-grinder'>Pepper Grinder</option>
                    <option value='redmond'>Redmond</option>
                    <option value='smoothness'>Smoothness</option>
                    <option value='south-street'>South Street</option>
                    <option value='start'>Start</option>
                    <option value='sunny'>Sunny</option>
                    <option value='swanky-purse'>Swanky Purse</option>
                    <option value='trontastic'>Trontastic</option>
                    <option value='ui-darkness'>UI Darkness</option>
                    <option value='ui-lightness'>UI Lightness</option>
                    <option value='vader'>Vader</option>
                </select>
            </div>

            <span id='loading' style='display:none'></span>
            <button class="btn btn-primary" data-toggle="modal" id="buttonmodal" data-target="#mimodalejemplo" style="display: none;">Agregar Cita</button>
        </div>



        <div class='clear'></div>
    </div>

    <div id='calendar'></div>








</div>

<!-- end: content -->

<button id="mimin-mobile-menu-opener" class="animated rubberBand btn btn-circle btn-danger">
    <span class="fa fa-bars"></span>
</button>
<!-- end: Mobile -->

<!-- start: Javascript -->

<script src="fullcalendar-3.7.0/lib/moment.min.js"></script>
<script src='fullcalendar-3.7.0/lib/jquery.min.js'></script>
<!--script src="asset/js/jquery.min.js"></script-->
<script src="asset/js/jquery.ui.min.js"></script>
<script src="asset/js/bootstrap.min.js"></script>


<!-- plugins -->

<script src="asset/js/plugins/jquery.knob.js"></script>
<script src="asset/js/plugins/ion.rangeSlider.min.js"></script>
<script src="asset/js/plugins/bootstrap-material-datetimepicker.js"></script>
<script src="asset/js/plugins/jquery.nicescroll.js"></script>
<script src="asset/js/plugins/jquery.mask.min.js"></script>
<script src="asset/js/plugins/select2.full.min.js"></script>
<script src="asset/js/plugins/nouislider.min.js"></script>
<script src="asset/js/plugins/jquery.validate.min.js"></script>
<script src='fullcalendar-3.7.0/fullcalendar.min.js'></script>
<script src='fullcalendar-3.7.0/demos/js/theme-chooser.js'></script>



<!-- custom -->
<script src="asset/js/main.js"></script>


<script>

                                                    $(document).ready(function () {

                                            initThemeChooser({
                                            init: function (themeSystem) {
                                            $('#calendar').fullCalendar({
                                            themeSystem: themeSystem,
                                                    header: {
                                                    left: 'prev,next today',
                                                            center: 'title',
                                                            right: 'month,agendaWeek,agendaDay,listMonth'
                                                    },
                                                    defaultDate: new Date,
                                                    weekNumbers: true,
                                                    navLinks: true, // can click day/week names to navigate views
                                                    editable: true,
                                                    eventLimit: true, // allow "more" link when too many events
                                                    events: [
                                                    <% ArrayList listar = (ArrayList) request.getAttribute("ArrayCitas");
                                                        for (Object Obj : listar) {
                                                           Citas cita = (Citas) Obj;%>
                                                    {
                                                    id: '<%= cita.getIdCitasMedicas()%>',
                                                            title: '<%= cita.getMascota().getNombre() %>',
                                                            start: '<%= cita.getFechaEntrada()%>',
                                                            end: '<%= cita.getFechaSalida()%>',
                                                            className: '<%= cita.getEstado() %>',
                                            <% if(cita.getEstado().equals("Programada")){ %>
                                                                //Azul
                                                backgroundColor: 'blue',
                                            <%  } else if(cita.getEstado().equals("Atendida")){ %>
                                                //Verde
                                                backgroundColor: '#378006',
                                           <% } else { %>
                                               //Rojo
                                               backgroundColor: 'red',
                                                   <% }  %>
                                                    },
                                                        <% } %>


                                                    ],
                                                   
                                                   

                                                                
                                                    
                                                    eventDrop: function (event, delta, revertFunc) {
                                                        var estado = event.className;
                                                        
                                                        if(estado == "Cancelada" || estado == "Atendida"){
                                                        alert("Cita ya no se puede modificar");    
                                                        revertFunc();   
                                                        }else{
                                                            event.start.add(1, 'days')
                                                    if(event.start >= new Date()){
                                                        event.start.subtract(1, 'days')      
                                                        var date = new Date(event.start);
                                                        var year = date.getFullYear();
                                                        var mes = date.getMonth()+1;
                                                        var dia = date.getDate();
                                                        if(dia < 10){
                                                            dia = "0"+dia;
                                                        }
                                                        var fechadrop = year+"-"+mes+"-"+dia;                                                       
                                                        var elem = document.getElementById('buttonmodal');
                                                            elem.click();
                                                            document.getElementById('idcita').value = event.id;
                                                            document.getElementById('fhentrada').value = fechadrop;
                                                            document.getElementById('fhsalida').value = fechadrop;
                                                            document.getElementById('at').value = "update";
                                                            document.getElementById('title').value = "Editar Cita";
                                                            $("#dtlcitas").hide();
                                                    }else{
//                                                        alert("Fecha no valida "+event.start.format()+" Actual"     );
                                                        revertFunc();   
                                                    }
                                                        }
                                                    
                                                            
                                                    },
                                                    dayClick: function (date, jsEvent, view) {
                                                        //alert(date.add(1, 'days'));
                                                        document.getElementById('result1').value = "";
                                                    if (date.add(1, 'days') <= new Date()) {
                                                    //alert("No se puede"+date.format());
                                                    } else {
                                                    date.subtract(1, 'days');
                                                            //alert("Si se puede"+date.format());
//                                                                    Ventana modal        
                                                            var elem = document.getElementById('buttonmodal');
                                                            elem.click();
                                                            document.getElementById('fhentrada').value = date.format();
                                                            document.getElementById('fhsalida').value = date.format();
                                                            document.getElementById('at').value = "create";
                                                            document.getElementById('title').value = "Crear Cita";
                                                            $("#dtlcitas").hide();
                                                            //                                                                
                                                    }
                                                    //                                                                    // change the day's background color just for fun
                                                    //                                                                    $(this).css('background-color', 'red');
                                                    },
                                                    eventClick: function (calEvent, jsEvent, view) {                                                        
                                                        //document.getElementById('result1').value = "";
                                                        var elem = document.getElementById('buttonmodal');
                                                        elem.click();
//                                                      Fecha entrada    
                                                        var date = new Date(calEvent.start.format());
                                                        var yeare = date.getFullYear();
                                                        var mese = date.getMonth()+1;
                                                        var diae = date.getDate();
                                                        var houre = date.getHours();
                                                        var mine = date.getMinutes();//                                                        
                                                        if(diae < 10){
                                                            diae = "0"+diae;
                                                        }
                                                        if(houre < 10){
                                                            houre = "0"+houre;
                                                        }
                                                        if(mine < 1 ){
                                                            mine = "0"+mine;
                                                        }
                                                        
                                                        var fechae = yeare+"-"+mese+"-"+diae;
                                                        var timee = houre+":"+mine;
                                                        document.getElementById('idcita').value = event.id;
                                                        document.getElementById('fhentrada').value = fechae;
                                                        document.getElementById('tmentrada').value = timee;
                                                        
                                                        
//                                                        Fecha salida
//                                                        alert("La fecha de salida: "+calEvent.end.format());
                                                        var date2 = new Date(calEvent.end.format());
                                                        var years = date2.getFullYear();
                                                        var mess = date2.getMonth()+1;
                                                        var dias = date2.getDate();
                                                        var hours = date2.getHours();
                                                        var mins = date2.getMinutes();//                                                        
                                                        if(dias < 10){
                                                            dias = "0"+dias;
                                                        }
                                                        if(hours < 10){
                                                            hours = "0"+hours;
                                                        }
                                                        if(mins < 1 ){
                                                            mins = "0"+mins;
                                                        }
                                                        
                                                        var fechas = years+"-"+mess+"-"+dias;
                                                        var times = hours+":"+mins;                                                                                                                
                                                        document.getElementById('fhsalida').value = fechas;
                                                        document.getElementById('tmsalida').value = times;
                                                        document.getElementById('idcita').value = calEvent.id;
                                                        if(calEvent.className == "Programada"){
                                                        document.getElementById('at').value = "update";
                                                        document.getElementById('title').value = "Editar Cita";
                                                    }else{
                                                        
                                                        $("#myBtn1").attr('disabled',true);
                                                        }
                                                        document.getElementById('dtlcitas').value = "Atender Cita";
                                                        $("#dtlcitas").show();                                                       
                        
//                                                    alert('Event: ' + calEvent.title);
//                                                            alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
//                                                            alert('View: ' + view.name);
//                                                            // change the border color just for fun
//                                                            $(this).css('border-color', 'red');
                                                    },
                                                    eventResize: function (event, delta, revertFunc) {

//                                                    alert(event.title + " end is now " + event.end.format());
//                                                            if (!confirm("is this okay?")) {
                                                    revertFunc();
//                                                    }
                                                    }


                                            });
                                            },
                                                    change: function (themeSystem) {
                                                    $('#calendar').fullCalendar('option', 'themeSystem', themeSystem);
                                                    }

                                            });
                                            });</script>
<!-- end: Javascript 
<script>
    
  $('#calendar').fullCalendar({
    dayClick: function(date, jsEvent, view) {

        alert('Clicked on: ' + date.format());

        alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);

        alert('Current view: ' + view.name);

        // change the day's background color just for fun
        $(this).css('background-color', 'red');

    }
});
</script>
-->

<script>

            $(document).ready(function () {
    $(".select2-A").select2({
    placeholder: "Select a state",
            allowClear: true,
            dropdownParent: $("#mimodalejemplo")

    });
    });
    
    $('#dtlcitas').click(function(){
        var id = document.getElementById('idcita').value;         
//         alert(id);
     $.ajax({
         type:'POST',
         data: {idcita: $('#idcita').val()},
         url: 'MedicamentosController?action=admin',          
         
         success: function(result){
             location.href ="DetallesCita.jsp";
         }
     })
    });
//    MedicamentosController?action=admin&idcita=
    $('#bttHello').click(function(){
//        alert("Le dio click al buton");
                     //var fullname = $('#fullname').val();
                     var id = document.getElementById('mascota').value;
                     var action = document.getElementById('at').value;
//                     alert("el action: "+id);
                    $.ajax({
                    type:'POST',
                    data: {fhentrada: $('#fhentrada').val(),tmentrada: $('#tmentrada').val(),fhsalida: $('#fhsalida').val(),tmsalida: $('#tmsalida').val(),tipo: $('#tipo').val(),mascota: $('#mascota').val(),idcita: $('#idcita').val()},
                    url: 'CitasController?action='+action,  
                    success: function(result){
                        if(result == ("")){
//                            alert("Es nulo");
                            location.reload(true);
                        }else{
//                             alert("Llego con algo");
                            $('#result1').html(result);
//                        alert(result);
                        }
                        
                    }                  
                    
                });
                 });             
            $('.time').bootstrapMaterialDatePicker({date: false, format: 'HH:mm', animation: true});
            $('.dateAnimate').bootstrapMaterialDatePicker({weekStart: 0, time: false, minDate: new Date(), animation: true});
            function check(e, f) {
                    var fhentrada = Date.parse(document.getElementById('fhentrada').value + " " + document.getElementById('tmentrada').value);
                    var fhsalida = Date.parse(document.getElementById('fhsalida').value + " " + document.getElementById('tmsalida').value);
                    var onlyfhentrada = document.getElementById('fhentrada').value;                    
//                    alert("La fecha de entrada: "+onlyfhentrada+);
                    if(Date.parse(onlyfhentrada) > new Date()){
//                        alert("La fecha es mayor valido sin hora");
                        if (fhentrada < fhsalida) {
//                            alert("Se puede crear la cita ");
                            var elem = document.getElementById('bttHello');
                            elem.click();                            
                        }else{
                            alert("Verifique que la fecha de salida sea menor o igual que la entrada");                    
                        }
                        //Si no es mayor la fecha de entrada valido con hora
                    }else{
//                        alert("No es mayor valido con hora");
                         //Validacion si la fecha es igual a hoy
                    if (fhentrada < fhsalida) {
//            alert("Si se pudo");
                    var f = document.getElementById('tmentrada').value;
                    var time = new Date();
                    var hora = time.getHours();
                    if(hora == 0){
                        hora = "0"+time.getHours();
//                        alert("La hora es igual a cero: "+hora);
                    }
                    var minuto = time.getMinutes();
                    if(minuto < 10 ){
                        minuto = "0"+time.getMinutes();
                    }
                    var finaltime = hora + ":" + minuto;
//                    alert("Hora de entrada"+f + " Antes del if la hora actual: " + finaltime);
                    if (f > finaltime) {
//            alert("Cita creada con validacion en la hora");
                var elem = document.getElementById('bttHello');
                elem.click();
              

            } else {
            alert("Verifique las horas no se pueden");
                    alert("Hora entrada: "+f + " Hora actual: " + finaltime);
                    
            }

            } else {
            alert("Verifique que la fecha de salida sea menor o igual que la entrada");
                    
            }


                    }
                   
            }
            function reset() {
                location.reload(true);
            }

</script>

</body>
</html>

