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
                        IN_idDetalleInventario: $('#txtDetInventario').val(),
                        IN_cantidad: $('#txtCantidad').val()
                    }

            var arg = Sys.Serialization.JavaScriptSerializer.serialize(data);
            EditarTomaInventarioEventHandler(arg, function (result, context) {
                if (result == 0) {
                    $('#modalEdit').modal('hide');

                    ObtenerDetalle($('#txtIdInventario').val());

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

                document.getElementById('btnAceptarError').style.display = "none";
                document.getElementById('btnAceptarOk').style.display = "block";

                $('#modalMensaje').modal('show');

            } else {
                document.getElementById('mensaje').innerHTML = "Error al finalizar toma de inventario";

                document.getElementById('btnAceptarOk').style.display = "none";
                document.getElementById('btnAceptarError').style.display = "block";

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