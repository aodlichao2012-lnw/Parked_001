<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_dash_public_work.aspx.cs" Inherits="Dash_Board_None.frm_dash_public_work" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Main_CSS/frm_dash_public_work.css" rel="stylesheet" />
    <link href="css/chart1.css" rel="stylesheet" />
    <script src="https://cdn.amcharts.com/lib/4/core.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/themes/kelly.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/themes/material.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/themes/dataviz.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/themes/frozen.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js"></script>
    <script src="MAIN_JS/frm_dash_public_work.js"></script>


</head>

<body onload="allchart1();">
    <form id="form1" runat="server">
        <div class="from_wrapper" style="margin: 30px">
            <div class="form_row form_header">
                <h1>Statistics of Service Request&nbsp; : Bureau Public Work</h1>
            </div>
            <div class="content">
                <div class="form_row" style="display: flex;flex-wrap:nowrap">
                    <div class="form_inline" style="border: 2px solid #808080;height:100%; border-radius: 5px;">
                        <div class="form_row">
                            <img src="images/logo.jpg" style="height: 149px; width: 162px;margin:0 15px" />
                        </div>
                        <div class="form_row">
                            <div class="form_row">
                                <div class="form_row" style="margin:1em 0;">
                                    <asp:Label ID="select1" runat="server" Text="เลือกปี" CssClass="labelch"></asp:Label>
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
                    <div class="form_inline" style="margin-left:30px">
                        <div class="form_row" style="display:flex">
                            <div class="form_inline3 w5"><div class="label_TT">ซ่อมฝาท่อ</div></div>
                            <div class="form_inline3 w5"><div class="label_TT">ตัดต้นไม้</div></div>
                            <div class="form_inline3 w5"><div class="label_TT">ป้ายชำรุด</div></div>
                            <div class="form_inline3 w5"><div class="label_TT">ซ่อมไฟฟ้า</div></div>
                            <div class="form_inline3 w5"><div class="label_TT">ซ่อมทางเท้า</div></div>
                        </div>
                        <div class="form_row" style="display:flex">
                            <div class="form_inline3 w5"><div id="label1" class="label_T">0</div></div>
                            <div class="form_inline3 w5"><div id="label2tree" class="label_T">0</div></div>
                            <div class="form_inline3 w5"><div id="label3weak" class="label_T">0</div></div>
                            <div class="form_inline3 w5"><div id="label4repair" class="label_T">0</div></div>
                            <div class="form_inline3 w5"><div id="label5stress" class="label_T">0</div></div>
                        </div>
                        <div class="form_row" style="display:flex">
                            <div class="form_inline w2 ma3 form_sub_title">ประเภทของการขอรับบริการ</div>
                            <div class="form_inline w2 ma3 form_sub_title">สำนักงานที่ให้บริการ</div>
                        </div>
                        <div class="form_row" style="display:flex">
                            <div class="form_inline w2 ma3"><div id="chart1" class="normal_text"  ></div></div>
                            <div class="form_inline w2 ma3"><div id="chart2" class="normal_text"  ></div></div>
                        </div>
                        <div class="form_row form_sub_title2" style="width:1200px;">
                            กราฟเปรียบเทียบรายเดือนแสดงจำนวนงานขอรับบริการจากสำนักงานช่าง เทศบาลนครปากเกร็ด
                        </div>
                        <div class="form_row">
                            <div id="chartdiv" class="normal_text"></div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div >
        </div>
               <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True">
        </asp:ScriptManager>
    </form>
</body>
</html>
