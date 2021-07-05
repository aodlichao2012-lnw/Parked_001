using Npgsql;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Configuration;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Dash_Board_None
{
    public partial class _Default : Page
    {
        public int i = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        public  static async Task<object> Connect(string sqlcommand , string sqlcom2 , string sql3 , string sql4 )
        {
            try
            {
                string connstring = WebConfigurationManager.ConnectionStrings["pkk_conection"].ConnectionString;
                string connstring2 = WebConfigurationManager.ConnectionStrings["pkk_conection2"].ConnectionString;
                string connstring3 = WebConfigurationManager.ConnectionStrings["pkk_conection3"].ConnectionString;
                string connstring4 = WebConfigurationManager.ConnectionStrings["pkk_conection4"].ConnectionString;
                NpgsqlConnection sql = new NpgsqlConnection(connstring);
                 sql.Open();
                NpgsqlConnection sql1 = new NpgsqlConnection(connstring2);
                 sql1.Open();
                NpgsqlConnection sql2 = new NpgsqlConnection(connstring3);
                 sql2.Open();
                NpgsqlConnection sql33 = new NpgsqlConnection(connstring4);
                sql33.Open();
                NpgsqlCommand objcmd = new NpgsqlCommand(sqlcommand, sql);
                NpgsqlCommand objcmd2 = new NpgsqlCommand(sqlcom2, sql1);
                NpgsqlCommand objcmd3 = new NpgsqlCommand(sql3, sql2);
                NpgsqlCommand objcmd4 = new NpgsqlCommand(sql4, sql33);
                objcmd.CommandType = CommandType.Text;
                objcmd2.CommandType = CommandType.Text;
                objcmd3.CommandType = CommandType.Text;
                objcmd4.CommandType = CommandType.Text;
                NpgsqlDataReader dr = objcmd.ExecuteReader();
                NpgsqlDataReader dr1 = objcmd2.ExecuteReader();
                NpgsqlDataReader dr2 = objcmd3.ExecuteReader();
                NpgsqlDataReader dr3 = objcmd4.ExecuteReader();
                List<Dash> ldata = new List<Dash>();
                Dash tmp_data = new Dash();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        tmp_data = new Dash();
                        tmp_data.pm = Convert.ToInt32(dr["pm25"]); ;
                        tmp_data.cc = Convert.ToInt32(dr["cctv"]);
                        tmp_data.live = Convert.ToInt32(dr["live_trafic"]);
                        tmp_data.livep = Convert.ToInt32(dr["licensep"]);
                        tmp_data.liveb = Convert.ToInt32(dr["light_b"]);
                        tmp_data.mag = Convert.ToInt32(dr["water_mng"]);
                        tmp_data.wat = Convert.ToInt32(dr["water_tread"]);
                        //tmp_data.pan = Convert.ToInt32(dr1["visits3"]);
                        tmp_data.endp = Convert.ToInt32(dr1["end_process"]);
                        tmp_data.livepo = Convert.ToInt32(dr1["in_process"]);
                        tmp_data.sta1 = Convert.ToInt32(dr2["station_name"]);
                        tmp_data.sta2 = Convert.ToInt32(dr2["pm25_val"]);
                        tmp_data.sta3 = Convert.ToInt32(dr2["trafic_val"]);
                        //tmp_data.sta4 = Convert.ToInt32(dr["visits3"]);
                        tmp_data.mm = Convert.ToInt32(dr3["mm"]);
                        tmp_data.livebul = Convert.ToInt32(dr3["lblub"]);
                        tmp_data.livecctv = Convert.ToInt32(dr3["cctv"]);
                        ldata.Add(tmp_data);
                    };


                }
                Dash[] arr_data = ldata.ToArray();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                object res = serializer.Serialize(arr_data);

                return res;
            }
            catch(Exception ex)
            {
                ex.Message.ToString();
                return "fail";
            }
        
        }

        [WebMethod]
        public static object ToList()
        {
            return Connect("SELECT * FROM pkk_warning.v_label_val", "SELECT * FROM pkk_warning.v_pie_val", "SELECT * FROM pkk_warning.v_pm_traf_val", "SELECT * FROM pkk_warning.v_blue_cctv_val");
        }
        [WebMethod]
        public static object ToList1()
        {
            return Connect("SELECT * FROM pkk_warning.v_label_val WHERE mm =(SELECT mm FROM pkk_warning.v_blub_cctv_val WHERE mm = '1')", "", "", "");
        }
        [WebMethod]
        public static object ToList2()
        {
            return Connect("SELECT * FROM pkk_warning.v_label_val WHERE mm =(SELECT mm FROM pkk_warning.v_blub_cctv_val WHERE mm = '2')", "", "", "");
        }

        [WebMethod]
        public static object ToList3()
        {
            return Connect("SELECT * FROM pkk_warning.v_label_val WHERE mm =(SELECT mm FROM pkk_warning.v_blub_cctv_val WHERE mm = '3')", "", "", "");
        }
        [WebMethod]
        public static object ToList4()
        {
            return Connect("SELECT * FROM pkk_warning.v_label_val WHERE mm =(SELECT mm FROM pkk_warning.v_blub_cctv_val WHERE mm = '4')", "", "", "");
        }
        [WebMethod]
        public static object ToList5()
        {
            return Connect("SELECT * FROM pkk_warning.v_label_val WHERE mm =(SELECT mm FROM pkk_warning.v_blub_cctv_val WHERE mm = '5')", "", "", "");
        }
        [WebMethod]
        public static object ToList6()
        {
            return Connect("SELECT * FROM pkk_warning.v_label_val WHERE mm =(SELECT mm FROM pkk_warning.v_blub_cctv_val WHERE mm = '6')", "", "", "");
        }
        [WebMethod]
        public static object ToList7()
        {
            return Connect("SELECT * FROM pkk_warning.v_label_val WHERE mm =(SELECT mm FROM pkk_warning.v_blub_cctv_val WHERE mm = '7')", "", "", "");
        }
        [WebMethod]
        public static object ToList8()
        {
            return Connect("SELECT * FROM pkk_warning.v_label_val WHERE mm =(SELECT mm FROM pkk_warning.v_blub_cctv_val WHERE mm = '8')", "", "", "");
        }
        [WebMethod]
        public static object ToList9()
        {
            return Connect("SELECT * FROM pkk_warning.v_label_val WHERE mm =(SELECT mm FROM pkk_warning.v_blub_cctv_val WHERE mm = '9')", "", "", "");
        }
        [WebMethod]
        public static object ToList10()
        {
            return Connect("SELECT * FROM pkk_warning.v_label_val WHERE mm =(SELECT mm FROM pkk_warning.v_blub_cctv_val WHERE mm = '10')", "", "", ""); ;
        }
        [WebMethod]
        public static object ToList11()
        {
            return Connect("SELECT * FROM pkk_warning.v_label_val WHERE mm =(SELECT mm FROM pkk_warning.v_blub_cctv_val WHERE mm = '11')", "", "", "");
        }
        [WebMethod]
        public static object ToList12()
        {
            return Connect("SELECT * FROM pkk_warning.v_label_val WHERE mm =(SELECT mm FROM pkk_warning.v_blub_cctv_val WHERE mm = '12')", "", "", "");
        }

        //protected void All_Click(object sender, EventArgs e)
        //{
        //    i = 1;
        //    HttpContext.Current.Session["MM"] = 1;
        //}

        //protected void JAN_Click(object sender, EventArgs e)
        //{
        //    i = 2;

        //}

        //protected void FEB_Click(object sender, EventArgs e)
        //{
        //    i = 3;
        //}

        //protected void MA_Click(object sender, EventArgs e)
        //{
        //    i = 4;
        //}

        //protected void AP_Click(object sender, EventArgs e)
        //{
        //    i = 5;
        //}

        //protected void MAY_Click(object sender, EventArgs e)
        //{
        //    i = 6;
        //}

        //protected void JUNE_Click(object sender, EventArgs e)
        //{
        //    i = 7;
        //}

        //protected void JUL_Click(object sender, EventArgs e)
        //{
        //    i = 8;
        //}

        //protected void AUG_Click(object sender, EventArgs e)
        //{
        //    i = 9;
        //}

        //protected void SEP_Click(object sender, EventArgs e)
        //{
        //    i = 10;
        //}

        //protected void OCT_Click(object sender, EventArgs e)
        //{
        //    i = 11;
        //}

        //protected void NOV_Click(object sender, EventArgs e)
        //{
        //    i = 12;
        //}

        //protected void DEC_Click(object sender, EventArgs e)
        //{
        //    i = 13;
        //}
    }

    public class Dash
    {
        public int pm { get; set; }
        public int cc { get; set; }
        public int live { get; set; }
        public int livep { get; set; }
        public int liveb { get; set; }
        public int mag { get; set; }
        public int wat { get; set; }
        public int pan { get; set; } 
        public int endp { get; set; } 
        public int livepo { get; set; } 
        public int sta1 { get; set; } 
        public int sta2 { get; set; } 
        public int sta3 { get; set; } 
        public int sta4 { get; set; } 
        public int yyyy { get; set; } 
        public int mm { get; set; } 
        public int livebul { get; set; } 
        public int livecctv { get; set; } 
    }
}

