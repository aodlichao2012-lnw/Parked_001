using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Dash_Board_None
{
    public class cl_json
    {
        public static string convert_to_simple_json(DataTable dt)
        {
            string res = "";

            string prefix = "[";
            string eachrow = "";
            string allrow = "";
            string subfix = "]";
            if (dt.Rows.Count == 0)
            {
                return res = "null";
            }
            for (var i = 0; i < dt.Rows.Count; i++)
            {
                eachrow = "{";
                foreach (DataColumn dcol in dt.Columns)
                {
                    if (dcol.DataType == typeof(System.Single)
                         || dcol.DataType == typeof(System.Double)
                         || dcol.DataType == typeof(System.Decimal)
                         || dcol.DataType == typeof(System.Byte)
                         || dcol.DataType == typeof(System.Int16)
                         || dcol.DataType == typeof(System.Int32)
                         || dcol.DataType == typeof(System.Int64))
                    { if (dt.Rows[i][dcol.ColumnName] != DBNull.Value)
                        {
                            eachrow = eachrow + "\"" + dcol.ColumnName + "\":" + dt.Rows[i][dcol.ColumnName].ToString() + ",";
                        } else
                        {
                            eachrow = eachrow + "\"" + dcol.ColumnName + "\":null,";
                        }
                        
                    }
                    else
                    {
                        if (dt.Rows[i][dcol.ColumnName] != DBNull.Value)
                        {
                            eachrow = eachrow + "\"" + dcol.ColumnName + "\":\"" + dt.Rows[i][dcol.ColumnName].ToString() + "\",";
                        }
                        else
                        {
                            eachrow = eachrow + "\"" + dcol.ColumnName + "\":null,";
                        }
                        
                    }


                }
                //eachrow = eachrow.Replace("D:", "D");
                eachrow = eachrow.Replace("\\", "\\\\");
                eachrow = eachrow.Substring(0, eachrow.Length - 1) + "}";
                allrow = allrow + eachrow + ",";
            }

            allrow = allrow.Substring(0, allrow.Length - 1);
            res = prefix + allrow + subfix;

            return res;
        }
        public static string convert_to_boots_json(DataTable dt)
        {
            string res = "";

            string prefix = "[";
            string eachrow = "";
            string allrow = "";
            string subfix = "]";
            if (dt.Rows.Count == 0)
            {
                return res = "null";
            }
            for (var i = 0; i < dt.Rows.Count; i++)
            {
                eachrow = "{";
                foreach (DataColumn dcol in dt.Columns)
                {
                    if (dcol.DataType == typeof(System.Single)
                         || dcol.DataType == typeof(System.Double)
                         || dcol.DataType == typeof(System.Decimal)
                         || dcol.DataType == typeof(System.Byte)
                         || dcol.DataType == typeof(System.Int16)
                         || dcol.DataType == typeof(System.Int32)
                         || dcol.DataType == typeof(System.Int64))
                    {
                        if (dt.Rows[i][dcol.ColumnName] != DBNull.Value)
                        {
                            eachrow = eachrow + "\"" + dcol.ColumnName + "\":" + dt.Rows[i][dcol.ColumnName].ToString() + ",";
                        }
                        

                    }
                    else
                    {
                        if (dt.Rows[i][dcol.ColumnName] != DBNull.Value)
                        {
                            eachrow = eachrow + "\"" + dcol.ColumnName + "\":\"" + dt.Rows[i][dcol.ColumnName].ToString() + "\",";
                        }
                        

                    }


                }
                //eachrow = eachrow.Replace("D:", "D");
                eachrow = eachrow.Replace("\\", "\\\\");
                eachrow = eachrow.Substring(0, eachrow.Length - 1) + "}";
                allrow = allrow + eachrow + ",";
            }

            allrow = allrow.Substring(0, allrow.Length - 1);
            res = prefix + allrow + subfix;

            return res;
        }
    }
}