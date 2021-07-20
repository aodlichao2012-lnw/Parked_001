<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_test_div.aspx.cs" Inherits="Dash_Board_None.frm_test_div" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .div_inline {
            display:inline-block;       
            padding:20px 20px 20px 20px ; 
            vertical-align: top;    
        }
        .div_left_menu {
            vertical-align: top;
        }
        .div_right_caption {
            padding:20px 20px 20px 20px ;
            vertical-align: top;
            text-align:center;
        }
        .div_right_content {
            padding:20px 20px 20px 20px ;
            margin-top: 5px;
        }
        .h1_caption {           
          -webkit-box-sizing: content-box;
          -moz-box-sizing: content-box;
          box-sizing: content-box;
          border: none;
          font: normal 25px/1 Arial Black, Gadget, sans-serif;
          color: rgba(38,37,37,1);
          -o-text-overflow: ellipsis;
          text-overflow: ellipsis;
          text-shadow: 1px 3px 3px rgba(0,0,0,0.5) ;
          
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div id="lside" class="div_inline" style="width: 200px;height: 600px;background-color: #f6d6d6;"> 
            <div id="l_menu" class="div_left_menu"  style="width: 200px;height: 600px;background-color: #FFaaaa;">xxx</div>    
        </div>
        <div id="rside" class="div_inline" style="width: 800px;height: 600px;background-color: #e4feca;">
            <div id="rside1" class="div_right_caption" style="width:95%;height: 100px;background-color: #cbf89d;">
                <label class="h1_caption">Caption size H1</label>
            </div>   
            <div id="rside2" class="div_right_content" style="width:95%;height: 400px;background-color: #a4f64f;">xxx</div> 
        </div>
    </div>
    </form>
</body>
</html>
