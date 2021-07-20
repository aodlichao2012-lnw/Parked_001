using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dash_Board_None.myclass;
using Npgsql;

namespace Dash_Board_None
{
    public partial class frm_graph_manhole : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public static object get_data_pie_send()
        {
            object res = null;
            DataTable dt = new DataTable();

            string connstring = WebConfigurationManager.ConnectionStrings["pkk_conection"].ConnectionString;

            NpgsqlConnection conn = new NpgsqlConnection(connstring);
            conn.Open();

            string strsql;

                strsql = "SELECT * FROM pkk_services.v_manhole_val  order by sort_order ASC ";

                NpgsqlCommand objcmd = new NpgsqlCommand(strsql, conn);
                objcmd.CommandType = CommandType.Text;

                NpgsqlDataReader dr = objcmd.ExecuteReader();

                List<frm_graph_manhole2> ldata = new List<frm_graph_manhole2>();
                frm_graph_manhole2 tmp_data = new frm_graph_manhole2();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        tmp_data = new frm_graph_manhole2();
                        tmp_data.display_label = dr["display_label"].ToString();
                        tmp_data.val = Convert.ToDouble(dr["val"]);
                        tmp_data.sort_order = Convert.ToInt32(dr["sort_order"]);

                        ldata.Add(tmp_data);
                    }
                }
                frm_graph_manhole2[] arr_data = ldata.ToArray();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                res = serializer.Serialize(arr_data);
                conn.Close();
                return res;
        }


        [WebMethod]
        public static object Default()
        {
            return get_data_pie_send();

        }
   
    }
}