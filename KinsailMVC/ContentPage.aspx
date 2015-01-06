<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/KinsailMVC.Master" CodeBehind="ContentPage.aspx.cs" Inherits="KinsailMVC.ContentPage" %>




<asp:Content ID="Content1" ContentPlaceHolderID="StyleSection" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentSection" runat="server">
    <link href="BootStrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery-1.9.1.js" type="text/javascript"></script>
    <script src="BootStrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="Scripts/bootstrap-datepicker.js" type="text/javascript"></script>


    <script src="Scripts/jquery-2.1.1.js"></script>
        <script type="text/javascript">

            function pageLoad(sender, args) {
                if (args.get_isPartialLoad()) {
                    $('#' + '<%= txtBDay.ClientID%>').datepicker();
                $('#' + '<%= txtHireDate.ClientID%>').datepicker();
                $('#' + '<%= txtResignedDate.ClientID%>').datepicker();
            }
        }

        $(document).ready(function () {

            $('#btnAdd').click(function (e) {
                e.preventDefault();
                ClearFields();
                $('#myModal').modal('show');
            });

        });

        function ClearFields() {
            $('#txtEmpId').val('');
            $('#txtFName').val('');
            $('#txtMName').val('');
            $('#txtLName').val('');
            $('#txtContact').val('');
            $('#txtEmail').val('');
            $('#optMale').prop('checked', true);
            $('#txtBDay').datepicker("update", '1/1/1950');
            $('#txtBDay').val('');
            //$('#txtHireDate').datepicker("update", new Date());
            $('#txtHireDate').val('');
            //$('#txtResignedDate').datepicker("update", new Date());
            $('#txtResignedDate').val('');
        };

        function CloseModal(msg) {
            $('#myModal').modal('hide');
            if (msg.length > 0) {
                alert(msg);
            }
        }

        function ShowModal() {
            $('#myModal').modal('show');
        }

        </script>


    <form id="form1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div>
        <div>
            <div class="wrapperDiv">
                <div class="headerDiv">
                    <h3 class="title">Employee Info</h3>
                </div>
                <div class="contentDiv">   
                     <div class="gridWrapper">
                        <div >
                            <asp:Button ID="btnAdd" ClientIDMode="Static" runat="server" Text="Add New" class="btn btn-primary"/>&nbsp;

                            <asp:Button ID="btnDelete" runat="server" Text="Delete" class="btn btn-primary" 
                            OnClientClick="return confirm('Do you really want to delete the employee?');" />&nbsp;

                            <asp:Label ID="Label1" runat="server" Text="Search by name : "></asp:Label>

                            <asp:TextBox ID="txtSearch" runat="server"  class="form-control" 
                            style="margin-top: 5px;"></asp:TextBox>

                            <asp:Button ID="btnSearch" runat="server" Text="Go!" class="btn btn-primary"/>

                        </div>
                        <!-- Start of Gridview-->
                         <div class="gridContainer">
                             <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <contenttemplate>
                                     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" EmptyDataText="No Record"
                                         class="table table-striped table-bordered table-condensed" AllowPaging="True" >
                                         <Columns>
                                             <asp:BoundField DataField="employee_id" HeaderText="Employee Id" SortExpression="employee_id" />
                                             <asp:BoundField DataField="employee_name" HeaderText="Name" SortExpression="employee_name" />
                                             <asp:BoundField DataField="date_hired" HeaderText="Date Hired" SortExpression="date_hired"
                                                 DataFormatString="{0:d}" />
                                             <asp:BoundField DataField="date_resigned" HeaderText="Date Resigned" SortExpression="date_resigned"
                                                 DataFormatString="{0:d}" />
                                             <asp:BoundField DataField="contact_no" HeaderText="Contact No." SortExpression="contact_no"/>
                                             <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email"/>
                                             <asp:TemplateField HeaderText="Edit | Delete">
                                                 <ItemTemplate>
                                                     <asp:LinkButton ID="LinkButton2" runat="server" CommandName="select" 
                                                     CommandArgument='<%# Eval("employee_id") %>'>Edit</asp:LinkButton>&nbsp;&nbsp;|&nbsp;
                                                     <asp:CheckBox ID="chkDelete" runat="server" AutoPostBack="True" />
                                                     <asp:HiddenField ID="hfEmpId" runat="server" value='<%# Eval("employee_id") %>'/>
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                         </Columns>
                                     </asp:GridView>          
                                     <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                     </asp:UpdatePanel>
                                </contenttemplate>
                                <Triggers>                                             
                                    <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />     
                                    <asp:AsyncPostBackTrigger ControlID="btnDelete" EventName="Click" />
                                    <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>  
                         </div>
                         <!-- End of Gridview-->
                     </div>          
                </div>
            </div>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none ;">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Employee Details</h4>
      </div>
        <div class="modal-body">
            <div style="float:left; display: inline; padding-right: 80px; ">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td style="text-align:right;">
                                    <label class="col-sm-2 control-label">Email:</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtEmpId" runat="server" class="form-control" style="max-width: 50px;" Enabled="False"></asp:TextBox>
                                </td>
                                <td>
                    
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align:right;">
                                    <label class="col-sm-2 control-label">First name : </label>
                                </td>
                                <td colspan="2">
                                    <asp:TextBox ID="txtFName" runat="server" class="form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align:right;">
                                    <label class="col-sm-2 control-label">Mid name : </label>
                                </td>
                                <td colspan="2">
                                    <asp:TextBox ID="txtMName" runat="server" class="form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align:right;">
                                    <label class="col-sm-2 control-label">Last name : </label>
                                </td>
                                <td colspan="2">
                                    <asp:TextBox ID="txtLName" runat="server" class="form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align:right;">
                                    <label class="col-sm-2 control-label">Gender : </label>
                                </td>
                                <td colspan="2">
                                    <label style="display :inline-block">
                                        <input type="radio" name="gender" id="optMale" value="Male" runat="server" checked="True" /> Male
                                    </label>
                                    <label style="display :inline-block"><input type="radio" name="gender" id="optFemale" value="Female" runat="server" /> Female     
                                    </label>
                               </td>
                            </tr>
                            <tr>
                                <td style="text-align:right;">
                                    <label class="col-sm-2 control-label">Birth date : </label>
                                </td>
                                <td colspan="2">
                                    <asp:TextBox ID="txtBDay" runat="server" class="datepicker"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align:right;">
                                    <label class="col-sm-2 control-label">Hired date : </label>
                                </td>
                                <td colspan="2">
                                    <asp:TextBox ID="txtHireDate" runat="server" class="form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align:right;">
                                    <label class="col-sm-2 control-label">Resigned date : </label>
                                </td>
                                <td colspan="2">
                                    <asp:TextBox ID="txtResignedDate" runat="server" class="form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align:right;">
                                    <label class="col-sm-2 control-label">Contact No. : </label>
                                </td>
                                <td colspan="2">
                                    <asp:TextBox ID="txtContact" runat="server" class="form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align:right;">
                                    <label class="col-sm-2 control-label">Email : </label>
                                </td>
                                <td colspan="2">
                                    <asp:TextBox ID="txtEmail" runat="server" class="form-control"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="Gridview1" EventName="RowCommand" />
                    </Triggers>
                </asp:UpdatePanel>

            </div>
            <div style="display: inline-block;">
                <img src="images/default_test.jpg" style="width:100px; height:100px;" 
                class="img-rounded"/><br />
                <input id="btnShowCam" type="submit" value="AddPhoto" />
            </div>
        </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" id="btnClose" >Close</button>
          <asp:Button ID="btnSave" runat="server" Text="Save change" CssClass="btn btn-primary"/>
      </div>
    </div>
  </div>
</div>
        </div>
    </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>