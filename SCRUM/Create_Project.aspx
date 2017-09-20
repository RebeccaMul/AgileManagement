<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Create_Project.aspx.cs" Inherits="projects" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Scrum Management System</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/datepicker3.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">

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
                    <a class="navbar-brand" href="Default.aspx"><span>Scrum Management</span> System</a>
                    <ul class="user-menu">
                        <li class="dropdown pull-right">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <svg class="glyph stroked eye">
                                    <use xlink:href="#stroked-eye"></use></svg>
                                <asp:Label ID="username" runat="server" Text=""></asp:Label><span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#">
                                    <svg class="glyph stroked male-user">
                                        <use xlink:href="#stroked-male-user"></use></svg>
                                    Profile</a></li>
                                <li><a href="#">
                                    <svg class="glyph stroked gear">
                                        <use xlink:href="#stroked-gear"></use></svg>
                                    Settings</a></li>
                                <li><a href="login.aspx">
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
                <li><a href="Default.aspx">
                    <svg class="glyph stroked home">
                        <use xlink:href="#stroked-home"></use></svg>
                    Dashboard</a></li>
                <li class="active"><a href="projects.aspx">
                    <svg class="glyph stroked open folder">
                        <use xlink:href="#stroked-open-folder"></use></svg>
                    Projects</a></li>
                <li><a href="sprints.aspx">
                    <svg class="glyph stroked clipboard with paper">
                        <use xlink:href="#stroked-clipboard-with-paper"></use></svg>
                    Sprints</a></li>
                <li><a href="teams.aspx">
                    <svg class="glyph stroked male user">
                        <use xlink:href="#stroked-male-user"></use></svg>
                    Teams</a></li>
                <li><a href="burndown.aspx">
                    <svg class="glyph stroked line-graph">
                        <use xlink:href="#stroked-line-graph"></use></svg>
                    Burndown</a></li>
                <li><a href="profile.aspx">
                    <svg class="glyph stroked eye">
                        <use xlink:href="#stroked-eye"></use></svg>
                    Profile</a></li>

                <li role="presentation" class="divider"></li>
                <li><a href="login.aspx">
                    <svg class="glyph stroked male-user">
                        <use xlink:href="#stroked-male-user"></use></svg>
                    Login Page</a></li>
                <li><a href="register.aspx">
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
                        <svg class="glyph stroked-open-folder">
                            <use xlink:href="#stroked-open-folder"></use></svg></a></li>
                    <li class="active">Projects</li>
                </ol>
            </div>
            <!--/.row-->

            <div class="content">


                <div class="panel panel-default">
                    <div class="panel-heading">
                        <svg class="glyph stroked clipboard-with-paper">
                            <use xlink:href="#stroked-clipboard-with-paper"></use></svg>Create a New Project
                    </div>



                    <div class='panel-body'>


                        <!--BL - Text box forms to create new project-->
                        <label class="col-md-3 control-label" for="projectName">Project Name</label>
                        <div class="col-md-3">
                            <asp:TextBox ID="projectName" CssClass="form-control" runat="server" inputclass="form-control" placeholder="Project Name" autofocus=""></asp:TextBox>
                        </div>
                        <br />
                        <br />
                        <label class="col-md-3 control-label" cssclass="form-control" for="projectName">Project Description</label>

                        <div class="col-md-3">
                            <asp:TextBox ID="projectDesc" TextMode="MultiLine" CssClass="form-control" runat="server" inputclass="form-control" placeholder="Project Description" autofocus=""></asp:TextBox>
                        </div>
                        <br />
                        <br />

                        <div class="col-md-14">

                            <br />

                            <label for="asTextLabel" class="col-md-3 control-label">Start Date: </label>


                            <asp:Calendar ID="Calendar1" runat="server" OnDayRender="Calendar1_DayRender" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
                                <DayHeaderStyle Font-Bold="True" Font-Size="8pt"></DayHeaderStyle>

                                <NextPrevStyle VerticalAlign="Bottom" Font-Bold="True" Font-Size="8pt" ForeColor="#333333"></NextPrevStyle>

                                <OtherMonthDayStyle ForeColor="#999999"></OtherMonthDayStyle>

                                <SelectedDayStyle BackColor="#333399" ForeColor="White"></SelectedDayStyle>

                                <TitleStyle BackColor="White" BorderColor="LightSteelBlue" BorderWidth="2px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399"></TitleStyle>

                                <TodayDayStyle BackColor="#CCCCCC"></TodayDayStyle>
                            </asp:Calendar>



                            <br />
                            <br />
                        </div>
                        <!--Label for textbox formating(projectDate) -->
                        <label class="col-md-3 control-label" cssclass="form-control" for="projectName"></label>
                        <asp:TextBox ID="projectDate" runat="server" CssClass="form-control" inputclass="form-control" Width="20%">  </asp:TextBox>
                        <br />

                        <asp:Button ID="ProjectButton" runat="server" Text="Submit" CssClass="btn btn-primary" Width="18%" OnClick="ProjectButton_Click" />
                        <asp:Button ID="cancelsprint" runat="server" CssClass="btn btn-danger" Text="Cancel" Width="14%" OnClick="cancelsprint_Click" />

                    </div>


                    <asp:Label ID="done" runat="server" Text=""></asp:Label>
                </div>
                <br />
                <br />
                <!-- Name input-->


            </div>

            <br />
            <br />
            <br />

            <script src="js/jquery-1.11.1.min.js"></script>
            <script src="js/bootstrap.min.js"></script>
            <script src="js/chart.min.js"></script>
            <script src="js/chart-data.js"></script>
            <script src="js/easypiechart.js"></script>
            <script src="js/easypiechart-data.js"></script>
            <script src="js/bootstrap-datepicker.js"></script>
            <script>
                $('#calendar').datepicker({
                });

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
