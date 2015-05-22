function Ingresar() {

    try {
        var valid = true;

        if ($('#txtUsuario').val() == '') {
            $('#txtUsuario').css('border', '1px solid red');
            $('#lblUsuario').css('display', 'block');
            $('#txtUsuario').focus();

            return false;
        } else {
            $('#txtUsuario').css('border', '1px solid #ccc');
            $('#lblUsuario').css('display', 'none');
        }

        if ($('#txtPassword').val() == '') {
            $('#txtPassword').css('border', '1px solid red');
            $('#lblPassword').css('display', 'block');
            $('#txtPassword').focus();

            return false;
        } else {
            $('#txtPassword').css('border', '1px solid #ccc');
            $('#lblPassword').css('display', 'none');
        }

        var user = $('#txtUsuario').val();
        var pass = $('#txtPassword').val();
        var data =
            {
                usuario: user,
                password: pass
            }
        LogInEventHandler(Sys.Serialization.JavaScriptSerializer.serialize(data), function (output) {
            var data = Sys.Serialization.JavaScriptSerializer.deserialize(output);

            if (data.resultado == 'ok') {
                location.href = 'frmBienvenida.aspx';
            }
            else {
                document.getElementById('mensaje').innerHTML = data.mensaje;

                $("#txtUsuario").val('');
                $("#txtPassword").val('');

                $('#modalMensaje').modal('show');
            }
        });

    } catch (e) {
        throw e;
    }

    return false;
}