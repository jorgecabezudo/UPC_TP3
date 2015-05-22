using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ETNA.BusinessEntity
{
    public class DetalleInventarioBE
    {
        #region Fields

        private int in_idDetalleInventario;
        private int in_idInventario;
        private int in_idAlmacen;
        private int in_idProducto;
        private int in_idOperadorAlmacen;
        private int in_cantidadActual;
        private int in_cantidad;
        private int in_cantidadAjuste;
        private DateTime dt_fechaToma;
        private int in_numeroToma;

        private string ch_codUsuario;

        private string vc_producto;

        #endregion

        #region Constructors

        public DetalleInventarioBE()
        {
        }

        #endregion

        #region Properties

        public int In_idDetalleInventario
        {
            get { return in_idDetalleInventario; }
            set { in_idDetalleInventario = value; }
        }

        public int In_idInventario
        {
            get { return in_idInventario; }
            set { in_idInventario = value; }
        }

        public int In_idAlmacen
        {
            get { return in_idAlmacen; }
            set { in_idAlmacen = value; }
        }

        public int In_idProducto
        {
            get { return in_idProducto; }
            set { in_idProducto = value; }
        }

        public int In_idOperadorAlmacen
        {
            get { return in_idOperadorAlmacen; }
            set { in_idOperadorAlmacen = value; }
        }

        public int In_cantidadActual
        {
            get { return in_cantidadActual; }
            set { in_cantidadActual = value; }
        }

        public int In_cantidad
        {
            get { return in_cantidad; }
            set { in_cantidad = value; }
        }

        public int In_cantidadAjuste
        {
            get { return in_cantidadAjuste; }
            set { in_cantidadAjuste = value; }
        }

        public DateTime Dt_fechaToma
        {
            get { return dt_fechaToma; }
            set { dt_fechaToma = value; }
        }

        public int In_numeroToma
        {
            get { return in_numeroToma; }
            set { in_numeroToma = value; }
        }

        public string Ch_codUsuario
        {
            get { return ch_codUsuario; }
            set { ch_codUsuario = value; }
        }

        public string Vc_producto
        {
            get { return vc_producto; }
            set { vc_producto = value; }
        }

        #endregion
    }
}
