using System;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Text;
using System.Web.Configuration;
using System.Xml;
using System.Reflection;

namespace ETNA.DataAccess
{

    /// <summary>
    /// Define los metodos de conexion y ejecuccion de comandos en la Base de Datos
    /// </summary>
    public class DbProvider
    {

        private string cadenaConexion;
        private string providerName;
        private DbProviderFactory factoty;
        /// <summary>
        /// Constructor de la clase
        /// </summary>
        /// <param name="_cadenaConexion">Cadena de conexion</param>
        /// <param name="provider">Tipo de proveedor de Datos</param>
        public DbProvider(string _cadenaConexion, string provider)
        {
            //Inicializamos la cadena de conxion a la base de datos
            cadenaConexion = _cadenaConexion;
            providerName = provider;
            factoty = SqlClientFactory.Instance;
            switch (providerName)
            {
                case "System.Data.SqlClient":
                    factoty = SqlClientFactory.Instance;
                    break;
            }

        }

        /// <summary>
        /// Devuelve un objecto DbCommand que ejecutara el procedure especificado
        /// </summary>
        /// <param name="spNombre">Nombre del procedure</param>
        /// <returns></returns>
        public DbCommand GetStoredProcCommand(String spNombre)
        {
            DbCommand cmd = factoty.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = spNombre;
            return cmd;

        }
        /// <summary>
        /// Devuelve un objeto DBCommand que ejecutara el comando especificado especificado
        /// </summary>
        /// <param name="str_cmd">script a ejecutar</param>
        /// <param name="typo">Tipo de comando</param>
        /// <returns></returns>
        public DbCommand GetCommand(string str_cmd, CommandType typo)
        {
            DbCommand cmd = factoty.CreateCommand();
            cmd.CommandType = typo;
            cmd.CommandText = str_cmd;

            return cmd;

        }
        /// <summary>
        /// Ejecuta el command especificado y devuelve un objecto
        /// </summary>
        /// <param name="cmd">el DbCommand que se ejecutara en la BD</param>
        /// <returns></returns>
        public object ExecuteScalar(IDbCommand cmd)
        {
            object r;
            //se instancia un objeto para la conexion
            using (DbConnection cn = CreaConnexion())
            {
                cmd.Connection = cn;
                cmd.CommandTimeout = Convert.ToInt32(WebConfigurationManager.AppSettings["ValorTimeOut"]);
                cn.Open();
                r = cmd.ExecuteScalar();
            }
            return r;
        }

        /// <summary>
        /// Ejecuta el command y devulve un DataReader para leer los datos obtenidos.
        /// </summary>
        /// <param name="cmd"></param>
        /// <returns></returns>
        public IDataReader ExecuteReader(IDbCommand cmd)
        {

            IDataReader r;
            //se instancia un objeto para la conexion
            DbConnection cn = CreaConnexion();
            cmd.Connection = cn;
            cmd.CommandTimeout = Convert.ToInt32(WebConfigurationManager.AppSettings["ValorTimeOut"]);
            cn.Open();
            r = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            return r;
        }

        /// <summary>
        /// Devuelve el numero de filas afectas al ejecutar el DbCommand
        /// no se necesita abrir la cadena de conexxion
        /// </summary>
        /// <param name="cmd">el DbCommand que se ejecutara en la BD</param>
        /// <returns></returns>
        public int ExecuteNonQuery(IDbCommand cmd)
        {
            int r = 0;
            using (DbConnection cn = CreaConnexion())
            {
                cmd.Connection = cn;
                cmd.CommandTimeout = Convert.ToInt32(WebConfigurationManager.AppSettings["ValorTimeOut"]);
                cn.Open();
                r = cmd.ExecuteNonQuery();
            }

            return r;
        }

        public void ExecuteBatchBulkCopy(DataTable dataTable, String DestinationTable, int batchSize,List<string> columnMapping)
        {
            try
            {
                using (DbConnection cn = CreaConnexion())
                {
                    using (SqlBulkCopy sbc = new SqlBulkCopy(cn.ConnectionString))
                    {
                        sbc.DestinationTableName = DestinationTable;

                        // Number of records to be processed in one go
                        sbc.BatchSize = batchSize;

                        // Add your column mappings here
                        foreach (var mapping in columnMapping)
                        {
                            string[] arr;
                            arr = mapping.Split(new[] { ',' });
                            sbc.ColumnMappings.Add(arr[0], arr[1]);
                        }
                        // Finally write to server
                        sbc.WriteToServer(dataTable);
                        sbc.Close();
                    }
                }
                
            }
            catch (Exception)
            {

                throw;
            }
        }

        /// <summary>
        /// Devuelve el resultado en un data set
        /// </summary>
        /// <param name="cmd"></param>
        /// <returns></returns>
        public DataSet ExecuteDataSet(DbCommand cmd)
        {
            DataSet ds = new DataSet();
            using (DbConnection cn = CreaConnexion())
            {
                cmd.Connection = cn;
                cmd.CommandTimeout = Convert.ToInt32(WebConfigurationManager.AppSettings["ValorTimeOut"]);
                DbDataAdapter da = factoty.CreateDataAdapter();
                da.SelectCommand = cmd;
                da.Fill(ds);
            }
            return ds;

        }


        private DbConnection CreaConnexion()
        {
            DbConnection cn = factoty.CreateConnection();
            cn.ConnectionString = cadenaConexion;
            return cn;
        }

        public void AddInParameter(IDbCommand cmd, string parNombre, DbType tipo, object valor)
        {
            DbParameter par = factoty.CreateParameter();
            par.DbType = tipo;
            par.ParameterName = parNombre;
            par.Value = valor;
            par.Direction = ParameterDirection.Input;
            cmd.Parameters.Add(par);
        }
        public void AddInParameter(IDbCommand cmd, string parNombre, object valor)
        {
            DbParameter par = factoty.CreateParameter();
            par.ParameterName = parNombre;
            par.Value = valor;
            par.Direction = ParameterDirection.Input;
            cmd.Parameters.Add(par);
        }
        /// <summary>
        /// Agrega parametros de salida para ejecutar los commandos en la BD
        /// </summary>
        /// <param name="cmd">DBCommand a ejecutar</param>
        /// <param name="parNombre">Nombre del parametro</param>
        /// <param name="tipo">Tipo de dato del parametro</param>
        /// <param name="valor">Valor del parametro</param>
        public void AddOuputParameter(IDbCommand cmd, string parNombre, DbType tipo, object valor)
        {
            DbParameter par = factoty.CreateParameter();
            par.DbType = tipo;
            par.ParameterName = parNombre;
            par.Value = valor;
            par.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(par);
        }
        public void AddOuputParameter(IDbCommand cmd, string parNombre, object valor)
        {

            DbParameter par = factoty.CreateParameter();
            par.ParameterName = parNombre;
            par.Value = valor;
            par.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(par);
        }
        public void AddOuputParameter(IDbCommand cmd, string parNombre, DbType tipo, int size, object valor)
        {
            DbParameter par = factoty.CreateParameter();
            par.DbType = tipo;
            par.ParameterName = parNombre;
            par.Size = size;
            par.Value = valor;
            par.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(par);
        }
        /// <summary>
        /// Obtiene el valor de los parametros de salida obtenidos despues de ejecutar el Command
        /// </summary>
        /// <param name="cmd">DbCommand</param>
        /// <param name="parameterName">Nombre del parametro de salida</param>
        /// <returns></returns>
        public object GetParameterValue(DbCommand cmd, string parameterName)
        {
            return cmd.Parameters[parameterName].Value;
        }

    }
}
