using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Npgsql;

namespace Dash_Board_None
{
    public partial class frm_dash_all : System.Web.UI.Page, IDisposable
    {

        Button inputbu;
        HtmlButton htmlButton;
        HtmlButton a = new HtmlButton();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Page.IsPostBack)
            {
                //string yy = allyears.Value;
                ////string mm = null;
                ////Buttonclick(mm);
                ////Buttonclick2(mm);
                ////Buttonclick3(mm);
                ////Buttonclick4(mm);
                //Change(yy);
                //Change2(yy);
                //Change3(yy);
                //Change4(yy);



            }
            //Default();
            //Default2();
            //Default3();
            //Default4();
            //Page.MaintainScrollPositionOnPostBack = true;
        }

        //[WebMethod]
        //public static object ret_child1(string yy)
        //{
        //    return get_data_pie_send(yy);
        //}


        public static object get_data_pie_send(string input, string yy)
        {
            object res = null;
            DataTable dt = new DataTable();

            string connstring = WebConfigurationManager.ConnectionStrings["pkk_conection"].ConnectionString;

            NpgsqlConnection conn = new NpgsqlConnection(connstring);
            conn.Open();

            string strsql;
            if (input == "13")
            {
                strsql = "SELECT * FROM pkk_warning.v_pie_val_all where yy = '" + yy + "'";

                NpgsqlCommand objcmd = new NpgsqlCommand(strsql, conn);
                objcmd.CommandType = CommandType.Text;

                NpgsqlDataReader dr = objcmd.ExecuteReader();

                List<sc_found_chart> ldata = new List<sc_found_chart>();
                sc_found_chart tmp_data = new sc_found_chart();

                if (dr.HasRows)
                {
                    dr.Read();

                    tmp_data = new sc_found_chart();
                    tmp_data.val = Convert.ToInt32(dr["in_process"]); ;
                    tmp_data.display = "In Process";

                    ldata.Add(tmp_data);

                    tmp_data = new sc_found_chart();
                    tmp_data.val = Convert.ToInt32(dr["end_process"]); ;
                    tmp_data.display = "ตอบรับ";

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
                strsql = "SELECT * FROM pkk_warning.v_pie_val  where mm = '" + input + "' and yy = '" + yy + "' ";

                NpgsqlCommand objcmd = new NpgsqlCommand(strsql, conn);
                objcmd.CommandType = CommandType.Text;

                NpgsqlDataReader dr = objcmd.ExecuteReader();

                List<sc_found_chart> ldata = new List<sc_found_chart>();
                sc_found_chart tmp_data = new sc_found_chart();

                if (dr.HasRows)
                {
                    dr.Read();

                    tmp_data = new sc_found_chart();
                    tmp_data.val = Convert.ToInt32(dr["in_process"]); ;
                    tmp_data.display = "In Process";

                    ldata.Add(tmp_data);

                    tmp_data = new sc_found_chart();
                    tmp_data.val = Convert.ToInt32(dr["end_process"]); ;
                    tmp_data.display = "ตอบรับ";

                    ldata.Add(tmp_data);



                }
                sc_found_chart[] arr_data = ldata.ToArray();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                res = serializer.Serialize(arr_data);
                conn.Close();
                return res;
            }
        }

        //[WebMethod]
        //public static object ret_child2(string yy)
        //{
        //    return get_data_pm_traf(yy);
        //}

        public static object get_data_pm_traf(string input, string yy)
        {
            object res = null;
            DataTable dt = new DataTable();

            string connstring = WebConfigurationManager.ConnectionStrings["pkk_conection"].ConnectionString;

            NpgsqlConnection conn = new NpgsqlConnection(connstring);
            conn.Open();

            string strsql;

            if (input == "13")
            {
                strsql = "SELECT * FROM pkk_warning.v_pm_traf_val_all where yy = '" + yy + "'";

                NpgsqlCommand objcmd = new NpgsqlCommand(strsql, conn);
                objcmd.CommandType = CommandType.Text;

                NpgsqlDataReader dr = objcmd.ExecuteReader();

                List<sc_pm_traf_chart> ldata = new List<sc_pm_traf_chart>();
                sc_pm_traf_chart tmp_data = new sc_pm_traf_chart();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        tmp_data = new sc_pm_traf_chart();
                        //tmp_data.yy = Convert.ToInt32(dr["yy"]);
                        //tmp_data.mm = Convert.ToInt32(dr["mm"]);
                        tmp_data.station = dr["station_name"].ToString();
                        tmp_data.pm = Convert.ToInt32(dr["pm25_val"]);
                        tmp_data.traf = Convert.ToInt32(dr["trafic_val"]);

                        ldata.Add(tmp_data);
                    };


                }
                sc_pm_traf_chart[] arr_data = ldata.ToArray();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                res = serializer.Serialize(arr_data);
                conn.Close();
                return res;
            }
            else
            {
                strsql = "SELECT * FROM pkk_warning.v_pm_traf_val where mm = '" + input + "' and yy = '" + yy + "' ";

                NpgsqlCommand objcmd = new NpgsqlCommand(strsql, conn);
                objcmd.CommandType = CommandType.Text;

                NpgsqlDataReader dr = objcmd.ExecuteReader();

                List<sc_pm_traf_chart> ldata = new List<sc_pm_traf_chart>();
                sc_pm_traf_chart tmp_data = new sc_pm_traf_chart();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        tmp_data = new sc_pm_traf_chart();
                        //tmp_data.yy = Convert.ToInt32(dr["yy"]);
                        //tmp_data.mm = Convert.ToInt32(dr["mm"]);
                        tmp_data.station = dr["station_name"].ToString();
                        tmp_data.pm = Convert.ToInt32(dr["pm25_val"]);
                        tmp_data.traf = Convert.ToInt32(dr["trafic_val"]);

                        ldata.Add(tmp_data);
                    };


                }
                sc_pm_traf_chart[] arr_data = ldata.ToArray();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                res = serializer.Serialize(arr_data);
                conn.Close();
                return res;
            }

        }

        //[WebMethod]
        //public static object ret_child3(string yy)
        //{
        //    return get_data_bar_blub(yy);
        //}

        public static object get_data_bar_blub(string input, string yy)
        {
            object res = null;
            DataTable dt = new DataTable();

            string connstring = WebConfigurationManager.ConnectionStrings["pkk_conection"].ConnectionString;

            NpgsqlConnection conn = new NpgsqlConnection(connstring);
            conn.Open();

            string strsql;

            if (input == "13")
            {
                strsql = "SELECT * FROM pkk_warning.v_blub_cctv_val  where yy='" + yy + "' ";



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
                        tmp_data.mm = dr["mm_label"].ToString();
                        tmp_data.blub = Convert.ToInt32(dr["lblub"]);
                        tmp_data.acc = Convert.ToInt32(dr["cctv"]);

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

                strsql = "SELECT * FROM pkk_warning.v_blub_cctv_val  where mm ='" + input + "' and yy = '" + yy + "' ";
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
                        tmp_data.mm = dr["mm_label"].ToString();
                        tmp_data.blub = Convert.ToInt32(dr["lblub"]);
                        tmp_data.acc = Convert.ToInt32(dr["cctv"]);

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

        //[WebMethod]
        //public static object set_label()
        //{
        //    return get_data_label();
        //}

        public static object get_data_label(string input, string yy)
        {
            object res = null;
            DataTable dt = new DataTable();

            string connstring = WebConfigurationManager.ConnectionStrings["pkk_conection"].ConnectionString;

            NpgsqlConnection conn = new NpgsqlConnection(connstring);
            string strsql;
            conn.Open();
            if (input == "13")
            {


                strsql = "SELECT * FROM pkk_warning.v_label_val_all  where yy ='" + yy + "' ";

                NpgsqlCommand objcmd = new NpgsqlCommand(strsql, conn);
                objcmd.CommandType = CommandType.Text;

                NpgsqlDataReader dr = objcmd.ExecuteReader();

                List<sc_label_chart> ldata = new List<sc_label_chart>();
                sc_label_chart tmp_data = new sc_label_chart();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        tmp_data = new sc_label_chart();

                        tmp_data.pm = dr["pm25"].ToString();
                        tmp_data.cctv = dr["cctv"].ToString();
                        tmp_data.trafic = dr["live_trafic"].ToString();
                        tmp_data.license = dr["licensep"].ToString();
                        tmp_data.lightb = get_blub_label(input, yy);
                        tmp_data.water = dr["water_mng"].ToString();
                        tmp_data.qc = dr["water_tread"].ToString();

                        ldata.Add(tmp_data);
                    };


                }
                sc_label_chart[] arr_data = ldata.ToArray();
                JavaScriptSerializer serializer = new JavaScriptSerializer();

                res = serializer.Serialize(arr_data);
                conn.Close();
                return res;
            }
            else
            {
                strsql = "SELECT * FROM pkk_warning.v_label_val  where mm ='" + input + "' and yy = '" + yy + "' ";

                NpgsqlCommand objcmd = new NpgsqlCommand(strsql, conn);
                objcmd.CommandType = CommandType.Text;

                NpgsqlDataReader dr = objcmd.ExecuteReader();

                List<sc_label_chart> ldata = new List<sc_label_chart>();
                sc_label_chart tmp_data = new sc_label_chart();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        tmp_data = new sc_label_chart();

                        tmp_data.pm = dr["pm25"].ToString();
                        tmp_data.cctv = dr["cctv"].ToString();
                        tmp_data.trafic = dr["live_trafic"].ToString();
                        tmp_data.license = dr["licensep"].ToString();
                        tmp_data.lightb = get_blub_label(input, yy);
                        tmp_data.water = dr["water_mng"].ToString();
                        tmp_data.qc = dr["water_tread"].ToString();

                        ldata.Add(tmp_data);
                    };


                }
                sc_label_chart[] arr_data = ldata.ToArray();
                JavaScriptSerializer serializer = new JavaScriptSerializer();

                res = serializer.Serialize(arr_data);
                conn.Close();
                return res;
            }
        }

        public static string get_blub_label(string input, string yy)
        {
            string res = "0";

            string connstring = WebConfigurationManager.ConnectionStrings["pkk_conection"].ConnectionString;

            NpgsqlConnection conn = new NpgsqlConnection(connstring);
            conn.Open();

            string strsql;
            if (input == "13")
            {
                strsql = "SELECT * FROM pkk_warning.v_sum_light_m  where req_yy = '" + yy + "' ";

                NpgsqlCommand objcmd = new NpgsqlCommand(strsql, conn);
                objcmd.CommandType = CommandType.Text;

                NpgsqlDataReader dr = objcmd.ExecuteReader();

                if (dr.HasRows)
                {
                    dr.Read();
                    res = dr["light_b"].ToString();
                }
                conn.Close();
                return res;
            }
            else
            {
                strsql = "SELECT * FROM pkk_warning.v_sum_light_m  where req_mm = '" + input + "' and req_yy = '" + yy + "' ";

                NpgsqlCommand objcmd = new NpgsqlCommand(strsql, conn);
                objcmd.CommandType = CommandType.Text;

                NpgsqlDataReader dr = objcmd.ExecuteReader();

                if (dr.HasRows)
                {
                    dr.Read();
                    res = dr["light_b"].ToString();
                }
                conn.Close();
                return res;
            }
        }

        //[WebMethod]
        //public static object Buttoncli(Button inpt)
        //{
        //    HttpContext.Current.Session["But"] = inpt.Text;
        //    all(HttpContext.Current.Session["But"] );
        //    return "ok";
        //}
        //public static object all(object input)
        //{
        //    string a = "ok";
        //    get_data_pm_traf(input);
        //    get_data_pie_send(input);
        //    get_data_bar_blub(input);
        //    get_data_label(input);
        //    get_blub_label(input);
        //    return a;
        //}

        //protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        //{

        //    ret_child1();
        //    ret_child2();
        //    ret_child3();
        //    set_label();
        //  //}
        [WebMethod]
        public static object Default()
        {
            return get_data_pie_send("13", "2021");

            //get_blub_label("2021");

        }
        [WebMethod]
        public static object Default2()
        {
            return get_data_pm_traf("13", "2021");
            //get_blub_label("2021");

        }
        [WebMethod]
        public static object Default3()
        {


            return get_data_bar_blub("13", "2021");

            //get_blub_label("2021");

        }
        [WebMethod]
        public static object Default4()
        {


            return get_data_label("13", "2021");
            //get_blub_label("2021");
        }

        [WebMethod]
        public static object Buttonclick(string mm, string yy)
        {

            //frm_dash_all aa = new frm_dash_all();

            return get_data_pie_send(mm, yy);

        }

        [WebMethod]
        public static object Buttonclick2(string mm, string yy)
        {

            return get_data_pm_traf(mm, yy);


        }

        [WebMethod]
        public static object Buttonclick3(string mm, string yy)
        {
            return get_data_bar_blub(mm, yy);
        }

        [WebMethod]
        public static object Buttonclick4(string mm, string yy)
        {
            return get_data_label(mm, yy);
        }

        [WebMethod]
        public static object Change(string yy)
        {

            return get_data_pie_send("13", yy);
            //frm_dash_all aa = new frm_dash_all();


        }

        [WebMethod]
        public static object Change2(string yy)
        {

            return get_data_pm_traf("13", yy);

        }

        [WebMethod]
        public static object Change3(string yy)
        {
            return get_data_bar_blub("13", yy);
        }

        [WebMethod]
        public static object Change4(string yy)
        {
            return get_data_label("13", yy);
        }




    }
}