﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Web;

namespace agenda_ssw_dtic.Models.Utils
{
    public class SqlUtils
    {

        public static Boolean validaCampo(SqlDataReader reader, string field)
        {
            Boolean ok = false;
            try
            {
                int ord = reader.GetOrdinal(field);
                if (!reader.IsDBNull(reader.GetOrdinal(field)))
                    ok = true;
            }catch(Exception){}

            return ok;
        }

        public static List<T> sqlToList<T>(SqlDataReader reader) where T : class, new()
        {
            List<T> listData = new List<T>();

            using (reader)
            {
                var props = typeof(T).GetProperties();
                while (reader.Read())
                {
                    T resp = new T();
                    foreach (PropertyInfo item in props)
                    {
                        if (SqlUtils.validaCampo(reader, item.Name))
                            typeof(T).GetProperty(item.Name).SetValue(resp, reader[item.Name]);
                    }
                    listData.Add(resp);
                }
            }
            return listData;
        }

        public static T sqlToObject<T>(SqlDataReader reader) where T : class, new()
        {
            T data = null;

            using (reader)
            {
                var props = typeof(T).GetProperties();
                if (reader.Read())
                {
                    data = new T();
                    foreach (PropertyInfo item in props)
                    {
                        if (SqlUtils.validaCampo(reader, item.Name))
                            typeof(T).GetProperty(item.Name).SetValue(data, reader[item.Name]);
                    }
                }
            }

            return data;
        }

    }
 }
