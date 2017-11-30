<!-- start:Left Menu -->
<div id="left-menu">
    <div class="sub-left-menu scroll">
        <ul class="nav nav-list">
            <li><div class="left-bg"></div></li>
            <li class="time">
                <h1 class="animated fadeInLeft">21:00</h1>
                <p class="animated fadeInRight">Sat,October 1st 2029</p>
            </li>         
           
            <li class="ripple">
                <a class="tree-toggle nav-header">
                    <span class="fa-area-chart fa"></span> Propietario
                    <span class="fa-angle-right fa right-arrow text-right"></span>
                </a>
                <ul class="nav nav-list tree">
                    <li><a href="RegistrarPropietario.jsp">Registrar Propietario</a></li>
                    <li><a href="PropietarioController?action=admin">Administrar</a></li>
                </ul>
            </li>
            <li class="active ripple">
                <a class="tree-toggle nav-header"><span class="fa-home fa"></span> Mascota 
                    <span class="fa-angle-right fa right-arrow text-right"></span>
                </a>
                <ul class="nav nav-list tree">
                    <li><a href="MascotasController?action=select">Registrar Mascota</a></li>
                    <li><a href="MascotasController?action=admin">Administrar</a></li>
                </ul>
            </li>
            <li class="active ripple">
                <a class="tree-toggle nav-header"><span class="fa-home fa"></span> Veterinario 
                    <span class="fa-angle-right fa right-arrow text-right"></span>
                </a>
                <ul class="nav nav-list tree">
                    <li><a href="RegistrarPersona.jsp">Registrar Persona</a></li>
                    <li><a href="PersonasController?action=admin">Administrar</a></li>
                </ul>
            </li>
            <li class="active ripple">
                <a class="tree-toggle nav-header"><span class="fa-home fa"></span> Citas 
                    <span class="fa-angle-right fa right-arrow text-right"></span>
                </a>
                <ul class="nav nav-list tree">
                    <li><a href="CitasController?action=admin&param=1">Crear cita</a></li>
                    <li><a href="CitasController?action=admin&param=2">Administrar</a></li>
                </ul>
            </li>
            <li class="active ripple">
                <a class="tree-toggle nav-header"><span class="fa-home fa"></span> Exit 
                    <span class="fa-angle-right fa right-arrow text-right"></span>
                </a>
                <ul class="nav nav-list tree">
                    <li><a href="">Logout</a></li>
                    <li><a href="">Logout</a></li>                    
                </ul>
            </li>            
        </ul>
    </div>
</div>
<!-- end: Left Menu -->