using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EasyCallback;
using ETNA.BusinessEntity;
using ETNA.BusinessLogic;
using Json;

namespace ProyectoETNA.Logistica
{
    public partial class ActualizacionInventario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                LoadMetodos();
        }

        protected override void OnInit(EventArgs e)
        {
            CallbackManager.Register(ObtenerInventariosEventHandler);
            CallbackManager.Register(IniciarInventarioEventHandler);
            CallbackManager.Register(AjustarInventarioEventHandler);
            base.OnInit(e);
        }

        protected void LoadMetodos()
        {
            CargarTipoInventarios();
            CargarAlmacenes();
        }

        protected void CargarTipoInventarios()
        {
            try
            {
                ddlEstadoInventario.DataSource = new TipoBL().ObtenerTipoEstadoInventario();
                ddlEstadoInventario.DataValueField = "In_Id_Tipo";
                ddlEstadoInventario.DataTextField = "Vc_Nombre";
                ddlEstadoInventario.DataBind();

                ddlEstadoInventario.Items.Insert(0, new ListItem("------ Todos ------", "0"));
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void CargarAlmacenes()
        {
            try
            {
                ddlAlmacen.DataSource = new UsuarioAlmacenBL().ObtenerAlmacen();
                ddlAlmacen.DataValueField = "In_idAlmacen";
                ddlAlmacen.DataTextField = "Vc_descripcionAlmacen";
                ddlAlmacen.DataBind();

                ddlAlmacen.Items.Insert(0, new ListItem("------ Todos ------", "0"));
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public string IniciarInventarioEventHandler(string arg)
        {
            string result = string.Empty;
            try
            {
                Hashtable data = JsonSerializer.FromJson<Hashtable>(arg);
                ProgramacionInventarioBE oBe = new ProgramacionInventarioBE()
                {
                    In_idProgInventario = int.Parse(data["IN_idProgInventario"].ToString())
                };

                result = new ProgramacionInventarioBL().IniciarInventario(oBe).ToString();

            }
            catch (Exception ex)
            {
                throw ex;
            }

            return result.ToString();
        }

        public string AjustarInventarioEventHandler(string arg)
        {
            string result = string.Empty;
            try
            {
                Hashtable data = JsonSerializer.FromJson<Hashtable>(arg);
                ProgramacionInventarioBE oBe = new ProgramacionInventarioBE()
                {
                    In_idProgInventario = int.Parse(data["IN_idProgInventario"].ToString())
                };

                result = new ProgramacionInventarioBL().AjustarInventario(oBe).ToString();

            }
            catch (Exception ex)
            {
                throw ex;
            }

            return result.ToString();
        }

        public string ObtenerInventariosEventHandler(string arg)
        {
            try
            {

                Hashtable data = JsonSerializer.FromJson<Hashtable>(arg);
                ProgramacionInventarioBE oBe = new ProgramacionInventarioBE()
                {
                    In_idEstadoInventario = int.Parse(data["IN_estadoInventario"].ToString()),
                    In_idAlmacen = int.Parse(data["IN_almacen"].ToString())
                };

                List<ProgramacionInventarioBE> listInventarios = new ProgramacionInventarioBL().ObtenerInventarios(oBe);

                gvInventarios.DataSource = listInventarios;
                gvInventarios.DataBind();

                return JsonSerializer.ToJson(new
                {
                    resultado = gvInventarios.GetHtml(),
                    rows = listInventarios.Count.ToString()
                });
            }
            catch (Exception ex)
            {
                return JsonSerializer.ToJson(new
                {
                    resultado = ex.Message,
                    rows = 0
                });
            }
        }
    }
}