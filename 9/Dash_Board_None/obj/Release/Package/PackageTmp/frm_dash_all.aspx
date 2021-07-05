<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_dash_all.aspx.cs" Inherits="Dash_Board_None.frm_dash_all" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

  
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

.tooltip-ex .tooltip-ex-text { /* This is for the tooltip text */
 visibility: hidden;
 width: 100px;
 background-color:aquamarine;
 color: white;
 text-align: center;
 padding: 10px;
 border-radius: 10px; /* This defines tooltip text position */
 position: absolute;
 z-index: 10;
}

.tooltip-ex:hover .tooltip-ex-text { /* Makes tooltip text visible when text is hovered on */
 visibility: visible;
}
    </style>
      <script>

          function allchart1() {
              /*   var yy = document.getElementById("allyears").value;*/

              PageMethods.Default(add_chart1);
              PageMethods.Default2(add_chart2);
              PageMethods.Default3(add_chart3);
              PageMethods.Default4(set_label1);
          }
          //      } function allchart2() {
          //          /*   var yy = document.getElementById("allyears").value;*/

          //     /*     PageMethods.Default(add_chart1);*/
          //          PageMethods.Default2(add_chart2);
          //          //PageMethods.Default3(add_chart3);
          //          //PageMethods.Default4(set_label1);

          //      } function allchart3() {
          //          /*   var yy = document.getElementById("allyears").value;*/

          //          //PageMethods.Default(add_chart1);
          //          //PageMethods.Default2(add_chart2);
          //          PageMethods.Default3(add_chart3);
          ///*          PageMethods.Default4(set_label1);*/

          //      } function allchart4() {
          //          /*   var yy = document.getElementById("allyears").value;*/

          //          //PageMethods.Default(add_chart1);
          //          //PageMethods.Default2(add_chart2);
          //          //PageMethods.Default3(add_chart3);
          //          PageMethods.Default4(set_label1);

          //      }
          //      //function allchart() {
          //      //    add_chart1();
          //      //    add_chart2();
          //      //    add_chart3();
          //      //    set_label1();
          //      //}

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
                 
                  //alert(JSON.stringify(response, 4, null));
                  //alert(chart.data);
                  //chart.data = [{
                  //    "display": "Found",
                  //    "val": 300
                  //},
                  //{
                  //    "display": "Finish",
                  //    "val": 210
                  //}]
                  var series = chart.series.push(new am4charts.PieSeries());
                  series.dataFields.value = "val";
                  series.dataFields.category = "display";
                  /* pieSeries.slices.template.propertyFields.fill = am4core.color("#0000FF");*/
                  /*series.slices.template.propertyFields.fill = am4core.color("#FF9933");*/
                  //series.fill = am4core.color("#0000FF");
                  //series.slices.template.stroke = am4core.color("#fff");
                  /*      chart.cursor = new am4charts.XYCursor();*/

                  series.colors.list = [
                      am4core.color("#047807"),
                      am4core.color("#e3e302")

                  ];
                  var label = chart.chartContainer.createChild(am4core.Label);
                  label.text = "การแจ้งเตือนทั้งหมด {val.total} คร้ง";
                  label.align = "center";
                  label.marginBottom = 50;
                  //let title = chart.titles.create();
                  //title.text = "Speed";
                  //title.fontSize = 25;
                  //title.marginBottom = 30;
              });
          }


          function add_chart2(response, userContext, methodName) {


              //            am4core.useTheme(am4themes_material);
              //            am4core.useTheme(am4themes_animated);
              //            // Themes end

              //            // Create chart instance
              //            var chart = am4core.create("chart2", am4charts.XYChart);
              //            //document.getElementById("res").innerHTML = JSON.stringify(response, 4, null);
              //             /*Add data*/
              //            chart.data = [{
              //                "st_name": "station1",
              //                "pm": 5000,
              //                "traf": 2500
              //            }, {
              //                "st_name": "station2",
              //                "pm": 4500,
              //                "traf": 3500
              //            }, {
              //                "st_name": "station3",
              //                "pm": 0,
              //                "traf": 5500
              //            }];
              //            //chart.data = JSON.parse(response)
              //            //alert(JSON.stringify(response, 4, null));
              //            chart.legend = new am4charts.Legend();
              //            chart.legend.position = "right";

              //            // Create axes
              //            var categoryAxis = chart.yAxes.push(new am4charts.CategoryAxis());
              //            categoryAxis.dataFields.category = "station_name";
              //            categoryAxis.renderer.grid.template.opacity = 0;

              //            var valueAxis = chart.xAxes.push(new am4charts.ValueAxis());
              //   /*         valueAxis.min = 0;*/
              //            valueAxis.renderer.grid.template.opacity = 0;
              //            valueAxis.renderer.ticks.template.strokeOpacity = 0.5;
              //   /*         valueAxis.renderer.ticks.template.stroke = am4core.color("#495C43");*/
              //            valueAxis.renderer.ticks.template.length = 10;
              //            valueAxis.renderer.line.strokeOpacity = 0.5;
              //            valueAxis.renderer.baseGrid.disabled = true;
              //            valueAxis.renderer.minGridDistance = 40;
              //            valueAxis.min = 0;
              ///*            valueAxis.max = 200;*/

              //            var label = chart.chartContainer.createChild(am4core.Label);
              //            label.text = "การแจ้งเตือน  PM 2.5 จำนวน {pm} คร้ง และ สภาพจราจร {traf} ครั้ง";
              //            label.align = "center";
              //            label.marginBottom = 50;
              //            // Create series
              //            function createSeries(field, name , colors) {
              //                var series = chart.series.push(new am4charts.ColumnSeries());
              //                series.dataFields.valueX = field;
              //                series.dataFields.categoryY = "station";
              //                series.stacked = true;
              //                series.name = name;
              //                series.fill = am4core.color(colors);
              //                series.columns.template.width = am4core.percent(70);
              //                var labelBullet = series.bullets.push(new am4charts.LabelBullet());
              //                labelBullet.locationX = 0.5;
              //                labelBullet.label.text = "{valueX}";
              //                labelBullet.label.fill = am4core.color("#fff");
              //            }

              //            createSeries("pm", "ค่า PM 2.5", "#FF9900");
              //            createSeries("traf", "สภาพจราจร", "#990099");
              //alert('in chart 2');
              am4core.useTheme(am4themes_material);
              am4core.useTheme(am4themes_animated);
              // Themes end

              // Create chart instance
              var chart = am4core.create("chart2", am4charts.XYChart);
              //document.getElementById("res").innerHTML = JSON.stringify(response, 4, null);
              // Add data
              //chart.data = [{
              //    "st_name": "station1",
              //    "pm": 10,
              //    "traf": 5
              //}, {
              //    "st_name": "station2",
              //    "pm": 20,
              //    "traf": 12
              //}, {
              //    "st_name": "station3",
              //    "pm": 23,
              //    "traf": 30
              //}];
              chart.data = JSON.parse(response)
              //alert(chart.data);
              chart.legend = new am4charts.Legend();
              chart.legend.position = "right";
              var label = chart.chartContainer.createChild(am4core.Label);
              label.text = "ครั้ง"
              label.align = "center";
         
              var label2 = chart.chartContainer.createChild(am4core.Label);
              label2.text = "จำนวนการแจ้งเตือน PM 2.5 {val.total} คร้ง และ สภาพจราจร {val.total}";
              label2.align = "center";
              label2.marginBottom = 90;
              // Create axes
              var categoryAxis = chart.yAxes.push(new am4charts.CategoryAxis());
              categoryAxis.dataFields.category = "station";
              categoryAxis.renderer.grid.template.opacity = 0;
              
              var valueAxis = chart.xAxes.push(new am4charts.ValueAxis());
              valueAxis.min = 0;
              valueAxis.renderer.grid.template.opacity = 0;
              valueAxis.renderer.ticks.template.strokeOpacity = 0.5;
              valueAxis.renderer.ticks.template.stroke = am4core.color("#495C43");
              valueAxis.renderer.ticks.template.length = 10;
              valueAxis.renderer.line.strokeOpacity = 0.5;
              valueAxis.renderer.baseGrid.disabled = true;
              valueAxis.renderer.minGridDistance = 40;

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
              //chart.data = [{
              //    "mm": "1",
              //    "blub": 5000,
              //    "acc": 2500
              //}, {
              //    "mm": "2",
              //    "blub": 4500,
              //    "acc": 3500
              //}, {
              //    "mm": "3",
              //    "blub": 0,
              //    "acc": 5500
              //    },{
              //        "mm": "4",
              //        "blub": 4500,
              //        "acc": 3500
              //    }];

              // Create axes
              var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
              categoryAxis.dataFields.category = "mm";
              categoryAxis.title.text = "เดือน";
              /*  categoryAxis.title.text = "Local country offices";*/
              categoryAxis.renderer.grid.template.location = 0;
              categoryAxis.renderer.minGridDistance = 20;
              categoryAxis.renderer.cellStartLocation = 0.2
              categoryAxis.renderer.cellEndLocation = 0.8
              var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
              valueAxis.title.text = "จำนวนครั้ง";

              // Create series
              var series = chart.series.push(new am4charts.ColumnSeries());
              series.sequencedInterpolation = true;
              series.columns.template.width = am4core.percent(80);
              series.dataFields.valueY = "blub";
              series.dataFields.categoryX = "mm";
              series.tooltipText = "[{categoryX}: bold]{valueY}[/]";
              series.columns.template.strokeWidth = 0;
              series.paddingRight = am4core.percent(90);
              series.fill = am4core.color("#1496fa");
              /*     series.label.text = "{valueY}";*/
              series.tooltip.pointerOrientation = "vertical";

              series.columns.template.column.cornerRadiusTopLeft = 1;
              series.columns.template.column.cornerRadiusTopRight = 1;
              series.columns.template.column.fillOpacity = 0.8;
              series.name = "เหตุที่เกี่ยวกับไฟดับ";

              let labelBullet = series.bullets.push(new am4charts.LabelBullet());
              labelBullet.label.text = "{valueY}";
              labelBullet.label.fill = am4core.color("#fff");
              labelBullet.locationY = 0.5;
              // This has no effect
              // series.stacked = true;
              //var totalBullet = series.bullets.push(new am4charts.LabelBullet());
              //totalBullet.dy = -20;
              //totalBullet.label.text = "{valueY.total}";
              //totalBullet.label.hideOversized = false;
              //totalBullet.label.fontSize = 18;
              //totalBullet.label.background.fill = totalSeries.stroke;
              //totalBullet.label.background.fillOpacity = 0.2;
              //totalBullet.label.padding(5, 10, 5, 10);

              var series2 = chart.series.push(new am4charts.ColumnSeries());
              series2.sequencedInterpolation = true;
              series2.columns.template.width = am4core.percent(80);
              series2.dataFields.valueY = "acc";
              series2.dataFields.categoryX = "mm";
             /* series2.paddingLeft = am4core.percent(40);*/
              series2.paddingRight = am4core.percent(60);
              series2.tooltipText = "[{categoryX}: bold]{valueY}[/]";
              series2.columns.template.strokeWidth = 0;
              series2.fill = am4core.color("#1902c7");
              series2.name = "ไฟดับแล้วเกี่ยวข้องกับเหตุ";


              series2.tooltip.pointerOrientation = "vertical";

              /*  series2.label.text = "{valueY}";*/
              let labelBullet1 = series2.bullets.push(new am4charts.LabelBullet());
              labelBullet1.label.text = "{valueY}";
              labelBullet1.label.fill = am4core.color("#fff");
              labelBullet1.locationY = 0.5;
              series2.columns.template.column.cornerRadiusTopLeft = 1;
              series2.columns.template.column.cornerRadiusTopRight = 1;
              series2.columns.template.column.fillOpacity = 0.8;
              // Do not try to stack on top of previous series
              // series2.stacked = true;

              //var totalBullet = series2.bullets.push(new am4charts.LabelBullet());
              //totalBullet.dy = -20;
              //totalBullet.label.text = "{valueY.total}";
              //totalBullet.label.hideOversized = false;
              //totalBullet.label.fontSize = 18;
              //totalBullet.label.background.fill = totalSeries.stroke;
              //totalBullet.label.background.fillOpacity = 0.2;
              //totalBullet.label.padding(5, 10, 5, 10);
              // Add cursor
              chart.cursor = new am4charts.XYCursor();

              // Add legend
              chart.legend = new am4charts.Legend();
          }

          function set_label1(response, userContext, methodName) {
              var json_obj = JSON.parse(response);
              //document.getElementById("res").innerHTML = JSON.stringify(json_obj, 4, null);
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
<body onload="allchart1();" >
    <form id="form1" runat="server">
        <div>
        </div>
        <table align="left"  style="width: 100%; position:absolute; float: left; border-style: solid; border-width: 1px">
            <tr>
                <td rowspan="2" style="text-align: center">
                    <img src="images/logo.jpg" width="120px" style="height: 120px" /></td>
                <td colspan="2">
                    <div class="text_header" style="width: 90%">Statistics of Emergency Warning : Pakkret Municipality</div>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <table align="center"  cellpadding="2" style="width: 100%">
                        <tr>
                            <td class="label_header" style="text-align: center; color: #FFFFFF; background-color: #666699;">
                                <strong>PM 2.5 </strong>
                                <input type="button" value="..." id="cmdpm" onclick="window.open('frm_grid_pm.aspx', '_blank');" />

                            </td>
                            <td class="label_header " class="normal_text" style="text-align: center; color: #FFFFFF; background-color: #666699;">
                                <strong>เหตุบริเวณไฟดับ </strong>
                                <input type="button" value="..." id="cmdcctv" onclick="window.open('frm_grid_cctv.aspx', '_blank');" />
                            </td>
                            <td class="label_header" style="text-align: center; color: #FFFFFF; background-color: #666699;">
                                <strong>การจราจร</strong>
                                <input type="button" value="..." id="cmdtrafic" onclick="window.open('frm_grid_trafic.aspx', '_blank');" />
                            </td>
                            <td class="label_header" style="text-align: center; color: #FFFFFF; background-color: #666699;">
                                <strong>ทะเบียนรถควรระวัง</strong>
                            </td>
                            <td class="label_header" style="text-align: center; color: #FFFFFF; background-color: #666699;">
                                <strong>แจ้งซ่อมไฟฟ้าดับ</strong><input type="button" value="..." id="cmdlight" onclick="window.open('frm_grid_light.aspx', '_blank');" />
                            </td>
                            <td class="label_header" style="text-align: center; color: #FFFFFF; background-color: #666699;">
                                <input type="button" value="..." id="cmdtrafic" onclick="window.open('frm_grid_water.aspx', '_blank');" />
                                <strong>บริหารจัดการน้ำ</strong>
                            </td>
                            <td class="label_header" style="text-align: center; color: #FFFFFF; background-color: #666699;">
                                <strong>คุณภาพน้ำ</strong>
                            </td>
                        </tr>
                        <tr>

                            <td style="text-align: center" class="tooltip-ex" ><div id="pm" class="label_num">100
                    
                             </div>
                                     <span class="tooltip-ex-text">
                                <span style="color: black;">จำนวนครั้งที่ PM 2.5 เกิน 90 ไมโครกรัมต่อลูกบาศก์เมตร</span>
                                </span>
                            </td>
                            <td style="text-align: center" class="tooltip-ex" >
                                <div id="cctv" class="label_num"  onclick="alert('xxx');">100  
                                </div>
                                <span class="tooltip-ex-text">
                                <span style="color: black;">จำนวนครั้งที่เกิดเหตุ / ทำให้เสียทรัพย์ บริเวณที่มี ไฟดับ</span>
                                </span>
                            </td>
                            <td style="text-align: center" class="tooltip-ex" >
                                <div id="live_trafic" class="label_num">100 
                                </div>
                                <span class="tooltip-ex-text">
                                <span style="color: black;">จำนวนครั้งที่มีรถติด นอกชวงเวลาที่กำหนดไว้</span>
                                </span>
                            </td>
                            <td style="text-align: center" class="tooltip-ex" >
                                <div id="licensep" class="label_num">100
                                </div>
                                <span class="tooltip-ex-text">
                                <span style="color: black;"> จำนวนครั้งที่มีการแจ้งเตือนเรื่องทะเบียนที่ต้องระวัง</span>
                                </span>
                            </td>
                            <td style="text-align: center" class="tooltip-ex" >
                                <div id="light_b" class="label_num">100
                                </div>
                                <span class="tooltip-ex-text">
                                <span style="color: black;"> จำนวนครั้งที่มีการแจ้งซ่อมไฟดับ </span>
                                </span>
                            </td>
                            <td style="text-align: center" class="tooltip-ex" >
                                <div id="water_mng" class="label_num">100
                                </div>
                                <span class="tooltip-ex-text">
                                <span style="color: black;"> จำนวนครั้งที่มีการแจ้งเตือนเรื่องน้ำด้านหลังประตูถึงระดับ 3 </span>
                                </span>
                            </td>
                            <td style="text-align: center" class="tooltip-ex" >
                                <div id="water_tread" class="label_num">100
                                </div>
                                <span class="tooltip-ex-text">
                                <span style="color: black;">จำนวนครั้งที่มีการแจ้งเตือนเรื่องคุณภาพน้ำทิ้ง เกินค่ามาตรฐาน</span>
                                </span>
                            </td>
                          
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td rowspan="2" style="width: 213px" valign="top">
                    <table align="center" cellpadding="2" style="width: 100%; float: left">
                        <tr>
                            <td class="normal_text">Select Year</td>
                        </tr>
                        <tr>
                            <td style="text-align: center">
                                <%--<asp:DropDownList ID="DropDownList1" CssClass="cbo_y" AutoPostBack="true" runat="server" Height="16px" Width="150px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                    <asp:ListItem Selected="True" Value="2021">2564</asp:ListItem>
                                    <asp:ListItem Value="2020">2563</asp:ListItem>
                                </asp:DropDownList>--%>
                                <select id="allyears" class="cbo_y"  onchange="ChangeAll();" style="height: 16px; width: 150px;">
                                    <option value="2021">2564</option>
                                    <option value="2020">2563</option>
                                    <option value="2019">2562</option>

                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: left" class="normal_text">Select Month</td>
                        </tr>
                        <tr>
                            <td style="text-align: center">
                                <input id="bu1" class="button_m" type="button" name="buttons" tabindex="1" value="All"  onclick="Button(13); "style="width: 150px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center">
                                <input id="bu2" onclick="Button(1);" type="button" class="button_m" value="JAN"  style="width: 150px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center">
                                <input id="bu3" class="button_m" onclick="Button(2);" type="button" value="Feb" style="width: 150px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center">
                                <input id="bu4" class="button_m" onclick="Button(3);" value="Mar" type="button"  style="width: 150px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center">
                                <input id="bu5" class="button_m" onclick="Button(4);" value="Apr" type="button" style="width: 150px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center">
                                <input id="bu6" class="button_m" onclick="Button(5);" value="May" type="button" style="width: 150px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center">
                                <input id="bu7" class="button_m" onclick="Button(6);" value="JUN" type="button"  style="width: 150px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center">
                                <input id="bu8" class="button_m" onclick="Button(7);" value="JULY" type="button"  style="width: 150px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center">
                                <input id="bu9" class="button_m" onclick="Butto(8);" value="AUG" type="button"  style="width: 150px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center">
                                <input id="bu10" class="button_m" onclick="Button(9);" value="sep" type="button"  style="width: 150px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center">
                                <input id="bu11" class="button_m" onclick="Button(10);" value="OCT"  type="button"  style="width: 150px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center">
                                <input id="bu12" class="button_m" onclick="Button(11);" value="Nov" type="button" style="width: 150px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center">
                                <input id="bu13" class="button_m" onclick="Button(12);" value="DEC" type="button"  style="width: 150px;"/>
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="width: 513px">
                    <div id="chart1" class="normal_text"  style="width: 100%; height: 300px"; display: inline-block;></div>
                </td>
                <td colspan="2">
                    <div id="chart2" class="normal_text"  style="width: 100%; height: 350px; display: inline-block;"></div>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <div id="chartdiv" class="normal_text"  style="width: 100%; height: 350px; display: inline-block; "></div>
                </td>
            </tr>
        

        </table>

       
        <div id="res" style="width: 100%; height: 100px"></div>
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True">
        </asp:ScriptManager>
    </form>
  
  
   
</body>
</html>
