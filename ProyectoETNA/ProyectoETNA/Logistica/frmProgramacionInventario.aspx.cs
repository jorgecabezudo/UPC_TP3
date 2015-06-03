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
    public partial class frmProgramacionInventario : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                LoadMetodos();
        }

        protected override void OnInit(EventArgs e)
        {
            CallbackManager.Register(ObtenerInventariosProgramadosEventHandler);
            CallbackManager.Register(RegistrarInventarioProgramadoEventHandler);
            CallbackManager.Register(ActualizarInventarioProgramadoEventHandler);
            CallbackManager.Register(EliminarInventarioProgramadoEventHandler);
            base.OnInit(e);
        }

        protected void LoadMetodos()
        {
            CargarTipoInventarios();
            CargarAlmacenes();
            CargarResponsable();
        }

        protected void CargarResponsable()
        {
            txtResponsableNuevo.Text = LoginInfo.NombreUsuario;
            idResponsableNuevo.Value = LoginInfo.CodigoUsuario;
            
            txtResponsableEdit.Text = LoginInfo.NombreUsuario;
            idResponsableEdit.Value = LoginInfo.CodigoUsuario;
        }

        protected void CargarTipoInventarios()
        {
            try
            {
                ddlTipoInventario.DataSource = new TipoBL().ObtenerTipoInventario();
                ddlTipoInventario.DataValueField = "In_Id_Tipo";
                ddlTipoInventario.DataTextField = "Vc_Nombre";
                ddlTipoInventario.DataBind();

                ddlTipoInventarioNuevo.DataSource = new TipoBL().ObtenerTipoInventario();
                ddlTipoInventarioNuevo.DataValueField = "In_Id_Tipo";
                ddlTipoInventarioNuevo.DataTextField = "Vc_Nombre";
                ddlTipoInventarioNuevo.DataBind();

                ddlTipoInventarioEdit.DataSource = new TipoBL().ObtenerTipoInventario();
                ddlTipoInventarioEdit.DataValueField = "In_Id_Tipo";
                ddlTipoInventarioEdit.DataTextField = "Vc_Nombre";
                ddlTipoInventarioEdit.DataBind();

                ddlTipoInventario.Items.Insert(0, new ListItem("------ Todos ------", "0"));
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

                ddlAlmacenNuevo.DataSource = new UsuarioAlmacenBL().ObtenerAlmacen(cod);
                ddlAlmacenNuevo.DataValueField = "In_idAlmacen";
                ddlAlmacenNuevo.DataTextField = "Vc_descripcionAlmacen";
                ddlAlmacenNuevo.DataBind();

                ddlAlmacenEdit.DataSource = new UsuarioAlmacenBL().ObtenerAlmacen(cod);
                ddlAlmacenEdit.DataValueField = "In_idAlmacen";
                ddlAlmacenEdit.DataTextField = "Vc_descripcionAlmacen";
                ddlAlmacenEdit.DataBind();

                ddlAlmacen.Items.Insert(0, new ListItem("------ Todos ------", "0"));
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public string RegistrarInventarioProgramadoEventHandler(string arg)
        {
            string result = string.Empty;
            try
            {
                Hashtable data = JsonSerializer.FromJson<Hashtable>(arg);
                if (data["DT_fechaProgramada"].ToString() != "")
                {
                    ProgramacionInventarioBE oBe = new ProgramacionInventarioBE()
                    {
                        Dt_fechaProgramada = DateTime.Parse(data["DT_fechaProgramada"].ToString()),
                        In_tipoInventario = int.Parse(data["IN_tipoInventario"].ToString()),
                        Ch_Cod_Usuario = data["CH_codUsuario"].ToString(),
                        In_idAlmacen = int.Parse(data["IN_almacen"].ToString())
                    };

                    result = new ProgramacionInventarioBL().RegistrarInventariosProgramados(oBe).ToString();
                }
                else { 
                    result = "3"; 
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return result.ToString();
        }

        public string ActualizarInventarioProgramadoEventHandler(string arg)
        {
            string result = string.Empty;
            try
            {
                Hashtable data = JsonSerializer.FromJson<Hashtable>(arg);
                ProgramacionInventarioBE oBe = new ProgramacionInventarioBE()
                {
                    In_idProgInventario = int.Parse(data["IN_idProgInventario"].ToString()),
                    Dt_fechaProgramada = DateTime.Parse(data["DT_fechaProgramada"].ToString()),
                    In_tipoInventario = int.Parse(data["IN_tipoInventario"].ToString()),
                    In_idAlmacen = int.Parse(data["IN_almacen"].ToString())
                };

                result = new ProgramacionInventarioBL().ActualizarInventariosProgramados(oBe).ToString();

            }
            catch (Exception ex)
            {
                throw ex;
            }

            return result.ToString();
        }

        public string EliminarInventarioProgramadoEventHandler(string arg)
        {
            string result = string.Empty;
            try
            {
                Hashtable data = JsonSerializer.FromJson<Hashtable>(arg);
                ProgramacionInventarioBE oBe = new ProgramacionInventarioBE()
                {
                    In_idProgInventario = int.Parse(data["IN_idProgInventario"].ToString())
                };

                result = new ProgramacionInventarioBL().EliminarInventariosProgramados(oBe).ToString();

            }
            catch (Exception ex)
            {
                throw ex;
            }

            return result.ToString();
        }

        public string ObtenerInventariosProgramadosEventHandler(string arg)
        {
            try
            {

                Hashtable data = JsonSerializer.FromJson<Hashtable>(arg);
                ProgramacionInventarioBE oBe = new ProgramacionInventarioBE()
                {
                    In_tipoInventario = int.Parse(data["IN_tipoInventario"].ToString()),
                    In_idAlmacen = int.Parse(data["IN_almacen"].ToString())
                };
                List<ProgramacionInventarioBE> listInventarios = new ProgramacionInventarioBL().ObtenerInventariosProgramados(oBe);
                Session["lbeInventarios"] = listInventarios;
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