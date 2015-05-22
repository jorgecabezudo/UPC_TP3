using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ETNA.BusinessEntity
{
    public class UsuarioBE
    {
        #region Fields

        private string ch_Cod_Usuario;
        private string ch_Pwd_Usuario;
        private string vc_Nom_Usuario;
        private string ch_Tipo_Usuario;
        private string ch_Estado_Usuario;

        #endregion

        #region Constructors

        public UsuarioBE()
        {
        }
        
        public UsuarioBE(string ch_Cod_Usuario, string ch_Pwd_Usuario, string vc_Nom_Usuario, string ch_Tipo_Usuario, string ch_Estado_Usuario)
		{
			this.ch_Cod_Usuario = ch_Cod_Usuario;
			this.ch_Pwd_Usuario = ch_Pwd_Usuario;
			this.vc_Nom_Usuario = vc_Nom_Usuario;
			this.ch_Tipo_Usuario = ch_Tipo_Usuario;
			this.ch_Estado_Usuario = ch_Estado_Usuario;
		}

        #endregion

        #region Properties

        public string Ch_Cod_Usuario
        {
            get { return ch_Cod_Usuario; }
            set { ch_Cod_Usuario = value; }
        }

        public string Ch_Pwd_Usuario
        {
            get { return ch_Pwd_Usuario; }
            set { ch_Pwd_Usuario = value; }
        }

        public string Vc_Nom_Usuario
        {
            get { return vc_Nom_Usuario; }
            set { vc_Nom_Usuario = value; }
        }

        public string Ch_Tipo_Usuario
        {
            get { return ch_Tipo_Usuario; }
            set { ch_Tipo_Usuario = value; }
        }

        public string Ch_Estado_Usuario
        {
            get { return ch_Estado_Usuario; }
            set { ch_Estado_Usuario = value; }
        }

        #endregion
    }
}
