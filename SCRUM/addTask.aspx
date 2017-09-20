<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addTask.aspx.cs" Inherits="addTask1" %>

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
                        <use xlink:href="#stroked-home"></use></svg>Home</a></li>
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
                        <svg class="glyph stroked open folder">
                            <use xlink:href="#stroked-open-folder"></use></svg></a></li>
                    <li class="active">View a different project</li>
                </ol>
            </div>
            <!--/.row-->

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Projects</h1>
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
                                <svg class="glyph stroked clipboard with paper">
                                    <use xlink:href="#stroked-clipboard-with-paper"></use></svg>
                            </div>
                            <div class="col-sm-9 col-lg-7 widget-right">
                                <div class="large"><a href="projects.aspx">Projects</a></div>
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
                                <div class="large"><a href="CreateTeam.aspx">Teams</a></div>
                                <div class="text-muted"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-md-6 col-lg-3">
                    <div class="panel panel-red panel-widget">
                        <div class="row no-padding">
                            <div class="col-sm-3 col-lg-5 widget-left">
                                <svg class="glyph stroked app-window-with-content">
                                    <use xlink:href="#stroked-app-window-with-content"></use></svg>
                            </div>
                            <div class="col-sm-9 col-lg-7 widget-right">
                                <div class="large"><a href="burndown.aspx">Burndown</a></div>
                                <div class="text-muted"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--/.row-->



            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <svg class="glyph stroked male user">
                                <use xlink:href="#stroked-male-user"></use></svg><b><i>Add a Task below: </i></b>
                        </div>
                        <div class="panel-body">






                            <br />

                            <%-- SM - Displays User Stories for each Project  --%>

                            <asp:SqlDataSource ID="backlog" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>'
                                SelectCommand="SELECT * FROM SCRUM_BACKLOG WHERE SCRUM_BACKLOG.ID = @backlogID">


                                <SelectParameters>
                                    <asp:QueryStringParameter QueryStringField="backlogID" Name="backlogID" Type="Int32"></asp:QueryStringParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>



                            <%-- SM - Displays User Story's Attributes for each Project  --%>

                            <asp:ListView ID="USListView" runat="server" DataSourceID="backlog">

                                <ItemTemplate>
                                    <b><i>User Story</i></b>
                                    <br />
                                    As a
          <asp:Label ID="As" runat="server" Text='<%# Eval("asUser") %>' />
                                    &nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp;
          <b>I want: </b>
                                    <asp:Label ID="Iwant" runat="server" Text='<%# Eval("iWant") %> ' />
                                    &nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp;
          <b>So That</b>
                                    <asp:Label ID="soThat" runat="server" Text='<%# Eval("soThat") %> ' />
                                    &nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp;
          <b>Value: </b>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("value") %> ' />
                                    <br />
                                    <br />


                                </ItemTemplate>

                            </asp:ListView>

                            <%-- SM - Enter Task  --%>


                            <label for="taskdetails" style="float: left; margin-left: 10px">Enter Task Details</label>


                            <asp:TextBox ID="task" runat="server" CssClass="form-control"></asp:TextBox>



                            <%-- JD - Enter Time Estimate --%>
                            <br />
                            <label for="estimatedTime" style="float: left; margin-left: 10px">Estimated Time To Complete Task (Hours)</label>


                            <asp:TextBox ID="estimatedTime" runat="server" CssClass="form-control"></asp:TextBox>


                            <%-- SM - Add Week Options  --%>


                            <br />
                            <asp:Label ID="Label1" Style="float: left; margin-left: 10px; margin-right: 10px;" runat="server" Text="Week: " Font-Bold="true"></asp:Label>


                            <asp:DropDownList ID="weekdropdown" runat="server">

                                <asp:ListItem Text="Week 1" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Week 2" Value="2"></asp:ListItem>
                                <asp:ListItem Text="Week 3" Value="3"></asp:ListItem>
                                <asp:ListItem Text="Week 4" Value="4"></asp:ListItem>



                            </asp:DropDownList>



                            <br />
                            <br />


                            <%-- SM - Add Task Button  --%>


                            <asp:Button ID="taskButton" runat="server" Text="Add Task" OnClick="addTask_OnClick" CssClass="btn-btn btn-primary" />

                            <asp:Label ID="addedLabel" runat="server" Text=""></asp:Label>


                            <asp:SqlDataSource ID="readfromproject1" runat="server" ConnectionString='<%$ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SCRUM_SPRINT_TASK INNER JOIN SCRUM_BACKLOG ON SCRUM_BACKLOG.ID = SCRUM_SPRINT_TASK.backlogID">


                                <SelectParameters>
                                    <asp:QueryStringParameter QueryStringField="projectID" Name="ID" Type="Int32"></asp:QueryStringParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <div>
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
