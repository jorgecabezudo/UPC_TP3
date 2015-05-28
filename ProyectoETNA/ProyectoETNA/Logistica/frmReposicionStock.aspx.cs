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
    public partial class frmReposicionStock : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                LoadMetodos();
        }

        protected override void OnInit(EventArgs e)
        {
            CallbackManager.Register(ObtenerStockProductosEventHandler);

            base.OnInit(e);
        }

        protected void LoadMetodos()
        {
            CargarAlmacenes();
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
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public string ObtenerStockProductosEventHandler(string arg)
        {
            try
            {
                Hashtable data = JsonSerializer.FromJson<Hashtable>(arg);
                ReposicionStockBE oBe = new ReposicionStockBE()
                {
                    Vc_codigoProducto = data["VC_codigo"].ToString(),
                    Vc_descripcionProducto = data["VC_nombre"].ToString(),
                    In_idAlmacen = int.Parse(data["IN_almacen"].ToString())
                };

                List<ReposicionStockBE> listStock = new ReposicionStockBL().ObtenerStockProductos(oBe);

                gvProductos.DataSource = listStock;
                gvProductos.DataBind();

                return JsonSerializer.ToJson(new
                {
                    resultado = gvProductos.GetHtml(),
                    rows = listStock.Count.ToString()
                });
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}