var prefix = "#ContentPlaceHolder1_";

window.onload = function () {
    Buscar();
}

function Nuevo() {
    $('#modalNuevo').modal('show');
    return false;
}

function Buscar() {

    try {
        var situacionAtencion = $(prefix + 'ddlEstadoAtencion').val();
        var almacen = $(prefix + 'ddlAlmacen').val();
        var tipoMovimiento = $(prefix + 'ddlTipoMovimiento').val();

        var data =
                {
                    IN_situacionAtencion: situacionAtencion,
                    IN_idAlmacen: almacen,
                    IN_tipoMovimiento: tipoMovimiento
                }

        var arg = Sys.Serialization.JavaScriptSerializer.serialize(data);
        ObtenerMovimientosAlmacenEventHandler(arg, function (result) {
            var output = Sys.Serialization.JavaScriptSerializer.deserialize(result);

            if (output.rows > 0) {
                $("#divgvMovimientos").css('display', 'block');
                $("#divgvMovimientosEmpty").css('display', 'none');
                $("#divgvMovimientos").html(output.resultado);
            } else {
                $("#divgvMovimientos").css('display', 'none');
                $("#divgvMovimientosEmpty").css('display', 'block');
                $("#lblMovimientosVacio").html("<b> .:: NO SE ENCONTRARON RESULTADOS ::. </b>");
            }
        });

    } catch (e) {
        throw e;
    }

    return false;
}

function AtenderDocumento(idDocPendiente) {

    location.href = 'frmAtenderMovimientosAlmacen.aspx?id=' + idDocPendiente;
}