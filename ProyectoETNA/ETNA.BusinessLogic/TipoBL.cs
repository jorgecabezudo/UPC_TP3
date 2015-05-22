using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ETNA.DataAccess;
using ETNA.BusinessEntity;

namespace ETNA.BusinessLogic
{
    public class TipoBL
    {
        private static TipoDA objTipo;

        public TipoBL()
        {
            objTipo = new TipoDA();
        }

        public List<TipoBE> ObtenerTipoInventario()
        {
            return objTipo.ObtenerTipoInventario();
        }

        public List<TipoBE> ObtenerTipoEstadoInventario()
        {
            return objTipo.ObtenerTipoEstadoInventario();
        }

        public List<TipoBE> ObtenerEstadoAtencion()
        {
            return objTipo.ObtenerEstadoAtencion();
        }

        public List<TipoBE> ObtenerTipoMovimiento()
        {
            return objTipo.ObtenerTipoMovimiento();
        }
    }
}
