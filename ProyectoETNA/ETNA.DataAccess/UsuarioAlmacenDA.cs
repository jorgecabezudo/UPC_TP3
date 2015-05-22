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
        public List<UsuarioAlmacenBE> ObtenerAlmacen()
        {
            List<UsuarioAlmacenBE> usuarioAlmacenList = new List<UsuarioAlmacenBE>();

            UsuarioAlmacenBE objUsuarioAlmacen;

            using (IDataReader dr = SqlHelper.Instance.ExecuteReader("SP_OBTENER_USUARIOALMACEN"))
            {
                while (dr.Read())
                {
                    objUsuarioAlmacen = new UsuarioAlmacenBE();
                    objUsuarioAlmacen.In_idAlmacen = dr.GetInt32(dr.GetOrdinal("idAlmacen"));
                    objUsuarioAlmacen.Vc_descripcionAlmacen = dr.GetString(dr.GetOrdinal("descripcionAlmacen"));
                    usuarioAlmacenList.Add(objUsuarioAlmacen);
                }
            }
            return usuarioAlmacenList;
        }
    }
}
