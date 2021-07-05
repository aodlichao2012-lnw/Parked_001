using Newtonsoft.Json;
using Npgsql;
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

namespace Dash_Board_None
{
    public partial class frm_Dash_2_Dash_1_grid : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public static  object   Chart1(string input , string yy)
        {
            object res = null;
            DataTable dt = new DataTable();

            string connstring = WebConfigurationManager.ConnectionStrings["pkk_conection"].ConnectionString;

            NpgsqlConnection conn = new NpgsqlConnection(connstring);
            conn.Open();

            string strsql;
            if (input == "13")
            {
                strsql = "SELECT * FROM pkk.v_sum_log where yy = '" + yy + "'";

                NpgsqlCommand objcmd = new NpgsqlCommand(strsql, conn);
                objcmd.CommandType = CommandType.Text;

                NpgsqlDataReader dr = objcmd.ExecuteReader();

                List<sc_found_chart> ldata = new List<sc_found_chart>();
                sc_found_chart tmp_data = new sc_found_chart();

                if (dr.HasRows)
                {
                    dr.Read();

                    tmp_data = new sc_found_chart();
                    tmp_data.val = Convert.ToInt32(dr["mo"]); ;
                    tmp_data.display = "กองสาธารณสุข";

                    ldata.Add(tmp_data);

                    tmp_data = new sc_found_chart();
                    tmp_data.val = Convert.ToInt32(dr["moph"]); ;
                    tmp_data.display = "สำนักการช่าง";

                    ldata.Add(tmp_data);



                }
                sc_found_chart[] arr_data = ldata.ToArray();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                res = serializer.Serialize(arr_data);
                conn.Close();
                return res;
            }
            else
            {
                strsql = "SELECT * FROM pkk.v_sum_log where mm = '" + input + "' and yy = '" + yy + "' ";

                NpgsqlCommand objcmd = new NpgsqlCommand(strsql, conn);
                objcmd.CommandType = CommandType.Text;

                NpgsqlDataReader dr = objcmd.ExecuteReader();

                List<sc_found_chart> ldata = new List<sc_found_chart>();
                sc_found_chart tmp_data = new sc_found_chart();

                if (dr.HasRows)
                {
                    dr.Read();

                    tmp_data = new sc_found_chart();
                    tmp_data.val = Convert.ToInt32(dr["mo"]); ;
                    tmp_data.display = "กองสาธารณสุข";

                    ldata.Add(tmp_data);

                    tmp_data = new sc_found_chart();
                    tmp_data.val = Convert.ToInt32(dr["moph"]); ;
                    tmp_data.display = "สำนักการช่าง";

                    ldata.Add(tmp_data);



                }
                sc_found_chart[] arr_data = ldata.ToArray();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                res = serializer.Serialize(arr_data);
                conn.Close();
                return res;
                //List<object> a = new List<object>();
                //a.Add("1");
                //a.Add("1");
                //a.Add("1");
                //a.Add("1");
                //a.Add("1");
                //a.ToList();
                //object json = JsonConvert.SerializeObject(a.ToList());
                //return json;

            }
            }  
        public static   object Grid1(string input , string yy)
        {
            object res = null;
            DataTable dt = new DataTable();

            string connstring = WebConfigurationManager.ConnectionStrings["pkk_conection"].ConnectionString;

            NpgsqlConnection conn = new NpgsqlConnection(connstring);
            conn.Open();

            string strsql;
            if (input == "13")
            {
                strsql = "SELECT mm, yy , mo , m_label , moph , SUM(mo + moph) as sum_mo  FROM  pkk.v_sum_log where yy = '" + yy + "' GROUP BY yy , mm , mo , m_label , moph ";

                NpgsqlCommand objcmd = new NpgsqlCommand(strsql, conn);
                objcmd.CommandType = CommandType.Text;

                NpgsqlDataReader dr = objcmd.ExecuteReader();

                List<Sum_log> ldata = new List<Sum_log>();
                Sum_log tmp_data = new Sum_log();

                if (dr.HasRows)
                {
                   while( dr.Read())
                    {

                        tmp_data = new Sum_log();
                        tmp_data.mm = dr["mm"].ToString();
                        tmp_data.yy = dr["yy"].ToString();
                        tmp_data.mo = Convert.ToInt32(dr["mo"]);
                        tmp_data.m_label = dr["m_label"].ToString();
                        tmp_data.moph = Convert.ToInt32(dr["moph"]);
                        tmp_data.sum_mo = Convert.ToInt32(dr["sum_mo"]);

                        ldata.Add(tmp_data);
                    }


                }
                Sum_log[] arr_data = ldata.ToArray();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                res = serializer.Serialize(arr_data);
                conn.Close();
                return res;
            }
            else
            {
                strsql = "SELECT  mm, yy , mo , m_label , moph  , SUM(mo + moph) as sum_mo  FROM pkk.v_sum_log where mm = '" + input + "' and yy = '" + yy + "' GROUP BY yy , mm , mo , m_label , moph ";

                NpgsqlCommand objcmd = new NpgsqlCommand(strsql, conn);
                objcmd.CommandType = CommandType.Text;

                NpgsqlDataReader dr = objcmd.ExecuteReader();

                List<Sum_log> ldata = new List<Sum_log>();
                Sum_log tmp_data = new Sum_log();

                if (dr.HasRows)
                {
                   while(dr.Read())
                    {
                        tmp_data = new Sum_log();
                        tmp_data.mm = dr["mm"].ToString();
                        tmp_data.yy = dr["yy"].ToString();
                        tmp_data.mo = Convert.ToInt32(dr["mo"]);
                        tmp_data.m_label = dr["m_label"].ToString();
                        tmp_data.moph = Convert.ToInt32(dr["moph"]);
                        tmp_data.sum_mo = Convert.ToInt32(dr["sum_mo"]);
                        tmp_data.sum_moph += Convert.ToInt32( dr["sum_mo"]);

                        ldata.Add(tmp_data);
                    }

                }
                Sum_log[] arr_data = ldata.ToArray();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                res = serializer.Serialize(arr_data);
                conn.Close();
                return res;
                //List<object> a = new List<object>();
                //a.Add("1");
                //a.Add("1");
                //a.Add("1");
                //a.Add("1");
                //a.Add("1");
                //a.ToList();
                //object json = JsonConvert.SerializeObject(a.ToList());
                //return json;

            }

        } 
        public static   object Chart2( string input , string yy)
        {
            object res = null;
            DataTable dt = new DataTable();

            string connstring = WebConfigurationManager.ConnectionStrings["pkk_conection"].ConnectionString;

            NpgsqlConnection conn = new NpgsqlConnection(connstring);
            conn.Open();

            string strsql;

            if (input == "13")
            {
                strsql = "SELECT * FROM pkk.v_sum_log  where yy='" + yy + "' ";



                NpgsqlCommand objcmd = new NpgsqlCommand(strsql, conn);
                objcmd.CommandType = CommandType.Text;

                NpgsqlDataReader dr = objcmd.ExecuteReader();

                List<sc_blub_chart> ldata = new List<sc_blub_chart>();
                sc_blub_chart tmp_data = new sc_blub_chart();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        tmp_data = new sc_blub_chart();
                        tmp_data.yy = Convert.ToInt32(dr["yy"]);
                        tmp_data.mm = dr["mm"].ToString();
                        tmp_data.blub = Convert.ToInt32(dr["mo"]);
                        tmp_data.acc = Convert.ToInt32(dr["moph"]);

                        ldata.Add(tmp_data);
                    };


                }
                sc_blub_chart[] arr_data = ldata.ToArray();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                res = serializer.Serialize(arr_data);
                conn.Close();
                return res;
            }
            else
            {

                strsql = "SELECT * FROM pkk.v_sum_log  where mm ='" + input + "' and yy = '" + yy + "' ";
                NpgsqlCommand objcmd = new NpgsqlCommand(strsql, conn);
                objcmd.CommandType = CommandType.Text;

                NpgsqlDataReader dr = objcmd.ExecuteReader();

                List<sc_blub_chart> ldata = new List<sc_blub_chart>();
                sc_blub_chart tmp_data = new sc_blub_chart();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        tmp_data = new sc_blub_chart();
                        tmp_data.yy = Convert.ToInt32(dr["yy"]); ;
                        tmp_data.mm = dr["mm"].ToString();
                        tmp_data.blub = Convert.ToInt32(dr["mo"]);
                        tmp_data.acc = Convert.ToInt32(dr["moph"]);

                        ldata.Add(tmp_data);
                    };


                }
                sc_blub_chart[] arr_data = ldata.ToArray();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                res = serializer.Serialize(arr_data);
                conn.Close();
                return res;
            }

        }
        public static   object Label1(string input , string yy)
        {
            object res = null;
            DataTable dt = new DataTable();

            string connstring = WebConfigurationManager.ConnectionStrings["pkk_conection"].ConnectionString;

            NpgsqlConnection conn = new NpgsqlConnection(connstring);
            conn.Open();

            string strsql;
            if (input == "13")
            {
                strsql = "SELECT mm, yy , mo , m_label , moph , SUM(mo + moph) as sum_mo  FROM  pkk.v_sum_log where yy = '" + yy + "' GROUP BY yy , mm , mo , m_label , moph ";

                NpgsqlCommand objcmd = new NpgsqlCommand(strsql, conn);
                objcmd.CommandType = CommandType.Text;

                NpgsqlDataReader dr = objcmd.ExecuteReader();

                List<Sum_log> ldata = new List<Sum_log>();
                Sum_log tmp_data = new Sum_log();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {

                        tmp_data = new Sum_log();
                        tmp_data.mm = dr["mm"].ToString();
                        tmp_data.yy = dr["yy"].ToString();
                        tmp_data.mo = Convert.ToInt32(dr["mo"]);
                        tmp_data.m_label = dr["m_label"].ToString();
                        tmp_data.moph = Convert.ToInt32(dr["moph"]);
                        tmp_data.sum_mo = Convert.ToInt32(dr["sum_mo"]);

                        ldata.Add(tmp_data);
                    }


                }
                Sum_log[] arr_data = ldata.ToArray();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                res = serializer.Serialize(arr_data);
                conn.Close();
                return res;
            }
            else
            {
                strsql = "SELECT  mm, yy , mo , m_label , moph  , SUM(mo + moph) as sum_mo  FROM pkk.v_sum_log where mm = '" + input + "' and yy = '" + yy + "' GROUP BY yy , mm , mo , m_label , moph ";

                NpgsqlCommand objcmd = new NpgsqlCommand(strsql, conn);
                objcmd.CommandType = CommandType.Text;

                NpgsqlDataReader dr = objcmd.ExecuteReader();

                List<Sum_log> ldata = new List<Sum_log>();
                Sum_log tmp_data = new Sum_log();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        tmp_data = new Sum_log();
                        tmp_data.mm = dr["mm"].ToString();
                        tmp_data.yy = dr["yy"].ToString();
                        tmp_data.mo = Convert.ToInt32(dr["mo"]);
                        tmp_data.m_label = dr["m_label"].ToString();
                        tmp_data.moph = Convert.ToInt32(dr["moph"]);
                        tmp_data.sum_mo = Convert.ToInt32(dr["sum_mo"]);
                        tmp_data.sum_moph += Convert.ToInt32(dr["sum_mo"]);

                        ldata.Add(tmp_data);
                    }

                }
                Sum_log[] arr_data = ldata.ToArray();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                res = serializer.Serialize(arr_data);
                conn.Close();
                return res;
                //List<object> a = new List<object>();
                //a.Add("1");
                //a.Add("1");
                //a.Add("1");
                //a.Add("1");
                //a.Add("1");
                //a.ToList();
                //object json = JsonConvert.SerializeObject(a.ToList());
                //return json;

            }
        }

        //[WebMethod]
        //public static object G1(string input , string yy)
        //{

        //    return Grid1();
        //} 

        //[WebMethod]
        //public static object C1(string input, string yy)
        //{
        //    return Chart1();
        //}

        //[WebMethod]
        //public static object C2(string input, string yy)
        //{
        //    return Chart2();
        //} 

        //[WebMethod]
        //public static object L1(string input, string yy)
        //{
        //    return Label1();
        //}

        [WebMethod]
        public static object Default()
        {
           
            return Chart1("13", "2021");

            //get_blub_label("2021");

        }
        [WebMethod]
        public static object Default2()
        {

            return Grid1("13", "2021");
            //get_blub_label("2021");

        }
        [WebMethod]
        public static object Default3()
        {


            return Chart2("13", "2021");

            //get_blub_label("2021");

        }
        [WebMethod]
        public static object Default4()
        {


            return Label1("13", "2021");
            //get_blub_label("2021");
        }

        [WebMethod]
        public static object Buttonclick(string mm, string yy)
        {

            //frm_dash_all aa = new frm_dash_all();

            return Chart1(mm, yy);

        }

        [WebMethod]
        public static object Buttonclick2(string mm, string yy)
        {
            return Grid1(mm, yy);
          


        }

        [WebMethod]
        public static object Buttonclick3(string mm, string yy)
        {
            return Chart2(mm, yy);
        }

        [WebMethod]
        public static object Buttonclick4(string mm, string yy)
        {
            return Label1(mm, yy);
        }

        [WebMethod]
        public static object Change(string yy)
        {

            return Chart1("13", yy);
          
            //frm_dash_all aa = new frm_dash_all();


        }

        [WebMethod]
        public static object Change2(string yy)
        {
            return Grid1("13", yy);


        }

        [WebMethod]
        public static object Change3(string yy)
        {
            return Chart2("13", yy);
        }

        [WebMethod]
        public static object Change4(string yy)
        {
            return Label1("13", yy);
        }


    }
}