using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ETNA.BusinessEntity;
using ETNA.BusinessLogic;

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

        protected void ObtenerDocumentoPendiente(int id)
        {
            MovimientosAlmacenBL objDocumentoBL = new MovimientosAlmacenBL();

            MovimientosAlmacenBE objDocumento = objDocumentoBL.ObtenerDocumentoPendiente(id);

            txtTipoMovimiento.Text = objDocumento.Vc_tipoMovimiento;
            txtSituacionAtencion.Text = objDocumento.Vc_situacionAtencion;
            txtAlmacen.Text = objDocumento.Vc_almacen;
        }
    }
}