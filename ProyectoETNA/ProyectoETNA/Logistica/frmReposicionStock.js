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

function Editar(idProducto) {

    $('#idProducto').val(idProducto);
    $('#txtCantidad').val("");

    document.getElementById('txtCantidad').style.border = "1px solid #ccc";
    document.getElementById('lblCantidad').style.display = "none";

    $('#modalEdit').modal('show');
}

function ValidarCantidad() {

    var txtCantidad = document.getElementById('txtCantidad');
    var lblCantidad = document.getElementById('lblCantidad');

    if (txtCantidad.value.length == 0) {

        lblCantidad.innerHTML = "Ingrese cantidad";
        txtCantidad.style.border = "1px solid red";
        lblCantidad.style.display = "block";

        return true;
    } else {

        if (isNaN(txtCantidad.value)) {
            lblCantidad.innerHTML = "Ingrese solo números";
            txtCantidad.style.border = "1px solid red";
            lblCantidad.style.display = "block";

            return true;
        } else {

            if (txtCantidad.value < 0) {

                lblCantidad.innerHTML = "Ingrese cantidad mayor a 0";
                txtCantidad.style.border = "1px solid red";
                lblCantidad.style.display = "block";

                return true;
            } 
        }
    }

    txtCantidad.style.border = "1px solid #ccc";
    lblCantidad.style.display = "none";

    return false;
}

function Aceptar() {

    if (!ValidarCantidad()) {
        try {

            var data =
                    {
                        IN_idProducto: $('#idProducto').val(),
                        IN_cantidad: $('#txtCantidad').val(),
                        IN_almacen: $(prefix + 'ddlAlmacen').val()
                    }

            var arg = Sys.Serialization.JavaScriptSerializer.serialize(data);
            EditarStockProductoEventHandler(arg, function (result, context) {
                if (result == 0) {
                    $('#modalEdit').modal('hide');
                    Buscar();

                } else {
                    $('#modalEdit').modal('hide');
                }
            });

        } catch (e) {
            throw e;
        }
    }
    return false;
}

function RealizarPedido() {

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
        RealizarPedidoEventHandler(arg, function (result, context) {
            if (result == 0) {
                document.getElementById('mensaje').innerHTML = "Pedido realizado correctamente";

                $('#modalMensaje').modal('show');

            } else {
                document.getElementById('mensaje').innerHTML = "Error al realizar pedido";

                $('#modalMensaje').modal('show');
            }
        });

    } catch (e) {
        throw e;
    }

    return false;
}


function HideMensaje() {
    $('#modalMensaje').modal('hide');

    location.reload();
}