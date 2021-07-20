<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Dash_Board_None._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
     /*
 * Made by Erik Terwan
 * 24th of November 2015
 * MIT License
 *
 *
 * If you are thinking of using this in
 * production code, beware of the browser
 * prefixes.
 */

   .topnav {
  overflow: hidden;
  background-color: #333;
}

.topnav a {
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: #4CAF50;
  color: white;
}

.topnav .icon {
  display: none;
}

@media screen and (max-width: 600px) {
  .topnav a:not(:first-child) {display: none;}
  .topnav a.icon {
    float: right;
    display: block;
  }
}

@media screen and (max-width: 600px) {
  .topnav.responsive {position: relative;}
  .topnav.responsive .icon {
    position: absolute;
    right: 0;
    top: 0;
  }
  .topnav.responsive a {
    float: none;
    display: block;
    text-align: left;
  }
}
@media screen and (max-width: 768px) {
    body { margin:2% ;}
    
}
body {
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol" ;
  margin:2% ;
}

#chart2 {
    margin-top:10%;
  width: 100%;
  height: 250px;
}
#chart1 {
    margin-top:10%;
  width: 100%;
  height: 450px;
}
#chart3  {
    margin-top:20%;
  width: 100%;
  height: 400px;
}
    </style>
    <script>

        function add_chart1 () {
            alert ('in chart 1') ;
            am4core.useTheme(am4themes_animated);
            // Themes end
            //document.getElementById("l1").value = [{"pm25": 362}];
            //document.getElementById("l2").value = [{ "cctv": 362 }];
            //document.getElementById("l3").value = [{ "live_trafic": 362 }];
            //document.getElementById("l4").value = [{ "licensep": 362 }];
            //document.getElementById("l5").value = [{ "light_b": 362 }];
            //document.getElementById("l6").value = [{ "water_mng": 362 }];
            //document.getElementById("l7").value = [{ "water_tread": 362 }];

     
            // Create chart instance
            var chart = am4core.create("chart1", am4charts.PieChart);

            // Add data
            /*  chart.data = JSON.parse(res);*/
            chart.data = [{
                "lblub": 362,
                "cctv": 501.9
            } ]
           
            // Add and configure Series
            var pieSeries = chart.series.push(new am4charts.PieSeries());
            pieSeries.dataFields.value = "lblub";
            pieSeries.dataFields.category = "lblub";
            pieSeries.innerRadius = am4core.percent(50);
            pieSeries.ticks.template.disabled = true;
            pieSeries.labels.template.disabled = true;

            var pieSeries1 = chart.series.push(new am4charts.PieSeries());
            pieSeries1.dataFields.value = "cctv";
            pieSeries1.dataFields.category = "cctv";
            pieSeries1.innerRadius = am4core.percent(50);
            pieSeries1.ticks.template.disabled = true;
            pieSeries1.labels.template.disabled = true;

            var rgm = new am4core.LinearGradientModifier();
            rgm.brightnesses.push(0, - 0.4);
            pieSeries.slices.template.fillModifier = rgm;
            pieSeries1.slices.template.fillModifier = rgm;

            var rgm2 = new am4core.LinearGradientModifier();
            rgm2.brightnesses.push(0, - 0.4);

            pieSeries.slices.template.strokeModifier = rgm2;
            pieSeries.slices.template.strokeOpacity = 1;
            pieSeries.slices.template.strokeWidth = 1;
            pieSeries1.slices.template.strokeModifier = rgm2;
            pieSeries1.slices.template.strokeOpacity = 1;
            pieSeries1.slices.template.strokeWidth = 1;


            chart.legend = new am4charts.Legend();
            chart.legend.position = "center";

            pieSeries.slices.template.events.on("validated", function (event) {
                var gradient = event.target.fillModifier.gradient
                gradient.rotation = event.target.middleAngle + 90;

                var gradient2 = event.target.strokeModifier.gradient
                gradient2.rotation = event.target.middleAngle + 90;
            })
        }

        function add_chart2 () {
            alert ('in chart 2') ;
            var chart = am4core.create("chart2", am4charts.PieChart);

            // Add data
            chart.data = [{
                "pm25_val": 80,
                "trafic_val": 100
            }];

            // Add and configure Series
            var pieSeries = chart.series.push(new am4charts.PieSeries());
            pieSeries.dataFields.value = "pm25_val";
            pieSeries.dataFields.category = "pm25_val";

            pieSeries.labels.template.maxWidth = 130;
            pieSeries.labels.template.wrap = true;

            // Add and configure Series
            var pieSeries2 = chart.series.push(new am4charts.PieSeries());
            pieSeries2.dataFields.value = "trafic_val";
            pieSeries2.dataFields.category = "trafic_val";

            pieSeries2.labels.template.maxWidth = 130;
            pieSeries2.labels.template.wrap = true;
        }

        function add_chart3 () {

            // Apply chart themes
            alert ('in chart 3') ;
            am4core.useTheme(am4themes_animated);
            am4core.useTheme(am4themes_kelly);

            // Create chart instance
            var chart = am4core.create("chart3", am4charts.XYChart);

            // Add data
            chart.data = [{
                "in_process": 20,
                "end_process": 15
            }];

            // Create axes
            var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
            categoryAxis.dataFields.category = "country";
            categoryAxis.title.text = "Local country offices";
            categoryAxis.renderer.grid.template.location = 0;
            categoryAxis.renderer.minGridDistance = 20;


            var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
            valueAxis.title.text = "Expenditure (%)";
            valueAxis.calculateTotals = true;
            valueAxis.min = 0;
            valueAxis.max = 100;
            valueAxis.strictMinMax = true;
            valueAxis.renderer.labels.template.adapter.add("text", function (text) {
                return text + "%";
            });

            // Create series
            var series = chart.series.push(new am4charts.ColumnSeries());
            series.dataFields.valueY = "in_process";
            series.dataFields.valueYShow = "in_process";
            series.dataFields.categoryX = "in_process";
            series.name = "Research";
            series.tooltipText = "{name}: [bold]{valueY}[/]";
            series.stacked = true;

            var series2 = chart.series.push(new am4charts.ColumnSeries());
            series2.dataFields.valueY = "end_process";
            series2.dataFields.valueYShow = "end_process";
            series2.dataFields.categoryX = "end_process";
            series2.name = "Marketing";
            series2.tooltipText = "{name}: [bold]{valueY}[/]";
            series2.stacked = true;

            //var series3 = chart.series.push(new am4charts.ColumnSeries());
            //series3.dataFields.valueY = "sales";
            //series3.dataFields.valueYShow = "totalPercent";
            //series3.dataFields.categoryX = "country";
            //series3.name = "Sales";
            //series3.tooltipText = "{name}: [bold]{valueY}[/]";
            //series3.stacked = true;

            // Add cursor
            chart.cursor = new am4charts.XYCursor();
        }
        //function All_Click() {
        //    PageMethods.ToList(list);
        //}

      
    /*    function list(res) {*/
            // Themes begin
            

            //------------------------------------------------------//

            

            //-------------------------------------------------//

            
    /*    }*/
    function inichart () {
        add_chart1 ();
        add_chart2 ();
        add_chart3 ();
    }
    window.onload = inichart () ;
      
    </script>
         <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <div class="navbar-toggler bg-dark navbar-fixed-top float-left topnav" role="navigation">
            <div class="container">
                <div class="d-flex justify-content-between">
                    <ul class="d-flex justify-content-between" >
                        
                        <li><div class="card p-2 text-center m-2" style="width: 10rem; height:5rem; background-color:aliceblue;"><div>PM 2.5</div> <label  id="l1">0</label>   </div></li>
                    
                        <li><div class="card p-2 text-center m-2" style="width: 10rem; height:5rem; background-color:aquamarine;"><div>CCTV</div> <label id="l2">0</label>     </div></li>
                       
                        <li><div class="card p-2 text-center m-2" style="width: 10rem; height:5rem; background-color:azure;"><div>Live Traffic </div> <label  id="l3">0</label>    </div></li>
                      
                        <li><div class="card p-2 text-center m-2" style="width: 10rem; height:5rem; background-color:bisque;"><div> Lisense Plate</div> <label id="l4">0</label>    </div></li>
                    
                        <li><div class="card p-2 text-center m-2" style="width: 10rem; height:5rem; background-color:blanchedalmond;"><div>Light Bulb </div> <label id="l5">0</label>   </div></li>
                     
                        <li><div class="card p-2 text-center m-2" style="width: 10rem; height:5rem; background-color:burlywood;"><div>Water ManageMent </div>  <label  id="l6">0</label>   </div></li>
                    
                        <li><div class="card p-2 text-center m-2" style="width: 10rem; height:5rem;"><div>Water Treatment </div> <label " id="l7">0</label>   </div></li>
                    
                        <li> <div class="card p-2 text-center m-2" style="width: 10rem; height:5rem; background-color:cornsilk;"><div>Pandemic </div> <label  id="l8">0</label>    </div></li>
                    </ul>
                </div>
            </div>
        </div>
    <div style="position:relative;">
    <div class="float-left bg-dark card col-md-6" style="height:100%; width:15%; padding-top:1.5rem; text-align:center;">
        <p><Button  runat="server" class="card-body border-light bg-light" style="width:100%"  onclick="All_Click()" > </Button>ALL</p>
        <p><Button  runat="server" class="card-body border-light bg-dark" style="color:white; width:100%;"  onclick="JAN_Click()" >JAN</Button></p>
        <p><Button  runat="server" class="card-body border-light bg-light" style="width:100%"  onclick="FEB_Click()" >FEB</Button></p>
        <p><Button  runat="server" class="card-body border-light bg-dark" style="color:white; width:100%;"  onclick="MA_Click()" >Mar</Button></p>
        <p><Button  runat="server" class="card-body border-light bg-light" style="width:100%"  onclick="AP_Click" >APR</Button></p>
        <p><Button runat="server" class="card-body border-light bg-dark" style="color:white;width:100%"  onclick="MAY_Click()" >MAY</Button></p>
        <p><Button  runat="server" class="card-body border-light bg-light" style="width:100%"  onclick="JUNE_Click" ></Button>JUN </p>
        <p><Button runat="server" class="card-body border-light bg-dark" style="color:white;width:100%"  onclick="JUL_Click()" >JUL</Button></p>
        <p><Button  runat="server" class="card-body border-light bg-light" style="width:100%"  onclick="AUG_Click()" ></Button>AUG</p>
        <p><Button  runat="server" class="card-body border-light bg-dark" style="color:white;width:100%"  onclick="SEP_Click()" >SEP</Button></p>
        <p><Button runat="server" class="card-body border-light bg-light" style="width:100%"  onclick="OCT_Click" >Oct</Button></p>
        <p><Button  runat="server" class="card-body border-light bg-dark" style="color:white;width:100%"  onclick="NOV_Click()" >Nov</Button></p>
        <p><Button  runat="server" class="card-body border-light bg-light" style="width:100%" onclick="DEC_Click()" >DEC</Button></p>
         
       
    </div>
    <div class="float-right align-content-end p-1 m-1" style=" position:absolute; left:18%; padding-top:1.5rem; margin:2%">
     <div class=" float-lg-right" style="width:100%">
               <div  id="chart3"></div>
          </div>
        <div class=" float-lg-left" style="width:50%">
               <div  id="chart2"></div>
          </div>
        <div class= " float-lg-right" style="width:50%">
               <div  id="chart1"></div>
          </div>
     
   
        </div>
        </div>
    <script>
        var a = document.getElementById("l1")
        a.value = "1";
        var b = document.getElementById("l2")
        b.value = "1";
        var c = document.getElementById("l3")
        c.value = "1";
        var d = document.getElementById("l4")
        d.value = "1";
        var e = document.getElementById("l5")
        e.value = "1";
        var f = document.getElementById("l6")
        f.value = "1";
        var g = document.getElementById("l7")
        g.value = "1";
        var h = document.getElementById("l8")
        h.value = "1";
    </script>
</asp:Content>
