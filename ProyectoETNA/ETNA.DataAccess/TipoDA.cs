using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using ETNA.BusinessEntity;

namespace ETNA.DataAccess
{
    public class TipoDA
    {
        public List<TipoBE> ObtenerTipoInventario()
        {
            return ObtenerTipo("tipoInventario");
        }

        public List<TipoBE> ObtenerTipoMovimiento()
        {
            return ObtenerTipo("tipoMovimiento");
        }

        public List<TipoBE> ObtenerTipoPersona()
        {
            return ObtenerTipo("tipoPersona");
        }

        public List<TipoBE> ObtenerTipoProducto()
        {
            return ObtenerTipo("tipoProducto");
        }

        public List<TipoBE> ObtenerTipoDocumentoPendiente()
        {
            return ObtenerTipo("tipoDocumentoPendiente");
        }

        public List<TipoBE> ObtenerTipoEstadoInventario()
        {
            return ObtenerTipo("tipoEstadoInventario");
        }

        public List<TipoBE> ObtenerTipoDocIdentidad()
        {
            return ObtenerTipo("tipoDocIdentidad");
        }

        public List<TipoBE> ObtenerEstadoAtencion()
        {
            return ObtenerTipo("estadoAtencion");
        }

        private List<TipoBE> ObtenerTipo(string strTipoTabla)
        {
            Dictionary<string, object> parameter = new Dictionary<string, object>();

            parameter.Add("@IN_TIPOTABLA", strTipoTabla);

            List<TipoBE> tipoList = new List<TipoBE>();
            TipoBE objTipo;

            using (IDataReader dr = SqlHelper.Instance.ExecuteReader("SP_OBTENER_TIPO", parameter))
            {
                while (dr.Read())
                {
                    objTipo = new TipoBE();
                    objTipo.In_Id_Tipo = dr.GetInt32(dr.GetOrdinal("idTipo"));
                    objTipo.Vc_Nombre = dr.GetString(dr.GetOrdinal("nombre"));
                    tipoList.Add(objTipo);
                }
            }
            return tipoList;
        }
    }
}
