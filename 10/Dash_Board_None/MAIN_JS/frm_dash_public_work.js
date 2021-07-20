
WebFont.load({
    google: {
        families: ["Zen Tokyo Zoo"]
    }
});
// //font
// WebFont.load({
//         google: {
//             families: ["Teko:300"]
//         },
//         active: add_chart1
//         });

//         AmCharts.addInitHandler(function(chart) {
//         chart.fontFamily = 'Oswald';
//         chart.fontSize = 16;
//         });

//กำหนด สี
function am4themes_myTheme(target) {
    if (target instanceof am4core.ColorSet) {
        target.list = [
            am4core.color("#3399FF"),
            am4core.color("#3366FF"),
            am4core.color("#00FF99"),
            am4core.color("#DF3520"),
            am4core.color("#64297B"),
            am4core.color("#232555")
        ];
    }
}

function am4themes_myThemenew2(target) {
    if (target instanceof am4core.ColorSet) {
        target.list = [
            am4core.color("#000099"),
            am4core.color("#0066CC"),
            am4core.color("#0066FF"),
            am4core.color("#0099CC")
        ];
    }
}
// จบการกำหนดสี //

// โหลด
window.onload = allchart1();
// จบการโหลด //

//ฟังก์ชั่น การเซ้ท label
function set_label1(response, userContext, methodName) {
    var json_obj = JSON.parse(response);
    document.getElementById("label1").innerHTML = "0";
    document.getElementById("label2tree").innerHTML = "0";
    document.getElementById("label3weak").innerHTML = "0";
    document.getElementById("label4repair").innerHTML = "0";
    document.getElementById("label5stress").innerHTML = "0";


    if (json_obj.length == 0) {
        console.log(json_obj)
        document.getElementById("label1").innerHTML = "0"
        document.getElementById("label2tree").innerHTML = "0"
        document.getElementById("label3weak").innerHTML = "0"
        document.getElementById("label4repair").innerHTML = "0"
        document.getElementById("label5stress").innerHTML = "0"
    }
    
    else {
        console.log(json_obj)

        //document.getElementById("res").innerHTML = JSON.stringify(json_obj, 4, null);
        for (var i = 0; i < json_obj.length; i++) {
            //if (json_obj[i].val == 0)
            //{
            //    document.getElementById("label1").innerHTML = "0"
            //    document.getElementById("label2tree").innerHTML = "0"
            //    document.getElementById("label3weak").innerHTML = "0"
            //    document.getElementById("label4repair").innerHTML = "0"
            //    document.getElementById("label5stress").innerHTML = "0"
            //}
            if (json_obj[i].type_id == 2) {
                document.getElementById("label1").innerHTML = json_obj[i].val;
            }
            else if (json_obj[i].type_id == 6) {
                document.getElementById("label2tree").innerHTML = json_obj[i].val;
            }
            else if (json_obj[i].type_id == 5) {
                document.getElementById("label4repair").innerHTML = json_obj[i].val;
            }

            else if (json_obj[i].type_id == 4) {
                document.getElementById("label5stress").innerHTML = json_obj[i].val;
            }
            else if (json_obj[i].type_id == 3) {
                document.getElementById("label3weak").innerHTML = json_obj[i].val;
            }


        }




    }

}

//เปลี่ยนเมื่อ เปฌ็นปี พ.ศ 2564
function ChangeAll() {

    var yy = document.getElementById("allyears").value;
    /*          var mm = document.getElementsByClassName("button_m").value;*/
    //alert("FF");
    PageMethods.Change(yy, add_chart1);
    PageMethods.Change2(yy, add_chart2);
    PageMethods.Change3(yy, add_chart3);
    PageMethods.Change4(yy, set_label1);

}
//เปลี่ยน เดือน
function Button(mm) {
    /*  var mm = document.getElementsByClassName("button_m").value;*/
    var yy = document.getElementById("allyears").value;
    //alert("GG");
    PageMethods.Buttonclick(mm, yy, add_chart1);
    PageMethods.Buttonclick2(mm, yy, add_chart2);
    PageMethods.Buttonclick3(mm, yy, add_chart3);
    PageMethods.Buttonclick4(mm, yy, set_label1);

}
// แรกเริ่ม
function allchart1() {
    /*   var yy = document.getElementById("allyears").value;*/
    //var yy = document.getElementById("allyears").value;
    PageMethods.Default(add_chart1);
    PageMethods.Default2(add_chart2);
    PageMethods.Default3(add_chart3);
    PageMethods.Default4(set_label1);
    //window.onload = add_chart1()
    //window.onload = add_chart2()
    //window.onload  = add_chart3()
}

//chart 3

function add_chart3(response, userContext, methodName) {

    am4core.useTheme(am4themes_material);
    am4core.useTheme(am4themes_animated);
    // Themes end

    // Create chart instance
    var chart = am4core.create("chartdiv", am4charts.XYChart);

    if (response !== "[]") {

        chart.data = JSON.parse(response);
    }
    else {
        chart.data = [
            {
                mm: "ไม่มีข้อมูล",
                val: 0
            }
        ];
    }

    // Create axes
    var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
    categoryAxis.dataFields.category = "mm_label";
    categoryAxis.title.text = "เดือน";
    /*  categoryAxis.title.text = "Local country offices";*/
    categoryAxis.renderer.grid.template.location = 0;
    categoryAxis.renderer.minGridDistance = 20;
    categoryAxis.renderer.cellStartLocation = 0.2
    categoryAxis.renderer.cellEndLocation = 0.8
    var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
    valueAxis.title.text = "จำนวนงาน";

    // Create series
    var series = chart.series.push(new am4charts.ColumnSeries());
    series.sequencedInterpolation = true;
    series.columns.template.width = am4core.percent(80);
    series.dataFields.valueY = "val";
    series.dataFields.categoryX = "mm_label";
    series.tooltipText = "[{categoryX}: bold]{valueY}[/]";
    series.columns.template.strokeWidth = 0;
    series.paddingRight = am4core.percent(90);
    series.fill = am4core.color("#40E0D0");
    /*     series.label.text = "{valueY}";*/
    series.tooltip.pointerOrientation = "vertical";

    series.columns.template.column.cornerRadiusTopLeft = 1;
    series.columns.template.column.cornerRadiusTopRight = 1;
    series.columns.template.column.fillOpacity = 0.8;
    series.name = "จำนวนงาน";


    let labelBullet = series.bullets.push(new am4charts.LabelBullet());
    labelBullet.label.text = "{valueY}";
    labelBullet.label.fill = am4core.color("#fff");
    labelBullet.locationY = 0.5;

    // Add cursor
    chart.cursor = new am4charts.XYCursor();

    // Add legend
    chart.legend = new am4charts.Legend();
}
//chart 2
function add_chart2(response, userContext, methodName) {
    am4core.ready(function () {

        // Themes begin
        am4core.useTheme(am4themes_myThemenew2);
        // Themes end

        var chart = am4core.create("chart2", am4charts.PieChart3D);
        chart.hiddenState.properties.opacity = 0; // this creates initial fade-in

        chart.legend = new am4charts.Legend();
        if (response !== "[]") {

            chart.data = JSON.parse(response);
        }
        else {
            chart.data = [
                {
                    group_name: "ไม่มีข้อมูล",
                    val: 0
                }
            ];
        }


        var series = chart.series.push(new am4charts.PieSeries3D());
        series.dataFields.value = "val";
        series.dataFields.category = "group_name";
        series.labels.template.text = "{group_name}: {value.value}";
        series.colors.list = [
            am4core.color("#000099"),
            am4core.color("#0066CC"),
            am4core.color("#0066FF"),
            am4core.color("#0099CC")


        ];

    }); // end am4core.ready()
}
//chart1
function add_chart1(response, userContext, methodName) {
    am4core.ready(function () {

        // Themes begin
        am4core.useTheme(am4themes_myTheme);
        // Themes end

        // Create chart instance
        var chart = am4core.create("chart1", am4charts.PieChart);
        //chart.fill = am4core.color("red");
        //chart.fill = am4core.color("yellow");
        // alert(response)
        if (response !== "[]") {

            chart.data = JSON.parse(response);
        }

        else {
            chart.data = [{
                "t_name": "ไม่มีข้อมูล",
                "val": 0
            }];
        }

        // Add data
        //chart.data = [{
        //    "country": "Lithuania",
        //    "litres": 501.9
        //}, {
        //    "country": "Czechia",
        //    "litres": 301.9
        //}, {
        //    "country": "Ireland",
        //    "litres": 201.1
        //}, {
        //    "country": "Germany",
        //    "litres": 165.8
        //}, {
        //    "country": "Australia",
        //    "litres": 139.9
        //}, {
        //    "country": "Austria",
        //    "litres": 128.3
        //}, {
        //    "country": "UK",
        //    "litres": 99
        //}, {
        //    "country": "Belgium",
        //    "litres": 60
        //}, {
        //    "country": "The Netherlands",
        //    "litres": 50
        //}];

        // Set inner radius
        chart.innerRadius = am4core.percent(50);

        // Add and configure Series
        var pieSeries = chart.series.push(new am4charts.PieSeries());
        pieSeries.dataFields.value = "val";
        pieSeries.dataFields.category = "t_name";
        pieSeries.slices.template.stroke = am4core.color("#fff");
        pieSeries.labels.template.text = "{t_name}: {value.value}";
        pieSeries.slices.template.strokeWidth = 2;
        pieSeries.slices.template.strokeOpacity = 1;
        pieSeries.colors.list = [
            am4core.color("#3399FF"),
            am4core.color("#3366FF"),
            am4core.color("#00FF99"),
            am4core.color("#DF3520"),
            am4core.color("#64297B"),
            am4core.color("#232555")
        ];


        // This creates initial animation
        pieSeries.hiddenState.properties.opacity = 1;
        pieSeries.hiddenState.properties.endAngle = -90;
        pieSeries.hiddenState.properties.startAngle = -90;

        var label = pieSeries.createChild(am4core.Label);
        label.text = "{values.value.sum} ";
        label.horizontalCenter = "middle";
        label.verticalCenter = "middle";
        label.fontSize = 40;

    }); // end am4core.ready()
}
