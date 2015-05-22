using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ETNA.DataAccess;
using ETNA.BusinessEntity;

namespace ETNA.BusinessLogic
{
    public class UsuarioAlmacenBL
    {
        private static UsuarioAlmacenDA objUsuarioAlmacen;

        public UsuarioAlmacenBL()
        {
            objUsuarioAlmacen = new UsuarioAlmacenDA();
        }

        public List<UsuarioAlmacenBE> ObtenerAlmacen()
        {
            return objUsuarioAlmacen.ObtenerAlmacen();
        }
    }
}
