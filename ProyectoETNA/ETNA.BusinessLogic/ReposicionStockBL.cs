using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ETNA.DataAccess;
using ETNA.BusinessEntity;

namespace ETNA.BusinessLogic
{
    public class ReposicionStockBL
    {
        private static ReposicionStockDA objStock;

        public ReposicionStockBL()
        {
            objStock = new ReposicionStockDA();
        }

        public List<ReposicionStockBE> ObtenerStockProductos(ReposicionStockBE oBe)
        {
            return objStock.ObtenerStockProductos(oBe);
        }
    }
}
