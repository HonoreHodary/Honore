<%@ Page Async="true" Title="" Language="C#" MasterPageFile="~/Master/Master.Master" AutoEventWireup="true" CodeBehind="SearchResult.aspx.cs" Inherits="BooksLibrary.SearchResult" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <table width="100%" border="0" cellspacing="0" cellpadding="0">
   
   <tr>
      <td>
         <a href="/Default.aspx" style="color:black">Home</a> |            
          <a href="/AddNewBooks.aspx" style="color:black">Add New Books</a> |         
         <a href="/contactus.aspx" style="color:black">Contact Us</a> |
         <a href="/about.aspx" style="color:black">About Us</a>
      </td>
   </tr>
</table>
 
     <br />
     
 <asp:Label runat="server" ID="lblMsg" BackColor="White" ForeColor="Red" Font-Size="Medium" Font-Bold="false" ></asp:Label>

             
    <asp:ScriptManager ID="ScriptManager1" EnablePartialRendering="True" runat="server" />

<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" GridLines="Both" BorderColor="#d8d8d8" 
        BorderWidth="1px" CellPadding="4" ForeColor="Black" AllowPaging="true" PagerSettings-Position="TopAndBottom" AllowSorting="true"
        DataKeyNames="_id" Height="50px" BorderStyle="None" PageSize="50" Font-Size="8pt" CssClass="SP_dataLabel" width="100%" 
         OnPageIndexChanging="GridView1_PageIndexChanging" onrowdatabound="GridView1_RowDataBound" OnRowCancelingEdit="GridView1_RowCancelingEdit" 
        OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
            <FooterStyle BackColor="#CCCC99" />
            <Columns>        
                <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true" ItemStyle-Width="100" Sortexpression="Title"/>             
                    
                <asp:BoundField DataField="ISBN" HeaderText="ISBN" ItemStyle-Width="150" />
                <asp:BoundField DataField="Title" HeaderText="Title" ItemStyle-Width="150" />    
                <asp:BoundField DataField="Author" HeaderText="Author" ItemStyle-Width="150" />        
                <asp:BoundField DataField="Publisher" HeaderText="Publisher" ItemStyle-Width="150" />   
                <asp:BoundField DataField="Description" HeaderText="Description" ItemStyle-Width="150" /> 
                     
             </Columns>

             

            <PagerTemplate>                
                <table style="width:100%">
                    <tr>
                    <td style="white-space:nowrap;text-align:center">
                    <div id="pager">
                    <asp:ImageButton ImageAlign="AbsBottom" ID="imgFirst" runat="server" CommandArgument="First" CommandName="Page" OnClientClick="PageIndexChanged();" ImageUrl="Images/DataContainer_MoveFirstHS.png" />
                    <asp:ImageButton ImageAlign="AbsBottom" ID="imgPrevious" runat="server" CommandArgument="Prev" CommandName="Page" OnClientClick="PageIndexChanged();" ImageUrl="Images/DataContainer_MovePreviousHS.png" />
                    <asp:Label ID="lblPageLabel" runat="server" Text="Page" Font-Names="Arial" Font-Size="7pt"></asp:Label>
                    <asp:DropDownList ID="ddlPageSelector" Font-Names="Arial" Font-Size="8pt" runat="server"></asp:DropDownList>                                    
                    <asp:ImageButton ImageAlign="AbsBottom" ID="imgNext" runat="server" CommandArgument="Next" CommandName="Page" OnClientClick="PageIndexChanged();" ImageUrl="Images/DataContainer_MoveNextHS.png" />
                    <asp:ImageButton ImageAlign="AbsBottom" ID="imgLast" runat="server" CommandArgument="Last" CommandName="Page" OnClientClick="PageIndexChanged();" ImageUrl="Images/DataContainer_MoveLastHS.png" />                                       
                    </div>          
                    </td>
                   
                    </tr>
                    </table>  
            </PagerTemplate>
            
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <HeaderStyle ForeColor="White" CssClass="SP_dataLabel_Header" Font-Bold="true" />
            <EmptyDataTemplate>
                No records found
            </EmptyDataTemplate>
           <RowStyle Font-Size="12pt" BackColor="#ebf3ff" Font-Names="Verdana" />
           <AlternatingRowStyle BackColor="White" Font-Size="12pt" Font-Names="Verdana" />
           <EditRowStyle Font-Size="Medium" />
           <EmptyDataRowStyle Font-Size="Medium" />
        </asp:GridView>
                   

   <%--//************ PROCPanel **************************//--%>
    <ajaxToolkit:ModalPopupExtender ID="PROCPanel" runat="server" 
        TargetControlID="hdnProc"
        PopupControlID="ProcessingPanel" 
        DropShadow="false" 
        BackgroundCssClass="modalBackground" />

    <asp:Panel ID="ProcessingPanel" style="display:none;width:0px;background:#ffffff;border:0px solid #668dae;" runat="server">        
        <img style="border:none" src="Images/ajax-loader.gif" alt="" />       
    </asp:Panel>

    <asp:HiddenField ID="hdnProc" runat="server"  />     
    
    <script type="text/javascript">
       
    </script>

</asp:Content>
