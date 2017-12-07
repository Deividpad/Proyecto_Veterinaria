<!-- start:Left Menu -->
<div id="left-menu">
    <div class="sub-left-menu scroll">
        <ul class="nav nav-list">
            <li><div class="left-bg"></div></li>
            <li class="time">
                <h1 class="animated fadeInLeft">21:00</h1>
                <p class="animated fadeInRight">Sat,October 1st 2029</p>
            </li>         
            <% String user = (String) session.getAttribute("perfil");
                if (user.equals("Veterinario")) {%>
            <li class="ripple">
                <a class="tree-toggle nav-header">
                    <span class="fa fa-user"></span> Propietario
                    <span class="fa-angle-right fa right-arrow text-right"></span>
                </a>
                <ul class="nav nav-list tree">
                    <li><a href="RegistrarPropietario.jsp"><span class="icons icon-plus"></span>Registrar Propietario</a></li>
                    <li><a href="PropietarioController?action=admin"><span class="icons icon-note"></span> Administrar</a></li>
                </ul>
            </li>
            <li class="active ripple">
                <a class="tree-toggle nav-header"><span class="fa fa-paw"></span> Mascota 
                    <span class="fa-angle-right fa right-arrow text-right"></span>
                </a>
                <ul class="nav nav-list tree">
                    <li><a href="MascotasController?action=select"><span class="icons icon-plus"></span>Registrar Mascota</a></li>
                    <li><a href="MascotasController?action=admin"><span class="icons icon-note"></span>Administrar</a></li>
                </ul>
            </li>
            <li class="active ripple">
                <a class="tree-toggle nav-header"><span class="fa fa-user-md"></span> Veterinario 
                    <span class="fa-angle-right fa right-arrow text-right"></span>
                </a>
                <ul class="nav nav-list tree">
                    <li><a href="RegistrarPersona.jsp"><span class="icons icon-plus"></span>Registrar Persona</a></li>
                    <li><a href="PersonasController?action=admin"><span class="icons icon-note"></span>Administrar</a></li>
                </ul>
            </li>
            <li class="active ripple">
                <a class="tree-toggle nav-header"><span class="fa fa-calendar"></span> Citas 
                    <span class="fa-angle-right fa right-arrow text-right"></span>
                </a>
                <ul class="nav nav-list tree">
                    <li><a href="CitasController?action=admin&param=1"><span class="icons icon-plus"></span>Crear cita</a></li>
                    <li><a href="CitasController?action=admin&param=2"><span class="icons icon-note"></span>Administrar</a></li>
                </ul>
            </li>
            <li class="active ripple">
                <a class="tree-toggle nav-header"><span class="fa fa-power-off"></span> Exit 
                    <span class="fa-angle-right fa right-arrow text-right"></span>
                </a>
                <ul class="nav nav-list tree">
                    <li><a href="LoginController?action=exitpersona"><span class="fa fa-toggle-off"></span>Logout</a></li>
                    <li><a href="LoginController?action=exitpersona">Logout</a></li>                    
                </ul>
            </li>
            <%} else {%>
            <li class="ripple">
                <a class="tree-toggle nav-header">
                    <span class="fa fa-user"></span> Propietario
                    <span class="fa-angle-right fa right-arrow text-right"></span>
                </a>
                <ul class="nav nav-list tree">
                    <li><a href="RegistrarPropietario.jsp"><span class="icons icon-plus"></span>Registrar Propietario</a></li>
                    <li><a href="PropietarioController?action=admin"><span class="icons icon-note"></span> Administrar</a></li>
                </ul>
            </li>
            <li class="active ripple">
                <a class="tree-toggle nav-header"><span class="fa fa-paw"></span> Mascota 
                    <span class="fa-angle-right fa right-arrow text-right"></span>
                </a>
                <ul class="nav nav-list tree">
                    <li><a href="MascotasController?action=select"><span class="icons icon-plus"></span>Registrar Mascota</a></li>
                    <li><a href="MascotasController?action=admin"><span class="icons icon-note"></span>Administrar</a></li>
                </ul>
            </li>
            <li class="active ripple">
                <a class="tree-toggle nav-header"><span class="fa fa-power-off"></span> Exit 
                    <span class="fa-angle-right fa right-arrow text-right"></span>
                </a>
                <ul class="nav nav-list tree">
                    <li><a href="LoginController?action=exitpersona"><span class="fa fa-toggle-off"></span>Logout</a></li>
                    <li><a href="LoginController?action=exitpersona">Logout</a></li>                    
                </ul>
            </li>
            <% }%>


        </ul>
    </div>
</div>
<!-- end: Left Menu -->