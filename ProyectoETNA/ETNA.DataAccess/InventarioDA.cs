using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ETNA.BusinessEntity;

namespace ETNA.DataAccess
{
    public class InventarioDA
    {
        public InventarioBE ObtenerInventario(InventarioBE oBe)
        {
            Dictionary<string, object> parameter = new Dictionary<string, object>();

            parameter.Add("@CH_CODUSUARIO", oBe.Ch_cod_Usuario);
            parameter.Add("@IN_IDALMACEN", oBe.In_idAlmacen);

            InventarioBE objInventario = new InventarioBE();

            using (IDataReader dr = SqlHelper.Instance.ExecuteReader("SP_OBTENER_INVENTARIO", parameter))
            {
                while (dr.Read())
                {
                    objInventario.In_idInventario = dr.GetInt32(dr.GetOrdinal("id"));
                    objInventario.Dt_fechaHoraInicio = dr.GetDateTime(dr.GetOrdinal("fechaInicio"));
                    objInventario.Vc_tipo = dr.GetString(dr.GetOrdinal("tipo"));
                    objInventario.Vc_responsable = dr.GetString(dr.GetOrdinal("responsable"));
                }
            }
            return objInventario;
        }
    }
}
