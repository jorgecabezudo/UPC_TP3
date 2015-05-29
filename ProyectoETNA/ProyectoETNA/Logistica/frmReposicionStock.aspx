<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/PaginaPrincipal.Master" AutoEventWireup="true" CodeBehind="frmReposicionStock.aspx.cs" Inherits="ProyectoETNA.Logistica.frmReposicionStock" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="frmReposicionStock.js"></script>

    <div class="row" style="margin-bottom: 4%">
        <div class="col-md-12">
            <fieldset>
                <legend>Reposición de Stock</legend>
                <div class="row">
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>Código de producto</label>
                            <input class="form-control" id="txtCodigoProducto" />
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>Nombre de producto</label>
                            <input class="form-control" id="txtNombreProducto" />
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>Almacén</label>
                            <asp:DropDownList ID="ddlAlmacen" CssClass="form-control" runat="server">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-md-1">
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <button class="btn btn-primary" onclick="return Buscar()" style="width: 100%;">BUSCAR</button>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <div id="divgvProductos">
                                <asp:GridView ID="gvProductos" AutoGenerateColumns="False" runat="server" CssClass="table table-striped table-bordered table-hover">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Código producto">
                                            <ItemTemplate>
                                                <%#DataBinder.Eval(Container, "DataItem.Vc_codigoProducto")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Nombre producto">
                                            <ItemTemplate>
                                                <%#DataBinder.Eval(Container, "DataItem.Vc_descripcionProducto")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cantidad existente">
                                            <ItemTemplate>
                                                <%#DataBinder.Eval(Container, "DataItem.In_cantidad")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cantidad a solicitar">
                                            <ItemTemplate>
                                                <%#DataBinder.Eval(Container, "DataItem.In_cantidadReservada")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Editar">
                                            <ItemTemplate>
                                                <a class="fa fa-pencil fa-custom" href="javascript:Editar('<%#DataBinder.Eval(Container, "DataItem.In_idProducto")%>')"></a>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center"/>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <div id="divgvProductosEmpty">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead style="background-color: white;">
                                        <tr>
                                            <th>Código producto
                                            </th>
                                            <th>Nombre producto
                                            </th>
                                            <th>Cantidad existente
                                            </th>
                                            <th>Cantidad a solicitar
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td colspan="4" style="text-align: center;">
                                                <label id="lblProductosVacio">
                                                </label>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <button type="button" class="btn btn-info pull-right" onclick="return RealizarPedido()">REALIZAR PEDIDO</button>
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
                    <h4 class="modal-title">ETNA - REPOSICION DE STOCK</h4>
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
                    <h4 class="modal-title">ETNA - MOVIMIENTOS DE ALMACÉN</h4>
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
