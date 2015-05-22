﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ETNA.BusinessEntity;

namespace ETNA.DataAccess
{
    public class MovimientosAlmacenDA
    {
        public List<MovimientosAlmacenBE> ObtenerMovimientosAlmacen(MovimientosAlmacenBE oBe)
        {
            List<MovimientosAlmacenBE> listMovimientosAlmacen = new List<MovimientosAlmacenBE>();

            Dictionary<string, object> parameter = new Dictionary<string, object>();

            parameter.Add("@IN_SITUACIONATENCION", oBe.In_situacionAtencion);
            parameter.Add("@IN_IDALMACEN", oBe.In_idAlmacen);
            parameter.Add("@IN_TIPOMOVIMIENTO", oBe.In_tipoMovimiento);

            MovimientosAlmacenBE objMovimientosAlmacen;

            using (IDataReader dr = SqlHelper.Instance.ExecuteReader("SP_DOCUMENTOPENDIENTE_LISTAR", parameter))
            {
                while (dr.Read())
                {
                    objMovimientosAlmacen = new MovimientosAlmacenBE();
                    objMovimientosAlmacen.Ch_numeroDocPendiente = dr.GetString(dr.GetOrdinal("numeroDocPendiente"));
                    objMovimientosAlmacen.Dt_fechaDocumento = dr.GetDateTime(dr.GetOrdinal("fechaDocumento"));
                    objMovimientosAlmacen.Vc_tipoDocumentoPendiente = dr.GetString(dr.GetOrdinal("descripcionDocumentoPendiente"));
                    objMovimientosAlmacen.Vc_situacionAtencion = dr.GetString(dr.GetOrdinal("descripcionSituacionAtencion"));
                    objMovimientosAlmacen.Vc_tipoMovimiento = dr.GetString(dr.GetOrdinal("descripcionTipoMovimiento"));
                    objMovimientosAlmacen.Vc_almacen = dr.GetString(dr.GetOrdinal("descripcionAlmacen"));
                    listMovimientosAlmacen.Add(objMovimientosAlmacen);
                }
            }
            return listMovimientosAlmacen;
        }
    }
}
