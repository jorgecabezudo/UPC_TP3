using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ETNA.BusinessEntity
{
    public class MovimientosAlmacenDetalleBE
    {
        #region Fields

        // documentoPendienteDetalle
        private int in_idDocPendiente;
        private int in_idDetalleDocPendiente;
        private int in_idProducto;
        private int in_cantidadPedida;
        private int in_cantidadAtendida;

        private string vc_codigoProducto;
        private string vc_descripcionProducto;

        #endregion

        #region Constructors

        public MovimientosAlmacenDetalleBE()
        {
        }

        #endregion

        #region Properties

        public int In_idDocPendiente
        {
            get { return in_idDocPendiente; }
            set { in_idDocPendiente = value; }
        }

        public int In_idDetalleDocPendiente
        {
            get { return in_idDetalleDocPendiente; }
            set { in_idDetalleDocPendiente = value; }
        }

        public int In_idProducto
        {
            get { return in_idProducto; }
            set { in_idProducto = value; }
        }

        public int In_cantidadPedida
        {
            get { return in_cantidadPedida; }
            set { in_cantidadPedida = value; }
        }

        public int In_cantidadAtendida
        {
            get { return in_cantidadAtendida; }
            set { in_cantidadAtendida = value; }
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
        
        #endregion
    }
}
