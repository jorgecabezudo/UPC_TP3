using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ETNA.BusinessEntity
{
    public class MovimientosAlmacenBE
    {
        #region Fields

        // documentoPendiente
        private int in_idDocPendiente;
        private string ch_numeroDocPendiente;
        private int in_tipoDocumentoPendiente;
        private int in_idClienteProveedor;
        private DateTime dt_fechaDocumento;
        private int in_situacionAtencion;
        private int in_activo;
        private int in_tipoMovimiento;
        private int in_idAlmacen;
        private string ch_Cod_Usuario;
        private DateTime dt_fechaCreacion;

        private string vc_tipoDocumentoPendiente;
        private string vc_situacionAtencion;
        private string vc_almacen;
        private string vc_tipoMovimiento;

        #endregion

        #region Constructors

        public MovimientosAlmacenBE()
        {
        }

        public MovimientosAlmacenBE(int in_idDocPendiente,
            string ch_numeroDocPendiente,
            int in_tipoDocumentoPendiente,
            int in_idClienteProveedor,
            DateTime dt_fechaDocumento,
            int in_situacionAtencion,
            int in_activo,
            int in_tipoMovimiento,
            int in_idAlmacen,
            string ch_Cod_Usuario,
            DateTime dt_fechaCreacion
            )
        {
            this.in_idDocPendiente         = in_idDocPendiente        ;
            this.ch_numeroDocPendiente     = ch_numeroDocPendiente    ;
            this.in_tipoDocumentoPendiente = in_tipoDocumentoPendiente;
            this.in_idClienteProveedor     = in_idClienteProveedor    ;
            this.dt_fechaDocumento         = dt_fechaDocumento        ;
            this.in_situacionAtencion      = in_situacionAtencion     ;
            this.in_activo                 = in_activo                ;
            this.in_tipoMovimiento         = in_tipoMovimiento        ;
            this.in_idAlmacen              = in_idAlmacen             ;
            this.ch_Cod_Usuario            = ch_Cod_Usuario           ;
            this.dt_fechaCreacion          = dt_fechaCreacion         ;
        }

        #endregion

        #region Properties

        public int In_idDocPendiente
        {
            get { return in_idDocPendiente; }
            set { in_idDocPendiente = value; }
        }

        public string Ch_numeroDocPendiente
        {
            get { return ch_numeroDocPendiente; }
            set { ch_numeroDocPendiente = value; }
        }
        
        public int In_tipoDocumentoPendiente
        {
            get { return in_tipoDocumentoPendiente; }
            set { in_tipoDocumentoPendiente = value; }
        }
        
        public int In_idClienteProveedor
        {
            get { return in_idClienteProveedor; }
            set { in_idClienteProveedor = value; }
        }

        public DateTime Dt_fechaDocumento
        {
            get { return dt_fechaDocumento; }
            set { dt_fechaDocumento = value; }
        }
        
        public int In_situacionAtencion
        {
            get { return in_situacionAtencion; }
            set { in_situacionAtencion = value; }
        }

        public int In_activo
        {
            get { return in_activo; }
            set { in_activo = value; }
        }

        public int In_tipoMovimiento
        {
            get { return in_tipoMovimiento; }
            set { in_tipoMovimiento = value; }
        }

        public int In_idAlmacen
        {
            get { return in_idAlmacen; }
            set { in_idAlmacen = value; }
        }

        public string Ch_Cod_Usuario
        {
            get { return ch_Cod_Usuario; }
            set { ch_Cod_Usuario = value; }
        }
        
        public DateTime Dt_fechaCreacion
        {
            get { return dt_fechaCreacion; }
            set { dt_fechaCreacion = value; }
        }

        public string Vc_tipoDocumentoPendiente
        {
            get { return vc_tipoDocumentoPendiente; }
            set { vc_tipoDocumentoPendiente = value; }
        }

        public string Vc_situacionAtencion
        {
            get { return vc_situacionAtencion; }
            set { vc_situacionAtencion = value; }
        }
               
        public string Vc_almacen
        {
            get { return vc_almacen; }
            set { vc_almacen = value; }
        }
        
        public string Vc_tipoMovimiento
        {
            get { return vc_tipoMovimiento; }
            set { vc_tipoMovimiento = value; }
        }
        
        #endregion
    }
}
