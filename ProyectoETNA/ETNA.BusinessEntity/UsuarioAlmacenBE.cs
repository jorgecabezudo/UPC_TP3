using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ETNA.BusinessEntity
{
    public class UsuarioAlmacenBE
    {
        #region Fields

        private int in_idUsuarioAlmacen;
        private string vc_idUsuario;
        private int in_idAlmacen;
        private string vc_descripcionAlmacen;

        #endregion

        #region Constructors

        public UsuarioAlmacenBE()
        {
        }

        public UsuarioAlmacenBE(int in_idUsuarioAlmacen, string vc_idUsuario, int in_idAlmacen, string vc_descripcionAlmacen)
		{
            this.in_idUsuarioAlmacen = in_idUsuarioAlmacen;
            this.vc_idUsuario = vc_idUsuario;
            this.in_idAlmacen = in_idAlmacen;
            this.vc_descripcionAlmacen = vc_descripcionAlmacen;
		}

        #endregion

        #region Properties

        public int In_idUsuarioAlmacen
        {
            get { return in_idUsuarioAlmacen; }
            set { in_idUsuarioAlmacen = value; }
        }

        public string Vc_idUsuario
        {
            get { return vc_idUsuario; }
            set { vc_idUsuario = value; }
        }

        public int In_idAlmacen
        {
            get { return in_idAlmacen; }
            set { in_idAlmacen = value; }
        }

        public string Vc_descripcionAlmacen
        {
            get { return vc_descripcionAlmacen; }
            set { vc_descripcionAlmacen = value; }
        }

        #endregion
    }
}
