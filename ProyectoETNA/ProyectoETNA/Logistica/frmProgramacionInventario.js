var prefix = "#ContentPlaceHolder1_";
/*MR-20150523 - INICIO*/
window.onload = function () {
    Buscar();
}
/*MR-20150523 - FIN*/
function Nuevo() {
    /*MR-20150523 - INICIO*/
    document.getElementById('txtFechaProgramadaNuevo').value = "";
    /*MR-20150523 - FIN*/
    $("#txtFechaProgramadaNuevo").datepicker({
        defaultDate: "+1w"
    });
    $('#modalNuevo').modal('show');
    return false;
}

function Editar(idProgInventario, fechaProgramada, idTipoInventario, idAlmacen) {

    $("#txtFechaProgramadaEdit").datepicker({
        defaultDate: "+1w"
    });

    document.getElementById('idProgInventario').value = idProgInventario;
    document.getElementById('txtFechaProgramadaEdit').value = fechaProgramada;
    $(prefix + 'ddlTipoInventarioEdit').val(idTipoInventario);
    $(prefix + 'ddlAlmacenEdit').val(idAlmacen);

    $('#modalEdit').modal('show');
}

function Buscar() {

    try {
        var tipoInventario = $(prefix + 'ddlTipoInventario').val();
        var almacen = $(prefix + 'ddlAlmacen').val();

        var data =
                {
                    IN_tipoInventario: tipoInventario,
                    IN_almacen: almacen
                }

        var arg = Sys.Serialization.JavaScriptSerializer.serialize(data);
        ObtenerInventariosProgramadosEventHandler(arg, function (result) {
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

function Registrar() {

    try {
        var fechaProgramada = $('#txtFechaProgramadaNuevo').val();
        var tipoInventario = $(prefix + 'ddlTipoInventarioNuevo').val();
        var responsable = $(prefix + 'idResponsableNuevo').val();
        var almacen = $(prefix + 'ddlAlmacenNuevo').val();

        var data =
                {
                    DT_fechaProgramada: fechaProgramada,
                    IN_tipoInventario: tipoInventario,
                    CH_codUsuario: responsable,
                    IN_almacen: almacen
                }

        var arg = Sys.Serialization.JavaScriptSerializer.serialize(data);
        RegistrarInventarioProgramadoEventHandler(arg, function (result, context) {
            if (result == 0) {
                document.getElementById('mensaje').innerHTML = "Programación insertada correctamente";
                $('#modalMensaje').modal('show');
                $('#modalNuevo').modal('hide');

                Buscar();
            }
                /*MR-20150523 - INICIO*/
            else if (result == 2) {
                document.getElementById('mensaje').innerHTML = "Ya tiene asignado un Inventario de este tipo en la fecha seleccionada";
                $('#modalNuevo').modal('hide');
                $('#modalMensaje').modal('show');
            }
            else if (result == 3) {
                document.getElementById('mensaje').innerHTML = "Ingrese la fecha para la Programación de Inventario";
                $('#modalNuevo').modal('hide');
                $('#modalMensaje').modal('show');
            }
                /*MR-20150523 - FIN*/
            else {
                document.getElementById('mensaje').innerHTML = "Error al insertar programación";
                $('#modalNuevo').modal('hide');
                $('#modalMensaje').modal('show');
            }
        });

    } catch (e) {
        throw e;
    }

    return false;
}

function Actualizar() {

    try {
        var idProgInventario = $('#idProgInventario').val();
        var fechaProgramada = $('#txtFechaProgramadaEdit').val();
        var tipoInventario = $(prefix + 'ddlTipoInventarioEdit').val();
        var almacen = $(prefix + 'ddlAlmacenEdit').val();

        var data =
                {
                    IN_idProgInventario: idProgInventario,
                    DT_fechaProgramada: fechaProgramada,
                    IN_tipoInventario: tipoInventario,
                    IN_almacen: almacen
                }

        var arg = Sys.Serialization.JavaScriptSerializer.serialize(data);
        ActualizarInventarioProgramadoEventHandler(arg, function (result, context) {
            if (result == 0) {
                document.getElementById('mensaje').innerHTML = "Programación actualizada correctamente";

                $('#modalMensaje').modal('show');

                $('#modalEdit').modal('hide');

                Buscar();
            }
                /*MR-20150523 - INICIO*/
            else if (result == 2) {
                document.getElementById('mensaje').innerHTML = "Ya tiene asignado un Inventario de este tipo en la fecha seleccionada";

                $('#modalMensaje').modal('show');
                $('#modalEdit').modal('hide');
            }
                /*MR-20150523 - FIN*/

            else {
                document.getElementById('mensaje').innerHTML = "Error al actualizar programación";

                $('#modalMensaje').modal('show');

                $('#modalEdit').modal('hide');
            }
        });

    } catch (e) {
        throw e;
    }
}

function Eliminar(idProgInventario) {

    try {

        var data =
                {
                    IN_idProgInventario: idProgInventario
                }

        var arg = Sys.Serialization.JavaScriptSerializer.serialize(data);
        EliminarInventarioProgramadoEventHandler(arg, function (result, context) {
            if (result == 0) {
                document.getElementById('mensaje').innerHTML = "Programación eliminada correctamente";

                $('#modalMensaje').modal('show');

                Buscar();
            } else {
                document.getElementById('mensaje').innerHTML = "Error al eliminar programación";

                $('#modalMensaje').modal('show');
            }
        });

    } catch (e) {
        throw e;
    }
}