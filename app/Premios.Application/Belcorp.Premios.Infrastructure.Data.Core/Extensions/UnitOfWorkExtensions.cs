﻿using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using System;
using System.Collections.Generic;
using System.Data;
using System.Reflection;
using System.Text;
using System.Linq;
using System.Data.SqlClient;
using System.ComponentModel;

namespace Belcorp.Premios.Infrastructure.Data.Core.Extensions
{
    public static class UnitOfWorkExtensions
    {
        public static IEnumerable<T> ExecuteSqlQuery<T>(this IUnitOfWork unitOfWork, string procedureName, Object parameters)
        {
            dynamic context = unitOfWork.GetType().GetField("_context", BindingFlags.Instance | BindingFlags.NonPublic).GetValue(unitOfWork);

            DatabaseFacade database = context.Database;

            IDbCommand cmd = database.GetDbConnection().CreateCommand();
            cmd.CommandText = procedureName;
            cmd.CommandType = CommandType.StoredProcedure;
            object[] sqlParameters = GetParametersSqlQuery(parameters);

            if (sqlParameters.Any())
            {
                foreach (object sqlParameter in sqlParameters)
                {
                    cmd.Parameters.Add(sqlParameter);
                }
            }

            IEnumerable<T> queryResult;
            DataTable dataTable = new DataTable();
            if (cmd.Connection.State.HasFlag(ConnectionState.Closed))
                cmd.Connection.Open();

            try
            {
                using (IDataReader reader = cmd.ExecuteReader())
                {
                    dataTable.Load(reader);
                    queryResult = ConvertTo<T>(dataTable);
                }
            }
            finally
            {
                cmd.Connection.Close();
            }


            return queryResult;
        }

        public static void ExecuteSqlNonQuery(this IUnitOfWork unitOfWork, string procedureName, Object parameters)
        {
            dynamic context = unitOfWork.GetType().GetField("_context", BindingFlags.Instance | BindingFlags.NonPublic).GetValue(unitOfWork);

            DatabaseFacade database = context.Database;

            IDbCommand cmd = database.GetDbConnection().CreateCommand();
            cmd.CommandText = procedureName;
            cmd.CommandType = CommandType.StoredProcedure;
            object[] sqlParameters = GetParametersSqlQuery(parameters);

            if (sqlParameters.Any())
            {
                foreach (object sqlParameter in sqlParameters)
                {
                    cmd.Parameters.Add(sqlParameter);
                }
            }

            
            if (cmd.Connection.State.HasFlag(ConnectionState.Closed))
                cmd.Connection.Open();

            try
            {
                cmd.ExecuteNonQuery();
            }
            finally
            {
                cmd.Connection.Close();
            }
        }


        private static object[] GetParametersSqlQuery(Object parameters)
        {
            IList<SqlParameter> listaParametro = new List<SqlParameter>();

            foreach (PropertyInfo prop in parameters.GetType().GetProperties())
            {
                dynamic valor = prop.GetValue(parameters, null);

                Type type = Nullable.GetUnderlyingType(prop.PropertyType);
                type = (type == null) ? prop.PropertyType : type;

                if (type == typeof(System.Data.DataTable))
                {
                    listaParametro.Add(new SqlParameter() { ParameterName = "@" + prop.Name, Value = valor, SqlDbType = SqlDbType.Structured });
                }
                else
                {
                    listaParametro.Add(new SqlParameter() { ParameterName = "@" + prop.Name, Value = valor });
                }
            }

            return listaParametro.ToArray();
        }
        public static T CreateItem<T>(DataRow row)
        {
            string columnName;
            T obj = default(T);
            if (row != null)
            {
                obj = Activator.CreateInstance<T>();
                foreach (DataColumn column in row.Table.Columns)
                {
                    columnName = column.ColumnName;
                    //Get property with same columnName
                    PropertyInfo prop = obj.GetType().GetProperty(columnName, BindingFlags.IgnoreCase | BindingFlags.Public | BindingFlags.Instance);
                    try
                    {
                        //Get value for the column
                        object value = (row[columnName].GetType() == typeof(DBNull))
                        ? null : row[columnName];
                        //Set property value
                        prop.SetValue(obj, value, null);
                    }
                    catch
                    {
                        throw;
                        //Catch whatever here
                    }
                }
            }
            return obj;
        }
        public static IList<T> ConvertTo<T>(IList<DataRow> rows)
        {
            IList<T> list = null;
            if (rows != null)
            {
                list = new List<T>();
                foreach (DataRow row in rows)
                {
                    T item = CreateItem<T>(row);
                    list.Add(item);
                }
            }
            return list;
        }
        public static IList<T> ConvertTo<T>(DataTable table)
        {
            if (table == null)
                return null;

            List<DataRow> rows = new List<DataRow>();
            foreach (DataRow row in table.Rows)
                rows.Add(row);

            return ConvertTo<T>(rows);
        }

        
    }
}
