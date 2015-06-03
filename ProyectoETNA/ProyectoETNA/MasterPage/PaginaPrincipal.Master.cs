using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using ETNA.BusinessEntity;

namespace ProyectoETNA.MasterPage
{
    public partial class PaginaPrincipal : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
            if (!IsPostBack)
            {
                if (!System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    Session.Abandon();
                    FormsAuthentication.SignOut();
                    FormsAuthentication.RedirectToLoginPage();
                }
                if (Session["LogUsuario"] != null)
                {
                    PersonaBE UsuarioObj = Session["LogUsuario"] as PersonaBE;
                    lblNombreUsuario.Text = "Bienvenido(a) :  " + UsuarioObj.Vc_nombres + " - " + UsuarioObj.Vc_tipoUsuario;
                }
                else
                {
                    Session.Abandon();
                    FormsAuthentication.SignOut();
                    Response.Redirect("../frmLogin.aspx");
                }
            }
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            FormsAuthentication.SignOut();
            FormsAuthentication.RedirectToLoginPage();
        }
    }

    public class LoginInfo : PaginaPrincipal
    {
        object UsuarioObj = HttpContext.Current.Session["LogUsuario"];
        PersonaBE UsuarioBEObj;
        public string GUIDCurrent { get; set; }

        public LoginInfo()
        {
            if (HttpContext.Current.Session["LogUsuario"] != null)
            {
                UsuarioBEObj = HttpContext.Current.Session["LogUsuario"] as PersonaBE;
            }
            else
            {
                Session.Abandon();
                FormsAuthentication.RedirectToLoginPage();
            }
        }

        public static string CodigoUsuario
        {
            get
            {
                if (HttpContext.Current.Session["LogUsuario"] != null)
                {
                    return (HttpContext.Current.Session["LogUsuario"] as PersonaBE).Ch_Cod_Usuario;
                }
                else return "0";
            }
        }

        public static string NombreUsuario
        {
            get
            {
                if (HttpContext.Current.Session["LogUsuario"] != null)
                {
                    return (HttpContext.Current.Session["LogUsuario"] as PersonaBE).Vc_nombres;
                }
                else return "";
            }
        }
    }
}