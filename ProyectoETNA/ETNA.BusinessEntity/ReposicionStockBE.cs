using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ETNA.BusinessEntity
{
    public class ReposicionStockBE
    {
        #region Fields

        //tabla producto
        private int in_idProducto;
        private string vc_codigoProducto;
        private string vc_descripcionProducto;

        //tabla stock
        private int in_idAlmacen;
        private int in_cantidad;
        private int in_cantidadReservada;

        private string ch_Cod_Usuario;

        #endregion

        #region Constructors

        public ReposicionStockBE()
        {
        }

        #endregion

        #region Properties

        public int In_idProducto
        {
            get { return in_idProducto; }
            set { in_idProducto = value; }
        }

        public string Vc_codigoProducto
        {
            get { return vc_codigoProducto; }
            set { vc_codigoProducto = value; }
        }

        public string Vc_descripcionProducto
        {
            get { return vc_descripcionProducto; }
            set { vc_descripcionProducto = value; }
        }

        public int In_idAlmacen
        {
            get { return in_idAlmacen; }
            set { in_idAlmacen = value; }
        }

        public int In_cantidad
        {
            get { return in_cantidad; }
            set { in_cantidad = value; }
        }

        public int In_cantidadReservada
        {
            get { return in_cantidadReservada; }
            set { in_cantidadReservada = value; }
        }

        public string Ch_Cod_Usuario
        {
            get { return ch_Cod_Usuario; }
            set { ch_Cod_Usuario = value; }
        }

        #endregion
    }
}
