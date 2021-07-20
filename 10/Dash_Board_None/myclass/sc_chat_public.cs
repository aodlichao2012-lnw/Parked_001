using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Dash_Board_None.myclass
{
    public class sc_chat_public
    {
    }
    public class sc_chart_event_by_type
    {
        public int yy { get; set; }
        public int mm { get; set; }
        public int val { get; set; }
        public int type_id { get; set; }
        public string t_name { get; set; }
     
    }
    public class sc_chart_event_by_group
    {
        public int yy { get; set; }
        public int mm { get; set; }
        public int val { get; set; }
        public int group_id { get; set; }
        public string group_name { get; set; }
    }
    public class sc_chart_event_by_month
    {
        public int yy { get; set; }
        public int mm { get; set; }
        public int val { get; set; }
        public string mm_label { get; set; }
    }
    public class sc_chart_event_by_year
    {
        public int yy { get; set; }
        public int val { get; set; }
    }
}