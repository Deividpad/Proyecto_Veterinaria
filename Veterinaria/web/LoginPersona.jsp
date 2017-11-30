<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="description" content="Miminium Admin Template v.1">
        <meta name="author" content="Isna Nur Azis">
        <meta name="keyword" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Miminium</title>

        <!-- start: Css -->
        <link rel="stylesheet" type="text/css" href="asset/css/bootstrap.min.css">

        <!-- plugins -->
        <link rel="stylesheet" type="text/css" href="asset/css/plugins/font-awesome.min.css"/>
        <link rel="stylesheet" type="text/css" href="asset/css/plugins/simple-line-icons.css"/>
        <link rel="stylesheet" type="text/css" href="asset/css/plugins/animate.min.css"/>
        <link rel="stylesheet" type="text/css" href="asset/css/plugins/icheck/skins/flat/aero.css"/>
        <link href="asset/css/style.css" rel="stylesheet">
        <!-- end: Css -->




        <link rel="shortcut icon" href="asset/img/logomi.png">
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
          <![endif]-->
    </head>

    <body id="mimin" class="dashboard form-signin-wrapper">

        <div class="container"> 
            <form class="form-signin" method="POST" action="LoginController?action=intoerpsona" >
                <div class="panel periodic-login">
                    <span class="atomic-number">28</span>
                    <div class="panel-body text-center">
                        <h1 class="atomic-symbol">Mi</h1>
                        <p class="atomic-mass">14.072110</p>
                        <p class="element-name">Miminium</p>

                        <i class="icons icon-arrow-down"></i>
                        <div class="form-group form-animate-text" style="margin-top:40px !important;">
                            <input type="text" class="form-text" name="correo" required>
                            <span class="bar"></span>
                            <label>Username</label>
                        </div>
                        <div class="form-group form-animate-text" style="margin-top:40px !important;">
                            <input type="password" class="form-text" name="contrasena" required>
                            <span class="bar"></span>
                            <label>Password</label>
                        </div>
                        <label class="pull-left">
                            <input type="checkbox" class="icheck pull-left" name="checkbox1"/> Remember me
                        </label>
                        <input type="submit" class="btn col-md-12" value="SignIn"/>
                        <input class="submit btn btn-danger" type="button" value="Inicio" onclick="location.href = 'Inicio.jsp'">
                    </div>
                    <div class="text-center" style="padding:5px;">
                        <a href="forgotpass.html">Forgot Password </a>
                        <a href="reg.html">| Signup</a>
                    </div>
                </div>
            </form>
        </div>

        <!-- end: Content -->
        <!-- start: Javascript -->
        <script src="asset/js/jquery.min.js"></script>
        <script src="asset/js/jquery.ui.min.js"></script>
        <script src="asset/js/bootstrap.min.js"></script>

        <script src="asset/js/plugins/moment.min.js"></script>
        <script src="asset/js/plugins/icheck.min.js"></script>
        <script src="asset/js/plugins/jquery.validate.min.js"></script>

        <!-- custom -->
        <script src="asset/js/main.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('input').iCheck({
                    checkboxClass: 'icheckbox_flat-aero',
                    radioClass: 'iradio_flat-aero'
                });
            });
        </script>
        <!-- end: Javascript -->
        <link rel="stylesheet" href="asset/Mensajes/themes/alertify.default.css" />       
        
        <script type="text/javascript" src="asset/Mensajes/lib/alertify.js"></script>
        <link rel="stylesheet" href="asset/Mensajes/themes/alertify.core.css" />

        <!-- Le javascript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script>
            /*
             --------------------------------------------------------------------------------
             | EJEMPLO Y SCRIPT ADAPTADO AL ESPA?OL POR http://blog.reaccionestudio.com/    |
             --------------------------------------------------------------------------------
             |	VIS?TANOS !!!                                                              |
             --------------------------------------------------------------------------------
             */
            function error() {
                alertify.error("Usuario o constraseña incorrecto/a.");
                return false;
            }
            function permisos() {
                alertify.error("No tiene permisos para acceder a esos sitios");
                return false;
            }
        </script>   
        <%
            String get = request.getParameter("error");
            if (get != null && get.equals("true")) { %>
        <script language='JavaScript' type='text/javascript'>
            error();</script>
            <% }else if(get != null && get.equals("permisos"))  { %>
        <script language='JavaScript' type='text/javascript'>
            permisos();</script>
        <% } %>
    </body>
</html>