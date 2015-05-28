var prefix = "#ContentPlaceHolder1_";

window.onload = function () {

    $("#txtCodigoProducto").keyup(function () {
        $("#txtNombreProducto").val("");
    });

    $("#txtNombreProducto").keyup(function () {
        $("#txtCodigoProducto").val("");
    });

    Buscar();
}

function Buscar() {

    try {
        var codigo = $('#txtCodigoProducto').val();
        var nombre = $('#txtNombreProducto').val();
        var almacen = $(prefix + 'ddlAlmacen').val();

        var data =
                {
                    VC_codigo: codigo,
                    VC_nombre: nombre,
                    IN_almacen: almacen
                }

        var arg = Sys.Serialization.JavaScriptSerializer.serialize(data);
        ObtenerStockProductosEventHandler(arg, function (result) {
            var output = Sys.Serialization.JavaScriptSerializer.deserialize(result);

            if (output.rows > 0) {
                $("#divgvProductos").css('display', 'block');
                $("#divgvProductosEmpty").css('display', 'none');
                $("#divgvProductos").html(output.resultado);
            } else {
                $("#divgvProductos").css('display', 'none');
                $("#divgvProductosEmpty").css('display', 'block');
                $("#lblProductosVacio").html("<b> .:: NO SE ENCONTRARON RESULTADOS ::. </b>");
            }
        });

    } catch (e) {
        throw e;
    }

    return false;
}