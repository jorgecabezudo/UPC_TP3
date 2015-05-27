using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using ETNA.BusinessEntity;

namespace ETNA.DataAccess
{
    public class MovimientosAlmacenDetalleDA
    {
        public List<MovimientosAlmacenDetalleBE> ObtenerDetalleMovimientos(int id)
        {
            List<MovimientosAlmacenDetalleBE> listDetalleMovimientos = new List<MovimientosAlmacenDetalleBE>();

            Dictionary<string, object> parameter = new Dictionary<string, object>();

            parameter.Add("@IN_IDDOCPENDIENTE", id);

            MovimientosAlmacenDetalleBE objDetalleMovimientos;

            using (IDataReader dr = SqlHelper.Instance.ExecuteReader("SP_OBTENER_DETALLEMOVIMIENTOS", parameter))
            {
                while (dr.Read())
                {
                    objDetalleMovimientos = new MovimientosAlmacenDetalleBE();
                    objDetalleMovimientos.In_idDocPendiente = id;
                    objDetalleMovimientos.In_idProducto = dr.GetInt32(dr.GetOrdinal("idProducto"));
                    objDetalleMovimientos.In_cantidadPedida = dr.GetInt32(dr.GetOrdinal("cantidadPedida"));
                    objDetalleMovimientos.In_cantidadAtendida = dr.GetInt32(dr.GetOrdinal("cantidadAtendida"));
                    objDetalleMovimientos.Vc_codigoProducto = dr.GetString(dr.GetOrdinal("codigoProducto"));
                    objDetalleMovimientos.Vc_descripcionProducto = dr.GetString(dr.GetOrdinal("descripcionProducto"));
                    listDetalleMovimientos.Add(objDetalleMovimientos);
                }
            }
            return listDetalleMovimientos;
        }

        public int EditarDetalleMovimiento(MovimientosAlmacenDetalleBE oBe)
        {
            try
            {
                int rpta = 0;
                Dictionary<string, object> parameter = new Dictionary<string, object>();
                parameter.Add("@IN_IDDOCPENDIENTE", oBe.In_idDocPendiente);
                parameter.Add("@IN_IDPRODUCTO", oBe.In_idProducto);
                parameter.Add("@IN_CANTIDAD", oBe.In_cantidadAtendida);
                rpta = int.Parse(SqlHelper.Instance.ExecuteScalar("SP_EDITAR_DETALLEMOVIMIENTO", parameter).ToString());
                return rpta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public int GuardarDetalleMovimiento(MovimientosAlmacenDetalleBE oBe)
        {
            try
            {
                int rpta = 0;
                Dictionary<string, object> parameter = new Dictionary<string, object>();
                parameter.Add("@IN_IDDOCPENDIENTE", oBe.In_idDocPendiente);
                rpta = int.Parse(SqlHelper.Instance.ExecuteScalar("SP_GUARDAR_DETALLEMOVIMIENTO", parameter).ToString());
                return rpta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
