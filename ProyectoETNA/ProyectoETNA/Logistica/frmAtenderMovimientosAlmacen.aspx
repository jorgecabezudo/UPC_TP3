<%@ Page Language="C#" MasterPageFile="~/MasterPage/PaginaPrincipal.Master" AutoEventWireup="true" CodeBehind="frmAtenderMovimientosAlmacen.aspx.cs" Inherits="ProyectoETNA.Logistica.frmAtenderMovimientosAlmacen" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="frmAtenderMovimientosAlmacen.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

    <div class="row" style="margin-bottom: 4%">
        <div class="col-md-12">
            <fieldset>
                <legend>Atender Movimientos de Almacén</legend>
                <div class="row">
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>Tipo de Movimiento</label>
                            <asp:HiddenField runat="server" ID="idDocPendiente" Value="0"></asp:HiddenField>
                            <asp:TextBox runat="server" CssClass="form-control form-read" ID="txtTipoMovimiento" ReadOnly="true"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>Estado de Atención</label>
                            <asp:TextBox runat="server" CssClass="form-control form-read" ID="txtSituacionAtencion" ReadOnly="true"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>Almacén</label>
                            <asp:TextBox runat="server" CssClass="form-control form-read" ID="txtAlmacen" ReadOnly="true"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>Fecha</label>
                            <asp:TextBox runat="server" CssClass="form-control form-read" ID="txtFechaMovimiento" ReadOnly="true"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>Area solicitante</label>
                            <asp:TextBox runat="server" CssClass="form-control form-read" ID="txtAreaSolicitante" ReadOnly="true"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>Usuario Solicitante</label>
                            <asp:TextBox runat="server" CssClass="form-control form-read" ID="txtUsuarioSolicitante" ReadOnly="true"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-2">
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <button class="btn btn-primary" onclick="return Guardar()" style="width: 100%;">GUARDAR</button>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <button class="btn btn-info" onclick="return Cancelar()" style="width: 100%;">CANCELAR</button>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <div id="divgvMovimientos">
                                <asp:GridView ID="gvMovimientos" AutoGenerateColumns="False" runat="server" CssClass="table table-striped table-bordered table-hover">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Id Producto">
                                            <ItemTemplate>
                                                <%#DataBinder.Eval(Container, "DataItem.Vc_codigoProducto")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Descripción">
                                            <ItemTemplate>
                                                <%#DataBinder.Eval(Container, "DataItem.Vc_descripcionProducto")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cantidad Solicitada">
                                            <ItemTemplate>
                                                <%#DataBinder.Eval(Container, "DataItem.In_cantidadPedida")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cantidad Atendida">
                                            <ItemTemplate>
                                                <%#DataBinder.Eval(Container, "DataItem.In_cantidadAtendida")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Editar">
                                            <ItemTemplate>
                                                <a class="fa fa-pencil fa-custom" href="javascript:Editar('<%#DataBinder.Eval(Container, "DataItem.In_idProducto")%>','<%#DataBinder.Eval(Container, "DataItem.In_cantidadPedida")%>')"></a>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center"/>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <div id="divgvMovimientosEmpty">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead style="background-color: white;">
                                        <tr>
                                            <th>Id Producto
                                            </th>
                                            <th>Descripción
                                            </th>
                                            <th>Cantidad Solicitada
                                            </th>
                                            <th>Cantidad Atendida
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td colspan="4" style="text-align: center;">
                                                <label id="lblMovimientosVacio">
                                                </label>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </fieldset>
        </div>
    </div>

    <div class="modal fade" id="modalEdit">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">ETNA - ATENDER MOVIMIENTOS</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-1">
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <label>Cantidad :</label>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <input type="hidden" id="idProducto" />
                                <input type="hidden" id="cantidadPedida" />
                                <input type="text" class="form-control" id="txtCantidad" placeholder="Ingrese cantidad"/>
                                <label class="label-validar-m" id="lblCantidad"></label>
                            </div>
                        </div>
                        <div class="col-md-5">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="return Aceptar()" style="width:100px">ACEPTAR</button>&nbsp;
                    <button type="button" class="btn btn-info" data-dismiss="modal" style="width:100px">CANCELAR</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

    <div class="modal fade" id="modalMensaje">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">ETNA - ATENDER MOVIMIENTOS</h4>
                </div>
                <div class="modal-body">
                    <div id="mensaje"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-info" onclick="return HideMensaje()">ACEPTAR</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
</asp:Content>
