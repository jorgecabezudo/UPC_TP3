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
using ProyectoETNA.MasterPage;

namespace ProyectoETNA.Logistica
{
    public partial class frmConsultaMovimientosAlmacen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                LoadMetodos();
        }

        protected override void OnInit(EventArgs e)
        {
            CallbackManager.Register(ObtenerMovimientosAlmacenEventHandler);

            base.OnInit(e);
        }

        protected void LoadMetodos()
        {
            CargarEstadoAtencion();
            CargarAlmacenes();
            CargarTipoMovimiento();
        }

        protected void CargarEstadoAtencion()
        {
            try
            {
                ddlEstadoAtencion.DataSource = new TipoBL().ObtenerEstadoAtencion();
                ddlEstadoAtencion.DataValueField = "In_Id_Tipo";
                ddlEstadoAtencion.DataTextField = "Vc_Nombre";
                ddlEstadoAtencion.DataBind();

                ddlEstadoAtencion.Items.Insert(0, new ListItem("------ Todos ------", "0"));
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void CargarTipoMovimiento()
        {
            try
            {
                ddlTipoMovimiento.DataSource = new TipoBL().ObtenerTipoMovimiento();
                ddlTipoMovimiento.DataValueField = "In_Id_Tipo";
                ddlTipoMovimiento.DataTextField = "Vc_Nombre";
                ddlTipoMovimiento.DataBind();

                ddlTipoMovimiento.Items.Insert(0, new ListItem("------ Todos ------", "0"));
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
                string cod = LoginInfo.CodigoUsuario;

                ddlAlmacen.DataSource = new UsuarioAlmacenBL().ObtenerAlmacen(cod);
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

        public string ObtenerMovimientosAlmacenEventHandler(string arg)
        {
            try
            {

                Hashtable data = JsonSerializer.FromJson<Hashtable>(arg);
                MovimientosAlmacenBE oBe = new MovimientosAlmacenBE()
                {
                    In_situacionAtencion = int.Parse(data["IN_situacionAtencion"].ToString()),
                    In_idAlmacen = int.Parse(data["IN_idAlmacen"].ToString()),
                    In_tipoMovimiento = int.Parse(data["IN_tipoMovimiento"].ToString())
                };

                List<MovimientosAlmacenBE> listMovimientos = new MovimientosAlmacenBL().ObtenerMovimientosAlmacen(oBe);

                gvMovimientos.DataSource = listMovimientos;
                gvMovimientos.DataBind();

                return JsonSerializer.ToJson(new
                {
                    resultado = gvMovimientos.GetHtml(),
                    rows = listMovimientos.Count.ToString()
                });
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}