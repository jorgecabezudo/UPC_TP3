using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using ETNA.BusinessEntity;

namespace ETNA.DataAccess
{
    public class UsuarioDA
    {
        // Clase colección para el envío de parámetros a base de datos
        private Dictionary<string, object> parameter;

        // Método para comprobar si el usuario está registrado en el sistema y
        // si la clave corresponde al registro
        public string ValidarUsuario(string usuario, string password)
        {
            string resultado = "";
            // Instancia de clase colección para asignación de parámetros
            parameter = new Dictionary<string, object>();
            // Asignación de parámetros esperados por el procedimiento de base de datos
            parameter.Add("@usuario", usuario);
            parameter.Add("@password", password);
            // Llamada a procedimiento de autenticación de usuario del sistema
            resultado = SqlHelper.Instance.ExecuteScalar("SP_VALIDARUSUARIO", parameter).ToString();
            return resultado;
        }

        // Método para obtener información del usuario autenticado en el sistema
        public PersonaBE ObtenerInfoUsuarioLogin(string cod)
        {
            PersonaBE UsuarioObj = null;
            // Instancia de clase colección para asignación de parámetros
            parameter = new Dictionary<string, object>();
            // El parámetro requerido es el código del usuario (login)
            parameter.Add("@CH_Cod_Usuario", cod);
            // Llamada a procedimiento que recupera información de usuario del sistema
            using (IDataReader dr = SqlHelper.Instance.ExecuteReader("SP_OBTINFOUSUARIOLOGIN", parameter))
            {
                // El procedimiento retorna un cursor. ¿Existen registros para leer?
                if (dr.Read())
                {
                    // Instanciar clase PersonaBE para almacenar la información que retorna el procedimiento
                    UsuarioObj = new PersonaBE();

                    // Tener disponibles los datos del identificador, código, nombres y apellido
                    UsuarioObj.In_idPersona = dr.GetInt32(dr.GetOrdinal("idPersona"));
                    UsuarioObj.Vc_nombres = dr.GetString(dr.GetOrdinal("nombres"));
                    UsuarioObj.Vc_apellidoPaterno = dr.GetString(dr.GetOrdinal("apellidoPaterno"));
                    UsuarioObj.Vc_tipoUsuario = dr.GetString(dr.GetOrdinal("tipoUsuario"));
                    UsuarioObj.Ch_Cod_Usuario = cod;
                }
            }
            return UsuarioObj;
        }
    }
}
