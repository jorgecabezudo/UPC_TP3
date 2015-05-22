<%@ Page Language="C#" MasterPageFile="~/MasterPage/PaginaPrincipal.Master" AutoEventWireup="true" CodeBehind="frmAtenderMovimientosAlmacen.aspx.cs" Inherits="ProyectoETNA.Logistica.frmAtenderMovimientosAlmacen" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="frmAtenderMovimientosAlmacen.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

    <div class="row" style="margin-top: 6%; margin-bottom: 4%">
        <div class="col-md-12">
            <fieldset>
                <legend>Atender Movimientos de Almacén</legend>
                <div class="row">
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>Tipo de Movimiento</label>
                            <input type="text" class="form-control" placeholder="Tipo de Movimiento" id="txtTipoMovimiento" readonly="true"/>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>Estado de Atención</label>
                            <input type="text" class="form-control" placeholder="Estado de Atención" id="txtSituacionAtencion" readonly="true"/>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>Almacén</label>
                            <input type="text" class="form-control" placeholder="Almacén" id="txtAlmacen" readonly="true"/>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>Fecha</label>
                            <input type="text" class="form-control" placeholder="Fecha" id="txtFechaMovimiento" readonly="true"/>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>Area solicitante</label>
                            <input type="text" class="form-control" placeholder="Area solicitante" id="txtAreaSolicitante" readonly="true"/>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>Usuario Solicitante</label>
                            <input type="text" class="form-control" placeholder="Usuario Solicitante" id="txtUsuarioSolicitante" readonly="true"/>
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
                            <button class="btn btn-info" onclick="return Regresar()" style="width: 100%;">SALIR</button>
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
                                                <%#DataBinder.Eval(Container, "DataItem.Vc_numeroDocumentoPendiente")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Descripción" ControlStyle-Font-Italic="true">
                                            <ItemTemplate>
                                                <%# string.Format("{0:dd/MM/yyyy}", DataBinder.Eval(Container, "DataItem.Dt_fechaDocumento"))%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Unidad Medida">
                                            <ItemTemplate>
                                                <%#DataBinder.Eval(Container, "DataItem.Vc_tipoMovimiento")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cantidad Pedida">
                                            <ItemTemplate>
                                                <%#DataBinder.Eval(Container, "DataItem.Vc_almacen")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cantidad Atendida">
                                            <ItemTemplate>
                                                <%#DataBinder.Eval(Container, "DataItem.Vc_situacionAtencion")%>
                                            </ItemTemplate>
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
                                            <th>Unidad Medida
                                            </th>
                                            <th>Cantidad Pedida
                                            </th>
                                            <th>Cantidad Atendida
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td colspan="7" style="text-align: center;">
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
</asp:Content>
