<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_dash_all.aspx.cs" Inherits="Dash_Board_None.frm_dash_all" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link href="Main_CSS/frm_dash_all.css" rel="stylesheet" />
    <link href="css/chart1.css" rel="stylesheet" />
    <%--  <link href="css/chart1.css" rel="stylesheet" />--%>
    <script src="https://cdn.amcharts.com/lib/4/core.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/themes/kelly.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/themes/material.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/themes/dataviz.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/themes/frozen.js"></script>
    <style>
        /*.tooltip-ex {*/ /* Container for our tooltip */
        /*position: relative; 
 display: inline-block;
}*/
        

        
    </style>

    <script>

        function allchart1() {
            /*   var yy = document.getElementById("allyears").value;*/

            PageMethods.Default(add_chart1);
            PageMethods.Default2(add_chart2);
            PageMethods.Default3(add_chart3);
            PageMethods.Default4(set_label1);
        }


        function add_chart1(response, userContext, methodName) {
            //alert("push ");
            am4core.ready(function () {
                //am4core.useTheme(am4themes_kelly);
                am4core.useTheme(am4themes_frozen);

                var chart = am4core.create("chart1", am4charts.PieChart);
                chart.hiddenState.properties.opacity = 0; // this creates initial fade-in

                chart.legend = new am4charts.Legend();

                /*           alert(JSON.stringify(response, 4, null));*/
                chart.data = JSON.parse(response);

                var series = chart.series.push(new am4charts.PieSeries());
                series.dataFields.value = "val";
                series.dataFields.category = "display";
                series.width = am4core.percent(100);
                series.height = am4core.percent(100);

                series.colors.list = [
                    am4core.color("#047807"),
                    am4core.color("#e3e302")

                ];
                var label = chart.chartContainer.createChild(am4core.Label);
                label.text = "สัดส่วนการตอบรับการแจ้งเตือนทั้งหมด ";
                label.align = "center";
                label.marginBottom = 50;
                label.fontSize = 15;

            });
        }


        function add_chart2(response, userContext, methodName) {

            am4core.useTheme(am4themes_material);
            am4core.useTheme(am4themes_animated);
            // Themes end

            // Create chart instance
            var chart = am4core.create("chart2", am4charts.XYChart);

            chart.data = JSON.parse(response)
            //alert(chart.data);
            chart.legend = new am4charts.Legend();
            let markerTemplate = chart.legend.markers.template;
            markerTemplate.width = 20;
            markerTemplate.height = 20;
            // var label2 = chart.chartContainer.createChild(am4core.Label);
            // label2.text = "จำนวนการแจ้งเตือน PM 2.5 {val.total} และ สภาพจราจร {val.total} ";
            // label2.align = "center";
            // label2.marginBottom = 90;
            // label2.fontSize = 15;
          
            // var label2 = chart.chartContainer.createChild(am4core.Label);
            // label2.text = "จำนวนการแจ้งเตือน PM 2.5 {val.total} และ สภาพจราจร {val.total} ";
            // label2.align = "top";
            // // label2.marginTop= 50;
            // label2.fontSize = 20;
            // Create axes
            var categoryAxis = chart.yAxes.push(new am4charts.CategoryAxis());
            categoryAxis.dataFields.category = "station";
            categoryAxis.renderer.grid.template.opacity = 0;
            categoryAxis.renderer.labels.template.fontSize = 11;

            var valueAxis = chart.xAxes.push(new am4charts.ValueAxis());
            valueAxis.min = 0;
            valueAxis.renderer.grid.template.opacity = 0;
            valueAxis.renderer.ticks.template.strokeOpacity = 0.5;
            valueAxis.renderer.ticks.template.stroke = am4core.color("#495C43");
            valueAxis.renderer.ticks.template.length = 5;
            valueAxis.renderer.line.strokeOpacity = 0.5;
            valueAxis.renderer.baseGrid.disabled = true;
            valueAxis.renderer.minGridDistance = 40;

            valueAxis.title.text = "จำนวนการแจ้งเตือนค่าฝุ่น PM 2.5 และ สภาพจราจรที่เกินค่ามาตรฐาน ";
            valueAxis.title.rotation = 0;
            valueAxis.title.align = "center";
            valueAxis.title.valign = "top";
            valueAxis.title.dy = -280
            valueAxis.title.fontWeight = 1000;

            //var categoryAxis2 = chart.xAxes.push(new am4charts.CategoryAxis());
            //categoryAxis2.title.text = "ครั้ง";

            // Create series
            function createSeries(field, name, colors) {
                var series = chart.series.push(new am4charts.ColumnSeries());
                series.dataFields.valueX = field;
                series.dataFields.categoryY = "station";
                series.stacked = true;
                series.name = name;
                series.fill = am4core.color(colors);
                var labelBullet = series.bullets.push(new am4charts.LabelBullet());
                labelBullet.locationX = 0.2;
                labelBullet.label.text = "{valueX}";
                labelBullet.label.fill = am4core.color("#fff");
            }

            createSeries("pm", "ค่า PM 2.5", "#d7a8b2");
            createSeries("traf", "สภาพจราจร", "#b8335b");


        }

        function add_chart3(response, userContext, methodName) {

            am4core.useTheme(am4themes_material);
            am4core.useTheme(am4themes_animated);
            // Themes end

            // Create chart instance
            var chart = am4core.create("chartdiv", am4charts.XYChart);

            /*      Add data*/
            chart.data = JSON.parse(response);


            // Create axes
            var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
            categoryAxis.dataFields.category = "mm";
            categoryAxis.title.text = "เดือน";
            categoryAxis.renderer.labels.template.fontSize = 50;
            /*  categoryAxis.title.text = "Local country offices";*/
            categoryAxis.renderer.grid.template.location = 0;
            categoryAxis.renderer.minGridDistance = 0;
            categoryAxis.renderer.cellStartLocation = 0.2
            categoryAxis.renderer.cellEndLocation = 0.8
            categoryAxis.renderer.labels.template.fontSize = 20;
            var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
            valueAxis.title.text = "จำนวนครั้ง";

            var label2 = chart.chartContainer.createChild(am4core.Label);
            label2.text = "ตำแหน่งการเกิดอุบัติเหตุหรืออาชญากรรม และไฟฟ้าดับ ในช่วงเวลา 7 วัน";
            label2.align = "center";
            label2.dy = -280
            label2.valign = "top"
            // label2.marginTop= 50;
            label2.fontSize = 13;

            var series2 = chart.series.push(new am4charts.ColumnSeries());
            series2.sequencedInterpolation = true;
            series2.columns.template.width = am4core.percent(100);
            series2.dataFields.valueY = "blub";
            series2.dataFields.categoryX = "mm";
            /* series2.paddingLeft = am4core.percent(40);*/
            series2.paddingRight = am4core.percent(100);
            series2.tooltipText = "[{categoryX}: bold]{valueY}[/]";
            series2.columns.template.strokeWidth = 0;
            series2.fill = am4core.color("#1496fa");
            series2.name = "ไฟดับแล้วเกี่ยวข้องกับเหตุ";
            series2.fontSize = 20;


            series2.tooltip.pointerOrientation = "vertical";

            /*  series2.label.text = "{valueY}";*/
            let labelBullet1 = series2.bullets.push(new am4charts.LabelBullet());
            labelBullet1.label.text = "{valueY}";
            labelBullet1.label.fill = am4core.color("#fff");
            labelBullet1.locationY = 0.5;
            series2.columns.template.column.cornerRadiusTopLeft = 1;
            series2.columns.template.column.cornerRadiusTopRight = 1;
            series2.columns.template.column.fillOpacity = 0.8;


            // Create series
            var series = chart.series.push(new am4charts.ColumnSeries());
            series.sequencedInterpolation = true;
            series.columns.template.width = am4core.percent(100);
            series.dataFields.valueY = "acc";
            series.dataFields.categoryX = "mm";
            series.tooltipText = "[{categoryX}: bold]{valueY}[/]";
            series.columns.template.strokeWidth = 0;
            series.paddingRight = am4core.percent(100);
            series.fill = am4core.color("#1902c7");
            /*     series.label.text = "{valueY}";*/
            series.tooltip.pointerOrientation = "vertical";

            series.columns.template.column.cornerRadiusTopLeft = 1;
            series.columns.template.column.cornerRadiusTopRight = 1;
            series.columns.template.column.fillOpacity = 0.8;
            series.name = "เหตุที่เกี่ยวกับไฟดับ";
            series.fontSize = 20;

            let labelBullet = series.bullets.push(new am4charts.LabelBullet());
            labelBullet.label.text = "{valueY}";
            labelBullet.label.fill = am4core.color("#fff");
            labelBullet.locationY = 0.5;

            // Add cursor
            chart.cursor = new am4charts.XYCursor();

            // Add legend
            chart.legend = new am4charts.Legend();
            let markerTemplate = chart.legend.markers.template;
            markerTemplate.width = 20;
            markerTemplate.height = 20;
        }

        function set_label1(response, userContext, methodName) {
            var json_obj = JSON.parse(response);
            //document.getElementById("res").innerHTML = JSON.stringify(json_obj, 4, null);
            if (json_obj.length == 0) {
                console.log(json_obj)
                document.getElementById("pm").innerHTML = "0"
                document.getElementById("cctv").innerHTML = "0"
                document.getElementById("live_trafic").innerHTML = "0"
                document.getElementById("licensep").innerHTML = "0"
                document.getElementById("light_b").innerHTML = "0"
                document.getElementById("water_mng").innerHTML = "0"
                document.getElementById("water_tread").innerHTML = "0"
            }
            document.getElementById("pm").innerHTML = json_obj[0].pm;
            document.getElementById("cctv").innerHTML = json_obj[0].cctv
            document.getElementById("live_trafic").innerHTML = json_obj[0].trafic;
            document.getElementById("licensep").innerHTML = json_obj[0].license;
            document.getElementById("light_b").innerHTML = json_obj[0].lightb;
            document.getElementById("water_mng").innerHTML = json_obj[0].water;
            document.getElementById("water_tread").innerHTML = json_obj[0].qc;
        }

        //Button
        function chartalls() {

        }
        function ChangeAll() {

            var yy = document.getElementById("allyears").value;
            /*          var mm = document.getElementsByClassName("button_m").value;*/
            //alert("FF");
            PageMethods.Change(yy, add_chart1);
            PageMethods.Change2(yy, add_chart2);
            PageMethods.Change3(yy, add_chart3);
            PageMethods.Change4(yy, set_label1);

        }
        function Button(mm) {
            /*  var mm = document.getElementsByClassName("button_m").value;*/
            var yy = document.getElementById("allyears").value;
            //alert("GG");
            PageMethods.Buttonclick(mm, yy, add_chart1);
            PageMethods.Buttonclick2(mm, yy, add_chart2);
            PageMethods.Buttonclick3(mm, yy, add_chart3);
            PageMethods.Buttonclick4(mm, yy, set_label1);

        }



    </script>
</head>
<body onload="allchart1();">
    <form id="form1" runat="server">
        <div class="from_wrapper" style="margin: 30px">
            <div class="form_row form_header">
                <h1>Statistics of Emergency Warning : Pakkret Municipality</h1>
            </div>
            <div class="content">
                <div class="form_row" style="display: flex;">
                    <div class="form_inline" style="border: 2px solid #808080; height: 100%; border-radius: 5px;">
                        <div class="form_row">
                            <img src="images/logo.jpg" style="height: 149px; width: 162px; margin: 0 15px" />
                        </div>
                        <div class="form_row">
                            <div class="form_row">
                                <div class="form_row" style="margin: 1em 0;">
                                    <asp:Label ID="select1" runat="server" Text="เลือกปี" CssClass="labelch"></asp:Label>
                                </div>
                                <div class="form_row">
                                    <select id="allyears" class="cbo_y" onchange="ChangeAll();">
                                        <option value="2021">2564</option>
                                        <option value="2020">2563</option>
                                        <option value="2019">2562</option>
                                    </select>
                                </div>
                                <div class="form_row" style="margin: 1em 0;">
                                    <asp:Label ID="selectbutton" runat="server" Text="เลือกเดือน" CssClass="labelch"></asp:Label>
                                </div>
                                <div class="form_row spacetb">
                                    <input id="bu1" class="button_m2" onclick="Button(13);" type="button" value="ทั้งปี" name="buttons" />
                                </div>
                                <div class="form_row spacetb">
                                    <input id="bu2" class="button_m2" onclick="Button(1);" type="button" value="ม.ค." />
                                </div>
                                <div class="form_row spacetb">
                                    <input id="bu3" class="button_m2" onclick="Button(2);" type="button" value="ก.พ." />
                                </div>
                                <div class="form_row spacetb">
                                    <input id="bu4" class="button_m2" onclick="Button(3);" type="button" value="มี.ค." />
                                </div>
                                <div class="form_row spacetb">
                                    <input id="bu5" class="button_m2" onclick="Button(4);" value="เม.ย." type="button" />
                                </div>
                                <div class="form_row spacetb">
                                    <input id="bu6" class="button_m2" onclick="Button(5);" value="พ.ค." type="button" />
                                </div>
                                <div class="form_row spacetb">
                                    <input id="bu7" class="button_m2" onclick="Button(6);" value="มิ.ย." type="button" />
                                </div>
                                <div class="form_row spacetb">
                                    <input id="bu8" class="button_m2" onclick="Button(7);" value="ก.ค." type="button" />
                                </div>
                                <div class="form_row spacetb">
                                    <input id="bu9" class="button_m2" onclick="Button(8);" value="ส.ค." type="button" />
                                </div>
                                <div class="form_row spacetb">
                                    <input id="bu10" class="button_m2" onclick="Button(9);" value="ก.ย." type="button" />
                                </div>
                                <div class="form_row spacetb">
                                    <input id="bu11" class="button_m2" onclick="Button(10);" value="ต.ค." type="button" />
                                </div>
                                <div class="form_row spacetb">
                                    <input id="bu12" class="button_m2" onclick="Button(11);" value="พ.ย." type="button" />
                                </div>
                                <div class="form_row spacetb">
                                    <input id="bu13" class="button_m2" onclick="Button(12);" value="ธ.ค." type="button" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form_inline" style="border: 2px solid #808080; height: 100%; border-radius: 5px; width: 1200px; margin-left: 30px;">
                        <div class="form_row flex_inline" style="z-index:1000;margin-top:10px;">
                            <div class="form_inline">
                                <div class="form_row">
                                    <div class="label_TT">
                                        PM 2.5
                                    <input type="button" value="..." id="cmdpm" onclick="window.open('frm_grid_pm.aspx', '_blank');" />
                                    </div>
                                </div>
                                <div class="form_row">
                                    <div id="pm" class="label_T " title="จำนวนครั้งที่ PM 2.5 เกิน 90 ไมโครกรัมต่อลูกบาศก์เมตร">100
                                        <div class="tooltiptext" >
                                            <span>จำนวนครั้งที่ PM 2.5 เกิน 90 ไมโครกรัมต่อลูกบาศก์เมตร</span>
                                        </div>
                                       
                                    </div>
                                   </div> 
                              

                            </div>
                            <div class="form_inline ">
                                <div class="form_row">
                                    <div class="label_TT">
                                        เหตุบริเวณไฟดับ
                                    <input type="button" value="..." id="cmdcctv" onclick="window.open('frm_grid_cctv.aspx', '_blank');" />
                                    </div>
                                </div>
                                <div class="form_row ">
                                    <div id="cctv" class="label_T" title="จำนวนครั้งที่เกิดเหตุ / ทำให้เสียทรัพย์ บริเวณที่มี ไฟดับ">
                                        100 
                                        <div class="tooltiptext" >
                                            <span>จำนวนครั้งที่เกิดเหตุ / ทำให้เสียทรัพย์ บริเวณที่มี ไฟดับ</span>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                            <div class="form_inline ">
                                <div class="form_row">
                                    <div class="label_TT">
                                        การจราจร
                                    <input type="button" value="..." id="cmdtrafic" onclick="window.open('frm_grid_trafic.aspx', '_blank');" />
                                    </div>
                                </div>
                                <div class="form_row ">
                                    <div id="live_trafic" class="label_T" title="จำนวนครั้งที่เกิดเหตุ / ทำให้เสียทรัพย์ บริเวณที่มี ไฟดับ">
                                        100 
                                        <div class="tooltiptext" >
                                            <span>จำนวนครั้งที่เกิดเหตุ / ทำให้เสียทรัพย์ บริเวณที่มี ไฟดับ</span>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                            <div class="form_inline ">
                                <div class="form_row">
                                    <div class="label_TT">ทะเบียนรถควรระวัง</div>
                                </div>
                                <div class="form_row ">
                                    <div id="licensep" class="label_T" title="จำนวนครั้งที่มีการแจ้งเตือนเรื่องทะเบียนที่ต้องระวัง">
                                        100
                                        <div class="tooltiptext" >
                                            <span>จำนวนครั้งที่มีการแจ้งเตือนเรื่องทะเบียนที่ต้องระวัง </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form_inline ">
                                <div class="form_row">
                                    <div class="label_TT">
                                        แจ้งซ่อมไฟฟ้าดับ
                                     <input type="button" value="..." id="cmdlight" onclick="window.open('frm_grid_light.aspx', '_blank');" />
                                    </div>
                                </div>
                                <div class="form_row ">
                                    <div id="light_b" class="label_T" title="จำนวนครั้งที่มีการแจ้งซ่อมไฟดับ">
                                        100
                                        <div class="tooltiptext" >
                                            <span>จำนวนครั้งที่มีการแจ้งซ่อมไฟดับ </span>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                            <div class="form_inline ">
                                <div class="form_row">
                                    <div class="label_TT">
                                        บริหารจัดการน้ำ
                                     <input type="button" value="..." id="cmdtrafic2" onclick="window.open('frm_grid_water.aspx', '_blank');" />
                                    </div>
                                    <div class="form_row ">
                                        <div id="water_mng" class="label_T" title="จำนวนครั้งที่มีการแจ้งเตือนเรื่องน้ำด้านหลังประตูถึงระดับ 3 ">
                                            100
                                            <div class="tooltiptext" >
                                            <span>จำนวนครั้งที่มีการแจ้งเตือนเรื่องน้ำด้านหลังประตูถึงระดับ 3</span>
                                        </div>
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
                            <div class="form_inline ">
                                <div class="form_row">
                                    <div class="label_TT">คุณภาพน้ำ</div>
                                </div>
                                <div class="form_row ">
                                    <div id="water_tread" class="label_T" title="จำนวนครั้งที่มีการแจ้งเตือนเรื่องคุณภาพน้ำทิ้ง เกินค่ามาตรฐาน">
                                        100
                                        <div class="tooltiptext" >
                                            <span>จำนวนครั้งที่มีการแจ้งเตือนเรื่องคุณภาพน้ำทิ้ง เกินค่ามาตรฐาน</span>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                        
                        <div class="form_row" style="display:flex;margin-top:10px;">
                            <div class="form_inline" style="width:50%">
                                <div id="chart1" class="normal_text" style="width:100%;height:347.5px;" ></div>
                            </div>
                            <div class="form_inline" style="width:50%">
                                <div id="chart2" class="normal_text" style="width:100%;height:347.5px;" ></div>
                            </div>
                        </div>
                        <div class="form_row">
                            <div class="form_inline" style="width:100%">
                                <div id="chartdiv" class="normal_text" style="width:100%;height:347.5px" ></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="res" style="width: 100%; height: 100px"></div>
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True">
        </asp:ScriptManager>
    </form>



</body>
</html>
