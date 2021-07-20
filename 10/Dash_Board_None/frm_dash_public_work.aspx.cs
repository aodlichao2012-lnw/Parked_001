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
    public partial class frm_dash_public_work : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

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
                strsql = "SELECT * FROM pkk_services.v_sum_events_by_types_all where yy = '" + yy + "' order by type_id ASC ";

                NpgsqlCommand objcmd = new NpgsqlCommand(strsql, conn);
                objcmd.CommandType = CommandType.Text;

                NpgsqlDataReader dr = objcmd.ExecuteReader();

                List<sc_chart_event_by_type> ldata = new List<sc_chart_event_by_type>();
                sc_chart_event_by_type tmp_data = new sc_chart_event_by_type();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        if (dr["t_name"].ToString() == "กำจัดขยะวัชพืชในคูคลอง")
                        {
                            tmp_data = new sc_chart_event_by_type();
                            tmp_data.t_name = "";
                            tmp_data.val = 0;
                        }
                        tmp_data = new sc_chart_event_by_type();
                        tmp_data.t_name = dr["t_name"].ToString();
                        tmp_data.val = Convert.ToInt32(dr["val"]);

                        ldata.Add(tmp_data);
                    }
                }
                sc_chart_event_by_type[] arr_data = ldata.ToArray();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                res = serializer.Serialize(arr_data);
                conn.Close();
                return res;
            }
            else
            {
                strsql = "SELECT * FROM pkk_services.v_sum_events_by_types  where mm = '" + input + "' and yy = '" + yy + "' order by type_id ASC ";

                NpgsqlCommand objcmd = new NpgsqlCommand(strsql, conn);
                objcmd.CommandType = CommandType.Text;

                NpgsqlDataReader dr = objcmd.ExecuteReader();

                List<sc_chart_event_by_type> ldata = new List<sc_chart_event_by_type>();
                sc_chart_event_by_type tmp_data = new sc_chart_event_by_type();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        if (dr["t_name"].ToString() == "กำจัดขยะวัชพืชในคูคลอง")
                        {
                            tmp_data = new sc_chart_event_by_type();
                            tmp_data.t_name = "";
                            tmp_data.val = 0;
                        }
                        tmp_data = new sc_chart_event_by_type();
                        tmp_data.t_name = dr["t_name"].ToString();
                        tmp_data.val = Convert.ToInt32(dr["val"]);

                        ldata.Add(tmp_data);

                    }
                }
                sc_chart_event_by_type[] arr_data = ldata.ToArray();
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
                strsql = "SELECT * FROM pkk_services.v_sum_events_by_group_all  where yy = '" + yy + "'";

                NpgsqlCommand objcmd = new NpgsqlCommand(strsql, conn);
                objcmd.CommandType = CommandType.Text;

                NpgsqlDataReader dr = objcmd.ExecuteReader();

                List<sc_chart_event_by_group> ldata = new List<sc_chart_event_by_group>();
                sc_chart_event_by_group tmp_data = new sc_chart_event_by_group();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        tmp_data = new sc_chart_event_by_group();
                        tmp_data.group_name = dr["group_name"].ToString();
                        tmp_data.group_id = Convert.ToInt32(dr["group_id"]);
                        tmp_data.val = Convert.ToInt32(dr["val"]);

                        ldata.Add(tmp_data);
                    };


                }
                sc_chart_event_by_group[] arr_data = ldata.ToArray();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                res = serializer.Serialize(arr_data);
                conn.Close();
                return res;
            }
            else
            {
                strsql = "SELECT * FROM pkk_services.v_sum_events_by_group where mm = '" + input + "' and yy = '" + yy + "' ";

                NpgsqlCommand objcmd = new NpgsqlCommand(strsql, conn);
                objcmd.CommandType = CommandType.Text;

                NpgsqlDataReader dr = objcmd.ExecuteReader();

                List<sc_chart_event_by_group> ldata = new List<sc_chart_event_by_group>();
                sc_chart_event_by_group tmp_data = new sc_chart_event_by_group();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        tmp_data = new sc_chart_event_by_group();
                        tmp_data = new sc_chart_event_by_group();
                        tmp_data.group_name = dr["group_name"].ToString();
                        tmp_data.group_id = Convert.ToInt32(dr["group_id"]);
                        tmp_data.val = Convert.ToInt32(dr["val"]);

                        ldata.Add(tmp_data);
                    };


                }
                sc_chart_event_by_group[] arr_data = ldata.ToArray();
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
                strsql = "SELECT * FROM pkk_services.v_sum_events_by_month  where yy='" + yy + "' ";



                NpgsqlCommand objcmd = new NpgsqlCommand(strsql, conn);
                objcmd.CommandType = CommandType.Text;

                NpgsqlDataReader dr = objcmd.ExecuteReader();

                List<sc_chart_event_by_month> ldata = new List<sc_chart_event_by_month>();
                sc_chart_event_by_month tmp_data = new sc_chart_event_by_month();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        tmp_data = new sc_chart_event_by_month();
                        tmp_data.val = Convert.ToInt32(dr["val"]);
                        tmp_data.mm_label = dr["mm_label"].ToString();

                        ldata.Add(tmp_data);
                    };


                }
                sc_chart_event_by_month[] arr_data = ldata.ToArray();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                res = serializer.Serialize(arr_data);
                conn.Close();
                return res;
            }
            else
            {

                strsql = "SELECT * FROM pkk_services.v_sum_events_by_month  where mm ='" + input + "' and yy = '" + yy + "' ";
                NpgsqlCommand objcmd = new NpgsqlCommand(strsql, conn);
                objcmd.CommandType = CommandType.Text;

                NpgsqlDataReader dr = objcmd.ExecuteReader();

                List<sc_chart_event_by_month> ldata = new List<sc_chart_event_by_month>();
                sc_chart_event_by_month tmp_data = new sc_chart_event_by_month();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        tmp_data = new sc_chart_event_by_month();
                        tmp_data.val = Convert.ToInt32(dr["val"]);
                        tmp_data.mm_label = dr["mm_label"].ToString();

                        ldata.Add(tmp_data);
                    };


                }
                sc_chart_event_by_month[] arr_data = ldata.ToArray();
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


                strsql = "SELECT * FROM pkk_services.v_sum_events_by_types_all  where yy ='" + yy + "'order by type_id ASC ";

                NpgsqlCommand objcmd = new NpgsqlCommand(strsql, conn);
                objcmd.CommandType = CommandType.Text;

                NpgsqlDataReader dr = objcmd.ExecuteReader();

                List<sc_chart_event_by_type> ldata = new List<sc_chart_event_by_type>();
                sc_chart_event_by_type tmp_data = new sc_chart_event_by_type();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {

                        tmp_data = new sc_chart_event_by_type();
                        tmp_data.t_name = dr["t_name"].ToString();
                        tmp_data.val = Convert.ToInt32(dr["val"]);
                        tmp_data.type_id = Convert.ToInt32(dr["type_id"]);

                        ldata.Add(tmp_data);
                    };


                }
                sc_chart_event_by_type[] arr_data = ldata.ToArray();
                JavaScriptSerializer serializer = new JavaScriptSerializer();

                res = serializer.Serialize(arr_data);
                conn.Close();
                return res;
            }
            else
            {
                strsql = "SELECT * FROM pkk_services.v_sum_events_by_types  where ( mm ='" + input + "' or  mm IS NULL)  and ( yy = '"+ yy+"' or yy IS null) order by type_id ASC ";

                NpgsqlCommand objcmd = new NpgsqlCommand(strsql, conn);
                objcmd.CommandType = CommandType.Text;

                NpgsqlDataReader dr = objcmd.ExecuteReader();

                List<sc_chart_event_by_type> ldata = new List<sc_chart_event_by_type>();
                sc_chart_event_by_type tmp_data = new sc_chart_event_by_type();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        tmp_data = new sc_chart_event_by_type();

                        tmp_data = new sc_chart_event_by_type();
                        tmp_data.t_name = dr["t_name"].ToString();
                        tmp_data.val = Convert.ToInt32(dr["val"]);
                        tmp_data.type_id = Convert.ToInt32(dr["type_id"]);
                        ldata.Add(tmp_data);
                    };


                }
                sc_chart_event_by_type[] arr_data = ldata.ToArray();
                JavaScriptSerializer serializer = new JavaScriptSerializer();

                res = serializer.Serialize(arr_data);
                conn.Close();
                return res;
            }
        }


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