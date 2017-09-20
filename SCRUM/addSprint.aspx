<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addSprint.aspx.cs" Inherits="addSprint" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Scrum Management System</title>

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
                        <span class="icon-bar"></span><a href="viewBacklog.aspx" type="button" class="btn">Add Backlog</></a>
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
                                    <svg class="glyph stroked eye">
                                        <use xlink:href="#stroked-eye"></use></svg>
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
                <li><a href="projects.aspx">
                    <svg class="glyph stroked open folder">
                        <use xlink:href="#stroked-open-folder"></use></svg>
                    Projects</a></li>
                <li class="active"><a href="sprints.aspx">
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
                <li role="presentation" class="divider"></li>
                <li><a href="profile.aspx">
                    <svg class="glyph stroked eye">
                        <use xlink:href="#stroked-eye"></use></svg>
                    Profile</a></li>
            </ul>

        </div>
        <!--/.sidebar-->

        <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
            <div class="row">
                <ol class="breadcrumb">
                    <li><a href="projects.aspx">
                        <svg class="glyph stroked home">
                            <use xlink:href="#stroked-home"></use></svg></a></li>
                    <li class="">Sprints</li>
                    <li class="ative">Create Sprint</li>
                </ol>
            </div>
            <!--/.row-->

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Sprints</h1>


                </div>
            </div>
            <!--/.row-->
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">

                        <div class="panel-body">
                            Select Start and End Dates for this Projects Sprint
                    <br />
                            <br />

                            <!-- JC - Sql Datasource that is pulling data from Projects table-->


                            <asp:SqlDataSource ID="dropdown" runat="server" ConnectionString='<%$ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SCRUM_PROJECT"></asp:SqlDataSource>

                            <label for="asTextLabel" class="col-sm-2 control-label">Start Date: </label>
                            <div class="col-sm-10">
                                <!--JC - ASP calendar which has been formatted for beter styling and previous dates before current date not able to be selected-->
                                <asp:Calendar ID="Calendar1" runat="server" OnDayRender="Calendar1_DayRender" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
                                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt"></DayHeaderStyle>

                                    <NextPrevStyle VerticalAlign="Bottom" Font-Bold="True" Font-Size="8pt" ForeColor="#333333"></NextPrevStyle>

                                    <OtherMonthDayStyle ForeColor="#999999"></OtherMonthDayStyle>

                                    <SelectedDayStyle BackColor="#333399" ForeColor="White"></SelectedDayStyle>

                                    <TitleStyle BackColor="White" BorderColor="LightSteelBlue" BorderWidth="2px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399"></TitleStyle>

                                    <TodayDayStyle BackColor="#CCCCCC"></TodayDayStyle>
                                </asp:Calendar>
                                <asp:TextBox ID="startdate" runat="server" CssClass="form-control" Width="20%">  </asp:TextBox>
                                <br />
                            </div>
                            <br />
                            <br />
                            <label for="enddate" class="col-sm-2 control-label">End Date: </label>
                            <div class="col-sm-10">

                                <asp:Calendar ID="Calendar2" runat="server" OnDayRender="Calendar2_DayRender" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
                                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt"></DayHeaderStyle>

                                    <NextPrevStyle VerticalAlign="Bottom" Font-Bold="True" Font-Size="8pt" ForeColor="#333333"></NextPrevStyle>

                                    <OtherMonthDayStyle ForeColor="#999999"></OtherMonthDayStyle>

                                    <SelectedDayStyle BackColor="#333399" ForeColor="White"></SelectedDayStyle>

                                    <TitleStyle BackColor="White" BorderColor="LightSteelBlue" BorderWidth="2px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399"></TitleStyle>

                                    <TodayDayStyle BackColor="#CCCCCC"></TodayDayStyle>
                                </asp:Calendar>
                                <asp:TextBox ID="enddate" runat="server" Text="" CssClass="form-control" Width="20%"> </asp:TextBox>
                                <br />

                            </div>
                            <br />
                            <br />
                            <label for="days" class="col-sm-2 control-label">Days within Sprint: </label>
                            <div class="col-sm-10">
                                <!-- JC - Validation to alert user if sprint will exceed a four week period-->
                                <asp:TextBox ID="days" runat="server" CssClass="form-control"> </asp:TextBox>
                                <asp:RangeValidator ID="RangeValidator1" Type="Integer" ControlToValidate="days" runat="server" MaximumValue="28" MinimumValue="0" ErrorMessage="Warning: Sprint will exceed 4 weeks"></asp:RangeValidator>
                                <br />
                                <br />
                            </div>
                            <br />

                            <br />
                            <br />



                            <div class="col-sm-10">


                                <asp:Button ID="addsprint" runat="server" Text="Create Sprint" CssClass="btn btn-primary" Width="300px" OnClick="addsprint_Click" />
                                <asp:Button ID="cancelsprint" runat="server" CssClass="btn btn-danger" Text="Cancel" Width="200px" OnClick="cancelsprint_Click" />

                                <asp:Label ID="addLabel" runat="server" Text=""></asp:Label>


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


