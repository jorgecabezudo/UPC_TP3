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
        private Dictionary<string, object> parameter;

        public string ValidarUsuario(string usuario, string password)
        {
            string resultado = "";
            parameter = new Dictionary<string, object>();
            parameter.Add("@usuario", usuario);
            parameter.Add("@password", password);
            resultado = SqlHelper.Instance.ExecuteScalar("SP_VALIDARUSUARIO", parameter).ToString();
            return resultado;
        }

        public PersonaBE ObtenerInfoUsuarioLogin(string cod)
        {
            PersonaBE UsuarioObj = null;
            parameter = new Dictionary<string, object>();
            parameter.Add("@CH_Cod_Usuario", cod);
            using (IDataReader dr = SqlHelper.Instance.ExecuteReader("SP_OBTINFOUSUARIOLOGIN", parameter))
            {
                if (dr.Read())
                {
                    UsuarioObj = new PersonaBE();

                    UsuarioObj.In_idPersona = dr.GetInt32(dr.GetOrdinal("idPersona"));
                    UsuarioObj.Vc_nombres = dr.GetString(dr.GetOrdinal("nombres"));
                    UsuarioObj.Vc_apellidoPaterno = dr.GetString(dr.GetOrdinal("apellidoPaterno"));
                    UsuarioObj.Ch_Cod_Usuario = cod;
                }
            }
            return UsuarioObj;
        }
    }
}
