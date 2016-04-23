<%@ Page Async="true" Title="" Language="C#" MasterPageFile="~/Master/Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BooksLibrary.Default" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" EnablePartialRendering="True" runat="server" EnablePageMethods="true" />

    <asp:Label runat="server" ID="lblMsg" BackColor="White" ForeColor="Red" Font-Size="Medium" Font-Bold="false"></asp:Label>

    <table width="100%" border="0" cellspacing="0" cellpadding="0">
   
   <tr>
      <td>
         <a href="/AddNewBooks.aspx" style="color:black">Add New Books</a> |         
         <a href="/contactus.aspx" style="color:black">Contact Us</a> |
         <a href="/about.aspx" style="color:black">About Us</a>
      </td>
   </tr>
</table>

    <br />
    <br />
        <table border="0" cellpadding="2" cellspacing="0" style="width:20%">                         
              <tr class="SP_Row">
                        <td class="SP_itemLabelCell" style="width:30%">
                            <asp:Label ID="lblTitle" runat="server" CssClass="SP_itemLabel2" Text="Title"></asp:Label>
                        </td>
                        <td class="SP_dataLabelCell" colspan="2">
                            <asp:TextBox ID="txtTitle" Width="200" runat="server" CssClass="SP_dataLabel"></asp:TextBox>                         
                        </td>
              </tr>

            <tr class="SP_Row">                
                <td class="SP_itemLabelCell">
                    <asp:Label ID="lblISBN" runat="server" CssClass="SP_itemLabel2" Text="ISBN"></asp:Label>
                </td>

                <td class="SP_dataLabelCell">
                    <asp:TextBox ID="txtISBN" Width="200" CssClass="SP_dataLabel" runat="server"></asp:TextBox>
                </td>
            </tr>                                                           
                        
            <tr class="SP_Row">
                <td class="SP_itemLabelCell">
                    <asp:Label ID="lblAuthor" runat="server" CssClass="SP_itemLabel2" Text="Author"></asp:Label>
                </td>
                <td class="SP_dataLabelCell" >
                    <asp:TextBox ID="txtAuthor" Width="200" CssClass="SP_dataLabel" runat="server"></asp:TextBox>
                </td>
            </tr>                            

            <tr class="SP_Row">
                <td class="SP_itemLabelCell">
                    <asp:Label ID="lblPublisher" runat="server" CssClass="SP_itemLabel2" Text="Publisher"></asp:Label>
                </td>                 
                <td class="SP_dataLabelCell">
                    <asp:TextBox ID="txtPublisher" runat="server" Width="200" CssClass="SP_dataLabel"></asp:TextBox>
                </td>
            </tr>                                                          

            <tr class="SP_Row">
                <td class="SP_itemLabelCell" colspan="1">
                    &nbsp;</td>
                <td class="SP_dataLabelCell">&nbsp;</td>
            </tr>                                          
                    <tr class="SP_Row">  
                        <td class="SP_itemLabelCell">
                            <asp:Label runat="server" CssClass="SP_itemLabel2"></asp:Label>
                        </td>                             
                        <td class="SP_dataLabelCell" colspan="2">                            
                            <asp:Button ID="btnSearch" runat="server" CssClass="SP_dataLabel" Text="Search" OnClientClick="fnSearch();" />&nbsp;&nbsp;&nbsp;&nbsp;                            
                        </td>
                    </tr>   
        </table>

    <br />    

    <asp:HiddenField ID="hdnFocus" runat="server" />
    <asp:HiddenField ID="hdnErrorMsg" runat="server" />

    

        <ajaxToolkit:ModalPopupExtender ID="PROCPanel" runat="server"
        TargetControlID="hdnProc"
        PopupControlID="ProcessingPanel" 
        DropShadow="false" 
        BackgroundCssClass="modalBackground" />

    <asp:Panel ID="ProcessingPanel" style="display:none;width:0px;background:#ffffff;border:0px solid #668dae;" runat="server">        
        <img style="border:none" src="Images/ajax-loader.gif" alt="" />       
    </asp:Panel>
    <asp:HiddenField ID="hdnProc" runat="server" />
           
  <script type="text/javascript">

      
      function fnSearch()
      {
          __doPostBack('Search', '');
          $find("<%=PROCPanel.ClientID%>").show();
      }

      function fnReset()
      {
        __doPostBack('ClearForm', '');
        $find("<%=PROCPanel.ClientID%>").show();
      }

  </script>

</asp:Content>
