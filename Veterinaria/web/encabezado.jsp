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
        <link rel="stylesheet" type="text/css" href="asset/css/plugins/select2.min.css"/>
        <link rel="stylesheet" type="text/css" href="asset/css/plugins/datatables.bootstrap.min.css"/>        
        <link rel="stylesheet" type="text/css" href="asset/css/plugins/simple-line-icons.css"/>
        <link rel="stylesheet" type="text/css" href="asset/css/plugins/animate.min.css"/>
        <link rel="stylesheet" type="text/css" href="asset/css/plugins/bootstrap-material-datetimepicker.css"/>
        <link href='fullcalendar-3.7.0/fullcalendar.min.css' rel='stylesheet' />
        <link href='fullcalendar-3.7.0/fullcalendar.print.min.css' rel='stylesheet' media='print' />
        <link href="asset/css/style.css" rel="stylesheet">
        <!-- end: Css -->

        <!--Jquery fullcalendar-->

        


        <!--Mensajes de alerta-->
        <link rel="stylesheet" href="asset/Mensajes/themes/alertify.default.css" />           
        <script type="text/javascript" src="asset/Mensajes/lib/alertify.js"></script>
        <link rel="stylesheet" href="asset/Mensajes/themes/alertify.core.css" />

        <!-- Modal 
        <link rel="stylesheet" type="text/css" href="bootstrap.css">
        <script src="jquery-3.1.1.min.js"></script>
        <script src="bootstrap.js"></script>
        <!-- end Modal -->

        <link rel="shortcut icon" href="asset/img/logomi.png">
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->


        <style>

            body {
                margin: 0;
                padding: 0;
                font-size: 14px;
            }

            #top,
            #calendar.fc-unthemed {
                font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
            }

            #top {
                background: #eee;
                border-bottom: 1px solid #ddd;
                padding: 0 10px;
                line-height: 40px;
                font-size: 12px;
                color: #000;
            }

            #top .selector {
                display: inline-block;
                margin-right: 10px;
            }

            #top select {
                font: inherit; /* mock what Boostrap does, don't compete  */
            }

            .left { float: left }
            .right { float: right }
            .clear { clear: both }

            #calendar {
                max-width: 900px;
                margin: 40px auto;
                padding: 0 10px;
            }

        </style>
    </head>

    <body id="mimin" class="dashboard">
        <!-- start: Header -->
        <nav class="navbar navbar-default header navbar-fixed-top">
            <div class="col-md-12 nav-wrapper">
                <div class="navbar-header" style="width:100%;">
                    <div class="opener-left-menu is-open">
                        <span class="top"></span>
                        <span class="middle"></span>
                        <span class="bottom"></span>
                    </div>                                                                                          
                    <a href="" class="navbar-brand">
                        <b>HOME</b>
                    </a>
                    <% String user = (String) session.getAttribute("perfil"); %>
                            


                    <ul class="nav navbar-nav navbar-right user-nav">
                        <li><a><%= user %></a></li>
                        <li class="dropdown avatar-dropdown">                            
                            
                            <img src="asset/img/avatar.jpg" class="img-circle avatar" alt="user name" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"/>
                            <ul class="dropdown-menu user-dropdown">

<!--                                <li><a href="" <span class="fa fa-user"></span> My Profile</a></li>                                                                                                        -->

                                <li role="separator" class="divider"></li>
                                <li class="more">
                                    <ul>                                     
                                        <li style="margin-left: 50px;"><a href="LoginController?action=exitpersona"><span class="fa fa-power-off "></span></a></li>                                        
                                    </ul>
                                </li>
                            </ul>
                        </li>                        
                        <li ><a href="#" class="opener-right-menu"><span class="fa fa-coffee"></span></a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- end: Header -->