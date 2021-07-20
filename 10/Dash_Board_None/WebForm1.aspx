<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Dash_Board_None.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script>
        function call_pg() {
            PageMethods.pmg( call_back);
        }

        function call_back(response, userContext, methodName) {
            alert(response);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <input type="button" value ="test" onclick="call_pg();" />
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True">
        </asp:ScriptManager>
    </div>
    </form>
</body>
</html>
