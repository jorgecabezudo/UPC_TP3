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
    public partial class frmAtenderMovimientosAlmacen : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                int idDocPendiente = 0;
                idDocPendiente = Convert.ToInt32(Request.QueryString["id"].ToString());

                ObtenerDocumentoPendiente(idDocPendiente);
            }
        }

        protected override void OnInit(EventArgs e)
        {
            CallbackManager.Register(ObtenerDetalleDocPendienteEventHandler);
            CallbackManager.Register(EditarDetalleMovimientoEventHandler);
            CallbackManager.Register(GuardarDetalleMovimientoEventHandler);

            base.OnInit(e);
        }

        protected void ObtenerDocumentoPendiente(int id)
        {
            MovimientosAlmacenBE objDocumento = new MovimientosAlmacenBL().ObtenerDocumentoPendiente(id);

            txtTipoMovimiento.Text = objDocumento.Vc_tipoMovimiento;
            txtSituacionAtencion.Text = objDocumento.Vc_situacionAtencion;
            txtAlmacen.Text = objDocumento.Vc_almacen;
            txtFechaMovimiento.Text = objDocumento.Dt_fechaDocumento.ToString();
            idDocPendiente.Value = id.ToString();
        }

        public string ObtenerDetalleDocPendienteEventHandler(string arg)
        {
            try
            {
                Hashtable data = JsonSerializer.FromJson<Hashtable>(arg);
                int id = int.Parse(data["In_idDocPendiente"].ToString());

                List<MovimientosAlmacenDetalleBE> listDetalleMovimientos = new MovimientosAlmacenDetalleBL().ObtenerDetalleMovimientos(id);

                gvMovimientos.DataSource = listDetalleMovimientos;
                gvMovimientos.DataBind();

                return JsonSerializer.ToJson(new
                {
                    resultado = gvMovimientos.GetHtml(),
                    rows = listDetalleMovimientos.Count.ToString()
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

        public string EditarDetalleMovimientoEventHandler(string arg)
        {

            string result = string.Empty;
            try
            {
                Hashtable data = JsonSerializer.FromJson<Hashtable>(arg);
                MovimientosAlmacenDetalleBE oBe = new MovimientosAlmacenDetalleBE()
                {
                    In_idDocPendiente = int.Parse(data["IN_idDocPendiente"].ToString()),
                    In_idProducto = int.Parse(data["IN_idProducto"].ToString()),
                    In_cantidadAtendida = int.Parse(data["IN_cantidad"].ToString())
                };

                result = new MovimientosAlmacenDetalleBL().EditarDetalleMovimiento(oBe).ToString();
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return result.ToString();
        }

        public string GuardarDetalleMovimientoEventHandler(string arg)
        {
            string result = string.Empty;
            try
            {
                Hashtable data = JsonSerializer.FromJson<Hashtable>(arg);
                MovimientosAlmacenDetalleBE oBe = new MovimientosAlmacenDetalleBE()
                {
                    In_idDocPendiente = int.Parse(data["IN_idDocPendiente"].ToString())
                };

                result = new MovimientosAlmacenDetalleBL().GuardarDetalleMovimiento(oBe).ToString();

            }
            catch (Exception ex)
            {
                throw ex;
            }

            return result.ToString();
        }
    }
}