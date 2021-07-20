using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using Npgsql;

namespace Dash_Board_None
{
    public partial class frm_grid_light : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataSource = get_data();
            GridView1.DataBind();
        }

        private DataTable get_data()
        {
            string connstring = WebConfigurationManager.ConnectionStrings["pkk_conection"].ConnectionString;
            DataTable res = new DataTable();

            NpgsqlConnection conn = new NpgsqlConnection(connstring);
            conn.Open();

            string strsql;

            strsql = "SELECT * FROM pkk_warning.v_grid_light";

            NpgsqlCommand objcmd = new NpgsqlCommand(strsql, conn);
            objcmd.CommandType = CommandType.Text;

            NpgsqlDataReader dr = objcmd.ExecuteReader();

            if (dr.HasRows)
            {
                res.Load(dr);
            }

            return res;
        }

      

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            get_data();// Grid View Binded
        }
    }
}