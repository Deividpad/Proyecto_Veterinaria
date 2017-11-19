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
                    <option value='cupertino' selected>Cupertino</option>
                    <option value='dark-hive'>Dark Hive</option>
                    <option value='dot-luv'>Dot Luv</option>
                    <option value='eggplant'>Eggplant</option>
                    <option value='excite-bike'>Excite Bike</option>
                    <option value='flick'>Flick</option>
                    <option value='hot-sneaks'>Hot Sneaks</option>
                    <option value='humanity'>Humanity</option>
                    <option value='le-frog'>Le Frog</option>
                    <option value='mint-choc'>Mint Choc</option>
                    <option value='overcast'>Overcast</option>
                    <option value='pepper-grinder'>Pepper Grinder</option>
                    <option value='redmond' selected>Redmond</option>
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
            <button class="btn btn-primary" onclick="location.href = 'CitasController?action=admin'">Agregar Cita</button>
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
                        title: 'All Day Event',
                                start: '<%= cita.getFechaEntrada() %>',
                                end: '<%= cita.getFechaSalida() %>'
                        },
                        <% }%>
                        
                        
                        ]
                });
                },
                        change: function (themeSystem) {
                        $('#calendar').fullCalendar('option', 'themeSystem', themeSystem);
                        }

                });
                });

</script>
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

</body>
</html>