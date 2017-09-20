<%@ Page Language="C#" AutoEventWireup="true" CodeFile="burndownpage.aspx.cs" Inherits="burndownpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Scrum Management System</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/datepicker3.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">
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
                <li><a href="projects.aspx">
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
                <li class="active"><a href="burndown.aspx">
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
                    <li><a href="burndown.aspx">
                        <svg class="glyph stroked open folder">
                            <use xlink:href="#stroked-open-folder"></use></svg></a></li>
                    <li class="active">View a different project's sprint</li>
                </ol>
            </div>
            <!--/.row-->

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Burndown</h1>
                </div>
            </div>
            <!--/.row-->



            <div class="row">
                <div class="col-xs-12 col-md-6 col-lg-3">
                    <div class="panel panel-blue panel-widget ">
                        <div class="row no-padding">
                            <div class="col-sm-3 col-lg-5 widget-left">
                                <svg class="glyph stroked home">
                                    <use xlink:href="#stroked-home"></use></svg>
                            </div>
                            <div class="col-sm-9 col-lg-7 widget-right">
                                <div class="large"><a href="Default.aspx">Dashboard</a></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-md-6 col-lg-3">
                    <div class="panel panel-orange panel-widget">
                        <div class="row no-padding">
                            <div class="col-sm-3 col-lg-5 widget-left">
                                <svg class="glyph stroked open folder">
                                    <use xlink:href="#stroked-open-folder"></use></svg>
                            </div>
                            <div class="col-sm-9 col-lg-7 widget-right">
                                <div class="large"><a href="projects.aspx">Projects</a></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-md-6 col-lg-3">
                    <div class="panel panel-red panel-widget">
                        <div class="row no-padding">
                            <div class="col-sm-3 col-lg-5 widget-left">
                                <svg class="glyph stroked clipboard with paper">
                                    <use xlink:href="#stroked-clipboard-with-paper"></use></svg>
                            </div>
                            <div class="col-sm-9 col-lg-7 widget-right">
                                <div class="large"><a href="sprints.aspx">Sprints</a></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-md-6 col-lg-3">
                    <div class="panel panel-teal panel-widget">
                        <div class="row no-padding">
                            <div class="col-sm-3 col-lg-5 widget-left">
                                <svg class="glyph stroked male-user">
                                    <use xlink:href="#stroked-male-user"></use></svg>
                            </div>
                            <div class="col-sm-9 col-lg-7 widget-right">
                                <div class="large"><a href="teams.aspx">Teams</a></div>
                                <div class="text-muted"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--/.row-->



                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <svg class="glyph stroked open folder">
                                    <use xlink:href="#stroked-line-graph"></use>
                                </svg><b>Burndown Chart</b>

                                <asp:SqlDataSource ID="LinkData" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>'
                                    SelectCommand="SELECT * FROM SCRUM_PROJECT WHERE projectID = @ID">
                                    <SelectParameters>
                                        <asp:QueryStringParameter QueryStringField="projectID" Name="ID" Type="Int32"></asp:QueryStringParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>


                                <asp:ListView ID="links" runat="server" Visible="true" DataSourceID="LinkData">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="sprint" runat="server" Style="float: right; margin-right: 5px;" CssClass="btn btn-primary" NavigateUrl='<%# "sprintpage.aspx?projectID=" + Request.QueryString["projectID"] + "&sprintID=" +Request.QueryString["sprintID"] %>'>View Sprint</asp:HyperLink>
                                        <asp:HyperLink ID="project" runat="server" CssClass="btn btn-primary" Style="float: right; margin-right: 5px;" NavigateUrl='<%# "projectlist.aspx?projectID=" + Request.QueryString["projectID"] + "&sprintID=" +Request.QueryString["sprintID"] %>'>View Project</asp:HyperLink>
                                    </ItemTemplate>
                                </asp:ListView>


                            </div>
                            <div class="panel-body">

                                <%-- Burndown Chart Section: --%>
                                <!-- RMU - Dashboard UI-->
                                <asp:SqlDataSource ID="week1" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>'
                                    SelectCommand="SELECT * FROM SCRUM_SPRINT_TASK WHERE sprintID = @ID AND week = '1'">
                                    <SelectParameters>
                                        <asp:QueryStringParameter QueryStringField="sprintID" Name="ID" Type="Int32"></asp:QueryStringParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>

                                <%-- RMU: Listview week1: --%>
                                <asp:ListView ID="TaskHourValues1" runat="server" DataSourceID="week1" Style="margin-left: auto; margin-right: auto;" Visible="false">
                                    <ItemTemplate>
                                        Week:
                                        <asp:Label runat="server" ID="week1" Text='<%# Eval("week") %>'></asp:Label><br />
                                        Mon:
                                        <asp:Label runat="server" ID="Label1" Text='<%# Eval("mon") %>'></asp:Label>
                                        Tues:
                                        <asp:Label runat="server" ID="Label2" Text='<%# Eval("tues") %>'></asp:Label>
                                        Wed:
                                        <asp:Label runat="server" ID="Label3" Text='<%# Eval("wed") %>'></asp:Label>
                                        Thurs:
                                        <asp:Label runat="server" ID="Label4" Text='<%# Eval("thurs") %>'></asp:Label>
                                        Fri:
                                        <asp:Label runat="server" ID="Label5" Text='<%# Eval("fri") %>'></asp:Label>
                                        Sat:
                                        <asp:Label runat="server" ID="Label6" Text='<%# Eval("sat") %>'></asp:Label>
                                        Sun:
                                        <asp:Label runat="server" ID="Label7" Text='<%# Eval("sun") %>'></asp:Label>
                                        <asp:Literal ID="Literal" runat="server" Visible="false" OnDataBinding="TaskHourValues1_DataBinding"></asp:Literal>
                                    </ItemTemplate>
                                </asp:ListView>
                                <asp:TextBox ID="Total" runat="server" Visible="false"></asp:TextBox>

                                <!-- RMU - SQL for listview week 2:-->
                                <asp:SqlDataSource ID="week2" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>'
                                    SelectCommand="SELECT * FROM SCRUM_SPRINT_TASK WHERE sprintID = @ID AND week = '2'">
                                    <SelectParameters>
                                        <asp:QueryStringParameter QueryStringField="sprintID" Name="ID" Type="Int32"></asp:QueryStringParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>

                                <%-- RMU: Listview week2: --%>
                                <asp:ListView ID="TaskHourValues2" runat="server" DataSourceID="week2" Style="margin-left: auto; margin-right: auto;" Visible="false">
                                    <ItemTemplate>
                                        Week:
                                        <asp:Label runat="server" ID="week2" Text='<%# Eval("week") %>'></asp:Label>
                                        Mon:
                                        <asp:Label runat="server" ID="Label1" Text='<%# Eval("mon") %>'></asp:Label>
                                        Tues:
                                        <asp:Label runat="server" ID="Label2" Text='<%# Eval("tues") %>'></asp:Label>
                                        Wed:
                                        <asp:Label runat="server" ID="Label3" Text='<%# Eval("wed") %>'></asp:Label>
                                        Thurs:
                                        <asp:Label runat="server" ID="Label4" Text='<%# Eval("thurs") %>'></asp:Label>
                                        Fri:
                                        <asp:Label runat="server" ID="Label5" Text='<%# Eval("fri") %>'></asp:Label>
                                        Sat:
                                        <asp:Label runat="server" ID="Label6" Text='<%# Eval("sat") %>'></asp:Label>
                                        Sun:
                                        <asp:Label runat="server" ID="Label7" Text='<%# Eval("sun") %>'></asp:Label>
                                        <asp:Literal ID="Literal" runat="server" Visible="false" OnDataBinding="TaskHourValues2_DataBinding"></asp:Literal>
                                    </ItemTemplate>
                                </asp:ListView>
                                <asp:TextBox ID="Total2" runat="server" Visible="false"></asp:TextBox>

                                <!-- RMU - SQL for listview week 3:-->
                                <asp:SqlDataSource ID="week3" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>'
                                    SelectCommand="SELECT * FROM SCRUM_SPRINT_TASK WHERE sprintID = @ID AND week = '3'">
                                    <SelectParameters>
                                        <asp:QueryStringParameter QueryStringField="sprintID" Name="ID" Type="Int32"></asp:QueryStringParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>

                                <%-- RMU: Listview week 3: --%>
                                <asp:ListView ID="TaskHourValues3" runat="server" DataSourceID="week3" Style="margin-left: auto; margin-right: auto;" Visible="false">
                                    <ItemTemplate>
                                        Week:
                                        <asp:Label runat="server" ID="week2" Text='<%# Eval("week") %>'></asp:Label>
                                        Mon:
                                        <asp:Label runat="server" ID="Label1" Text='<%# Eval("mon") %>'></asp:Label>
                                        Tues:
                                        <asp:Label runat="server" ID="Label2" Text='<%# Eval("tues") %>'></asp:Label>
                                        Wed:
                                        <asp:Label runat="server" ID="Label3" Text='<%# Eval("wed") %>'></asp:Label>
                                        Thurs:
                                        <asp:Label runat="server" ID="Label4" Text='<%# Eval("thurs") %>'></asp:Label>
                                        Fri:
                                        <asp:Label runat="server" ID="Label5" Text='<%# Eval("fri") %>'></asp:Label>
                                        Sat:
                                        <asp:Label runat="server" ID="Label6" Text='<%# Eval("sat") %>'></asp:Label>
                                        Sun:
                                        <asp:Label runat="server" ID="Label7" Text='<%# Eval("sun") %>'></asp:Label>
                                        <asp:Literal ID="Literal" runat="server" Visible="false" OnDataBinding="TaskHourValues3_DataBinding"></asp:Literal>
                                    </ItemTemplate>
                                </asp:ListView>
                                <asp:TextBox ID="Total3" runat="server" Visible="false"></asp:TextBox>

                                <!-- RMU - SQL for listview week 4:-->
                                <asp:SqlDataSource ID="week4" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>'
                                    SelectCommand="SELECT * FROM SCRUM_SPRINT_TASK WHERE sprintID = @ID AND week = '4'">
                                    <SelectParameters>
                                        <asp:QueryStringParameter QueryStringField="sprintID" Name="ID" Type="Int32"></asp:QueryStringParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>

                                <%-- RMU: Listview week 4: --%>
                                <asp:ListView ID="TaskHourValues4" runat="server" DataSourceID="week4" Style="margin-left: auto; margin-right: auto;" Visible="false">
                                    <ItemTemplate>
                                        Week:
                                        <asp:Label runat="server" ID="week2" Text='<%# Eval("week") %>'></asp:Label><br />
                                        Mon:
                                        <asp:Label runat="server" ID="Label1" Text='<%# Eval("mon") %>'></asp:Label>
                                        Tues:
                                        <asp:Label runat="server" ID="Label2" Text='<%# Eval("tues") %>'></asp:Label>
                                        Wed:
                                        <asp:Label runat="server" ID="Label3" Text='<%# Eval("wed") %>'></asp:Label>
                                        Thurs:
                                        <asp:Label runat="server" ID="Label4" Text='<%# Eval("thurs") %>'></asp:Label>
                                        Fri:
                                        <asp:Label runat="server" ID="Label5" Text='<%# Eval("fri") %>'></asp:Label>
                                        Sat:
                                        <asp:Label runat="server" ID="Label6" Text='<%# Eval("sat") %>'></asp:Label>
                                        Sun:
                                        <asp:Label runat="server" ID="Label7" Text='<%# Eval("sun") %>'></asp:Label><br />
                                        <asp:Literal ID="Literal" runat="server" Visible="false" OnDataBinding="TaskHourValues4_DataBinding"></asp:Literal>
                                    </ItemTemplate>
                                </asp:ListView>
                                <asp:TextBox ID="Total4" runat="server" Visible="false"></asp:TextBox>


                                <!-- RMU: Chart Panel: -->
                                <asp:Panel ID="ChartPanel1" runat="server">

                                    <asp:SqlDataSource ID="projectDetails" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>'
                                        SelectCommand="SELECT * FROM SCRUM_PROJECT 
                            INNER JOIN SCRUM_USERS ON SCRUM_PROJECT.projectManager = SCRUM_USERS.userID
                            WHERE SCRUM_PROJECT.projectID = @ID">
                                        <SelectParameters>
                                            <asp:QueryStringParameter QueryStringField="projectID" Name="ID" Type="Int32"></asp:QueryStringParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>

                                    <asp:SqlDataSource ID="sprintDetails" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>'
                                        SelectCommand="SELECT * FROM SCRUM_SPRINT WHERE sprintID = @ID">
                                        <SelectParameters>
                                            <asp:QueryStringParameter QueryStringField="sprintID" Name="ID" Type="Int32"></asp:QueryStringParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>

                                    <asp:ListView ID="Title" runat="server" DataSourceID="projectDetails">
                                        <ItemTemplate>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("ProjectName") + " Burndown chart:" %>' Font-Size="Large" Font-Bold="true" Font-Underline="true" Style="margin-left: 10%;"></asp:Label>
                                        </ItemTemplate>
                                    </asp:ListView>

                                    <div id="proj" style="float: right; margin-right: 25%; width: 30%;">
                                        <asp:Label ID="Label13" runat="server" Text="Project & Sprint Details:" Font-Size="Large" Font-Bold="true" Font-Underline="true" Style="margin-left: 25%;"></asp:Label><br />
                                        <br />
                                        <asp:ListView ID="project" runat="server" DataSourceID="projectDetails">
                                            <ItemTemplate>

                                                <b>Project Name:</u></b>
                                                <asp:Label ID="Label8" runat="server" Text='<%# Eval("ProjectName") %>' Style="float: right;"></asp:Label><br />
                                                <b>Description:</b>
                                                <asp:Label ID="Label10" runat="server" Text='<%# Eval("ProjectDesc") %>' Style="float: right;"></asp:Label><br />
                                                <b>Date:</b>
                                                <asp:Label ID="Label16" runat="server" Text='<%# Eval("ProjectDate") %>' Style="float: right;"></asp:Label><br />
                                                <b>Project Manager:</b>
                                                <asp:Label ID="Label15" runat="server" Text='<%# Eval("lastName") %>' Style="float: right; margin-left: 5px;"></asp:Label>
                                                <asp:Label ID="Label14" runat="server" Text='<%# Eval("firstName") + " " %>' Style="float: right;"></asp:Label><br />
                                                <br />
                                            </ItemTemplate>
                                        </asp:ListView>

                                        <asp:ListView ID="sprint" runat="server" DataSourceID="sprintDetails">
                                            <ItemTemplate>

                                                <b>Sprint Identifier:</b>
                                                <asp:Label ID="Label8" runat="server" Text='<%# Eval("sprintID") %>' Style="float: right;"></asp:Label><br />
                                                <b>Working days:</b>
                                                <asp:Label ID="Label9" runat="server" Text='<%# Eval("sprintNoOfDays") + " Days" %>' Style="float: right;"></asp:Label><br />
                                                <b>Start date:</b>
                                                <asp:Label ID="Label11" runat="server" Text='<%# Eval("sprintStartDate") %>' Style="float: right;"></asp:Label><br />
                                                <b>End date:</b>
                                                <asp:Label ID="Label12" runat="server" Text='<%# Eval("sprintEndDate") %>' Style="float: right;"></asp:Label><br />

                                            </ItemTemplate>
                                        </asp:ListView>
                                    </div>


                                    <!-- RMU: Week 1 Chart: -->
                                    <asp:Chart ID="BurndownTaskHours" runat="server" Style="height: 500px; width: 500px;" AntiAliasing="Graphics">
                                        <Series>
                                            <asp:Series Name="TaskHoursSeries" ChartType="Area" Color="CadetBlue" IsValueShownAsLabel="true" YAxisType="Primary"></asp:Series>
                                        </Series>
                                        <ChartAreas>
                                            <asp:ChartArea Name="TaskHoursAreas" BackColor="GhostWhite" Area3DStyle-WallWidth="0"></asp:ChartArea>
                                        </ChartAreas>

                                    </asp:Chart>

                                    <!-- RMU: Week 2 Chart: -->
                                    <asp:Chart ID="BurndownTaskHours2" runat="server" Style="height: 500px; width: 500px;" AntiAliasing="Graphics">
                                        <Series>
                                            <asp:Series Name="TaskHoursSeries" ChartType="Area" Color="CadetBlue" IsValueShownAsLabel="true" YAxisType="Primary"></asp:Series>
                                        </Series>
                                        <ChartAreas>
                                            <asp:ChartArea Name="TaskHoursAreas" BackColor="GhostWhite" Area3DStyle-WallWidth="0"></asp:ChartArea>
                                        </ChartAreas>

                                    </asp:Chart>

                                    <!-- RMU: Week 3 Chart: -->
                                    <asp:Chart ID="BurndownTaskHours3" runat="server" Style="height: 500px; width: 500px;" AntiAliasing="Graphics">
                                        <Series>
                                            <asp:Series Name="TaskHoursSeries" ChartType="Area" Color="CadetBlue" IsValueShownAsLabel="true" YAxisType="Primary"></asp:Series>
                                        </Series>
                                        <ChartAreas>
                                            <asp:ChartArea Name="TaskHoursAreas" BackColor="GhostWhite" Area3DStyle-WallWidth="0"></asp:ChartArea>
                                        </ChartAreas>

                                    </asp:Chart>

                                    <!-- RMU: Week 4 Chart: -->
                                    <asp:Chart ID="BurndownTaskHours4" runat="server" Style="height: 500px; width: 500px;" AntiAliasing="Graphics">
                                        <Series>
                                            <asp:Series Name="TaskHoursSeries" ChartType="Area" Color="CadetBlue" IsValueShownAsLabel="true" YAxisType="Primary" Font="Calibri"></asp:Series>
                                        </Series>
                                        <ChartAreas>
                                            <asp:ChartArea Name="TaskHoursAreas" BackColor="GhostWhite" Area3DStyle-WallWidth="0"></asp:ChartArea>
                                        </ChartAreas>

                                    </asp:Chart>
                                </asp:Panel>


                            </div>
                        </div>



                    </div>
                    <!--/.col-->


                </div>
                <!--/.row-->
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
