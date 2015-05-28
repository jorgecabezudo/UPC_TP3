var prefix = "#ContentPlaceHolder1_";

window.onload = function () {

    Buscar();
}


function Buscar() {

    try {
        var estadoInventario = $(prefix + 'ddlEstadoInventario').val();
        var almacen = $(prefix + 'ddlAlmacen').val();

        var data =
                {
                    IN_estadoInventario: estadoInventario,
                    IN_almacen: almacen
                }

        var arg = Sys.Serialization.JavaScriptSerializer.serialize(data);
        ObtenerInventariosEventHandler(arg, function (result) {
            var output = Sys.Serialization.JavaScriptSerializer.deserialize(result);

            if (output.rows > 0) {
                $("#divgvInventarios").css('display', 'block');
                $("#divgvInventariosEmpty").css('display', 'none');
                $("#divgvInventarios").html(output.resultado);
            } else {
                $("#divgvInventarios").css('display', 'none');
                $("#divgvInventariosEmpty").css('display', 'block');
                $("#lblInventarioVacio").html("<b> .:: NO SE ENCONTRARON RESULTADOS ::. </b>");
            }
        });

    } catch (e) {
        throw e;
    }

    return false;
}

function Iniciar(idProgInventario, estadoInventario) {

    if (estadoInventario != 'PENDIENTE') {
        document.getElementById('mensaje').innerHTML = 'El estado no se encuentra "PENDIENTE"';

        $('#modalMensaje').modal('show');
    } else {

        try {

            var data =
                    {
                        IN_idProgInventario: idProgInventario
                    }

            var arg = Sys.Serialization.JavaScriptSerializer.serialize(data);
            IniciarInventarioEventHandler(arg, function (result, context) {
                if (result == 0) {
                    document.getElementById('mensaje').innerHTML = "Inventario iniciado correctamente";

                    $('#modalMensaje').modal('show');

                    Buscar();
                } else {
                    document.getElementById('mensaje').innerHTML = "Error al iniciar inventario";

                    $('#modalMensaje').modal('show');
                }
            });

        } catch (e) {
            throw e;
        }
    }
}

function Ajustar(idProgInventario, estadoInventario) {

    if (estadoInventario != 'CONTABILIZADO') {
        document.getElementById('mensaje').innerHTML = 'El estado no se encuentra "CONTABILIZADO"';

        $('#modalMensaje').modal('show');
    } else {

        try {

            var data =
                    {
                        IN_idProgInventario: idProgInventario
                    }

            var arg = Sys.Serialization.JavaScriptSerializer.serialize(data);
            AjustarInventarioEventHandler(arg, function (result, context) {
                if (result == 0) {
                    document.getElementById('mensaje').innerHTML = "Inventario ajustado correctamente";

                    $('#modalMensaje').modal('show');

                    Buscar();
                } else {
                    document.getElementById('mensaje').innerHTML = "Error al ajustar inventario";

                    $('#modalMensaje').modal('show');
                }
            });

        } catch (e) {
            throw e;
        }
    }
}