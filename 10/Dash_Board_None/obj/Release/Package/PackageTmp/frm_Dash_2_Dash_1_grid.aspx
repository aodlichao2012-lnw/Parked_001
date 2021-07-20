<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_Dash_2_Dash_1_grid.aspx.cs" Inherits="Dash_Board_None.frm_Dash_2_Dash_1_grid" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/chart1.css" rel="stylesheet" />
    <style>



        .test1{
            justify-content:center;
             align-items: center;
             width:100%;
               background-repeat:no-repeat;
    background-size:100% 100%;
        }
        .test2 table {
            width:180%;
            height:100%;
            background-color:antiquewhite;
              background-repeat:no-repeat;
    background-size:90% 90%;
    float:left;
    display:inline-block;
        }
        td{
            text-align:center;
        }
        .caption {
            caption-side: top;
            float:left;
        }
        .Grid1{
            width:100%;
            table-layout:auto;
        }
    </style>
         <script src="https://cdn.amcharts.com/lib/4/core.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/themes/kelly.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/themes/material.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/themes/dataviz.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/themes/frozen.js"></script>
   <script>


       function allchart1() {
           /*   var yy = document.getElementById("allyears").value;*/
           PageMethods.Default2(TableHtml);
           PageMethods.Default(Defaults);
        
/*           PageMethods.Default3(add_chart3);*/
           PageMethods.Default3(Defualt2);
           /*           PageMethods.Default4(label);*/
          
       }
       function ChangeAll() {

           var yy = document.getElementById("allyears").value;
           /*          var mm = document.getElementsByClassName("button_m").value;*/
           //alert("FF");
/*           PageMethods.Change2(yy, Defualt2);*/
           PageMethods.Change3(yy, Defualt2);
           PageMethods.Change(yy, Defaults);
           PageMethods.Change2(yy, TableHtml);
/*           PageMethods.Change4(yy, label);*/

       }
       function Button(mm) {
           /*  var mm = document.getElementsByClassName("button_m").value;*/
           var yy = document.getElementById("allyears").value;
           //alert("GG");
           PageMethods.Buttonclick2(mm, yy, TableHtml);
           PageMethods.Buttonclick(mm, yy, Defaults);
         
/*           PageMethods.Buttonclick3(mm, yy, add_chart3);*/
           PageMethods.Buttonclick3(mm, yy, Defualt2);
 /*          PageMethods.Buttonclick4(mm, yy, label);*/

       }


       function TableHtml(res) {
           var valuejson = JSON.parse(res);
           //alert(JSON.parse(res));
           //alert(JSON.stringify(res));
           var txt = "";
           txt += "<table  border='1' class='Grid1'style='table-layout:auto;' ><tr><th width='180%'>เดือน/หน่วยงาน</th><th width='180%'>สำนักการช่าง</th><th width='180%'>กองสาธารณสุข</th><th width='180%'>รวม</th></tr>"
           for (var i = 0; i < valuejson.length; i ++) {
               txt += "<tr><td width='180%'>" + valuejson[i].m_label + "</td>";
               txt += "<td width='180%'>" + valuejson[i].mo + "</td>";
               txt += "<td width='180%'>" + valuejson[i].moph + "</td>";
               txt += "<td width='180%'>" + valuejson[i].sum_mo  + "</td></tr>";
/*               txt += "<td>" + valuejson[i].sum_moph+ "</td></tr>";*/
              
           /*    txt += "<td>" + item + "</td></tr>";*/
           }
           var sumtotal = 0;
           var sumtotal2 = 0;
           var sumtotal3 = 0;
           for (var a = 0; a < valuejson.length ; a++)
           {
           
               sumtotal += parseInt(valuejson[a].mo);
               sumtotal2 += parseInt(valuejson[a].moph);
               sumtotal3 += parseInt(valuejson[a].sum_mo);


           }
           txt += "<tr><th>สถิติการใช้รวม</th>";
           txt += "<th>" + sumtotal + "</th><th>" + sumtotal2 + "</th><th>" + sumtotal3 + "</th></tr>";
           txt += "</table >";
         
           document.getElementById("Grid1").innerHTML = txt;

           document.getElementById("head_caption").innerHTML ="ข้อมูล ณ "+ valuejson[0].m_label;
       }

//       function label(res) {

//           var valuejson = JSON.parse(res);
//           var txt = "";
//           txt += "<table border='1' class='Grid1' >"
//           for (var i = 0; i < valuejson.length; i++) {
//               txt += "<tr><th>" + valuejson[i].m_label + "</th>";
//               txt += "<th>" + valuejson[i].mo + "</th>";
//               txt += "<th>" + valuejson[i].moph + "</th></tr>";
///*               txt += "<td>" + valuejson[i].sum_mo + "</td></tr>";*/

//           }
//           txt += "</table >";
//           document.getElementById("label1").innerHTML = txt;
//       }

       function Defaults(res) {
           am4core.ready(function () {
               var chart = am4core.create("chartdiv", am4charts.PieChart3D);
               chart.hiddenState.properties.opacity = 0; // this creates initial fade-in

               /*        chart.legend = new am4charts.Legend();*/
               chart.data = JSON.parse(res);
/*               alert(JSON.stringify(res));*/
               //chart.data = [
               //    {
               //        country: "Lithuania",
               //        litres: 501.9
               //    },
               //    {
               //        country: "Czech Republic",
               //        litres: 301.9
               //    },
               //    {
               //        country: "Ireland",
               //        litres: 201.1
               //    },
               //    {
               //        country: "Germany",
               //        litres: 165.8
               //    },
               //    {
               //        country: "Australia",
               //        litres: 139.9
               //    },
               //    {
               //        country: "Austria",
               //        litres: 128.3
               //    },
               //    {
               //        country: "UK",
               //        litres: 99
               //    },
               //    {
               //        country: "Belgium",
               //        litres: 60
               //    },
               //    {
               //        country: "The Netherlands",
               //        litres: 50
               //    }
               //];

               var series = chart.series.push(new am4charts.PieSeries3D());
               series.dataFields.value = "val";
               series.dataFields.category = "display";
               series.colors.list = [
                   am4core.color("#047807"),
                   am4core.color("#e3e302")

               ];
           });
               }
               // end am4core.ready()

               // end am4core.ready()

               //////////////////////////////////////
       function Defualt2(res) {
           am4core.ready(function () {

               // Themes begin
               am4core.useTheme(am4themes_animated);
               // Themes end

               // Create chart instance
               var chart = am4core.create("chartdiv2", am4charts.XYChart);


               chart.data = JSON.parse(res);
      

               // Create axes
               var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
               categoryAxis.dataFields.category = "mm";
               categoryAxis.renderer.grid.template.location = 0;
               categoryAxis.renderer.minGridDistance = 30;

               var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
               valueAxis.title.text = "จำนวนการแจ้งเตือน";
               valueAxis.renderer.labels.template.adapter.add("text", function (text) {
                   return text + "";
               });

               // Create series
               var series = chart.series.push(new am4charts.ColumnSeries3D());
               series.dataFields.valueY = "blub";
               series.dataFields.categoryX = "mm";
               series.name = "กองสาธารณสุข";
               series.clustered = false;
               series.paddingRight = am4core.percent(60);
               series.columns.template.tooltipText = "กองสาธารณสุข {category} : [bold]{valueY}[/]";
               series.columns.template.fillOpacity = 0.9;
               let labelBullet = series.bullets.push(new am4charts.LabelBullet());
               labelBullet.label.text = "{valueY}";
               labelBullet.label.fill = am4core.color("#fff");
               labelBullet.locationY = 0.5;

               var series2 = chart.series.push(new am4charts.ColumnSeries3D());
               series2.dataFields.valueY = "acc";
               series2.dataFields.categoryX = "mm";
               series2.name = "สำนักการช่าง";
               series2.clustered = false;
               series2.paddingRight = am4core.percent(60);
               series2.columns.template.tooltipText = "สำนักการช่าง {category} : [bold]{valueY}[/]";
               let labelBullet2 = series2.bullets.push(new am4charts.LabelBullet());
               labelBullet2.label.text = "{valueY}";
               labelBullet2.label.fill = am4core.color("#fff");
               labelBullet2.locationY = 0.5;

               chart.legend = new am4charts.Legend();

           });
       }
   </script>
 
</head>
<body onload="allchart1();" class="test1">
    <form id="form1" runat="server">
        <div>
             <h1 style="justify-content:center ; text-align:center;" id="head_caption"><%--ข้อมูล ณ วันที่ 31 ธันวาคม 2563--%></h1>
            <table  class="test1"   style=" border-style: solid; border-width: 1px">
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
                                <input id="bu3" class="button_m" onclick="Button(2);" type="button" value="FEB" style="width: 150px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center">
                                <input id="bu4" class="button_m" onclick="Button(3);" value="MAR" type="button"  style="width: 150px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center">
                                <input id="bu5" class="button_m" onclick="Button(4);" value="APR" type="button" style="width: 150px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center">
                                <input id="bu6" class="button_m" onclick="Button(5);" value="APR" type="button" style="width: 150px;"/>
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
                                <input id="bu10" class="button_m" onclick="Button(9);" value="SEP" type="button"  style="width: 150px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center">
                                <input id="bu11" class="button_m" onclick="Button(10);" value="OCT"  type="button"  style="width: 150px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center">
                                <input id="bu12" class="button_m" onclick="Button(11);" value="NOV" type="button" ;  style="width: 150px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center">
                                <input id="bu13" class="button_m" onclick="Button(12);" value="DEC" type="button"  style="width: 150px;"/>
                            </td>
                        </tr>
                    </table>
                </td>

                 <th  class="caption"><div>
                     <h1 style="justify-content:center ; text-align:center;float:left;">สถิติการใช้งานระบบแผนที่ออนไลน์</h1>
                     </div></th>
                <td style="width: 513px ; float:left;clear:both;">
                    <div id="chartdiv" class="test2" style="width: 110%; height: 300px; float:left;"></div>
                </td>
               
                <td  style="float:left;">
                   <div id="Grid1"  class="test2 Grid1" ></div>
                </td>

            </tr>
                <tr>
                        <th  class="caption"><div>
                     <h1 style="justify-content:center ; text-align:center;float:left;">สถิติการใช้งานรายเดือนจำแนกหน่วยงาน</h1>
                     </div></th>
                  <td style="float:left; clear:both;">
                      <div id="chartdiv2" class="test2"  style="width: 300%; height: 350px;float:left; position:static;"></div>
                   <%--   <div id="label1" class=" test2" style="width:300%; height: 350px;"></div>--%>
                  </td>
                    </tr>
            <%--<tr>
                <td colspan="3">
                    <div id="chartdiv" class="normal_text"  style="width: 100%; height: 350px; display: inline-block; "></div>
                </td>
            </tr>--%>
            </table>

        </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
    </form>
    
</body>
</html>
