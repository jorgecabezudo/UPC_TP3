using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ETNA.BusinessEntity;

namespace ETNA.DataAccess
{
    public class UsuarioAlmacenDA
    {
        // Método para recuperar los almacenes de un usuario en una colección
        public List<UsuarioAlmacenBE> ObtenerAlmacen(string cod)
        {
            // Instanciar la colección para almacenar los datos recuperados
            List<UsuarioAlmacenBE> usuarioAlmacenList = new List<UsuarioAlmacenBE>();

            // Instanciar el objeto para especificar los parámetros
            Dictionary<string, object> parameter = new Dictionary<string, object>();

            // Asignar el código de usuario a la variable de parámetros
            parameter.Add("@CH_COD_USUARIO", cod);

            // Definir variable Usuario de Almacén
            UsuarioAlmacenBE objUsuarioAlmacen;

            // Recuperar los almacenes del cursor que retorna el procedimiento con el parámetro del código de usuario
            using (IDataReader dr = SqlHelper.Instance.ExecuteReader("SP_OBTENER_USUARIOALMACEN", parameter))
            {
                // Si hay almacenes para el usuario especificado
                while (dr.Read())
                {
                    // Instanciar el objeto UsuarioAlmacen
                    objUsuarioAlmacen = new UsuarioAlmacenBE();

                    // Registrar el almacén en la variable del objeto UsuarioAlmacen
                    objUsuarioAlmacen.In_idAlmacen = dr.GetInt32(dr.GetOrdinal("idAlmacen"));
                    objUsuarioAlmacen.Vc_descripcionAlmacen = dr.GetString(dr.GetOrdinal("descripcionAlmacen"));

                    // Agregar el objeto a la lista de almacenes del usuario
                    usuarioAlmacenList.Add(objUsuarioAlmacen);
                }
            }
            // Retornar la lista de almacenes para un usuario
            return usuarioAlmacenList;
        }
    }
}
