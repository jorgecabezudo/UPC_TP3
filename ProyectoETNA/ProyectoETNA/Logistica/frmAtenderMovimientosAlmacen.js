var prefix = "#ContentPlaceHolder1_";

var repeticion = window.setInterval('ObtenerDetalle()', 500);

//window.clearInterval(repeticion);

function ObtenerDetalle() {

    var id = $(prefix + 'idDocPendiente').val();

    if (id != "0") {

        try {
            var data =
                    {
                        In_idDocPendiente: id
                    }

            var arg = Sys.Serialization.JavaScriptSerializer.serialize(data);
            ObtenerDetalleDocPendienteEventHandler(arg, function (result) {
                var output = Sys.Serialization.JavaScriptSerializer.deserialize(result);

                if (output.rows > 0) {
                    $("#divgvMovimientos").css('display', 'block');
                    $("#divgvMovimientosEmpty").css('display', 'none');
                    $("#divgvMovimientos").html(output.resultado);
                    window.clearInterval(repeticion);
                } else {
                    $("#divgvMovimientos").css('display', 'none');
                    $("#divgvMovimientosEmpty").css('display', 'block');
                    $("#lblMovimientosVacio").html("<b> .:: NO SE ENCONTRARON RESULTADOS ::. </b>");
                }
            });

        } catch (e) {
            throw e;
        }
    }
}

function Editar(idProducto, cantidad) {

    $('#idProducto').val(idProducto);
    $('#cantidadPedida').val(cantidad);
    $('#txtCantidad').val("");

    document.getElementById('txtCantidad').style.border = "1px solid #ccc";
    document.getElementById('lblCantidad').style.display = "none";

    $('#modalEdit').modal('show');
}

function Entero(numero) {
    if (numero % 1 == 0) {
        return true;
    }
    else {
        return false;
    }
}

function ValidarCantidad() {

    var txtCantidad = document.getElementById('txtCantidad');
    var cantidadPedida = document.getElementById('cantidadPedida');
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

            if (!Entero(txtCantidad.value)) {

                lblCantidad.innerHTML = "Ingrese cantidad entera";
                txtCantidad.style.border = "1px solid red";
                lblCantidad.style.display = "block";

                return true;
            }

            if (parseInt(txtCantidad.value) < 1) {

                lblCantidad.innerHTML = "Ingrese cantidad mayor a 0";
                txtCantidad.style.border = "1px solid red";
                lblCantidad.style.display = "block";

                return true;
            } else {

                if (parseInt(txtCantidad.value) > parseInt(cantidadPedida.value)) {

                    lblCantidad.innerHTML = "Ingrese cantidad menor o igual a cantidad pedida";
                    txtCantidad.style.border = "1px solid red";
                    lblCantidad.style.display = "block";

                    return true;
                }
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
                        IN_idDocPendiente: $(prefix + 'idDocPendiente').val(),
                        IN_idProducto: $('#idProducto').val(),
                        IN_cantidad: $('#txtCantidad').val()
                    }

            var arg = Sys.Serialization.JavaScriptSerializer.serialize(data);
            EditarDetalleMovimientoEventHandler(arg, function (result, context) {
                if (result == 0) {
                    $('#modalEdit').modal('hide');
                    ObtenerDetalle();

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

function Guardar() {

    try {

        var data =
                {
                    IN_idDocPendiente: $(prefix + 'idDocPendiente').val()
                }

        var arg = Sys.Serialization.JavaScriptSerializer.serialize(data);
        GuardarDetalleMovimientoEventHandler(arg, function (result, context) {
            if (result == 0) {
                document.getElementById('mensaje').innerHTML = "Movimiento guardado correctamente";

                $('#modalMensaje').modal('show');

            } else {
                document.getElementById('mensaje').innerHTML = "Error al guardar movimiento";

                $('#modalMensaje').modal('show');
            }
        });

    } catch (e) {
        throw e;
    }

    return false;
}

function Cancelar() {
    location.href = "frmConsultaMovimientosAlmacen.aspx";
    return false;
}

function HideMensaje() {
    $('#modalMensaje').modal('hide');
    location.href = "frmConsultaMovimientosAlmacen.aspx";

    return false;
}