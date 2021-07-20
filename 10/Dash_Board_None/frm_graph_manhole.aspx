<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_graph_manhole.aspx.cs" Inherits="Dash_Board_None.frm_graph_manhole" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <script src="https://cdn.amcharts.com/lib/4/core.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/themes/kelly.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/themes/material.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/themes/dataviz.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/themes/frozen.js"></script>
    <script src="MAIN_JS/frm_graph_manhole.js"></script>
</head>
<body onload="allchart1();">
    <form id="form1" runat="server">
    <div >
        <div style="width:60%; height:400%; margin-top:5%;text-align:center;align-content:center;align-items:center;margin-left:19%;" id="chartdiv"></div>
    </div>
           <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True">
        </asp:ScriptManager>
    </form>
   
</body>
</html>
