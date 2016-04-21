<%@ Page Async="true" Title="" Language="C#" MasterPageFile="~/Master/Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BooksLibrary.Default" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" EnablePartialRendering="True" runat="server" EnablePageMethods="true" />

    <asp:Label runat="server" ID="lblMsg" BackColor="White" ForeColor="Red" Font-Size="Medium" Font-Bold="false"></asp:Label>

    <table width="100%" border="0" cellspacing="0" cellpadding="0">
   
   <tr>
      <td>
         <a href="/AddNewBooks.aspx">Add New Books</a> |         
         <a href="/contactus.aspx">Contact us</a> |
         <a href="/about.aspx">About us</a>
      </td>
   </tr>
</table>

    <br />
        <table border="0" cellpadding="2" cellspacing="0" style="width:30%">                         
              <tr class="SP_Row">
                        <td class="SP_itemLabelCell">
                            <asp:Label ID="lblTitle" runat="server" CssClass="SP_itemLabel2" Text="Title"></asp:Label>
                        </td>
                        <td class="SP_dataLabelCell" colspan="2">
                            <asp:TextBox ID="txtTitle" Width="100" runat="server" CssClass="SP_dataLabel"></asp:TextBox>                         
                        </td>
              </tr>

            <tr class="SP_Row">                
                <td class="SP_itemLabelCell">
                    <asp:Label ID="lblISBN" runat="server" CssClass="SP_itemLabel2" Text="ISBN"></asp:Label>
                </td>

                <td class="SP_dataLabelCell">
                    <asp:TextBox ID="txtISBN" Width="100" CssClass="SP_dataLabel" runat="server"></asp:TextBox>
                </td>
            </tr>                                                           
                        
            <tr class="SP_Row">
                <td class="SP_itemLabelCell">
                    <asp:Label ID="lblAuthor" runat="server" CssClass="SP_itemLabel2" Text="Author"></asp:Label>
                </td>
                <td class="SP_dataLabelCell" >
                    <asp:TextBox ID="txtAuthor" Width="100" CssClass="SP_dataLabel" runat="server"></asp:TextBox>
                </td>
            </tr>                            

            <tr class="SP_Row">
                <td class="SP_itemLabelCell">
                    <asp:Label ID="lblPublisher" runat="server" CssClass="SP_itemLabel2" Text="Publisher"></asp:Label>
                </td>                 
                <td class="SP_dataLabelCell">
                    <asp:TextBox ID="txtPublisher" runat="server" Width="100" CssClass="SP_dataLabel"></asp:TextBox>
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

    <ajaxToolkit:AutoCompleteExtender 
        ID="AutoCompleteExtender1" 
        runat="server" 
        CompletionInterval="10" 
        EnableCaching="true"
        TargetControlID="txtTitle" ServiceMethod="GetTitle" 
        CompletionListCssClass="AutoExtender" 
        CompletionListItemCssClass="AutoExtenderList" 
        CompletionListHighlightedItemCssClass="AutoExtenderHighlight"
        MinimumPrefixLength="2"
        FirstRowSelected="true"
        CompletionSetCount="15" 
        UseContextKey = "true">
    </ajaxToolkit:AutoCompleteExtender>

     <ajaxToolkit:AutoCompleteExtender 
        ID="AutoCompleteExtender2" 
        runat="server" 
        CompletionInterval="10" 
        EnableCaching="true"
        TargetControlID="txtISBN" ServiceMethod="GetISBN" 
        CompletionListCssClass="AutoExtender" 
        CompletionListItemCssClass="AutoExtenderList" 
        CompletionListHighlightedItemCssClass="AutoExtenderHighlight"
        MinimumPrefixLength="2"
        FirstRowSelected="true"
        CompletionSetCount="15" 
        UseContextKey = "true">      
    </ajaxToolkit:AutoCompleteExtender>    

    <ajaxToolkit:AutoCompleteExtender 
        ID="AutoCompleteExtender3" 
        runat="server" 
        CompletionInterval="10" 
        EnableCaching="true"
        TargetControlID="txtAuthor" ServiceMethod="GetAuthor" 
        CompletionListCssClass="AutoExtender" 
        CompletionListItemCssClass="AutoExtenderList" 
        CompletionListHighlightedItemCssClass="AutoExtenderHighlight"
        MinimumPrefixLength="2"
        FirstRowSelected="true"
        CompletionSetCount="15" 
        UseContextKey = "true">
    </ajaxToolkit:AutoCompleteExtender>

    <ajaxToolkit:AutoCompleteExtender 
        ID="AutoCompleteExtender4" 
        runat="server" 
        CompletionInterval="10" 
        EnableCaching="true"
        TargetControlID="txtPublisher" ServiceMethod="GetPublisher" 
        CompletionListCssClass="AutoExtender" 
        CompletionListItemCssClass="AutoExtenderList" 
        CompletionListHighlightedItemCssClass="AutoExtenderHighlight"
        MinimumPrefixLength="2"
        FirstRowSelected="true"
        CompletionSetCount="15" 
        UseContextKey = "true">
    </ajaxToolkit:AutoCompleteExtender>

        <ajaxToolkit:ModalPopupExtender ID="PROCPanel" runat="server"
        TargetControlID="hdnProc"
        PopupControlID="ProcessingPanel" 
        DropShadow="false" 
        BackgroundCssClass="modalBackground" />

    <asp:Panel ID="ProcessingPanel" style="display:none;width:0px;background:#ffffff;border:0px solid #668dae;" runat="server">        
        <img style="border:none" src="Images/ajax-loader.gif" alt="" />       
    </asp:Panel>
    <asp:HiddenField ID="hdnProc" runat="server" />
     
    <asp:HiddenField ID="hdnUserID" runat="server" />
           
  <script type="text/javascript">

      function SetContextKeyTitle()
      {
        $find('<%=AutoCompleteExtender1.ClientID%>').set_contextKey(document.getElementById("<%=txtTitle.ClientID %>").value);
        alert(document.getElementById("<%=txtTitle.ClientID %>").value);
      }

      function SetContextKeyISBN()
      {
        $find('<%=AutoCompleteExtender2.ClientID%>').set_contextKey(document.getElementById("<%=txtISBN.ClientID %>").value);
        alert(document.getElementById("<%=txtISBN.ClientID %>").value);
      }

      function SetContextKeyAuthor()
      {
        $find('<%=AutoCompleteExtender3.ClientID%>').set_contextKey(document.getElementById("<%=txtAuthor.ClientID %>").value);
        alert(document.getElementById("<%=txtAuthor.ClientID %>").value);
      }

      function SetContextKeyPublisher()
      {
        $find('<%=AutoCompleteExtender4.ClientID%>').set_contextKey(document.getElementById("<%=txtPublisher.ClientID %>").value);
        alert(document.getElementById("<%=txtPublisher.ClientID %>").value);
      }

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
