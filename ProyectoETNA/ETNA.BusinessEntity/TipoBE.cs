using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ETNA.BusinessEntity
{
    public class TipoBE
    {
        #region Fields

        private int in_Id_Tipo;
        private string vc_Nombre;
        private string vc_Descripcion;
        private string vc_Id_Tabla;

        #endregion

        #region Constructors

        public TipoBE()
        {
        }

        public TipoBE(int in_Id_Tipo, string vc_Nombre, string vc_Descripcion, string vc_Id_Tabla)
		{
            this.in_Id_Tipo = in_Id_Tipo;
            this.vc_Nombre = vc_Nombre;
            this.vc_Descripcion = vc_Descripcion;
            this.vc_Id_Tabla = vc_Id_Tabla;
		}

        #endregion

        #region Properties

        public int In_Id_Tipo
        {
            get { return in_Id_Tipo; }
            set { in_Id_Tipo = value; }
        }

        public string Vc_Nombre
        {
            get { return vc_Nombre; }
            set { vc_Nombre = value; }
        }

        public string Vc_Descripcion
        {
            get { return vc_Descripcion; }
            set { vc_Descripcion = value; }
        }

        public string Vc_Id_Tabla
        {
            get { return vc_Id_Tabla; }
            set { vc_Id_Tabla = value; }
        }

        #endregion
    }
}
