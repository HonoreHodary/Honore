<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Master.Master" AutoEventWireup="true" CodeBehind="AddNewBooks.aspx.cs" Inherits="BooksLibrary.Admin.AddNewBooks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">  

 <asp:ScriptManager ID="ScriptManager1" EnablePartialRendering="True" runat="server" EnablePageMethods="true" />

    <asp:Label runat="server" ID="lblMsg" BackColor="White" ForeColor="Red" Font-Size="Medium" Font-Bold="false"></asp:Label>
    <br />
        <table border="0" cellpadding="2" cellspacing="0" style="width:30%">                         
              <tr class="SP_Row">
                        <td class="SP_itemLabelCell">
                            <asp:Label ID="lblTitle" runat="server" CssClass="SP_itemLabel2" Text="Title"></asp:Label>
                        </td>
                        <td class="SP_dataLabelCell" colspan="2">
                            <asp:TextBox ID="txtTitle" Width="100" runat="server" CssClass="SP_dataLabel" onkeyup = "SetContextKeyFirstName()"></asp:TextBox>                         
                        </td>
              </tr>

            <tr class="SP_Row">                
                <td class="SP_itemLabelCell">
                    <asp:Label ID="lblISBN" runat="server" CssClass="SP_itemLabel2" Text="ISBN"></asp:Label>
                </td>

                <td class="SP_dataLabelCell">
                    <asp:TextBox ID="txtISBN" Width="100" CssClass="SP_dataLabel" runat="server" onkeyup = "SetContextKeyLastName()"></asp:TextBox>
                </td>
            </tr>                                                           
                        
            <tr class="SP_Row">
                <td class="SP_itemLabelCell">
                    <asp:Label ID="lblAuthor" runat="server" CssClass="SP_itemLabel2" Text="Author"></asp:Label>
                </td>
                <td class="SP_dataLabelCell" >
                    <asp:TextBox ID="txtAuthor" Width="100" CssClass="SP_dataLabel" runat="server" onkeyup = "SetContextKeyFirstName()"></asp:TextBox>
                </td>
            </tr>                            

            <tr class="SP_Row">
                <td class="SP_itemLabelCell">
                    <asp:Label ID="lblPublicationDate" runat="server" CssClass="SP_itemLabel2" Text="Publication Date"></asp:Label>
                </td>                 
                <td class="SP_dataLabelCell" >
                    <asp:TextBox ID="txtPublicationDate" runat="server" Width="100" CssClass="SP_dataLabel" onkeyup = "SetContextKeyFirstName()"></asp:TextBox>
                </td>
            </tr>   
            
            <tr class="SP_Row">
                <td class="SP_itemLabelCell">
                    <asp:Label ID="lblDescription" runat="server" CssClass="SP_itemLabel2" Text="Description"></asp:Label>
                </td>                 
                <td class="SP_dataLabelCell" >
                    <asp:TextBox ID="txtDescription" TextMode="multiline" Columns="40" Rows="5" runat="server"  CssClass="SP_dataLabel" onkeyup = "SetContextKeyFirstName()"></asp:TextBox>
                </td>
            </tr>                                                                     

            <tr class="SP_Row">
                <td class="SP_itemLabelCell" colspan="1">
                    &nbsp;</td>
                <td class="SP_dataLabelCell">&nbsp;</td>
            </tr>                                          
                    <tr class="SP_Row" style="text-align:right">
                        <td class="SP_itemLabelCell">&nbsp;</td>
                        <td class="SP_dataLabelCell" colspan="2">                            
                            <asp:Button ID="btnSubmit" runat="server" CssClass="SP_dataLabel" Text="Submit" OnClientClick="fnSearch();" />&nbsp;&nbsp;&nbsp;&nbsp;                            
                        </td>
                    </tr>   
        </table>  

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
     
    <asp:HiddenField ID="hdnUserID" runat="server" />
           
  <script type="text/javascript">

     <%--function pageLoad() {
          // Display Error Messages
          if (document.getElementById("<%=hdnErrorMsg.ClientID%>").value != "") {
              alert(document.getElementById("<%=hdnErrorMsg.ClientID%>").value);
              document.getElementById("<%=hdnErrorMsg.ClientID%>").value = "";
          }
      }     --%>

   <%-- function Admin(BP) {
        window.location = "admin.aspx?BP=" + BP;
        $find("<%=PROCPanel.ClientID%>").show();
    }--%>
   <%-- function SetContextKeyFirstName() {
        $find('<%=AutoCompleteExtender1.ClientID%>').set_contextKey(document.getElementById("<%=ddl_Location.ClientID %>").value);
        alert(document.getElementById("<%=ddl_Location.ClientID %>").value);
    }--%>

      <%--function SetContextKeyLastName() {
        $find('<%=AutoCompleteExtender2.ClientID%>').set_contextKey(document.getElementById("<%=ddl_Location.ClientID %>").value);
        alert(document.getElementById("<%=ddl_Location.ClientID %>").value);
    }--%>

   <%-- function fnSearch() {        
          __doPostBack('Search', '');
          $find("<%=PROCPanel.ClientID%>").show();
    }--%>

   <%--function MyWorkfow() {
        __doPostBack('MyWorkfow', '');
        $find("<%=PROCPanel.ClientID%>").show();
    }--%>

    <%--function CreateNewWorkfow() {
        __doPostBack('New', '');
        $find("<%=PROCPanel.ClientID%>").show();
    }--%>

   <%-- function fnReset() {
        __doPostBack('ClearForm', '');
        $find("<%=PROCPanel.ClientID%>").show();
    }--%>

      //function fnCheckForEnter() {
      //    if (window.event.keyCode == 13) {
      //        window.event.returnValue = false;
      //        window.event.cancelBubble = true;
      //        fnSearch();
      //    }
      //}

<%--      function fnLocationChanged() {
          __doPostBack('LocationChanged', '');
          $find("<%=PROCPanel.ClientID%>").show();
      }--%>

  </script>

</asp:Content>
