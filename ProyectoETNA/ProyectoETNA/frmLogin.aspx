<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmLogin.aspx.cs" Inherits="ProyectoETNA.frmLogin" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>ETNA - Sistema Integrado</title>
    <!-- BOOTSTRAP STYLES-->
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/login.css" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

</head>
<body>
    <form runat="server">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" EnableScriptGlobalization="true"
            EnableScriptLocalization="true" AsyncPostBackTimeout="600" runat="server">
        </asp:ToolkitScriptManager>
    </form>

    <div class="container">
        <div class="row header-login">
            <div class="col-md-12">
                <img src="img/logo.png" class="img-responsive" style="padding-left: 10%;" alt="" />
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 margin-content">
                <img src="img/baterias.png" class="center-block img-responsive imagen" alt="" />
            </div>
            <div class="col-md-5 margin-content">
                <div class="panel panel-primary" style="border-radius: 15px;">
                    <div class="panel-heading panel-heading-radius">
                        LOGIN
                    </div>
                    <div class="panel-body panel-body-radius">
                        <div class="form-group">
                            <label class="label-login">Usuario</label>
                            <input type="text" class="form-control" placeholder="Ingrese usuario" id="txtUsuario" />
                            <label class="label-validar-m" id="lblUsuario">Ingrese su usuario</label>
                        </div>
                        <div class="form-group">
                            <label class="label-login">Contraseña</label>
                            <input type="password" class="form-control" placeholder="Ingrese contraseña" id="txtPassword" />
                            <label class="label-validar-m" id="lblPassword">Ingrese su contraseña</label>
                        </div>
                        <div>
                            <button class="btn btn-danger center-block" onclick="return Ingresar()">INGRESAR</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-1"></div>
        </div>
        <div class="row footer-login">
            <div class="col-md-12">
                <label class="label-footer">Copyright © 2015 ETNA S.A. <span>Todos los derechos reservados.</span></label>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalMensaje">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">ETNA - LOGIN</h4>
                </div>
                <div class="modal-body">
                    <div id="mensaje"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-info" data-dismiss="modal">ACEPTAR</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

    <script src="js/jquery-1.11.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/validLogin.js"></script>
</body>
</html>
