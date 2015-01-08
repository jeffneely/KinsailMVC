<%@ Page Language="C#" AutoEventWireup="true"  CodeBehind="AdminSiteBasic.aspx.cs" Inherits="KinsailMVC.AdminSiteBasic" %>

<!DOCTYPE html>
<html lang="en">
<head id="Head1" runat="server">
    <title>::Kinsail MVC Administrator::</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Kinsail MVC Project">

    
    <script src="js/jquery-1.10.2.js"></script>
    <script src="BootStrap/js/bootstrap.js"></script>
    <link href="css/site.css" rel="stylesheet" />
    <script src="js/custom.js"></script>
    <link href="BootStrap/css/bootstrap.css" rel="stylesheet" />

    <script type="text/javascript">

        $(document).ready(function () {

            $('#btnAdd').click(function (e) {
                e.preventDefault();
                ShowModal();
                //ClearFields();
                //$('#myModal').modal();
                //$('#myModal').modal('show');
               
            });

        });

        function CloseModal(msg) {
            $('#myModal').modal('hide');
            if (msg.length > 0) {
                alert(msg);
            }
        }

        function ShowModal() {
            $('#myModal').modal('show');
        } (jQuery);

    </script>


    
</head>
<body>


        <div class="container">
        <!-- Static navbar -->
        	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
  <!-- Brand and toggle get grouped for better mobile display -->
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    
  </div>

  <!-- Collect the nav links, forms, and other content for toggling -->
  <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#" class="scroll-link" data-id="home">Home</a></li>
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Menu <b class="caret"></b></a>
        <ul class="dropdown-menu">
          <li><a href="#">Site Basic</a></li>
          
            <li class="divider"></li>
            <li><a href="#">Locations</a></li>
          <li class="divider"></li>
            <li><a href="#">Rec Users</a></li>
          
        </ul>
       </li> 

    </ul>
  </div><!-- /.navbar-collapse -->
  </nav>

            
            <!-- Content Page Section -->
    </div>



    <form id="form1" runat="server">
<!-- Button to trigger modal -->
<div>
        <div>
            <div class="wrapperDiv">
             <div class="headerDiv">
                    <h3 class="title">Site information</h3>
                </div>

                <div class="contentDiv">   
                     <div class="gridWrapper">
                        <div >

                            
             <asp:Button ID="btnAdd"  ClientIDMode="Static" runat="server" Text="Add New" class="btn btn-primary" />&nbsp;

               <asp:Label ID="lblError" runat="server" Text="" CssClass="error"></asp:Label>

                            <asp:GridView ID="dgSites" runat="server" EmptyDataText="No Record"
                                         class="table table-striped table-bordered table-condensed" AllowPaging="True" OnPageIndexChanged="dgSites_PageIndexChanged" OnPageIndexChanging="dgSites_PageIndexChanging">
                                
                            </asp:GridView>

                            </div>
                         </div>
                    </div>
                </div>
            </div>
    </div>


<!-- Modal -->
<div class="modal fade  bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="H1">Create Site</h4>
      </div>
      <div class="modal-body">
       <table>
          <tr>
              <td>Location:</td>
              <td>
                  <asp:DropDownList ID="ddlLocation" runat="server"></asp:DropDownList>

              </td>
              
          </tr>
          
          <tr>
              <td>Site:</td>
              <td>
                  <asp:DropDownList ID="ddlSite" runat="server"></asp:DropDownList>

              </td>
          </tr>

          <tr>
              <td>Map:</td>
              <td>
                  <asp:DropDownList ID="ddlMap" runat="server"></asp:DropDownList>

              </td>
          </tr>

          <tr>
              <td>Image:</td>
              <td>
                  <asp:DropDownList ID="ddlImage" runat="server"></asp:DropDownList>

              </td>
          </tr>

          <tr>
              <td>Display Order:</td>
              <td>
                  <asp:DropDownList ID="ddlDisplayOrder" runat="server"></asp:DropDownList>

              </td>
          </tr>

          
          <tr>
              <td>Relation Description:</td>
              <td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
          </tr>

          <tr>
              <td>Coordinate X:</td>
              <td><asp:TextBox ID="txtCoordinateX" runat="server"></asp:TextBox></td>
          </tr>

          <tr>
              <td>Coordinate Y:</td>
              <td><asp:TextBox ID="txtCoordinateY" runat="server"></asp:TextBox></td>
          </tr>

          

          <tr>
              <td></td>
              <td></td>
          </tr>
      </table>
     
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>




    </form>

</body>
</html>