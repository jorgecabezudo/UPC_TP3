var prefix = "#ContentPlaceHolder1_";

function changeAlmacen() {

    try {
        var almacen = $(prefix + 'ddlAlmacen').val();

        var data =
                {
                    IN_almacen: almacen
                }

        var arg = Sys.Serialization.JavaScriptSerializer.serialize(data);
        ObtenerInventarioEventHandler(arg, function (result) {
            var output = Sys.Serialization.JavaScriptSerializer.deserialize(result);

            if (output.id > 0) {
                $("#txtIdInventario").val(output.id);
                $("#txtFechaInicio").val(output.fechaInicio);
                $("#txtTipoInventario").val(output.tipo);
                $("#txtResponsable").val(output.responsable);
                ObtenerDetalle(output.id);
            } else {
                /*MR-20150523 - INICIO*/
                $("#divgvDetalle").css('display', 'none');
                $("#divgvDetalleEmpty").css('display', 'block');
                $("#lblDetalleVacio").html("<b> .:: NO SE ENCONTRARON RESULTADOS ::. </b>");
                /*MR-20150523 - FIN*/
                $("#txtIdInventario").val("");
                $("#txtFechaInicio").val("");
                $("#txtTipoInventario").val("");
                $("#txtResponsable").val("");
            }
        });

    } catch (e) {
        throw e;
    }

    return false;
}

function ObtenerDetalle(id) {

    try {


        var data =
                {
                    In_idInventario: id
                }

        var arg = Sys.Serialization.JavaScriptSerializer.serialize(data);
        ObtenerDetalleInventarioEventHandler(arg, function (result) {
            var output = Sys.Serialization.JavaScriptSerializer.deserialize(result);

            if (output.rows > 0) {
                $("#divgvDetalle").css('display', 'block');
                $("#divgvDetalleEmpty").css('display', 'none');
                $("#divgvDetalle").html(output.resultado);

            } else {
                $("#divgvDetalle").css('display', 'none');
                $("#divgvDetalleEmpty").css('display', 'block');
                $("#lblDetalleVacio").html("<b> .:: NO SE ENCONTRARON RESULTADOS ::. </b>");
            }
        });

    } catch (e) {
        throw e;
    }

    return false;
}

function Editar(id) {

    $('#txtDetInventario').val(id);
    var txtCant = document.getElementById('txtCantidad');
    txtCant.value = '';
    /*MR-20150523 - INICIO*/
 document.getElementById('lblError').style.display = "none";
    /*MR-20150523 - FIN*/
    $('#modalEdit').modal('show');
}

function Aceptar() {
    /*MR-20150523 - INICIO*/
    var txtCant = document.getElementById('txtCantidad');
    if (txtCant.value != '') {
        /*MR-20150523 - FIN*/
        try {

            var data =
                    {
                        IN_idDetalleInventario: $('#txtDetInventario').val(),
                        IN_cantidad: $('#txtCantidad').val()
                    }

            var arg = Sys.Serialization.JavaScriptSerializer.serialize(data);
            EditarTomaInventarioEventHandler(arg, function (result, context) {
                if (result == 0) {
                    $('#modalEdit').modal('hide');
                    document.getElementById('mensaje').innerHTML = "Producto actualizado";

                    $('#modalMensaje').modal('show');

                    ObtenerDetalle($('#txtIdInventario').val());

                } else {
                    $('#modalEdit').modal('hide');
                    document.getElementById('mensaje').innerHTML = "Error al actualizar producto";

                    $('#modalMensaje').modal('show');
                }
            });

        } catch (e) {
            throw e;
        }
    }
    /*MR-20150523 - INICIO*/


    else {
        document.getElementById('lblError').style.display = "block";    }
/*MR-20150523 - FIN*/
    return false;
}

function Finalizar() {

    try {

        var data =
                {
                    IN_idInventario: $('#txtIdInventario').val()
                }

        var arg = Sys.Serialization.JavaScriptSerializer.serialize(data);
        FinalizarTomaInventarioEventHandler(arg, function (result, context) {
            if (result == 0) {
                document.getElementById('mensaje').innerHTML = "Toma de inventario finalizada correctamente";

                $('#modalMensaje').modal('show');

            } else {
                document.getElementById('mensaje').innerHTML = "Error al finalizar toma de inventario";

                $('#modalMensaje').modal('show');
            }
        });

    } catch (e) {
        throw e;
    }

    return false;
}