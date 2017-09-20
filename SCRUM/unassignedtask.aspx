<%@ Page Language="C#" AutoEventWireup="true" CodeFile="unassignedtask.aspx.cs" Inherits="unassignedtask" %>

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
                            <svg class="glyph stroked open folder">
                                <use xlink:href="#stroked-open-folder"></use></svg>
                            <b>Sprint Details</b></div>
                        <div class="panel-body">


                            <asp:SqlDataSource ID="ListProjects" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SCRUM_PROJECT INNER JOIN SCRUM_TEAM ON SCRUM_TEAM.projectID = SCRUM_PROJECT.projectID WHERE SCRUM_TEAM.userID = @userid">


                                <SelectParameters>

                                    <asp:SessionParameter Name="userid" SessionField="userid" Type="string" />

                                </SelectParameters>

                            </asp:SqlDataSource>

                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <svg class="glyph stroked male user">
                                        <use xlink:href="#stroked-male-user"></use></svg><b><i>Select an Unassigned Task below: </i></b></div>

                                <br />

                                <%-- SM - Displays Unassigned Tasks for each Project  --%>

                                <asp:SqlDataSource ID="unassign" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>'
                                    SelectCommand="SELECT SCRUM_BACKLOG.ID, SCRUM_BACKLOG.asUser, SCRUM_BACKLOG.iWant, SCRUM_BACKLOG.soThat, SCRUM_BACKLOG.priority, SCRUM_BACKLOG.value, SCRUM_SPRINT_TASK.taskDetails, SCRUM_SPRINT_TASK.taskID
                FROM SCRUM_BACKLOG 
                INNER JOIN SCRUM_SPRINTBACKLOG ON SCRUM_BACKLOG.ID = SCRUM_SPRINTBACKLOG.backlogID 
                INNER JOIN SCRUM_SPRINT_TASK ON SCRUM_BACKLOG.ID = SCRUM_SPRINT_TASK.backlogID
                WHERE (SCRUM_SPRINT_TASK.userID =@Uid) AND (SCRUM_SPRINT_TASK.sprintID=@sid)">

                                    <SelectParameters>
                                        <asp:QueryStringParameter QueryStringField="projectID" Name="ID" Type="Int32"></asp:QueryStringParameter>
                                        <asp:QueryStringParameter QueryStringField="userID" Name="Uid" Type="Int32"></asp:QueryStringParameter>
                                        <asp:QueryStringParameter QueryStringField="SprintID" Name="sid" Type="Int32"></asp:QueryStringParameter>

                                    </SelectParameters>
                                </asp:SqlDataSource>



                                <%-- SM - Displays Unassigned Task Attributes for each Project  --%>

                                <asp:ListView ID="ListView1" runat="server" DataSourceID="unassign">

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
                                        <b>Unassigned Task: </b>
                                        <br />
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("taskDetails") %> ' />
                                        <br />
                                        <br />





                                        <%-- SM - Assign To Me Button  --%>

                                        <asp:HyperLink ID="AssignToMe" Text="Assign To Me" runat="server" Style="margin-left: 20px;" class="btn btn-primary"
                                            NavigateUrl='<%# "unassignedTaskAddUpdate.aspx?userID=0&backlogID=" + Eval("ID")+"&taskID="+Eval("taskID")+"&projectID="+
                    Request.QueryString["projectid"].ToString() + "&SprintID=" + Request.QueryString["sprintID"].ToString()  %>'>Assign</asp:HyperLink>
                                        <br />
                                        <br />

                                    </ItemTemplate>

                                </asp:ListView>





                            </div>
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
