<%@ Page Language="C#" MasterPageFile="~/Forms/PageMaster.master" AutoEventWireup="true" CodeFile="frmVoucherEntry.aspx.cs" Inherits="Forms_frmVoucherEntry" Title="SAMS: Voucher Entry" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphPage" Runat="Server">
   <script language="JavaScript" type="text/javascript">
   
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest( startRequest );

        Sys.WebForms.PageRequestManager.getInstance().add_endRequest( endRequest );

        function startRequest( sender, e )
        { 
            
            document.getElementById('<%=btnSave.ClientID%>').disabled = true;
            document.getElementById('<%=btnDone.ClientID%>').disabled = true;

        }

        function endRequest( sender, e ) 
        { 
           
            document.getElementById('<%=btnSave.ClientID%>').disabled = false;
            document.getElementById('<%=btnDone.ClientID%>').disabled = false;

        }
    function ValidateVoucherDate(txtVoucher)
    {
        var voucherDt = document.getElementById("<%=txtVoucherDate.ClientID %>").value;
        var year = voucherDt.split("/")[2];
        var month = voucherDt.split("/")[1];
        var date = voucherDt.split("/")[0];        
        if (year <= 2012) {
            alert('Voucher Date must be greater than 31-May-2013');
            setTimeout(function () { txtVoucher.focus() }, 10);
        }
        else {
            if (year == 2013) {
                if (month < 6) {
                    alert('Voucher Date must be greater than 31-May-2013');
                    setTimeout(function () { txtVoucher.focus() }, 10);
                }
                else if (month > 12) {
                    alert('Voucher date is invalid.');
                }
            }
        }
        
    }        
    
    function ValidateForm()
    {
        var voucherDt = document.getElementById("<%=txtVoucherDate.ClientID %>").value;
        var year = voucherDt.split("/")[2];
        var month = voucherDt.split("/")[1];
        var date = voucherDt.split("/")[0];
        if (year <= 2012) {
            alert('Voucher Date must be greater than 31-May-2013');
            return false;
        }
        else {
            if (year == 2013) {
                if (month < 6) {
                    alert('Voucher Date must be greater than 31-May-2013');
                    return false;
                }
                else if (month > 12) {
                    alert('Voucher date is invalid.');
                }
            }
        }
                
        var str;
        str  =  document.getElementById("<%= txtAccountCode.ClientID %>").value;
        if(str == null || str.length == 0)
		{
			alert('Must enter Account Code');
			return false;
		}
		str  =  document.getElementById("<%= txtAccountName.ClientID %>").value;
		if(str == null || str.length == 0)
		{
			alert('Wrong Account Code');
			return false;
		}
	    str  =  document.getElementById("<%= txtVoucherDate.ClientID %>").value;
		if(str == null || str.length < 9)
		{
			alert('Must Enter Voucher Date');
			return false;
		}
        var Debit = document.getElementById("<%= txtDebitAmount.ClientID %>").value;
        var Credit = document.getElementById("<%= txtCreditAmount.ClientID %>").value;
        
        if(Debit.length == 0 && Credit.length == 0)
        {
            alert('Debit or Credit Must Enter');
            return false;
        }  
        
        if(Debit > 0 && Credit > 0)
        {
            alert('Only Debit or Credit Can Enter');
            return false;
        }
        return true;
 }
 function SearchList()
 {
     var l =  document.getElementById('<%= LstAccountHead.ClientID %>');
     var tb = document.getElementById('<%= txtAccountCode.ClientID %>');
        
            if(tb.value == "")
            {
                ClearSelection(l);
            }
            else
            {
                for (var i=0; i < l.options.length; i++)
                {
                    if (l.options[i].value.toLowerCase().match(tb.value.toLowerCase()))
                    {
                        l.options[i].selected = true;
                        return false;
                    }
                    else
                    {
                        ClearSelection(l);
                        
                    }
                }
           }
 }
 function SearchedCode()
 {
    
    var str  
    var stroption
    str  = document.getElementById("<%= LstAccountHead.ClientID %>").value;
    stroption = document.getElementById("<%= txtAccountName.ClientID %>").value;
    
     if(str.length > 0)
     {      
            document.getElementById("<%= txtAccountCode.ClientID %>").value =  str.substring(str.indexOf('~') + 1);
            document.getElementById("<%= txtAccountName.ClientID %>").value =  str.substring(0,str.indexOf('~'));
            document.getElementById("<%= Panel3.ClientID %>").className = "HidePanel";
            
    
     }
     else if(stroption.length == 0)
     {
            document.getElementById("<%= Panel3.ClientID %>").className = "ShowPanel";
            document.getElementById("<%= LstAccountHead.ClientID %>").focus();
     }
     ClearSelection(document.getElementById('<%= LstAccountHead.ClientID %>'));
    
 }

 function SelectCode(e)
 {
      if(e.keyCode == 13)
      {
        var str  = document.getElementById("<%= LstAccountHead.ClientID %>").value;
        document.getElementById("<%= txtAccountCode.ClientID %>").value =  str.substring(0,str.indexOf('~')); 
        document.getElementById("<%= txtAccountName.ClientID %>").value =  str.substring(str.indexOf('~') + 1);
        document.getElementById("<%= Panel3.ClientID %>").className = "HidePanel";
        document.getElementById("<%= txtAccountDes.ClientID %>").focus();
      }
 }
 function ClearSelection(lb)
 {
    lb.selectedIndex = -1;
 }

  </script>
 <div id="right_data">
     <div >
         <table width="100%">
             <tr>
                 <td>
                     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                         <ContentTemplate>
<TABLE><TBODY><TR><TD style="HEIGHT: 25px" align=left>
<strong><asp:Label id="Label4" runat="server" Width="61px" Text="Location" CssClass="lblbox"></asp:Label></strong> </TD><TD style="HEIGHT: 20px" align=left><asp:DropDownList id="drpDistributor" runat="server" Width="206px" CssClass="DropList">
                                         </asp:DropDownList></TD><TD align=left></TD><TD style="WIDTH: 99px" align=left>
                                         <strong> <asp:Label id="Label5" runat="server" Width="83px" Text="Voucher Type" CssClass="lblbox"></asp:Label></strong> </TD><TD align=left><asp:DropDownList id="DrpVoucherType" runat="server" Width="205px" CssClass="DropList" AutoPostBack="True" OnSelectedIndexChanged="DrpVoucherType_SelectedIndexChanged">
                                         </asp:DropDownList></TD></TR><TR><TD style="HEIGHT: 25px" align=left>
                                         <strong> <asp:Label id="Label9" runat="server" Width="87px" Text="Payment Mode" CssClass="lblbox"></asp:Label></strong> </TD><TD style="HEIGHT: 20px" align=left><asp:DropDownList id="DrpPaymentMode" runat="server" Width="206px" CssClass="DropList">
                                             <asp:ListItem Value="19">Cash</asp:ListItem>
                                             <asp:ListItem Value="18">Cheque</asp:ListItem>
                                             <asp:ListItem Value="21">Pay Order</asp:ListItem>
                                         </asp:DropDownList></TD><TD style="HEIGHT: 18px" align=left></TD><TD style="WIDTH: 99px; HEIGHT: 18px" align=left>
                                         <strong> <asp:Label id="Label1" runat="server" Width="98px" Text="Bank/Cash Head" CssClass="lblbox"></asp:Label></strong> </TD><TD style="HEIGHT: 18px" align=left><asp:DropDownList id="drpBanks" runat="server" Width="206px" CssClass="DropList">
                                         </asp:DropDownList></TD></TR><TR><TD style="HEIGHT: 25px" align=left>
                                         <strong> <asp:Label id="Label6" runat="server" Width="76px" Text="Voucher Date" CssClass="lblbox"></asp:Label></strong> </TD><TD style="HEIGHT: 20px" align=left>
                                         <asp:TextBox id="txtVoucherDate" runat="server" Width="200px" CssClass="txtBox " onblur="ValidateVoucherDate(this);"></asp:TextBox></TD><TD align=left></TD><TD style="WIDTH: 99px" align=left>
                                         <strong> <asp:Label id="Label7" runat="server" Width="91px" Text="Slip No" CssClass="lblbox"></asp:Label></strong> </TD><TD style="HEIGHT: 20px" align=left><asp:TextBox id="txtSlipNo" onkeyup="SearchList()" runat="server" Width="200px" CssClass="txtBox "></asp:TextBox></TD></TR><TR><TD style="HEIGHT: 25px" align=left>
                                         <strong> <asp:Label id="lblChequeNo" runat="server" Width="76px" Text="Cheque No" CssClass="lblbox"></asp:Label></strong> </TD><TD style="HEIGHT: 20px" align=left><asp:TextBox id="txtChequeNo" runat="server" Width="200px" CssClass="txtBox "></asp:TextBox></TD><TD style="HEIGHT: 20px" align=left></TD><TD style="WIDTH: 99px; HEIGHT: 20px" align=left>
                                         <strong> <asp:Label id="lblChequedate" runat="server" Width="78px" Text="Cheque Date" CssClass="lblbox"></asp:Label></strong> </TD><TD style="HEIGHT: 20px" align=left><asp:TextBox id="txtChequeDate" onkeyup="SearchList()" runat="server" Width="200px" CssClass="txtBox "></asp:TextBox></TD></TR><TR><TD style="HEIGHT: 25px" align=left>
                                         <strong> <asp:Label id="Label10" runat="server" Width="91px" Text="Payee's Name" CssClass="lblbox"></asp:Label></strong> </TD><TD style="HEIGHT: 25px" align=left><asp:TextBox id="txtpayeesName" runat="server" Width="200px" CssClass="txtBox "></asp:TextBox></TD><TD style="HEIGHT: 25px" align=left>
                                         <strong> <asp:Label id="Label14" runat="server" Width="10px" CssClass="lblbox"></asp:Label></strong> </TD><TD style="WIDTH: 99px; HEIGHT: 25px" align=left>
                                         <strong> <asp:Label id="Label2" runat="server" Width="85px" Text="Due Date" CssClass="lblbox" __designer:wfdid="w1"></asp:Label></strong> </TD><TD style="HEIGHT: 25px" align=left><asp:TextBox id="txtDueDate" onkeyup="SearchList()" runat="server" Width="200px" CssClass="txtBox " __designer:wfdid="w2"></asp:TextBox></TD></TR><TR><TD style="HEIGHT: 25px" align=left>
                                         <strong> <asp:Label id="Label3" runat="server" Width="85px" Text="Narration" CssClass="lblbox"></asp:Label></strong> </TD><TD style="HEIGHT: 25px" align=left><asp:TextBox id="txtRemarks" runat="server" Width="200px" CssClass="txtBox " MaxLength="250"></asp:TextBox></TD><TD style="HEIGHT: 25px" align=left></TD><TD style="WIDTH: 99px; HEIGHT: 25px" align=left></TD><TD style="HEIGHT: 25px" align=left></TD></TR><TR><TD style="HEIGHT: 25px" align=left></TD><TD style="HEIGHT: 25px" align=left colSpan=4></TD></TR></TBODY></TABLE><cc1:MaskedEditExtender id="MaskedEditExtender1" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="txtChequeDate">
                             </cc1:MaskedEditExtender> <cc1:MaskedEditExtender id="MaskedEditExtender2" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="txtVoucherDate">
                             </cc1:MaskedEditExtender> <cc1:MaskedEditExtender id="MaskedEditExtender3" runat="server" __designer:wfdid="w3" Mask="99/99/9999" MaskType="Date" TargetControlID="txtDueDate"></cc1:MaskedEditExtender>&nbsp;&nbsp; <asp:TextBox id="txtTotalDebit" runat="server" Width="100px" CssClass="HidePanel"></asp:TextBox><asp:TextBox id="txtTotalCredit" runat="server" Width="73px" CssClass="HidePanel"></asp:TextBox> &nbsp; &nbsp; &nbsp; 
</ContentTemplate>
                     </asp:UpdatePanel>
                     &nbsp;</td>
             </tr>
         </table>
     </div>
     <div >
         <table width="100%">
             <tr>
                 <td>
                     <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                         <ContentTemplate>
<TABLE style="BORDER-RIGHT: #007395 1px solid; BORDER-TOP: #007395 1px solid; BORDER-LEFT: #007395 1px solid; BORDER-BOTTOM: #007395 1px solid" cellSpacing=0 cellPadding=0><TBODY><TR><TD style="HEIGHT: 16px">
<asp:Label id="lblskuCode" runat="server" Width="83px" Height="16px" ForeColor="White" Font-Bold="True" Text="Account Code" BackColor="#006699"></asp:Label></TD><TD style="HEIGHT: 16px">
<asp:Label id="Label13" runat="server" Width="163px" Height="16px" ForeColor="White" Font-Bold="True" Text="Description" BackColor="#006699"></asp:Label></TD>
    <TD style="HEIGHT: 16px">
<asp:Label id="lblskuname" runat="server" Width="146px" Height="16px" ForeColor="White" Font-Bold="True" Text="Remarks" BackColor="#006699"></asp:Label></TD>
    <TD style="HEIGHT: 16px">
<asp:Label id="Label15" runat="server" Width="135px" Height="16px" ForeColor="White" Font-Bold="True" Text="Principal" BackColor="#006699"></asp:Label></TD><TD style="HEIGHT: 16px">
<asp:Label id="Label11" runat="server" Width="89px" Height="16px" ForeColor="White" Font-Bold="True" Text="Debit" BackColor="#006699"></asp:Label></TD><TD style="HEIGHT: 16px">
<asp:Label id="Label12" runat="server" Width="87px" Height="16px" ForeColor="White" Font-Bold="True" Text="Credit" BackColor="#006699"></asp:Label></TD><TD style="HEIGHT: 16px"></TD><TD><asp:Label id="Label8" runat="server" Width="69px" Height="16px"></asp:Label></TD></TR><TR><TD style="HEIGHT: 12px"><asp:TextBox id="txtAccountCode" onkeyup="SearchList()" runat="server" Width="76px" CssClass="txtBox "></asp:TextBox></TD><TD colSpan=1 rowSpan=1><asp:TextBox id="txtAccountName" runat="server" Width="156px" ForeColor="Black" Font-Bold="False" CssClass="txtBox " Enabled="False"></asp:TextBox></TD>
    <TD style="HEIGHT: 12px"><asp:TextBox id="txtAccountDes" onfocus="SearchedCode();" runat="server" Width="140px" CssClass="txtBox "></asp:TextBox></TD>
    <TD style="HEIGHT: 12px"><asp:DropDownList id="DrpPrincipal" runat="server" Width="133px" CssClass="DropList">
                                         </asp:DropDownList></TD><TD style="HEIGHT: 12px"><asp:TextBox id="txtDebitAmount" runat="server" Width="80px" CssClass="txtBox "></asp:TextBox></TD><TD style="HEIGHT: 12px"><asp:TextBox id="txtCreditAmount" runat="server" Width="80px" CssClass="txtBox "></asp:TextBox></TD><TD style="HEIGHT: 12px"></TD><TD style="WIDTH: 79px; HEIGHT: 12px">
                                         <asp:Button accessKey="A" id="btnSave" onclick="btnSave_Click" runat="server" Width="70px" Font-Size="8pt" Text="Add New" CssClass="Button" /> </TD></TR><TR><TD align=center colSpan=8 rowSpan=1>
                                         <asp:GridView id="GrdOrder" runat="server" Width="100%" ForeColor="SteelBlue" CssClass="gridRow2" BackColor="White" AutoGenerateColumns="False" BorderColor="White" CaptionAlign="Left" HorizontalAlign="Center" OnRowDataBound="GrdOrder_RowDataBound" OnRowDeleting="GrdOrder_RowDeleting" OnRowEditing="GrdOrder_RowEditing" ShowFooter="True" ShowHeader="False">
                                             <PagerSettings FirstPageText="" LastPageText="" Mode="NextPrevious" NextPageText="Next"
                                                 PreviousPageText="Previous" />
                                             <Columns>
                                                 <asp:BoundField DataField="Account_Head_Id" HeaderText="Account Head Id">
                                                     <FooterStyle CssClass="HidePanel" />
                                                     <HeaderStyle CssClass="HidePanel" />
                                                     <ItemStyle CssClass="HidePanel" />
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="Account_Code" HeaderText="Account Code">
                                                     <FooterStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                                     <HeaderStyle HorizontalAlign="Left" />
                                                     <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left"
                                                          />
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="Account_Name">
                                                     <HeaderStyle CssClass="HidePanel" />
                                                     <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px"  HorizontalAlign="Left" />
                                                     <FooterStyle CssClass="HidePanel" />
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="REMARKS" HeaderText="Account Description">
                                                     <FooterStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Right" />
                                                     <HeaderStyle HorizontalAlign="Left" />
                                                     <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left"
                                                          />
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="Principal" HeaderText="Principal">
                                                     <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left"
                                                          />
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="debit" DataFormatString="{0:F2}" HeaderText="Debit">
                                                     <FooterStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Right" />
                                                     <HeaderStyle HorizontalAlign="Right" />
                                                     <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Right"
                                                          />
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="credit" DataFormatString="{0:F2}" HeaderText="Credit">
                                                     <FooterStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Right" />
                                                     <HeaderStyle HorizontalAlign="Right" />
                                                     <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Right"
                                                          />
                                                 </asp:BoundField>
                                                 <asp:BoundField DataField="Principal_id" HeaderText="Principal">
                                                     <FooterStyle HorizontalAlign="Right" />
                                                     <HeaderStyle CssClass="HidePanel" />
                                                     <ItemStyle CssClass="HidePanel" HorizontalAlign="Right" />
                                                 </asp:BoundField>
                                                 <asp:CommandField HeaderText="Edit" ShowEditButton="True">
                                                     <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" Width="35px" HorizontalAlign="Center" />
                                                     <FooterStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Right" />
                                                 </asp:CommandField>
                                                 <asp:TemplateField HeaderText="Delete">
                                                     <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" Width="35px" HorizontalAlign="Center" />
                                                     <ItemTemplate>
                                                         <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" OnClientClick="javascript:return confirm('Are you sure you want to Delete?');return false;"
                                                             Text="Delete"></asp:LinkButton>
                                                     </ItemTemplate>
                                                     <FooterStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Right" />
                                                 </asp:TemplateField>
                                             </Columns>
                                             <HeaderStyle CssClass="tblhead" />
                                         </asp:GridView> 
                                         <DIV style="LEFT: 10px; WIDTH: 325px; POSITION: absolute; TOP: 350px; HEIGHT: 200px">
                                            <asp:Panel id="Panel3" runat="server" Width="325px" Height="200px" CssClass="HidePanel" BackColor="Silver" BorderColor="White" BorderStyle="Inset" BorderWidth="1px">
                                            <TABLE style="BORDER-RIGHT: #ffffff thin groove; BORDER-TOP: #ffffff thin groove; BORDER-LEFT: #ffffff thin groove; WIDTH: 99%; BORDER-BOTTOM: #ffffff thin groove">
                                            <TBODY>
                                                <TR>
                                                    <TD style="BORDER-BOTTOM: black thin solid" align=left colSpan=2>&nbsp;Select A<STRONG>ccount Head from List</STRONG></TD><TD style="BORDER-BOTTOM: black thin solid" vAlign=top align=right>
                                                    <asp:Button id="Button5" runat="server" Width="21px" Height="16px" Font-Size="8pt" Text="X" BorderStyle="Groove" BorderWidth="1px"></asp:Button></TD></TR></TBODY></TABLE>
                                                    <asp:ListBox id="LstAccountHead" onkeyup="SelectCode(event)" runat="server" Width="325px" Height="200px" CssClass="DropList"></asp:ListBox></asp:Panel> &nbsp; &nbsp;&nbsp; </DIV>&nbsp;&nbsp;</TD></TR><TR><TD align=center colSpan=8></TD></TR></TBODY></TABLE><BR /><cc1:FilteredTextBoxExtender id="FilteredTextBoxExtender2" runat="server" TargetControlID="txtCreditAmount" FilterType="Custom" ValidChars=".0123456789">
                             </cc1:FilteredTextBoxExtender><DIV style="Z-INDEX: 101; LEFT: 706px; WIDTH: 100px; POSITION: absolute; TOP: 364px; HEIGHT: 100px"><asp:Panel id="Panel21" runat="server">
                                     <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel2">
                                         <ProgressTemplate>
                                             <asp:ImageButton ID="ImageButton1" runat="server" Height="35px" ImageUrl="~/App_Themes/Granite/Images/image003.gif"
                                                 Width="39px" />
                                             Wait Update
                                         </ProgressTemplate>
                                     </asp:UpdateProgress>
                                 </asp:Panel> </DIV><cc1:FilteredTextBoxExtender id="FilteredTextBoxExtender1" runat="server" TargetControlID="txtDebitAmount" FilterType="Custom" ValidChars="0123456789.">
                             </cc1:FilteredTextBoxExtender> &nbsp; 
</ContentTemplate>
                     </asp:UpdatePanel>
                 </td>
             </tr>
         </table>
       <asp:Button ID="btnDone" runat="server"
             AccessKey="S" OnClick="btnDone_Click" Text="Save" CssClass="Button" /></div>
<br />
  </div>
</asp:Content>

