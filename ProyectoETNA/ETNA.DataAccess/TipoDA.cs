using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using ETNA.BusinessEntity;

namespace ETNA.DataAccess
{
    // Clase y métodos para obtener las listas (combobox, listbox) usadas en el sistema
    // Los métodos invocan al método genérico ObtenerTipo para acceder a la tabla de listas
    // La tabla de listas (TablaTipo) contiene los identificadores de cada elemento,
    // el nombre de la lista y la descripción de cada identificador de la lista
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

        // El método ObtenerTipo requiere el código o identificador de la lista
        private List<TipoBE> ObtenerTipo(string strTipoTabla)
        {
            // Se instancia la variable de parámetros para el procedimiento
            Dictionary<string, object> parameter = new Dictionary<string, object>();

            // Asignar el identificador de la lista
            parameter.Add("@IN_TIPOTABLA", strTipoTabla);

            // Instanciar las variables para almacenar el contenido
            List<TipoBE> tipoList = new List<TipoBE>();
            TipoBE objTipo;

            // Invocar al procedimiento que retorna los elementos de una lista
            using (IDataReader dr = SqlHelper.Instance.ExecuteReader("SP_OBTENER_TIPO", parameter))
            {
                // Si hay elementos
                while (dr.Read())
                {
                    // Instanciar el objeto del elemento
                    objTipo = new TipoBE();
                    // Asignar las columnas retornadas por el cursor
                    objTipo.In_Id_Tipo = dr.GetInt32(dr.GetOrdinal("idTipo"));
                    objTipo.Vc_Nombre = dr.GetString(dr.GetOrdinal("nombre"));
                    // Agregar un elemento a la lista
                    tipoList.Add(objTipo);
                }
            }
            // Retornar la lista de elementos
            return tipoList;
        }
    }
}
