using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Dash_Board_None
{
    public class sc_chart
    {

    }

    public class sc_pm_chart
    {
        public int yy { get; set; }
        public string tt { get; set; }
        public int visits { get; set; }
        public int visits2 { get; set; }
        public int visits3 { get; set; }
    }

    public class sc_blub_chart
    {
        public int yy { get; set; }
        public string mm { get; set; }
        public int blub { get; set; }
        public int acc { get; set; }
        
    }

    public class sc_pm_traf_chart
    {
        public string station { get; set; }
        public int pm { get; set; }
        public int traf { get; set; }
        public int yy { get; set; }
        public int mm { get; set; }

    }

    public class sc_found_chart
    {
        public string display { get; set; }
        public int val { get; set; }
    }

    public class sc_label_chart
    {
        public string pm { get; set; }
        public string cctv { get; set; }
        public string trafic { get; set; }
        public string license { get; set; }
        public string lightb { get; set; }
        public string water { get; set; }
        public string qc { get; set; }


    }

    public class Sum_log
    {
        public string yy { get; set; }
        public string mm { get; set; }
        public string m_label { get; set; }
        public int mo { get; set; }
        public int moph { get; set; }
        public int sum_mo { get; set; }
        public int sum_moph { get; set; }
    }
}