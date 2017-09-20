<%@ Page Language="C#" AutoEventWireup="true" CodeFile="viewTask.aspx.cs" Inherits="viewTask" %>

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
                        <use xlink:href="#stroked-home"></use></svg>Dashboard</a></li>
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


            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <svg class="glyph stroked open folder">
                            <use xlink:href="#stroked-open-folder"></use></svg>
                        <b>User Story</b></div>
                    <div class="panel-body">


                        <%-- SM - Displays User Stories for each Project  --%>

                        <asp:SqlDataSource ID="backlog" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>'
                            SelectCommand="SELECT * FROM SCRUM_BACKLOG INNER JOIN SCRUM_STORYOPTIONS ON SCRUM_BACKLOG.options = SCRUM_STORYOPTIONS.optionID
                        WHERE SCRUM_BACKLOG.ID = 
                        @backlogID">


                            <SelectParameters>
                                <asp:QueryStringParameter QueryStringField="backlogID" Name="backlogID" Type="Int32"></asp:QueryStringParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>



                        <%-- SM - Displays User Story's Attributes for each Project  --%>

                        <asp:ListView ID="TaskListView" runat="server" DataSourceID="backlog">

                            <ItemTemplate>

                                <b>As a</b>
                                <i>
                                    <asp:Label ID="As" runat="server" Text='<%# Eval("asUser") %>' /></i>
                                &nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp;
          <b>I want: </b>
                                <i>
                                    <asp:Label ID="Iwant" runat="server" Text='<%# Eval("iWant") %> ' /></i>
                                &nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp;
          <b>So That</b>
                                <i>
                                    <asp:Label ID="soThat" runat="server" Text='<%# Eval("soThat") %> ' /></i>
                                &nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp;
          <b>Value: </b>
                                <i>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("value") %> ' /></i>
                                &nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp;
          <b>Story Point:</b>
                                <i>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("point") %> ' /></i>
                                <br />
                                <br />

                            </ItemTemplate>

                        </asp:ListView>
                        <hr style="margin-top: 0px;" />
                        <%-- SM - Displays ASSIGNED Task Details for each User Story --%>



                        <asp:SqlDataSource ID="readfromsprinttask" runat="server" ConnectionString='<%$ConnectionStrings:dbconnect %>'
                            SelectCommand="SELECT * FROM SCRUM_SPRINT_TASK 
                    INNER JOIN SCRUM_USERS ON SCRUM_SPRINT_TASK.userID = SCRUM_USERS.userID 
                    WHERE SCRUM_SPRINT_TASK.backlogID = @ID AND SCRUM_SPRINT_TASK.sprintID = @sprint AND SCRUM_SPRINT_TASK.week = @week">

                            <SelectParameters>
                                <asp:QueryStringParameter QueryStringField="backlogID" Name="ID" Type="Int32"></asp:QueryStringParameter>
                                <asp:QueryStringParameter QueryStringField="sprintID" Name="sprint" Type="Int32"></asp:QueryStringParameter>
                                <asp:QueryStringParameter QueryStringField="weekID" Name="week" Type="String"></asp:QueryStringParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>

                        <h3 style="margin-top: 0px;">Assigned Tasks</h3>
                        <br />
                        <asp:ListView ID="sprinttask" runat="server" DataSourceID="readfromsprinttask">
                            <EmptyDataTemplate><i>No Tasks Added</i></EmptyDataTemplate>
                            <ItemTemplate>

                                <b><i>Task:</i></b>
                                <asp:Label ID="As" runat="server" Text='<%# Eval("taskDetails") %>' />
                                &nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;
            
            <b><i>Assigned to:</i></b>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("firstName") %>' />
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("lastName") %>' />
                                &nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;

             

                        <br />
                                <br />

                                <b>Week: </b>
                                <asp:Label ID="weekBox" Text='<%# Eval ("week") %>' runat="server" Style="width: 30px;"></asp:Label>
                                &nbsp;||&nbsp;
                               <b>Est Time:</b>
                                <asp:Label ID="esttimeBox" Text='<%# Eval ("estTime") %>' runat="server" Style="width: 30px;"></asp:Label>
                                &nbsp;||&nbsp;
                               <b>Monday:</b>
                                <asp:Label ID="monLabel" Text='<%# Eval ("mon") %>' runat="server" Style="width: 30px;"></asp:Label>
                                &nbsp;||&nbsp;
                               <b>Tuesday:</b>
                                <asp:Label ID="tuesLabel" Text='<%# Eval ("tues") %>' runat="server" Style="width: 30px;"></asp:Label>
                                &nbsp;||&nbsp;
                      <b>Wednesday:</b>
                                <asp:Label ID="wedLabel" Text='<%# Eval ("wed") %>' runat="server" Style="width: 30px;"></asp:Label>
                                &nbsp;||&nbsp;
                        <b>Thursday:</b>
                                <asp:Label ID="thursLabel" Text='<%# Eval ("thurs") %>' runat="server" Style="width: 30px;"></asp:Label>
                                &nbsp;||&nbsp;
                        <b>Friday:</b>
                                <asp:Label ID="friLabel" Text='<%# Eval ("fri") %>' runat="server" Style="width: 30px;"></asp:Label>
                                &nbsp;||&nbsp;
                       <b>Saturday:</b>
                                <asp:Label ID="satLabel" Text='<%# Eval ("sat") %>' runat="server" Style="width: 30px;"></asp:Label>
                                &nbsp;||&nbsp;
                      <b>Sunday:</b>
                                <asp:Label ID="sunLabel" Text='<%# Eval ("sun") %>' runat="server" Style="width: 30px;"></asp:Label>
                                <asp:HyperLink ID="taskLink" Text="Update Hours" runat="server" class="btn btn-primary"
                                    NavigateUrl='<%# "viewTaskHours.aspx?taskID="+Eval("taskID")%>'></asp:HyperLink>

                                <br />
                                <asp:HyperLink ID="blocked" Text="" runat="server" class="btn btn-danger"
                                    NavigateUrl='<%# "blockedTask.aspx?taskID="+Eval("taskID")+"&SprintID="+Request.QueryString["sprintID"]+"&ProjectID="+Request.QueryString["projectID"]+"&backlogID="+Request.QueryString["backlogID"]+"&weekID="+Request.QueryString["weekID"]+"&userID="+Eval("userID")%>'>Blocked</asp:HyperLink>

                                <!-- SM Set to UnBlock -->
                                <asp:HyperLink ID="unblocked" Text="" runat="server" class="btn btn-primary" Style="background-color: #32CD32; border-color: #32CD32"
                                    NavigateUrl='<%# "unblockTask.aspx?taskID="+Eval("taskID")+"&SprintID="+Request.QueryString["sprintID"]+"&ProjectID="+Request.QueryString["projectID"]+"&backlogID="+Request.QueryString["backlogID"]+"&weekID="+Request.QueryString["weekID"]%>'>Unblock</asp:HyperLink>
                                <br />
                                <i>Reason for block: </i>
                                <asp:Label ID="blockedDescription" runat="server" Text='<%# Eval("blockedDescription") %> ' />
                                <br />
                                <br />
                                <br />
                                <br />
                                <!-- SM Set to Block -->

                                <hr />

                            </ItemTemplate>

                        </asp:ListView>



                        <%-- SM - Displays ****UNASSIGNED**** Task Details for each User Story --%>


                        <asp:SqlDataSource ID="unassigned" runat="server" ConnectionString='<%$ConnectionStrings:dbconnect %>'
                            SelectCommand="SELECT SCRUM_SPRINT_TASK.taskID, SCRUM_SPRINT_TASK.taskDetails, SCRUM_SPRINT_TASK.estTime, SCRUM_SPRINT_TASK.blockedDescription 
                FROM SCRUM_SPRINT_TASK 
                WHERE SCRUM_SPRINT_TASK.backlogID = @ID AND SCRUM_SPRINT_TASK.userID = '0' AND SCRUM_SPRINT_TASK.sprintID = @sprint">

                            <SelectParameters>
                                <asp:QueryStringParameter QueryStringField="backlogID" Name="ID" Type="Int32"></asp:QueryStringParameter>
                                <asp:QueryStringParameter QueryStringField="sprintID" Name="sprint" Type="Int32"></asp:QueryStringParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <h3>Unassigned Tasks</h3>
                        <asp:ListView ID="ListView1" runat="server" DataSourceID="unassigned">
                            <EmptyDataTemplate><i>No Tasks Added</i></EmptyDataTemplate>
                            <ItemTemplate>


                                <b><i>Task:</i></b>
                                <asp:Label ID="As" runat="server" Text='<%# Eval("taskDetails") %>' />

                                <br />

                            </ItemTemplate>

                        </asp:ListView>
                        <asp:Button ID="addBtn" runat="server" Text="Assign Tasks" Style="float: right; margin-right: 5px;" CssClass="btn btn-primary" OnClick="addBtn_Click" />
                    </div>
                    <%--RMU: This SQL is used for the page's buttons carrying URL's - Add Developers, Add User Stories and Assign Tasks--%>
                </div>

            </div>
        </div>
        </div>
				
			<!--/.col-->


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
