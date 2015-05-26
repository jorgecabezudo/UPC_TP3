using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ETNA.DataAccess;
using ETNA.BusinessEntity;

namespace ETNA.BusinessLogic
{
    public class MovimientosAlmacenBL
    {
        private static MovimientosAlmacenDA objMovimientosAlmacen;

        public MovimientosAlmacenBL()
        {
            objMovimientosAlmacen = new MovimientosAlmacenDA();
        }

        public List<MovimientosAlmacenBE> ObtenerMovimientosAlmacen(MovimientosAlmacenBE oBe)
        {
            return objMovimientosAlmacen.ObtenerMovimientosAlmacen(oBe);
        }

        public MovimientosAlmacenBE ObtenerDocumentoPendiente(int cod)
        {
            return objMovimientosAlmacen.ObtenerDocumentoPendiente(cod);
        }
    }
}
