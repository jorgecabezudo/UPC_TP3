using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using EasyCallback;
using ETNA.BusinessEntity;
using ETNA.BusinessLogic;
using Json;

namespace ProyectoETNA
{
    public partial class frmLogin : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ReturnUrl"] != null)
            {
                if (Session["LogUsuario"] != null) FormsAuthentication.RedirectFromLoginPage(Session["LogUsuario"].ToString(), false);
            }
        }

        protected override void OnInit(EventArgs e)
        {
            CallbackManager.Register(LogInEventHandler);

            base.OnInit(e);
        }

        public string LogInEventHandler(string argument)
        {

            try
            {
                Hashtable entity = JsonSerializer.FromJson<Hashtable>(argument);
                string result = new UsuarioBL().ValidarUsuario(entity["usuario"].ToString(), entity["password"].ToString());
                if (result != "0")
                {
                    Session["LogUsuario"] = new UsuarioBL().ObtenerInfoUsuarioLogin(result);

                    return JsonSerializer.ToJson(new
                    {
                        resultado = "ok",
                        mensaje = ""
                    });
                }
                else
                {
                    return JsonSerializer.ToJson(new
                    {
                        resultado = "error",
                        mensaje = "El usuario y la contraseña que ingresaste no coinciden."
                    });
                }
            }
            catch (Exception ex)
            {
                return JsonSerializer.ToJson(new
                {
                    resultado = ex.Message,
                    mensaje = ex.Message
                });
            }

        }
    }
}