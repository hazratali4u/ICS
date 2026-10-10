<%@ Page Language="C#" MasterPageFile="~/Forms/PageMaster.master" AutoEventWireup="true" CodeFile="frmCustomerRelization.aspx.cs" Inherits="Forms_frmCustomerRelization" Title="SAMS: Bank Transaction" %>
<%@ Register Assembly="AjaxControlToolkit"   Namespace="AjaxControlToolkit"    TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphPage">
      <script language="JavaScript" type="text/javascript">
    
    function ValidateForm()
    {
        var str;
        str  =  document.getElementById("<%= txtAmount.ClientID %>").value;
        if(str == null || str.length == 0)
		{
			alert('Must enter Amount');
			return false;
		}
		
    }    
    function pageLoad(){
	     $('#<%=GrdOrder.ClientID %>').tablesorter(
	     {
        headers: {
            3: {
                sorter: false
            },
            6: {
                sorter: false
            },
            10: {
                sorter: false
            },
            11: {
                sorter: false
            },
            12: {
                sorter: false
            },
            13: {
                sorter: false
            }
        }
    }
	     );  
	     $('#<%=gvSaleForceCash.ClientID %>').tablesorter(
	     {
        headers: {
            0: {
                sorter: false
            },
            1: {
                sorter: false
            },
            2: {
                sorter: false
            },
            3: {
                sorter: false
            },
            4: {
                sorter: false
            },
            5: {
                sorter: false
            },
            7: {
                sorter: false
            },
            8: {
                sorter: false
            }
        }
    }
	     );  
    }
  </script>
  <div id="right_data">
    <div >
        <table width="100%">
            <tr>
                <td >
                    <asp:UpdatePanel id="UpdatePanel2" runat="server" RenderMode="Inline">
                        <contenttemplate>
<TABLE><TBODY><TR><TD align=left colSpan=2><asp:Label id="lblErrorMsg" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label> </TD><TD style="WIDTH: 201px" align=left colSpan=1></TD><TD style="WIDTH: 201px" align=left colSpan=1></TD>
    <TD align=left colSpan=1></TD><TD align=left colSpan=1></TD></TR><TR><TD align=left>
<strong>  <asp:Label id="lblfromLocation" runat="server" Width="94px" Text="Location" CssClass="lblbox"></asp:Label></strong></TD><TD style="WIDTH: 201px" align=left><asp:DropDownList id="drpDistributor" runat="server" Width="200px" CssClass="DropList" OnSelectedIndexChanged="drpDistributor_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList></TD><TD style="WIDTH: 201px" align=left></TD>
    <TD align=left>
    <strong><asp:Label id="Label10" runat="server" Width="62px" Text="Sale Force" CssClass="lblbox"></asp:Label></strong></TD>
    <TD align=left><asp:DropDownList id="DrpDeliveryMan" runat="server" Width="240px" CssClass="DropList" OnSelectedIndexChanged="DrpDeliveryMan_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList></TD><TD align=left></TD></TR><TR><TD align=left>
    <strong><asp:Label id="Label8" runat="server" Width="89px" Text="Principal" CssClass="lblbox"></asp:Label></strong></TD><TD style="WIDTH: 201px" align=left><asp:DropDownList id="DrpPrincipal" runat="server" Width="200px" CssClass="DropList" OnSelectedIndexChanged="DrpPrincipal_SelectedIndexChanged" AutoPostBack="True">
            </asp:DropDownList></TD><TD style="WIDTH: 201px" align=left></TD>
    <TD align=left>
    <strong><asp:Label id="Label2" runat="server" Width="58px" Text="Route      " CssClass="lblbox"></asp:Label></strong></TD>
    <TD align=left><asp:DropDownList id="DrpRoute" runat="server" Width="240px" CssClass="DropList" OnSelectedIndexChanged="DrpRoute_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList></TD><TD align=left></TD></TR><TR><TD align=left>
    <strong><asp:Label id="Label1" runat="server" Width="99px" Text="Account Type" CssClass="lblbox"></asp:Label></strong></TD><TD style="WIDTH: 201px" align=left><asp:DropDownList id="DrpAccountType" runat="server" Width="200px" CssClass="DropList" OnSelectedIndexChanged="DrpAccountType_SelectedIndexChanged" AutoPostBack="True"><asp:ListItem Value="19">Cash Realization</asp:ListItem>
<asp:ListItem Value="21">Cash Advance</asp:ListItem>
<asp:ListItem Value="22">Bank Deposit (Branch)</asp:ListItem>
<asp:ListItem Value="23">Income Tax</asp:ListItem>
<asp:ListItem Value="28">Credit Transfer Out</asp:ListItem>
<asp:ListItem Value="29">Advance Return</asp:ListItem>
<asp:ListItem Value="222">Bank Deposit (DM)</asp:ListItem>
<asp:ListItem>Cash From DM</asp:ListItem>
</asp:DropDownList></TD><TD style="WIDTH: 201px" align=left>
<strong><asp:Label id="lblDocumentNo" runat="server" Width="25px" Text="" ></asp:Label></strong></TD>
    <TD align=left>
    <strong><asp:Label id="Label4" runat="server" Width="55px" Text="Customer" CssClass="lblbox"></asp:Label></strong></TD>
    <TD align=left><asp:DropDownList id="DrpCustomer" runat="server" Width="240px" CssClass="DropList" OnSelectedIndexChanged="DrpCustomer_SelectedIndexChanged" AutoPostBack="True">
            </asp:DropDownList></TD><TD align=left rowSpan=8></TD></TR><TR><TD align=left>
            <strong><asp:Label id="Label7" runat="server" Width="97px" Text="Account" CssClass="lblbox"></asp:Label></strong></TD><TD style="WIDTH: 201px"><asp:DropDownList id="DrpAccountDetail" runat="server" Width="200px" CssClass="DropList" OnSelectedIndexChanged="DrpAccountDetail_SelectedIndexChanged">
</asp:DropDownList></TD><TD style="WIDTH: 201px"></TD><TD vAlign=middle align=left colSpan=2 rowSpan=8><asp:Panel id="Panel1" runat="server" Height="150px" ScrollBars="Vertical" BorderColor="Silver" BorderStyle="Groove" BorderWidth="1px">
        <asp:GridView ID="GrdCredit" runat="server" AutoGenerateColumns="False" BackColor="White"
                                        BorderColor="White" CssClass="gridRow2" ForeColor="SteelBlue" HorizontalAlign="Center"
                                        Width="290px" OnRowDeleting="GrdOrder_RowDeleting" DataKeyNames="SALE_INVOICE_ID">
            <PagerSettings FirstPageText="" LastPageText="" Mode="NextPrevious" NextPageText="Next"
                                            PreviousPageText="Previous" />
            <Columns>
                <asp:TemplateField HeaderText="Select">
                    <ItemTemplate>
                        <asp:CheckBox ID="ChbIsAssigned" runat="server" Width="14px" />
                    </ItemTemplate>
                    <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                </asp:TemplateField>
                <asp:BoundField DataField="MANUAL_INVOICE_ID" HeaderText="Invoice No">
                    <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                </asp:BoundField>
                <asp:BoundField DataField="DOCUMENT_DATE" HeaderText="Invoice Date">
                    <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                </asp:BoundField>
                <asp:BoundField DataField="CURRENT_CREDIT_AMOUNT" HeaderText="Credit Amount" DataFormatString="{0:F2}">
                    <ItemStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="DELIVERYMAN_ID" HeaderText="DELIVERYMAN_ID">
                    <HeaderStyle CssClass="HidePanel" />
                    <ItemStyle CssClass="HidePanel" />
                </asp:BoundField>
            </Columns>
            <HeaderStyle CssClass="tblhead" HorizontalAlign="Center"
                                            VerticalAlign="Middle" />
        </asp:GridView>
        </asp:Panel> </TD></TR><TR><TD align=left>
        <strong><asp:Label id="Label5" runat="server" Width="94px" Text="Chque No" CssClass="lblbox"></asp:Label></strong></TD><TD style="WIDTH: 201px" vAlign=top align=left>&nbsp;
        <strong><asp:Label id="Label3" runat="server" Width="94px" Text="Slip No" CssClass="lblbox"></asp:Label></strong></TD><TD style="WIDTH: 201px" vAlign=top align=left></TD></TR><TR><TD vAlign=top align=left><asp:TextBox id="txtChequeNo" runat="server" Width="94px" CssClass="txtBox"></asp:TextBox></TD><TD style="WIDTH: 201px" vAlign=top align=left><asp:TextBox id="txtSlipNo" runat="server" Width="94px" CssClass="txtBox"></asp:TextBox></TD><TD style="WIDTH: 201px" vAlign=top align=left>&nbsp;</TD></TR><TR><TD vAlign=top align=left>
        <strong><asp:Label id="Label6" runat="server" Width="74px" Text="Amount" CssClass="lblbox"></asp:Label></strong></TD><TD style="WIDTH: 201px" vAlign=top align=left>
        <strong><asp:Label id="Label9" runat="server" Width="73px" Text="Remarks" CssClass="lblbox"></asp:Label></strong></TD><TD style="WIDTH: 201px" vAlign=top align=left></TD></TR><TR><TD vAlign=top align=left><asp:TextBox id="txtAmount" runat="server" Width="94px" CssClass="txtBox "></asp:TextBox></TD><TD style="WIDTH: 201px" vAlign=top align=left><asp:TextBox id="txtRemarks" runat="server" Width="194px" CssClass="txtBox "></asp:TextBox></TD><TD style="WIDTH: 201px" vAlign=top align=left></TD></TR><TR><TD style="HEIGHT: 20px" vAlign=top align=left colSpan=2></TD><TD style="WIDTH: 201px; HEIGHT: 20px" vAlign=top align=left></TD></TR><TR><TD align=left colSpan=2></TD><TD style="WIDTH: 201px" align=left colSpan=1></TD></TR><TR><TD style="HEIGHT: 36px" align=left>
        <asp:Button accessKey="S" id="btnSave" onclick="btnSave_Click" runat="server" Width="102px" Font-Size="8pt" Text="Save" CssClass="Button" /> </TD><TD style="WIDTH: 201px; HEIGHT: 36px" vAlign=middle align=left>
        <asp:Button accessKey="C" id="btnCancel" runat="server" Width="120px" Font-Size="8pt" Text="Cancel" CssClass="Button" /> 
        <DIV style="Z-INDEX: 101; LEFT: 487px; WIDTH: 100px; POSITION: absolute; TOP: 308px; HEIGHT: 100px"><asp:Panel id="Panel21" runat="server">
                <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel2">
                    <ProgressTemplate>
                        <asp:ImageButton ID="ImageButton1" runat="server" Height="26px" ImageUrl="~/App_Themes/Granite/Images/image003.gif"
                            Width="23px" />
                        Wait Update
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </asp:Panel> </DIV></TD><TD style="WIDTH: 201px; HEIGHT: 36px" vAlign=middle align=left></TD><TD style="WIDTH: 201px; HEIGHT: 36px" vAlign=middle align=left></TD></TR></TBODY></TABLE>&nbsp; <ajaxToolkit:FilteredTextBoxExtender id="FilteredTextBoxExtender1" runat="server" FilterType="Custom" ValidChars="0123456789." TargetControlID="txtAmount"></ajaxToolkit:FilteredTextBoxExtender> 
</contenttemplate>
                        <triggers>
<asp:AsyncPostBackTrigger ControlID="DrpRoute" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
</triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
        
           </div>
    <div >
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
<TABLE style="BORDER-RIGHT: silver thin inset; BORDER-TOP: silver thin inset; BORDER-LEFT: silver thin inset; WIDTH: 650px; BORDER-BOTTOM: silver thin inset"><TBODY><TR><TD style="HEIGHT: 20px" align=left colSpan=5><asp:Panel id="Panel12" runat="server" Width="750px" Height="200px" ScrollBars="Vertical">
<asp:GridView id="GrdOrder" runat="server" Width="728px" ForeColor="SteelBlue" CssClass="tablesorter" BorderColor="White" OnRowDeleting="GrdOrder_RowDeleting" HorizontalAlign="Center" BackColor="White" AutoGenerateColumns="False">
<PagerSettings FirstPageText="" LastPageText="" Mode="NextPrevious" NextPageText="Next" PreviousPageText="Previous"></PagerSettings>
<Columns>
<asp:BoundField DataField="CUSTOMER_ID" HeaderText="CUSTOMER_ID">
<HeaderStyle CssClass="HidePanel"></HeaderStyle>

<ItemStyle CssClass="HidePanel"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="PRINCIPAL_ID" HeaderText="PRINCIPAL_ID">
<HeaderStyle CssClass="HidePanel"></HeaderStyle>

<ItemStyle CssClass="HidePanel"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="voucher_type_id" HeaderText="voucher_type_id">
<HeaderStyle CssClass="HidePanel"></HeaderStyle>

<ItemStyle CssClass="HidePanel"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="SKU_HIE_NAME" HeaderText="Principal">
<ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="CUSTOMER_NAME" HeaderText="Customer">
<ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="Manual_Document_no" HeaderText="Document No">
<ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="Ledger_date" HeaderText="Ledger Date">
<ItemStyle HorizontalAlign="Center" BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="Voucher_no" HeaderText="Voucher No">
<ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="Balance" DataFormatString="{0:F2}" HeaderText="Amount">
<ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="Remarks" HeaderText="Remarks">
<ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="Document_no" HeaderText="Document_no">
<HeaderStyle CssClass="HidePanel"></HeaderStyle>

<ItemStyle CssClass="HidePanel"></ItemStyle>
</asp:BoundField>
<asp:TemplateField HeaderText="Delete"><ItemTemplate>
                                                    
<asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" OnClientClick="javascript:return confirm('Are you sure you want to Delete?');return false;"
Text="Delete"></asp:LinkButton>
</ItemTemplate>

<ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:TemplateField>
<asp:CommandField ShowEditButton="True" HeaderText="Edit">
<ItemStyle HorizontalAlign="Center" BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:CommandField>
</Columns>

<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="tblhead"></HeaderStyle>
</asp:GridView> <asp:GridView id="gvSaleForceCash" runat="server" Visible="False" Width="728px" ForeColor="SteelBlue" CssClass="tablesorter" BorderColor="White" OnRowDeleting="gvSaleForceCash_RowDeleting" HorizontalAlign="Center" BackColor="White" AutoGenerateColumns="False" OnRowEditing="gvSaleForceCash_RowEditing">
<Columns>
<asp:BoundField DataField="SALE_FORCE_CASH_ID" HeaderText="SALE_FORCE_CASH_ID">
<HeaderStyle CssClass="HidePanel"></HeaderStyle>

<ItemStyle CssClass="HidePanel"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="PRINCIPAL_ID" HeaderText="PRINCIPAL_ID">
<HeaderStyle CssClass="HidePanel"></HeaderStyle>

<ItemStyle CssClass="HidePanel"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="PRINCIPAL" HeaderText="PRINCIPAL">
<ItemStyle HorizontalAlign="Left" BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="DELIVERYMAN_ID" HeaderText="DELIVERYMAN_ID">
<HeaderStyle CssClass="HidePanel"></HeaderStyle>

<ItemStyle CssClass="HidePanel"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="DELIVERYMAN" HeaderText="DELIVERY MAN">
<ItemStyle HorizontalAlign="Left" BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="DOCUMENT_DATE" HeaderText="DOCUMENT DATE">
<ItemStyle HorizontalAlign="Left" BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="AMOUNT" HeaderText="AMOUNT">
<ItemStyle HorizontalAlign="Left" BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:BoundField>
<asp:CommandField ShowEditButton="True" HeaderText="Edit">
<ItemStyle HorizontalAlign="Center" BorderColor="Silver" BorderWidth="1px" Width="40px"></ItemStyle>
</asp:CommandField>
<asp:TemplateField HeaderText="Delete"><ItemTemplate>
    <asp:LinkButton ID="btnDeleteSaleForceCash" runat="server" CommandName="Delete" OnClientClick="javascript:return confirm('Are you sure you want to Delete?');return false;"
    Text="Delete"></asp:LinkButton>
</ItemTemplate>

<ItemStyle HorizontalAlign="Center" BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:TemplateField>
</Columns>
<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="tabs_css"></HeaderStyle>
</asp:GridView> <asp:HiddenField id="hfSALE_FORCE_CASH_ID" runat="server"></asp:HiddenField> <asp:HiddenField id="hfPRINCIPAL_ID" runat="server" __designer:wfdid="w2"></asp:HiddenField> <asp:HiddenField id="hfDELIVERYMAN_ID" runat="server" __designer:wfdid="w3"></asp:HiddenField></asp:Panel> </TD></TR></TBODY></TABLE>
</ContentTemplate>
        </asp:UpdatePanel>
    </div>   
    </div>
</asp:Content>





