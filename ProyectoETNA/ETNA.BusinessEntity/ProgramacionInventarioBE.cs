using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ETNA.BusinessEntity
{
    public class ProgramacionInventarioBE
    {
        #region Fields

        private int in_idProgInventario;
        private int in_tipoInventario;
        private DateTime dt_fechaProgramada;
        private int in_frecuencia;
        private int in_idAlmacen;
        private int in_idPersona;
        private int in_idEstadoInventario;
        private int in_activo;
        private string ch_Cod_Usuario;

        private string vc_tipoInventario;
        private string vc_almacen;
        private string vc_usuario;
        private string vc_estado;

        #endregion

        #region Constructors

        public ProgramacionInventarioBE()
        {
        }

        public ProgramacionInventarioBE(int in_idProgInventario, int in_tipoInventario, DateTime dt_fechaProgramada,
                                        int in_frecuencia, int in_idAlmacen, int in_idPersona, int in_idEstadoInventario,
                                        int in_activo, string ch_Cod_Usuario)
		{
            this.in_idProgInventario = in_idProgInventario;
            this.in_tipoInventario = in_tipoInventario;
            this.dt_fechaProgramada = dt_fechaProgramada;
            this.in_frecuencia = in_frecuencia;
            this.in_idAlmacen = in_idAlmacen;
            this.in_idPersona = in_idPersona;
            this.in_idEstadoInventario = in_idEstadoInventario;
            this.in_activo = in_activo;
            this.ch_Cod_Usuario = ch_Cod_Usuario;
		}

        #endregion

        #region Properties

        public int In_idProgInventario
        {
            get { return in_idProgInventario; }
            set { in_idProgInventario = value; }
        }

        public int In_tipoInventario
        {
            get { return in_tipoInventario; }
            set { in_tipoInventario = value; }
        }

        public DateTime Dt_fechaProgramada
        {
            get { return dt_fechaProgramada; }
            set { dt_fechaProgramada = value; }
        }

        public int In_frecuencia
        {
            get { return in_frecuencia; }
            set { in_frecuencia = value; }
        }

        public int In_idAlmacen
        {
            get { return in_idAlmacen; }
            set { in_idAlmacen = value; }
        }

        public int In_idPersona
        {
            get { return in_idPersona; }
            set { in_idPersona = value; }
        }

        public int In_idEstadoInventario
        {
            get { return in_idEstadoInventario; }
            set { in_idEstadoInventario = value; }
        }

        public int In_activo
        {
            get { return in_activo; }
            set { in_activo = value; }
        }

        public string Ch_Cod_Usuario
        {
            get { return ch_Cod_Usuario; }
            set { ch_Cod_Usuario = value; }
        }

        public string Vc_tipoInventario
        {
            get { return vc_tipoInventario; }
            set { vc_tipoInventario = value; }
        }

        public string Vc_almacen
        {
            get { return vc_almacen; }
            set { vc_almacen = value; }
        }

        public string Vc_usuario
        {
            get { return vc_usuario; }
            set { vc_usuario = value; }
        }

        public string Vc_estado
        {
            get { return vc_estado; }
            set { vc_estado = value; }
        }

        #endregion
    }
}
