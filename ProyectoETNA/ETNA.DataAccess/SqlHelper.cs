using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Reflection;
using System.Text;

namespace ETNA.DataAccess
{
    class SqlHelper
    {
        #region "Singleton"

        private static SqlHelper _instance = null;

        public static SqlHelper Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new SqlHelper();
                return _instance;
            }
        }
        #endregion

        public DataTable LoadTable(string storedProcedureName, Dictionary<string, object> parameters)
        {
            string strConn = ConfigurationManager.ConnectionStrings["cnETNA"].ConnectionString;
            string strProvider = ConfigurationManager.ConnectionStrings["cnETNA"].ProviderName;
            DataTable dtTable = new DataTable();
            DbProvider database = new DbProvider(strConn, strProvider);
            DbCommand command = database.GetStoredProcCommand(storedProcedureName);
            foreach (KeyValuePair<string, object> parameter in parameters)
            {
                database.AddInParameter(command, parameter.Key, parameter.Value);
            }
            dtTable.Load(database.ExecuteReader(command));
            return dtTable;
        }

        public DataTable LoadTable(string storedProcedureName)
        {
            string strConn = ConfigurationManager.ConnectionStrings["cnETNA"].ConnectionString;
            string strProvider = ConfigurationManager.ConnectionStrings["cnETNA"].ProviderName;
            DataTable dtTable = new DataTable();
            DbProvider database = new DbProvider(strConn, strProvider);
            DbCommand command = database.GetStoredProcCommand(storedProcedureName);
            dtTable.Load(database.ExecuteReader(command));
            return dtTable;
        }

        public int ExecuteNonQuery(string storedProcedureName, Dictionary<string, object> parameters)
        {
            string strConn = ConfigurationManager.ConnectionStrings["cnETNA"].ConnectionString;
            string strProvider = ConfigurationManager.ConnectionStrings["cnETNA"].ProviderName;
            DbProvider database = new DbProvider(strConn, strProvider);
            DbCommand command = database.GetStoredProcCommand(storedProcedureName);
            foreach (KeyValuePair<string, object> parameter in parameters)
            {
                database.AddInParameter(command, parameter.Key, parameter.Value);
            }
            return database.ExecuteNonQuery(command);
        }
        public object ExecuteScalar(string storedProcedureName, Dictionary<string, object> parameters)
        {
            string strConn = ConfigurationManager.ConnectionStrings["cnETNA"].ConnectionString;
            string strProvider = ConfigurationManager.ConnectionStrings["cnETNA"].ProviderName;
            DbProvider database = new DbProvider(strConn, strProvider);
            DbCommand command = database.GetStoredProcCommand(storedProcedureName);
            foreach (KeyValuePair<string, object> parameter in parameters)
            {
                database.AddInParameter(command, parameter.Key, parameter.Value);
            }
            return database.ExecuteScalar(command);
        }


        public IDataReader ExecuteReader(string storedProcedureName, Dictionary<string, object> parameters)
        {
            string strConn = ConfigurationManager.ConnectionStrings["cnETNA"].ConnectionString;
            string strProvider = ConfigurationManager.ConnectionStrings["cnETNA"].ProviderName;
            DbProvider database = new DbProvider(strConn, strProvider);
            DbCommand command = database.GetStoredProcCommand(storedProcedureName);
            foreach (KeyValuePair<string, object> parameter in parameters)
            {
                database.AddInParameter(command, parameter.Key, parameter.Value);
            }
            IDataReader dr = database.ExecuteReader(command);
            return dr;
        }

        public IDataReader ExecuteReader(string storedProcedureName)
        {
            string strConn = ConfigurationManager.ConnectionStrings["cnETNA"].ConnectionString;
            string strProvider = ConfigurationManager.ConnectionStrings["cnETNA"].ProviderName;
            DbProvider database = new DbProvider(strConn, strProvider);
            DbCommand command = database.GetStoredProcCommand(storedProcedureName);
            IDataReader dr = database.ExecuteReader(command);
            return dr;
        }
        public void BatchBulkCopy(DataTable dataTable, String DestinationTable, int batchSize, List<string> columnMapping)
        {
            try
            {

                string strConn = ConfigurationManager.ConnectionStrings["cnETNA"].ConnectionString;
                string strProvider = ConfigurationManager.ConnectionStrings["cnETNA"].ProviderName;
                DbProvider database = new DbProvider(strConn, strProvider);
                database.ExecuteBatchBulkCopy(dataTable, DestinationTable, batchSize, columnMapping);
            }
            catch (Exception)
            {

                throw;
            }
        }
        public void SetEntity(object entidad, IDataReader dr)
        {

            PropertyInfo[] propertyInfoList = entidad.GetType().GetProperties();
            foreach (PropertyInfo propertyInfo in propertyInfoList)
            {
                try
                {
                    int index = dr.GetOrdinal(propertyInfo.Name);
                    if (!dr.IsDBNull(index))
                    {
                        propertyInfo.SetValue(entidad, dr.GetValue(index), null);
                    }

                }
                catch
                {

                }
            }

        }
    }
}
