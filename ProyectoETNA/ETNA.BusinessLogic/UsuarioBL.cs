using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ETNA.DataAccess;
using ETNA.BusinessEntity;

namespace ETNA.BusinessLogic
{
    public class UsuarioBL
    {
        private static UsuarioDA objUsuario;

        public UsuarioBL()
        {
            objUsuario = new UsuarioDA();
        }

        public string ValidarUsuario(string usuario, string password)
        {
            return objUsuario.ValidarUsuario(usuario, password);
        }

        public PersonaBE ObtenerInfoUsuarioLogin(string codigo)
        {
            return objUsuario.ObtenerInfoUsuarioLogin(codigo);
        }
    }
}
