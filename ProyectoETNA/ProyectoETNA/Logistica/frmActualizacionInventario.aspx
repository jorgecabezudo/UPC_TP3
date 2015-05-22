<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/PaginaPrincipal.Master" AutoEventWireup="true" CodeBehind="frmActualizacionInventario.aspx.cs" Inherits="ProyectoETNA.Logistica.ActualizacionInventario" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="frmActualizacionInventario.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

    <div class="row" style="margin-bottom: 4%">
        <div class="col-md-12">
            <fieldset>
                <legend>Actualización de Inventario</legend>
                <div class="row">
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>Estado de inventario</label>
                            <asp:DropDownList ID="ddlEstadoInventario" CssClass="form-control" runat="server">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>Almacén</label>
                            <asp:DropDownList ID="ddlAlmacen" CssClass="form-control" runat="server">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-md-2">
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <button class="btn btn-primary" onclick="return Buscar()" style="width: 100%;">BUSCAR</button>
                        </div>
                    </div>
                    <div class="col-md-2">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <div id="divgvInventarios">
                                <asp:GridView ID="gvInventarios" AutoGenerateColumns="False" runat="server" CssClass="table table-striped table-bordered table-hover">
                                    <Columns>
                                        <asp:TemplateField HeaderText="id" Visible="false">
                                            <ItemTemplate>
                                                <%#DataBinder.Eval(Container, "DataItem.In_idProgInventario")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Fecha Programada">
                                            <ItemTemplate>
                                                <%# string.Format("{0:dd/MM/yyyy}", DataBinder.Eval(Container, "DataItem.Dt_fechaProgramada"))%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Tipo Inventario">
                                            <ItemTemplate>
                                                <%#DataBinder.Eval(Container, "DataItem.Vc_tipoInventario")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Almacén">
                                            <ItemTemplate>
                                                <%#DataBinder.Eval(Container, "DataItem.Vc_almacen")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Responsable">
                                            <ItemTemplate>
                                                <%#DataBinder.Eval(Container, "DataItem.Vc_usuario")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Estado">
                                            <ItemTemplate>
                                                <%#DataBinder.Eval(Container, "DataItem.Vc_estado")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Iniciar">
                                            <ItemTemplate>
                                                <a class="glyphicon glyphicon-expand" href="javascript:Iniciar('<%#DataBinder.Eval(Container, "DataItem.In_idProgInventario")%>',
                                                                                                               '<%#DataBinder.Eval(Container, "DataItem.Vc_estado")%>')"></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Ajustar">
                                            <ItemTemplate>
                                                <a class="glyphicon glyphicon-wrench" href="javascript:Ajustar('<%#DataBinder.Eval(Container, "DataItem.In_idProgInventario")%>',
                                                                                                               '<%#DataBinder.Eval(Container, "DataItem.Vc_estado")%>')"></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <div id="divgvInventariosEmpty">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead style="background-color: white;">
                                        <tr>
                                            <th>Fecha Programada
                                            </th>
                                            <th>Tipo Inventario
                                            </th>
                                            <th>Almacén
                                            </th>
                                            <th>Responsable
                                            </th>
                                            <th>Estado
                                            </th>
                                            <th>Act.
                                            </th>
                                            <th>Eli.
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td colspan="7" style="text-align: center;">
                                                <label id="lblInventarioVacio">
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

    <div class="modal fade" id="modalMensaje">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">ETNA - ACTUALIZACION INVENTARIO</h4>
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
</asp:Content>
