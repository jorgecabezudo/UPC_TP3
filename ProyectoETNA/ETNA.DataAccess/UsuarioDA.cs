using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace ETNA.DataAccess
{
    public class UsuarioDA
    {
        private Dictionary<string, object> parameter;

        public Int32 ValidarUsuario(string usuario, string password)
        {
            Int32 resultado = 0;
            parameter = new Dictionary<string, object>();
            parameter.Add("@usuario", usuario);
            parameter.Add("@password", password);
            resultado = Convert.ToInt32(SqlHelper.Instance.ExecuteScalar("SP_VALIDARUSUARIO", parameter));
            return resultado;
        }
    }
}
