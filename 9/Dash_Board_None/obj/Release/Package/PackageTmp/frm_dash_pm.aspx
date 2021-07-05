<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_dash_pm.aspx.cs" Inherits="Dash_Board_None.frm_dash_pm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
         #School1 {
        width: 100%;
        height: 300px;
        }
    </style>
    <script src="https://www.amcharts.com/lib/4/core.js"></script>
    <script src="https://www.amcharts.com/lib/4/charts.js"></script>
    <script src="https://www.amcharts.com/lib/4/themes/kelly.js"></script>
    <script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
    <link href="css/chart1.css" rel="stylesheet" />
    <script>


        function call_pg() {
            PageMethods.pmg( call_back);
        }

        function call_back(response, userContext, methodName) {
            //alert(JSON.stringify(response,4,null));
            //document.getElementById("res").innerHTML = JSON.stringify(response,4,null) ;
            // Create chart instance
              var chart = am4core.create("School1", am4charts.XYChart);

            chart.legend = new am4charts.Legend();

                chart.data =  JSON.parse(response) ;
                var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
                categoryAxis.dataFields.category = "tt";
                categoryAxis.renderer.grid.template.location = 0;

                categoryAxis.renderer.minGridDistance = 5;
                categoryAxis.renderer.labels.template.horizontalCenter = "right";
                categoryAxis.renderer.labels.template.verticalCenter = "middle";
                categoryAxis.renderer.labels.template.rotation = 0;
                categoryAxis.tooltip.disabled = true;
         /*       categoryAxis.renderer.minHeight = 110;*/
                categoryAxis.renderer.cellEndLocation = 0.8;
                categoryAxis.title.text = "เวลา";

                var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
                valueAxis.renderer.minWidth = 50;
            valueAxis.title.text = "จำนวนครั้ง";
           
                // Create series
                var series = chart.series.push(new am4charts.ColumnSeries());
                series.sequencedInterpolation = true;
                series.columns.template.width = am4core.percent(100);
                series.dataFields.valueY = "visits";
                series.dataFields.categoryX = "tt";
                series.tooltipText = "[{categoryX}: bold]{valueY}[/]";
                series.columns.template.strokeWidth = 0;
                series.paddingRight = am4core.percent(10);
                series.fill = am4core.color("#c1c758");
                series.name = "โรงเรียนวัดกู้";
                series.tooltip.pointerOrientation = "vertical";

                series.columns.template.column.cornerRadiusTopLeft = 1;
                series.columns.template.column.cornerRadiusTopRight = 1;
                series.columns.template.column.fillOpacity = 0.8;


                var series1 = chart.series.push(new am4charts.ColumnSeries());
                series1.sequencedInterpolation = true;
                series1.columns.template.width = am4core.percent(100);
                series1.dataFields.valueY = "visits2";
                series1.dataFields.categoryX = "tt";
                series1.tooltipText = "[{categoryX}: bold]{valueY}[/]";
                series1.columns.template.strokeWidth = 0;
                series1.fill = am4core.color("#607131");


                series1.tooltip.pointerOrientation = "vertical";

                series1.name = " โรงเรียนวัดบ่อ";
                series1.columns.template.column.cornerRadiusTopLeft = 1;
                series1.columns.template.column.cornerRadiusTopRight = 1;
                series1.columns.template.column.fillOpacity = 0.8;


                var series2 = chart.series.push(new am4charts.ColumnSeries());
                series2.sequencedInterpolation = true;
                series2.columns.template.width = am4core.percent(100);
                series2.dataFields.valueY = "visits3";
                series2.dataFields.categoryX = "tt";
                series2.tooltipText = "[{categoryX}: bold]{valueY}[/]";
                series2.columns.template.strokeWidth = 0;
                series2.fill = am4core.color("#643e46");

                series2.tooltip.pointerOrientation = "vertical";

                series2.columns.template.column.cornerRadiusTopLeft = 1;
                series2.columns.template.column.cornerRadiusTopRight = 1;
                series2.columns.template.column.fillOpacity = 0.8;
                series2.name = " โรงเรียนวัดผาสุกมณีจักร";


                chart.cursor = new am4charts.XYCursor();
        }
    </script>
</head>
<body onload ="call_pg();">
    <form id="form1" runat="server">
    <div>
    <div class="normal_text" style="text-align: center">ฝุ่นละอองขนาดเล็กกว่า PM 2.5 บริเวณโรงเรียน 3 แห่ง<br /> 1. โรงเรียนวัดกู้ 2. โรงเรียนวัดบ่อ 3. โรงเรียนวัดผาสุกมณีจักร</div>
    <div id="School1"class="normal_text"  height="600"></div>
    </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True">
        </asp:ScriptManager>
    </form>
</body>
</html>
