using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ETNA.DataAccess;

namespace ETNA.BusinessLogic
{
    public class UsuarioBL
    {
        private static UsuarioDA objUsuario;

        public UsuarioBL()
        {
            objUsuario = new UsuarioDA();
        }

        public Int32 ValidarUsuario(string usuario, string password)
        {
            return objUsuario.ValidarUsuario(usuario, password);
        }
    }
}
