using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ETNA.BusinessEntity
{
    public class InventarioBE
    {
        #region Fields

        private int in_idInventario;
        private int in_idAlmacen;
        private int in_idProgInventario;
        private DateTime dt_fechaHoraInicio;
        private DateTime dt_fechaHoraFin;
        private int in_tipo;
        private int in_activo;
        private string ch_cod_Usuario;

        private string vc_tipo;
        private string vc_responsable;

        #endregion

        #region Constructors

        public InventarioBE()
        {
        }

        #endregion

        #region Properties

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

        public int In_idProgInventario
        {
            get { return in_idProgInventario; }
            set { in_idProgInventario = value; }
        }

        public DateTime Dt_fechaHoraInicio
        {
            get { return dt_fechaHoraInicio; }
            set { dt_fechaHoraInicio = value; }
        }

        public DateTime Dt_fechaHoraFin
        {
            get { return dt_fechaHoraFin; }
            set { dt_fechaHoraFin = value; }
        }

        public int In_tipo
        {
            get { return in_tipo; }
            set { in_tipo = value; }
        }

        public int In_activo
        {
            get { return in_activo; }
            set { in_activo = value; }
        }

        public string Ch_cod_Usuario
        {
            get { return ch_cod_Usuario; }
            set { ch_cod_Usuario = value; }
        }

        public string Vc_tipo
        {
            get { return vc_tipo; }
            set { vc_tipo = value; }
        }

        public string Vc_responsable
        {
            get { return vc_responsable; }
            set { vc_responsable = value; }
        }

        #endregion
    }
}
