using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using ETNA.BusinessEntity;

namespace ETNA.DataAccess
{
    public class ReposicionStockDA
    {
        public List<ReposicionStockBE> ObtenerStockProductos(ReposicionStockBE oBe)
        {
            List<ReposicionStockBE> listStock = new List<ReposicionStockBE>();

            Dictionary<string, object> parameter = new Dictionary<string, object>();

            parameter.Add("@VC_COD_DESCRIP_PRODUCTO", oBe.Vc_codigoProducto + oBe.Vc_descripcionProducto);
            parameter.Add("@IN_IDALMACEN", oBe.In_idAlmacen);

            ReposicionStockBE objStock;

            using (IDataReader dr = SqlHelper.Instance.ExecuteReader("SP_OBTENER_STOCKPRODUCTOS", parameter))
            {
                while (dr.Read())
                {
                    objStock = new ReposicionStockBE();
                    objStock.In_idProducto = dr.GetInt32(dr.GetOrdinal("idProducto"));
                    objStock.Vc_codigoProducto = dr.GetString(dr.GetOrdinal("codigoProducto"));
                    objStock.Vc_descripcionProducto = dr.GetString(dr.GetOrdinal("descripcionProducto"));
                    objStock.In_cantidad = dr.GetInt32(dr.GetOrdinal("cantidad"));
                    objStock.In_cantidadReservada = dr.GetInt32(dr.GetOrdinal("cantidadReservada"));
                    listStock.Add(objStock);
                }
            }
            return listStock;
        }
    }
}
