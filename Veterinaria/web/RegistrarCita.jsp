 
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
    <form>
     <h6>Hello World!</h6>
<!--                                        Name: <input type="text" id="fullname">
                                        <input type="button" value="Hello" id="bttHello">        
                                        <span id="result1"></span>-->
        </form>
    <!-- Modal --><!-- Modal -->
    <div class="modal fade" id="mimodalejemplo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">        
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="col-md-10">
                    <div class="col-md-12 panel">
                        <div class="col-md-12 panel-heading">
                            <h4>Crear Cita</h4>
                        </div>
                        <div class="col-md-12 panel-body" style="padding-bottom:30px;">
                            <div class="col-md-12">
                                <!--action="CitasController?action=create"-->
                                <form class="cmxform" id="signupForm" method="POST" onsubmit="check(event, this)" >
                                    <div class="col-md-6">   
                                       <h6>Hello World!</h6>
                                        Name: <input type="text" id="fullname">
                                        <input type="button" value="Hello" id="bttHello">        
                                        <span id="result1"></span>
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
                                            <select class="select2-A" style="width: 100%;" name="mascota">        
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
                                            <input type="text" class="form-text dateAnimate" name="fhsalida" value="2017-10-30" id="fhsalida" required>
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
                                            <select class="form-control" name="tipo">
                                                <option value="Programada">Programadaa</option>
                                                <option value="Urgencia">Urgencia</option>                                                
                                            </select>
                                        </div>

                                    </div>
                                    <div class="col-md-12" style="padding-top: 20px;">
                                        <input class="submit btn btn-success" id="myBtn1" type="submit" value="Modificar" >
                                        <input type="submit" class="submit btn btn-danger" value="Volver" onclick="reset()" data-dismiss="modal">
                                    </div>

                                </form>

                            </div>
                        </div> 
                    </div>
                </div>         
            </div>
        </div>
    </div>    

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
                                                            title: '<%= cita.getEstado() %>',
                                                            start: '<%= cita.getFechaEntrada()%>',
                                                            end: '<%= cita.getFechaSalida()%>'
                                                    },
                                                        <% } %>


                                                    ],
                                                   <% for (Object Obj : listar) {
                                            Citas cita = (Citas) Obj; 
                                            if(cita.getEstado().equals("Programada")){ %>
                                                                //Azul
                                                eventColor: 'blue',
                                            <%  } else if(cita.getEstado().equals("Atendida")){ %>
                                                //Verde
                                                eventColor: '#378006',
                                           <% } else { %>
                                               //Rojo
                                               eventColor: 'red',
                                                   <% } } %>
                                                   

                                                                
                                                    
                                                    eventDrop: function (event, delta, revertFunc) {
                                                        var estado = event.title;
                                                        
                                                        if(estado == "Cancelada" || estado == "Atendida"){
                                                        alert("Cita ya no se puede modificar");    
                                                        revertFunc();   
                                                        }else{
                                                            event.start.add(1, 'days')
                                                    if(event.start >= new Date()){
                                                        var elem = document.getElementById('buttonmodal');
                                                            elem.click();
                                                    }else{
//                                                        alert("Fecha no valida "+event.start.format()+" Actual"     );
                                                        revertFunc();   
                                                    }
                                                        }                                            
                                                    
                                                            
                                                    },
                                                    dayClick: function (date, jsEvent, view) {                                                                 //alert(date.add(1, 'days'));
                                                    if (date.add(1, 'days') <= new Date()) {
                                                    //alert("No se puede"+date.format());
                                                    } else {
                                                    date.subtract(1, 'days');
                                                            //alert("Si se puede"+date.format());
//                                                                    Ventana modal        
                                                            var elem = document.getElementById('buttonmodal');
                                                            elem.click();
                                                            document.getElementById('fhentrada').value = date.format();
                                                            //                                                                
                                                    }
                                                    //                                                                    // change the day's background color just for fun
                                                    //                                                                    $(this).css('background-color', 'red');
                                                    },
                                                    eventClick: function (calEvent, jsEvent, view) {

                                                    alert('Event: ' + calEvent.title);
                                                            alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
                                                            alert('View: ' + view.name);
                                                            // change the border color just for fun
                                                            $(this).css('border-color', 'red');
                                                    },
                                                    eventResize: function (event, delta, revertFunc) {

                                                    alert(event.title + " end is now " + event.end.format());
                                                            if (!confirm("is this okay?")) {
                                                    revertFunc();
                                                    }
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
    $('#bttHello').click(function(){
        alert("Le dio click al buton");
                     var fullname = $('#fullname').val();
                     var action = "create";
                     alert("Hola: "+fullname);
                    $.ajax({
                    type:'POST',
                    data: {fullname: fullname},
                    url: 'CitasController?action='+action,  
                    success: function(result){
                        $('#result1').html(result);
                        alert(result);
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
                        alert("La fecha es mayor valido sin hora");
                        if (fhentrada < fhsalida) {
                            alert("Se puede crear la cita ");
                            var fullname = $('#fullname').val();
                     var action = "create";
                     alert("Hola: "+fullname);
                    $.ajax({
                    type:'POST',
                    data: {fullname: fullname},
                    url: 'CitasController?action='+action,  
                    success: function(result){
                        $('#result1').html(result);
                        alert(result);
                        e.preventDefault();
                    }                  
                    
                });
                            
                        }else{
                            alert("Verifique que la fecha de salida sea menor o igual que la entrada");
                    e.preventDefault();
                        }
                        //Si no es mayor la fecha de entrada valido con hora
                    }else{
                        alert("No es mayor valido con hora");
                         //Validacion si la fecha es igual a hoy
                    if (fhentrada < fhsalida) {
            alert("Si se pudo");
                    var f = document.getElementById('tmentrada').value;
                    var time = new Date();
                    var hora = time.getHours();
                    if(hora == 0){
                        hora = "0"+time.getHours();
                        alert("La hora es igual a cero: "+hora);
                    }
                    var minuto = time.getMinutes();
                    if(minuto < 10 ){
                        minuto = "0"+time.getMinutes();
                    }
                    var finaltime = hora + ":" + minuto;
                    alert("Hora de entrada"+f + " Antes del if la hora actual: " + finaltime);
                    if (f > finaltime) {
            alert("Cita creada con validacion en la hora");
                var elem = document.getElementById('bttHello');
                elem.click();
//                var fullname = $('#fullname').val();
//                     var action = "create";
//                     alert("Hola: "+fullname);
//                    $.ajax({
//                    type:'POST',
//                    data: {fullname: fullname},
//                    url: 'CitasController?action='+action,  
//                    success: function(result){
//                        $('#result1').html(result);
//                        alert(result);                        
//                    }                  
//                    
//                });
            } else {
            alert("Verifique las horas no se pueden");
                    alert("Hora entrada: "+f + " Hora actual: " + finaltime);
                    e.preventDefault();
            }

            } else {
            alert("Verifique que la fecha de salida sea menor o igual que la entrada");
                    e.preventDefault();
            }


                    }
                   
            }

</script>

</body>
</html>

