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
    txt += "<table class='Grid1' ><tr><th >เดือน/หน่วยงาน</th><th >สำนักการช่าง</th><th >กองสาธารณสุข</th><th >รวม</th></tr>"
    for (var i = 0; i < valuejson.length; i++) {
        txt += "<tr><td >" + valuejson[i].m_label + "</td>";
        txt += "<td >" + valuejson[i].mo + "</td>";
        txt += "<td >" + valuejson[i].moph + "</td>";
        txt += "<td>" + valuejson[i].sum_mo + "</td></tr>";
        /*               txt += "<td>" + valuejson[i].sum_moph+ "</td></tr>";*/

        /*    txt += "<td>" + item + "</td></tr>";*/
    }
    var sumtotal = 0;
    var sumtotal2 = 0;
    var sumtotal3 = 0;
    for (var a = 0; a < valuejson.length; a++) {

        sumtotal += parseInt(valuejson[a].mo);
        sumtotal2 += parseInt(valuejson[a].moph);
        sumtotal3 += parseInt(valuejson[a].sum_mo);


    }
    txt += "<tr><th>สถิติการใช้รวม</th>";
    txt += "<th>" + sumtotal + "</th><th>" + sumtotal2 + "</th><th>" + sumtotal3 + "</th></tr>";
    txt += "</table >";

    document.getElementById("Grid1").innerHTML = txt;
    if (valuejson[0].mm == "1") {

        document.getElementById("head_caption").innerHTML = "ข้อมูล ณ ปัจจุบัน"
    }
    else {
        document.getElementById("head_caption").innerHTML = "ข้อมูล ณ " + valuejson[0].m_label;
    }
    // document.getElementById("head_caption").innerHTML = "ข้อมูล ณ " + valuejson[0].m_label;
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
            am4core.color("#ff8000"),
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
        valueAxis.title.text = "จำนวนการใช้งาน";
        valueAxis.renderer.labels.template.adapter.add("text", function (text) {
            return text + "";
        });

        // Create series
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



        chart.legend = new am4charts.Legend();

    });
}