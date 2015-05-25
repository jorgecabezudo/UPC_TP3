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
    public partial class frmTomaInventario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                LoadMetodos();
        }

        protected override void OnInit(EventArgs e)
        {
            CallbackManager.Register(ObtenerInventarioEventHandler);
            CallbackManager.Register(FinalizarTomaInventarioEventHandler);
            CallbackManager.Register(ObtenerDetalleInventarioEventHandler);
            CallbackManager.Register(EditarTomaInventarioEventHandler);

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

        public string ObtenerInventarioEventHandler(string arg)
        {
            try
            {
                Hashtable data = JsonSerializer.FromJson<Hashtable>(arg);
                InventarioBE oBe = new InventarioBE()
                {
                    Ch_cod_Usuario = "1",
                    In_idAlmacen = int.Parse(data["IN_almacen"].ToString())
                };

                InventarioBE objInventario = new InventarioBL().ObtenerInventario(oBe);

                return JsonSerializer.ToJson(new
                {
                    id = objInventario.In_idInventario.ToString(),
                    fechaInicio = objInventario.Dt_fechaHoraInicio.ToString(),
                    tipo = objInventario.Vc_tipo,
                    responsable = objInventario.Vc_responsable
                });
            }
            catch (Exception ex)
            {
                return JsonSerializer.ToJson(new
                {
                    id = "0",
                    fechaInicio = "",
                    tipo = ex.Message,
                    responsable = ""
                });
            }

        }

        public string ObtenerDetalleInventarioEventHandler(string arg)
        {
            try
            {
                Hashtable data = JsonSerializer.FromJson<Hashtable>(arg);
                DetalleInventarioBE oBe = new DetalleInventarioBE()
                {
                    In_idInventario = int.Parse(data["In_idInventario"].ToString())
                };

                List<DetalleInventarioBE> listDetalle = new DetalleInventarioBL().ObtenerDetalleInventario(oBe);

                gvDetalle.DataSource = listDetalle;
                gvDetalle.DataBind();

                return JsonSerializer.ToJson(new
                {
                    resultado = gvDetalle.GetHtml(),
                    rows = listDetalle.Count.ToString()
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


        public string EditarTomaInventarioEventHandler(string arg)
        {

            string result = string.Empty;
            try
            {
                Hashtable data = JsonSerializer.FromJson<Hashtable>(arg);
                /*MR-20150523 - INICIO*/
                if (data["IN_cantidad"].ToString() != "")
                {
                    /*MR-20150523 - FIN*/
                    DetalleInventarioBE oBe = new DetalleInventarioBE()
                    {
                        In_idDetalleInventario = int.Parse(data["IN_idDetalleInventario"].ToString()),
                        In_cantidad = int.Parse(data["IN_cantidad"].ToString())
                    };

                    result = new DetalleInventarioBL().EditarTomaInventario(oBe).ToString();
                }
                /*MR-20150523 - INICIO*/
                else { result = ""; }
                /*MR-20150523 - FIN*/
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return result.ToString();
        }

        public string FinalizarTomaInventarioEventHandler(string arg)
        {
            string result = string.Empty;
            try
            {
                Hashtable data = JsonSerializer.FromJson<Hashtable>(arg);
                DetalleInventarioBE oBe = new DetalleInventarioBE()
                {
                    In_idInventario = int.Parse(data["IN_idInventario"].ToString())
                };

                result = new DetalleInventarioBL().FinalizarTomaInventario(oBe).ToString();

            }
            catch (Exception ex)
            {
                throw ex;
            }

            return result.ToString();
        }
    }
}