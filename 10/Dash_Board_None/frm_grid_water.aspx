<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_grid_water.aspx.cs" Inherits="Dash_Board_None.frm_grid_water" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/form_style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table align="center" cellpadding="2" style="width: 90%">
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: left">
                     <div class="grid_node01">
                          <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True" 
                              OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="100">
                             <Columns>
                                 <asp:BoundField DataField="s_yy" HeaderText="ปี" />
                                 <asp:BoundField DataField="s_mm" HeaderText="เดือน" />
                                 <asp:BoundField DataField="s_dd" HeaderText="วันที่" />
                                 <asp:BoundField DataField="s_tt" HeaderText="เวลา" />
                                 <asp:BoundField DataField="group_name" HeaderText="ส่ง Line ถึง" />
                                 <asp:BoundField DataField="msg" HeaderText="ข้อความที่ส่ง" />
                                 <asp:BoundField DataField="remark" HeaderText="หมายเหตุ" />
                                 <asp:BoundField DataField="status" HeaderText="สถานะปัจจุบัน" />
                             </Columns>
                             <PagerSettings Position="TopAndBottom" />
                             <PagerStyle BackColor="#EEFFFF" HorizontalAlign="Left" />
                         </asp:GridView>
                     </div>
                    
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
