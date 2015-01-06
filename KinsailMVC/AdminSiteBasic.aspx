<%@ Page Language="C#" AutoEventWireup="true"  CodeBehind="AdminSiteBasic.aspx.cs" Inherits="KinsailMVC.AdminSiteBasic" %>

<!DOCTYPE html>
<html lang="en">
<head id="Head1" runat="server">
    <title>::Kinsail MVC Administrator::</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Kinsail MVC Project">

    <link href="BootStrap/css/bootstrap.css" rel="stylesheet" />
    <script src="js/jquery-1.10.2.js"></script>
    <link href="site.css" rel="stylesheet" />
    <script src="js/bootstrap.js"></script>
    <script src="js/custom.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {

            $('#btnAdd').click(function (e) {
                e.preventDefault();
                //ClearFields();
                $('#myModal').modal('show');
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
        }

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

                            
             <asp:Button ID="btnAdd"  ClientIDMode="Static" runat="server" Text="Add New" class="btn btn-primary"/>&nbsp;

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
<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>

    <h3 id="myModalLabel">Create Site</h3>
  </div>
  <div class="modal-body">
    
      <table>
          <tr>
              <td>Site Id:</td>
              <td><asp:TextBox ID="txtSiteId" runat="server"></asp:TextBox></td>
          </tr>
          
          <tr>
              <td>Location Id:</td>
              <td><asp:TextBox ID="txtLocationId" runat="server"></asp:TextBox></td>
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
              <td>Image:</td>
              <td><asp:TextBox ID="txtImage" runat="server"></asp:TextBox></td>
          </tr>


          <tr>
              <td></td>
              <td></td>
          </tr>
      </table>
     
  </div>
  <div class="modal-footer">


    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
    
      <asp:Button ID="btnSave" runat="server" Text="Save changes" CssClass="btn btn-primary" />
  </div>
</div>


    </form>

</body>
</html>