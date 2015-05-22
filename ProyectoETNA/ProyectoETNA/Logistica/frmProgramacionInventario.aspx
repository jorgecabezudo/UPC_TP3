<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/PaginaPrincipal.Master" AutoEventWireup="true" CodeBehind="frmProgramacionInventario.aspx.cs" Inherits="ProyectoETNA.Logistica.frmProgramacionInventario" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="frmProgramacionInventario.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

    <div class="row" style="margin-bottom: 4%">
        <div class="col-md-12">
            <fieldset>
                <legend>Programación de Inventario</legend>
                <div class="row">
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>Tipo de inventario</label>
                            <asp:DropDownList ID="ddlTipoInventario" CssClass="form-control" runat="server">
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
                        <div class="form-group">
                            <button class="btn btn-info" onclick="return Nuevo()" style="width: 100%;">NUEVO</button>
                        </div>
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
                                        <asp:TemplateField HeaderText="idTipo" Visible="false">
                                            <ItemTemplate>
                                                <%#DataBinder.Eval(Container, "DataItem.In_tipoInventario")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Tipo Inventario">
                                            <ItemTemplate>
                                                <%#DataBinder.Eval(Container, "DataItem.Vc_tipoInventario")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="idAlmacen" Visible="false">
                                            <ItemTemplate>
                                                <%#DataBinder.Eval(Container, "DataItem.In_idAlmacen")%>
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
                                        <asp:TemplateField HeaderText="Act.">
                                            <ItemTemplate>
                                                <a class="glyphicon glyphicon-pencil" href="javascript:Editar('<%#DataBinder.Eval(Container, "DataItem.In_idProgInventario")%>',
                                                                                                              '<%# string.Format("{0:dd/MM/yyyy}", DataBinder.Eval(Container, "DataItem.Dt_fechaProgramada"))%>', 
                                                                                                              '<%#DataBinder.Eval(Container, "DataItem.In_tipoInventario")%>',
                                                                                                              '<%#DataBinder.Eval(Container, "DataItem.In_idAlmacen")%>')"></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Eli.">
                                            <ItemTemplate>
                                                <a class="glyphicon glyphicon-trash" href="javascript:Eliminar('<%#DataBinder.Eval(Container, "DataItem.In_idProgInventario")%>')"></a>
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
                    <h4 class="modal-title">ETNA - PROGRAMACION INVENTARIO</h4>
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

    <div class="modal fade" id="modalNuevo" tabindex="-1" role="dialog" aria-labelledby="modalNuevoLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="modalNuevoLabel">NUEVA PROGRAMACIÓN</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Fecha Programada</label>
                                <input type="text" class="form-control" id="txtFechaProgramadaNuevo" style="background-color: #fff; cursor: pointer;" readonly="true"/>
                            </div>
                            <div class="form-group">
                                <label>Tipo Inventario</label>
                                <asp:DropDownList ID="ddlTipoInventarioNuevo" CssClass="form-control" runat="server">
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label>Responsable</label>
                                <input type="text" class="form-control form-read" id="txtResponsableNuevo" readonly="true" value="Administrador"/>
                                <input type="hidden" id="idResponsableNuevo" value="1"/>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Almacén</label>
                                <asp:DropDownList ID="ddlAlmacenNuevo" CssClass="form-control" runat="server">
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label>Estado</label>
                                <input type="text" class="form-control form-read" id="txtEstadoNuevo" value="PENDIENTE" readonly="true"/>
                            </div>
                        </div>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="col-md-12">
                            <div class="pull-right">
                                <button type="button" class="btn btn-primary" onclick="return Registrar()">REGISTRAR</button>&nbsp;&nbsp;
                                <button type="button" class="btn btn-info" data-dismiss="modal">CANCELAR</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalEdit" tabindex="-1" role="dialog" aria-labelledby="modalEditLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="modalEditLabel">ACTUALIZAR PROGRAMACIÓN</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Fecha Programada</label>
                                <input type="hidden" id="idProgInventario" />
                                <input type="text" class="form-control" id="txtFechaProgramadaEdit" style="background-color: #fff; cursor: pointer;" readonly="true"/>
                            </div>
                            <div class="form-group">
                                <label>Tipo Inventario</label>
                                <asp:DropDownList ID="ddlTipoInventarioEdit" CssClass="form-control" runat="server">
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label>Responsable</label>
                                <input type="text" class="form-control form-read" id="txtResponsableEdit" readonly="true" value="Administrador"/>
                                <input type="hidden" id="idResponsableEdit" value="1"/>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Almacén</label>
                                <asp:DropDownList ID="ddlAlmacenEdit" CssClass="form-control" runat="server">
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label>Estado</label>
                                <input type="text" class="form-control form-read" id="txtEstadoEdit" value="PENDIENTE" readonly="true"/>
                            </div>
                        </div>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="col-md-12">
                            <div class="pull-right">
                                <button type="button" class="btn btn-primary" onclick="return Actualizar()">ACTUALIZAR</button>&nbsp;&nbsp;
                                <button type="button" class="btn btn-info" data-dismiss="modal">CANCELAR</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>