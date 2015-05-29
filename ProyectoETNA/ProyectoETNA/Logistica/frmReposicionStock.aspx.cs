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
            CallbackManager.Register(EditarStockProductoEventHandler);
            CallbackManager.Register(RealizarPedidoEventHandler);

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

        public string EditarStockProductoEventHandler(string arg)
        {

            string result = string.Empty;
            try
            {
                Hashtable data = JsonSerializer.FromJson<Hashtable>(arg);
                ReposicionStockBE oBe = new ReposicionStockBE()
                {
                    In_idAlmacen = int.Parse(data["IN_almacen"].ToString()),
                    In_idProducto = int.Parse(data["IN_idProducto"].ToString()),
                    In_cantidadReservada = int.Parse(data["IN_cantidad"].ToString())
                };

                result = new ReposicionStockBL().EditarStockProducto(oBe).ToString();
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return result.ToString();
        }

        public string RealizarPedidoEventHandler(string arg)
        {
            string result = string.Empty;
            try
            {
                Hashtable data = JsonSerializer.FromJson<Hashtable>(arg);
                ReposicionStockBE oBe = new ReposicionStockBE()
                {
                    Vc_codigoProducto = data["VC_codigo"].ToString(),
                    Vc_descripcionProducto = data["VC_nombre"].ToString(),
                    In_idAlmacen = int.Parse(data["IN_almacen"].ToString())
                };

                result = new ReposicionStockBL().RealizarPedido(oBe).ToString();

            }
            catch (Exception ex)
            {
                throw ex;
            }

            return result.ToString();
        }
    }
}