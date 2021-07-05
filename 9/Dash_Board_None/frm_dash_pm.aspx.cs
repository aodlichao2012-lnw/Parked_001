using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Web.Configuration;
using Npgsql;
using System.Data;
using System.Web.Script.Serialization;

namespace Dash_Board_None
{
    public partial class frm_dash_pm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static object pmg()
        {
            return get_data();
        }

        public static object get_data ()
        {
            object res = null;
            DataTable dt = new DataTable();

            string connstring = WebConfigurationManager.ConnectionStrings["pkk_conection"].ConnectionString;

            NpgsqlConnection conn = new NpgsqlConnection(connstring);
            conn.Open();

            string strsql;

            strsql = "SELECT yy, tt , visits, visits2, visits3 FROM pkk_warning.v_for_dash_pm  where yy=2021 and mm=1  ";

            NpgsqlCommand objcmd = new NpgsqlCommand(strsql, conn);
            objcmd.CommandType = CommandType.Text;

            NpgsqlDataReader dr = objcmd.ExecuteReader();
            string string_json = "";
            List<sc_pm_chart> ldata = new List<sc_pm_chart>();
            sc_pm_chart tmp_data = new sc_pm_chart();

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    tmp_data = new sc_pm_chart();
                    tmp_data.yy = Convert.ToInt32(dr["yy"]); ;
                    tmp_data.tt = dr["tt"].ToString();
                    tmp_data.visits = Convert.ToInt32(dr["visits"]);
                    tmp_data.visits2 = Convert.ToInt32(dr["visits2"]);
                    tmp_data.visits3 = Convert.ToInt32(dr["visits3"]);
                    ldata.Add(tmp_data);
                };

                
            }
            sc_pm_chart[] arr_data = ldata.ToArray();
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            res = serializer.Serialize(arr_data);

            return res;
        }
    }

    
}