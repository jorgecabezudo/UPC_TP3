using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ETNA.DataAccess;
using ETNA.BusinessEntity;

namespace ETNA.BusinessLogic
{
    public class InventarioBL
    {
        private static InventarioDA objInventario;

        public InventarioBL()
        {
            objInventario = new InventarioDA();
        }

        public InventarioBE ObtenerInventario(InventarioBE oBe)
        {
            return objInventario.ObtenerInventario(oBe);
        }
    }
}
