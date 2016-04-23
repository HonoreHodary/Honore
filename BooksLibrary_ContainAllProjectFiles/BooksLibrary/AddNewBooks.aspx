<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Master.Master" AutoEventWireup="true" CodeBehind="AddNewBooks.aspx.cs" Inherits="BooksLibrary.Admin.AddNewBooks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">  

 <asp:ScriptManager ID="ScriptManager1" EnablePartialRendering="True" runat="server" EnablePageMethods="true" />

    <asp:Label runat="server" ID="lblMsg" BackColor="White" ForeColor="Red" Font-Size="Medium" Font-Bold="false"></asp:Label>

     <table width="100%" border="0" cellspacing="0" cellpadding="0">
   
   <tr>
      <td>
          <a href="/Default.aspx" style="color:black">Home</a> |                 
         <a href="/contactus.aspx" style="color:black">Contact Us</a> |
         <a href="/about.aspx" style="color:black">About Us</a>
       
      </td>
   </tr>
</table>

    <br />
    <br />
        <table border="0" cellpadding="2" cellspacing="0" style="width:30%">                         
              <tr class="SP_Row">
                        <td class="SP_itemLabelCell">
                            <asp:Label ID="lblTitle" runat="server" CssClass="SP_itemLabel2" Text="Title"></asp:Label>
                        </td>
                        <td class="SP_dataLabelCell">
                            <asp:TextBox ID="txtTitle" Width="200" runat="server" CssClass="SP_dataLabel"></asp:TextBox>                         
                        </td>
              </tr>

            <tr class="SP_Row">                
                <td class="SP_itemLabelCell" style="height: 25px">
                    <asp:Label ID="lblISBN" runat="server" CssClass="SP_itemLabel2" Text="ISBN"></asp:Label>
                </td>

                <td class="SP_dataLabelCell" style="height: 25px">
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
            
            <tr>
                <td class="SP_itemLabelCell">
                    <asp:Label ID="lblPublisher" runat="server" CssClass="SP_itemLabel2" Text="Publisher"></asp:Label>
                </td>                 
                <td class="SP_dataLabelCell" >
                    <asp:TextBox ID="txtPublisher" runat="server" Width="200" CssClass="SP_dataLabel"></asp:TextBox>
                </td>
              </tr>                                                                
            
            <tr class="SP_Row">
                <td class="SP_itemLabelCell">
                    <asp:Label ID="lblDescription" runat="server" CssClass="SP_itemLabel2" Text="Description"></asp:Label>
                </td>                 
                <td class="SP_dataLabelCell" >
                    <asp:TextBox ID="txtDescription" TextMode="multiline" Columns="50" Rows="5" runat="server"  CssClass="SP_dataLabel"></asp:TextBox>
                </td>
            </tr>                                                                     

            <tr class="SP_Row">
                <td class="SP_itemLabelCell" colspan="1">
                    &nbsp;</td>
                <td class="SP_dataLabelCell">&nbsp;</td>
            </tr> 
            
            <tr class="SP_Row" style="text-align:right">
                <td class="SP_itemLabelCell">&nbsp;</td>
                <td class="SP_dataLabelCell">                            
                    <asp:Button ID="btnSubmit" runat="server" CssClass="SP_dataLabel" Text="Submit" OnClick="btnSubmit_Click" />&nbsp;&nbsp;&nbsp;&nbsp;                            
                </td>
            </tr>                                            
                    
        </table>  
    <br />

     <asp:Label runat="server" ID="labelMessage" BackColor="White" ForeColor="Red" Font-Size="Medium" Font-Bold="false"></asp:Label>

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
     
  </script>

</asp:Content>
