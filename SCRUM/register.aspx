<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Scrum Mangement System</title>

    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/datepicker3.css" rel="stylesheet" />
    <link href="css/styles.css" rel="stylesheet" />
    <link rel="icon" href="img/scrum.png" />
    <!--Icons-->
    <script src="js/lumino.glyphs.js"></script>

    <!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<script src="js/respond.min.js"></script>
<![endif]-->

</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#"><span>Scrum Management</span> System</a>
                    <ul class="user-menu">
                        <li class="dropdown pull-right">

                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#">
                                    <svg class="glyph stroked male-user">
                                        <use xlink:href="#stroked-male-user"></use></svg>
                                    Profile</a></li>
                                <li><a href="#">
                                    <svg class="glyph stroked gear">
                                        <use xlink:href="#stroked-gear"></use></svg>
                                    Settings</a></li>
                                <li><a href="#">
                                    <svg class="glyph stroked cancel">
                                        <use xlink:href="#stroked-cancel"></use></svg>
                                    Logout</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>

            </div>
            <!-- /.container-fluid -->
        </nav>

        <div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">



            <ul class="nav menu">



                <li><a href="login.aspx">
                    <svg class="glyph stroked male-user">
                        <use xlink:href="#stroked-male-user"></use></svg>
                    Login Page</a></li>
                <li class="active"><a href="register.aspx">
                    <svg class="glyph stroked male-user">
                        <use xlink:href="#stroked-male-user"></use></svg>
                    Register Page</a></li>

            </ul>

        </div>
        <!--/.sidebar-->

        <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
            <div class="row">
                <ol class="breadcrumb">
                    <li><a href="#">
                        <svg class="glyph stroked home">
                            <use xlink:href="#stroked-home"></use></svg></a></li>
                    <li class="active">Register</li>
                </ol>
            </div>
            <!--/.row-->

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Register</h1>
                </div>
            </div>
            <!--/.row-->
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <svg class="glyph stroked email">
                                <use xlink:href="#stroked-email"></use></svg>
                            Register</div>
                        <div class="panel-body">


                            <!-- JC - Name input-->

                            <div class="form-group">
                                <label class="col-md-3 control-label" for="firstname">First Name</label>
                                <div class="col-md-3">
                                    <asp:TextBox ID="firstname" runat="server" class="form-control" placeholder="First Name" autofocus=""></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="A First Name must be entered" ControlToValidate="firstname" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>


                            </div>
                            <br />
                            <br />
                            <!-- JC - Name input-->

                            <div class="form-group">
                                <label class="col-md-3 control-label" for="lastname">Last Name</label>
                                <div class="col-md-3">
                                    <asp:TextBox ID="lastname" runat="server" class="form-control" placeholder="Last Name" autofocus=""></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="A Last Name must be entered" ControlToValidate="lastname" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <br />
                            <br />
                            <!-- JC - username input-->
                            <!-- JC - Validation used to avoid the user being able to enter no username-->
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="username">Username</label>
                                <div class="col-md-3">
                                    <asp:TextBox ID="username1" runat="server" class="form-control" placeholder="Username" autofocus=""></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="A Username must be entered" ControlToValidate="username1" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <br />
                            <br />

                            <!-- JC - password input-->
                            <!-- JC - Validation used to make use create complex password-->
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="password">Password</label>
                                <div class="col-md-3">
                                    <asp:TextBox ID="password" runat="server" class="form-control" placeholder="Password" TextMode="Password" autofocus=""></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" Display="Dynamic" ErrorMessage="Password must be 8-10 characters long</br> with at least one numeric character." ForeColor="Red" ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,10})$" ControlToValidate="password" runat="server"> </asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="A Password must be entered" ControlToValidate="password" ForeColor="Red"></asp:RequiredFieldValidator>

                                </div>
                            </div>
                            <br />
                            <br />
                            <br />
                            <br />

                            <!-- JC - confirm password input-->
                            <!-- JC - Validation used to confirm both passwords match-->

                            <div class="form-group">
                                <label class="col-md-3 control-label" for="confirmpassword">Re-enter Password</label>
                                <div class="col-md-3">
                                    <asp:TextBox ID="confirmPassword" runat="server" class="form-control" placeholder="Re-enter your password" TextMode="Password" autofocus=""></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="confirmPassword" ControlToCompare="password" ErrorMessage="Passwords do not match!" ForeColor="Red"></asp:CompareValidator>

                                </div>
                            </div>
                            <br />
                            <br />
                            <br />

                            <!-- Email input-->
                            <!-- JC - Validation used to make sure email is in the correct form using a @ symbol-->
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="email">E-mail</label>
                                <div class="col-md-3">
                                    <asp:TextBox ID="email" runat="server" class="form-control" placeholder="Email" TextMode="Email" autofocus=""></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="An Email must be entered" ControlToValidate="email" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <br />
                            <br />

                            <!-- confirm email input-->
                            <!-- JC - Validation used to confirm emails match-->

                            <div class="form-group">
                                <label class="col-md-3 control-label" for="confirmEmail">Re-enter E-mail</label>
                                <div class="col-md-3">
                                    <asp:TextBox ID="confirmEmail" runat="server" class="form-control" placeholder="Re-enter your e-mail" TextMode="Email" autofocus=""></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="confirmEmail" ControlToCompare="email" ErrorMessage="Email addresses do not match!" ForeColor="Red"></asp:CompareValidator>
                                    <br />
                                    <br />
                                </div>
                            </div>
                            <br />
                            <br />
                            <br />
                            <!-- JC - Profile image upload-->
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="profileImage">Profile Picture</label>
                                <div class="col-md-3">
                                    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />

                                </div>
                            </div>
                            <asp:Label ID="myinfo" runat="server" Text=""></asp:Label>
                            <br />
                            <br />

                            <!-- JC - Skillset textbox-->
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="skillset">Skillset Description</label>
                                <div class="col-md-3">
                                    <asp:TextBox ID="skillset" runat="server" class="form-control" TextMode="MultiLine" placeholder="" autofocus=""></asp:TextBox>

                                </div>
                            </div>
                            <br />
                            <br />
                            <!-- JC & RME - Assign user roles-->
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="email">Product Owner</label>
                                <asp:DropDownList Width="25%" ID="accountproductowner" button class="btn btn-default dropdown-toggle" runat="server">
                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 control-label" for="email">Scrum Master</label>
                                <asp:DropDownList Width="25%" ID="accountscrummaster" button class="btn btn-default dropdown-toggle" runat="server">
                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 control-label" for="email">Developer</label>
                                <asp:DropDownList Width="25%" ID="accountdeveloper" button class="btn btn-default dropdown-toggle" runat="server">
                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                </asp:DropDownList>
                            </div>


                            <div class="col-md-6 widget-right">
                                <asp:Button ID="registerbutton" runat="server" Text="Register" CssClass="btn btn-default" OnClick="registerbutton_Click" Visible="true" />

                                <asp:Label ID="registerLabel" runat="server" ForeColor="Black" Text=""></asp:Label>

                            </div>


                        </div>




                    </div>
                </div>
            </div>
        </div>
        </div>
        <!--/.main-->


        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/chart.min.js"></script>
        <script src="js/chart-data.js"></script>
        <script src="js/easypiechart.js"></script>
        <script src="js/easypiechart-data.js"></script>
        <script src="js/bootstrap-datepicker.js"></script>
        <script>
            !function ($) {
                $(document).on("click", "ul.nav li.parent > a > span.icon", function () {
                    $(this).find('em:first').toggleClass("glyphicon-minus");
                });
                $(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
            }(window.jQuery);

            $(window).on('resize', function () {
                if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
            })
            $(window).on('resize', function () {
                if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
            })
        </script>

    </form>
</body>
</html>

