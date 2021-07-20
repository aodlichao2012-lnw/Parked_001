﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_Dash_2_Dash_1_grid.aspx.cs" Inherits="Dash_Board_None.frm_Dash_2_Dash_1_grid" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/chart1.css" rel="stylesheet" />
    <link href="Main_CSS/frm_Dash_2_Dash_1_grid.css" rel="stylesheet" />
    <script src="https://cdn.amcharts.com/lib/4/core.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/themes/kelly.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/themes/material.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/themes/dataviz.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/themes/frozen.js"></script>
    <script src="MAIN_JS/frm_Dash_2_Dash_1_grid.js"></script>


</head>
<body onload="allchart1();" class="test1">
    <form id="form1" runat="server">

        <div class="form_header">
            <h1 style="justify-content: center; text-align: center;" id="head_caption"></h1>
        </div>
        <div class="from_wrapper">
            <div class="form_row">
                <h2>สถิติการใช้งานระบบแผนที่ออนไลน์</h2>
            </div>
            <div class="content">
                <div class="form_row" style="display:flex;">
                    <div class="form_inline">
                        <div class="form_inline" style="border: 2px solid #808080; margin-right: 30px; padding: 20px;height:100%">
                            <%--//btn//--%>
                            <div class="form_row">
                                <div class="form_row" style="margin:1em 0;" >
                                    <asp:Label ID="select1" runat="server" Text="เลือกปี" CssClass="labelch" ></asp:Label>
                                </div>
                                <div class="form_row">
                                    <select id="allyears" class="cbo_y" onchange="ChangeAll();">
                                        <option value="2021">2564</option>
                                        <option value="2020">2563</option>
                                        <option value="2019">2562</option>
                                    </select>
                                </div>
                                <div class="form_row" style="margin:1em 0;">
                                    <asp:Label ID="selectbutton" runat="server" Text="เลือกเดือน" CssClass="labelch"></asp:Label>
                                </div>
                                <div class="form_row spacetb">
                                    <input id="bu1" class="button_m" onclick="Button(13);" type="button" value="ทั้งปี" name="buttons" />
                                </div>
                                <div class="form_row spacetb">
                                    <input id="bu2" class="button_m" onclick="Button(1);" type="button" value="ม.ค." />
                                </div>
                                <div class="form_row spacetb">
                                    <input id="bu3" class="button_m" onclick="Button(2);" type="button" value="ก.พ." />
                                </div>
                                <div class="form_row spacetb">
                                    <input id="bu4" class="button_m" onclick="Button(3);" type="button" value="มี.ค." />
                                </div>
                                <div class="form_row spacetb">
                                    <input id="bu5" class="button_m" onclick="Button(4);" value="เม.ย." type="button" />
                                </div>
                                <div class="form_row spacetb">
                                    <input id="bu6" class="button_m" onclick="Button(5);" value="พ.ค." type="button" />
                                </div>
                                <div class="form_row spacetb">
                                    <input id="bu7" class="button_m" onclick="Button(6);" value="ก.ค." type="button" />
                                </div>
                                <div class="form_row spacetb">
                                    <input id="bu8" class="button_m" onclick="Button(7);" value="มิ.ย." type="button" />
                                </div>
                                <div class="form_row spacetb">
                                    <input id="bu9" class="button_m" onclick="Butto(8);" value="สิ.ค." type="button" />
                                </div>
                                <div class="form_row spacetb">
                                    <input id="bu10" class="button_m" onclick="Button(9);" value="ก.ย." type="button" />
                                </div>
                                <div class="form_row spacetb">
                                    <input id="bu11" class="button_m" onclick="Button(10);" value="ต.ค." type="button" />
                                </div>
                                <div class="form_row spacetb">
                                    <input id="bu12" class="button_m" onclick="Button(11);" value="พ.ย." type="button" />
                                </div>
                                <div class="form_row spacetb">
                                    <input id="bu13" class="button_m" onclick="Button(12);" value="ธ.ค." type="button" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form_inline">
                        <div class="form_row" style="display:flex;">
                            <div class="form_inline">
                                <%--//chart//--%>
                                <div id="chartdiv"></div>
                            </div>
                            <div class="form_inline" style="margin-left:20px;">
                                <%--//Grid//--%>
                                <div id="Grid1"></div>
                            </div>
                        </div>
                        <div class="form_row">
                            <div class="form_row">
                                <h2>สถิติการใช้งานระบบแผนที่ออนไลน์</h2>
                            </div>
                            <div class="fom_row">
                                <div id="chartdiv2" class="test2" style="width: 100%; height: 350px;"></div>
                            </div>
                        </div>
                    </div>
                </div>



            </div>




        </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
    </form>

</body>
</html>
