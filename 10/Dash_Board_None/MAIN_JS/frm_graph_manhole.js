
// แรกเริ่ม

// โหลด
window.onload = allchart1();
// จบการโหลด //



function chart1(res)
{
    am4core.ready(function () {

        //    // Themes begin
        //    am4core.useTheme(am4themes_animated);
        //    // Themes end

        //    // Create chart instance
        //    var chart = am4core.create("chartdiv", am4charts.XYChart);
        //    chart.paddingBottom = 30;
        //    chart.angle = 35;

        //    // Add data
        //    chart.data = [{
        //        "country": "USA",
        //        "visits": 4025
        //    }, {
        //        "country": "China",
        //        "visits": 1882
        //    }, {
        //        "country": "Japan",
        //        "visits": 1809
        //    }, {
        //        "country": "Germany",
        //        "visits": 1322
        //    }, {
        //        "country": "UK",
        //        "visits": 1122
        //    }, {
        //        "country": "France",
        //        "visits": 1114
        //    }, {
        //        "country": "India",
        //        "visits": 984
        //    }, {
        //        "country": "Spain",
        //        "visits": 711
        //    }, {
        //        "country": "Netherlands",
        //        "visits": 665
        //    }, {
        //        "country": "Russia",
        //        "visits": 580
        //    }, {
        //        "country": "South Korea",
        //        "visits": 443
        //    }, {
        //        "country": "Canada",
        //        "visits": 441
        //    }, {
        //        "country": "Brazil",
        //        "visits": 395
        //    }, {
        //        "country": "Italy",
        //        "visits": 386
        //    }, {
        //        "country": "Taiwan",
        //        "visits": 338
        //    }];
        //    chart.data = JSON.parse(res)
        //    alert(res)
        //    // Create axes
        //    var label = chart.chartContainer.createChild(am4core.Label);
        //    label.text = "ID ของท่อ"
        //    label.align = "center";
        //    label.fontSize = 40
        //    var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
        //    categoryAxis.dataFields.category = "display_label";
        //    categoryAxis.renderer.grid.template.location = 0;
        //    categoryAxis.renderer.minGridDistance = 10;
        //    categoryAxis.renderer.inside = true;
        //    categoryAxis.renderer.grid.template.disabled = true;

        //    //var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
        //    //valueAxis.events.on("ready", function (ev) {
        //    //    ev.target.min = ev.target.min;
        //    //    ev.target.max = ev.target.max;
        //    //})


        //    var cellSize = 200;
        //    chart.events.on("datavalidated", function (ev) {

        //        // Get objects of interest
        //        var chart = ev.target;
        //        var categoryAxis = chart.yAxes.getIndex(0);

        //        // Calculate how we need to adjust chart height
        //        var adjustHeight = chart.data.length * cellSize - categoryAxis.pixelHeight;

        //        // get current chart height
        //        var targetHeight = chart.pixelHeight + adjustHeight;

        //        // Set it on chart's container
        //        chart.svgContainer.htmlElement.style.height = targetHeight + "px";
        //    });



        //    let labelTemplate = categoryAxis.renderer.labels.template;
        //    labelTemplate.rotation = 360;
        //    labelTemplate.horizontalCenter = "middle";
        //    labelTemplate.verticalCenter = "middle";
        //    labelTemplate.dy = -5 // moves it a bit down;
        //    labelTemplate.inside = false; // this is done to avoid settings which are not suitable when label is rotated

        //    var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
        //    valueAxis.title.text = "หน่วยความลึก เป็นเมตร";
        //    valueAxis.title.fontSize = 40


        //    //chart.scrollbarX = new am4core.Scrollbar();
        //    chart.scrollbarY = new am4core.Scrollbar();

        //    //chart.legend = new am4charts.Legend();
        //    // Create series
        //    var series = chart.series.push(new am4charts.ConeSeries());
        //    series.columns.template.width = am4core.percent(50);
        //    series.columns.template.height = am4core.percent(80);
        //    series.tooltipText = "{valueY.value}"
        //    series.dataFields.valueY = "val";
        //    series.dataFields.categoryX = "display_label";
        //    series.colors.list = [
        //       am4core.color("#000099"),

        //    ];

        //    var labelBullet = series.bullets.push(new am4charts.LabelBullet());
        //    labelBullet.label.verticalCenter = "top";
        //    labelBullet.label.dy = -10;
        //    labelBullet.label.text = "{values.valueY.workingValue.formatNumber('xzx #.')}";



        //}); // end am4core.ready()

        var chart = am4core.create("chartdiv", am4charts.XYChart);
        chart.hiddenState.properties.opacity = 0; // this creates initial fade-in

        chart.data = JSON.parse(res)

        var label = chart.chartContainer.createChild(am4core.Label);
            label.text = "ID ของท่อ"
            label.align = "center";
            label.fontSize = 40

        var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
        categoryAxis.renderer.grid.template.location = 0;
        categoryAxis.dataFields.category = "display_label";
        categoryAxis.renderer.minGridDistance = 40;
        categoryAxis.fontSize = 11;

        var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
        valueAxis.strictMinMax = true;
        valueAxis.renderer.minGridDistance = 30;
        valueAxis.title.text = "หน่วยความลึก เป็นเมตร";
        valueAxis.title.fontSize = 40
        // axis break

        chart.scrollbarY = new am4core.Scrollbar();


        let labelTemplate = categoryAxis.renderer.labels.template;
        labelTemplate.rotation = 360;
        labelTemplate.horizontalCenter = "middle";
        labelTemplate.verticalCenter = "middle";
        labelTemplate.dy = -5 // moves it a bit down;
        labelTemplate.inside = false;

        var axisBreak = valueAxis.axisBreaks.create();
        axisBreak.startValue = 2100;
        axisBreak.endValue = 22900;
        //axisBreak.breakSize = 0.005;

        // fixed axis break
        var d = (axisBreak.endValue - axisBreak.startValue) / (valueAxis.max - valueAxis.min);
        axisBreak.breakSize = 0.05 * (1 - d) / d; // 0.05 means that the break will take 5% of the total value axis height

        // make break expand on hover
        var hoverState = axisBreak.states.create("hover");
        hoverState.properties.breakSize = 1;
        hoverState.properties.opacity = 0.1;
        hoverState.transitionDuration = 1500;

        axisBreak.defaultState.transitionDuration = 1000;
        var cellSize = 200;
        chart.events.on("datavalidated", function (ev) {

            // Get objects of interest
            var chart = ev.target;
            var categoryAxis = chart.yAxes.getIndex(0);

            // Calculate how we need to adjust chart height
            var adjustHeight = chart.data.length * cellSize - categoryAxis.pixelHeight;

            // get current chart height
            var targetHeight = chart.pixelHeight + adjustHeight;

            // Set it on chart's container
            chart.svgContainer.htmlElement.style.height = targetHeight + "px";
        });


        var series = chart.series.push(new am4charts.ColumnSeries());
        series.dataFields.categoryX = "display_label";
        series.dataFields.valueY = "val";
        series.columns.template.tooltipText = "{valueY.value}";
        series.columns.template.tooltipY = 0;
        series.columns.template.strokeOpacity = 0;
        series.colors.list = [
            am4core.color("#000099"),

        ];

        var labelBullet = series.bullets.push(new am4charts.LabelBullet());
        labelBullet.label.verticalCenter = "bottom";
        labelBullet.label.dy = -10;
        labelBullet.label.text = "{values.valueY.workingValue.formatNumber('xzx #.')}";

        // as by default columns of the same series are of the same color, we add adapter which takes colors from chart.colors color set
        series.columns.template.adapter.add("fill", function (fill, target) {
            return chart.colors.getIndex(target.dataItem.index);
        });
   

    })
    }
    



function allchart1() {
    /*   var yy = document.getElementById("allyears").value;*/

    PageMethods.Default(chart1);


}


