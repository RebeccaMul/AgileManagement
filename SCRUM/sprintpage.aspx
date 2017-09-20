<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sprintpage.aspx.cs" Inherits="projectlist" %>

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
                    <li><a href="sprints.aspx">
                        <svg class="glyph stroked open folder">
                            <use xlink:href="#stroked-open-folder"></use></svg></a></li>
                    <li class="active">View a different project</li>
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
                                <div class="large"><a href="teams.aspx">Teams</a></div>
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
                                <use xlink:href="#stroked-male-user"></use>
                            </svg><b>Team Members</b>

                            <%-- Add Developers Button in Team Section/Panel:--%>
                            <asp:ListView ID="AddDevelopersBtn" runat="server" DataSourceID="backlogsource">
                                <ItemTemplate>

                                    <asp:HyperLink ID="AddDevelopers" runat="server" Style="float: right; margin-right: 10px; margin-top: 5px;" class="btn btn-primary" NavigateUrl='<%# "sprintdevelopers.aspx?projectID=" + Request.QueryString["projectid"].ToString() + "&sprintID=" + Request.QueryString["sprintid"].ToString() %>'>Add Developers</asp:HyperLink>

                                </ItemTemplate>
                            </asp:ListView>

                        </div>
                        <div class="panel-body">

                            <!-- BL - Listing the team members SQL -->
                            <asp:SqlDataSource ID="listTeamMembers" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT SCRUM_TEAM.teamID, SCRUM_TEAM.projectID, SCRUM_TEAM.userID, SCRUM_TEAM.roleID, SCRUM_PROJECT.projectName, SCRUM_USERS.firstName, SCRUM_USERS.lastName, SCRUM_USERS.email, SCRUM_ROLE.roleTitle, SCRUM_USERS.imagepath 
                            FROM SCRUM_TEAM 
                            INNER JOIN SCRUM_USERS ON SCRUM_TEAM.userID = SCRUM_USERS.userID 
                            INNER JOIN SCRUM_PROJECT ON SCRUM_TEAM.projectID = SCRUM_PROJECT.projectID 
                            INNER JOIN SCRUM_ROLE ON SCRUM_TEAM.roleID = SCRUM_ROLE.roleID 
                            WHERE (SCRUM_TEAM.projectID = @ID AND SCRUM_TEAM.sprintMember = 'True')">

                                <SelectParameters>
                                    <asp:QueryStringParameter QueryStringField="projectID" Name="ID" Type="Int32"></asp:QueryStringParameter>
                                </SelectParameters>

                            </asp:SqlDataSource>



                            <%-- RMU - SQL for blocked tasks  --%>
                            <asp:SqlDataSource ID="blockedTasks" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>'
                                SelectCommand="SELECT * FROM SCRUM_SPRINT_TASK 
                            WHERE blocked='True' AND sprintID=@ID">
                                <SelectParameters>
                                    <asp:QueryStringParameter QueryStringField="sprintID" Name="ID" Type="Int32"></asp:QueryStringParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>

                            <%-- RMU - Blocked Task section  --%>
                            <asp:Panel ID="BlockList" runat="server">
                                <div id="blockedlist" style="float: right; margin-right: 5%; margin-left: 5%; width: 30%">
                                    <asp:Label ID="blockedTitle" runat="server" Text="Currently blocked tasks:" Font-Size="Medium" ForeColor="Red" Font-Underline="true" Style="margin-right: 20%; margin-left: 20%"></asp:Label><br />
                                    <br />

                                    <%-- RMU - Listview for list of blocked tasks --%>
                                    <asp:ListView ID="displayBlocked" runat="server" DataSourceID="blockedTasks">
                                        <ItemTemplate>


                                            <b>Task: </b>
                                            <asp:Label ID="taskDetails" runat="server" Text='<%# " " + Eval("taskDetails") %>' Style="margin-top: 5px; padding-top: 5px;"></asp:Label><br />
                                            <b>Description: </b>
                                            <asp:Label ID="Label2" runat="server" Text='<%# " " + Eval("blockedDescription") %>' Style="margin-top: 5px; padding-top: 5px;"></asp:Label>

                                            <asp:HyperLink ID="unblocked" Text="" runat="server" class="btn btn-primary" Style="background-color: #32CD32; border-color: #32CD32; float: right; margin-bottom: 20px;"
                                                NavigateUrl='<%# "unblockTask2.aspx?taskID="+Eval("taskID")+"&SprintID="+Request.QueryString["sprintID"]+"&ProjectID="+Request.QueryString["projectID"]+"&backlogID="+Request.QueryString["backlogID"]+"&weekID="+Request.QueryString["weekID"]%>'>Unblock</asp:HyperLink><br />
                                            <br />
                                        </ItemTemplate>

                                        <EmptyDataTemplate>

                                            <asp:Label ID="EmptyList" runat="server" Text="There are no blocked tasks on the current sprint backlog." Style=""></asp:Label>
                                        </EmptyDataTemplate>
                                    </asp:ListView>

                                </div>
                            </asp:Panel>

                            <!--BL -Displaying the team members via a listview-->

                            <asp:ListView ID="ListView3" runat="server" DataSourceID="listTeamMembers" Style="margin-left: auto; margin-right: auto;">

                                <ItemTemplate>

                                    <ul class="todo-list">
                                        <li class="todo-list-item" style="padding: 10px;">
                                            <div class="checkbox">
                                                <label for="checkbox">
                                                    <asp:Image ID="image" runat="server" Style="width: 50px; height: 50px" ImageUrl='<%# Eval("imagepath")  %>' />
                                                    <b>
                                                        <asp:Label Text='<%# Eval("firstName") %> ' runat="server" ID="firstNameLabel" />
                                                        <asp:Label Text='<%# Eval("lastName") %>' runat="server" ID="lastNameLabel" /></label></b> 
                                    -
                                                <asp:Label Text='<%# Eval("roleTitle") %> ' runat="server" ID="Label1" />
                                        </li>
                                    </ul>

                                </ItemTemplate>
                            </asp:ListView>





                        </div>
                    </div>


                    <%-- Sprint Backlog Section: --%>
                    <div class="panel panel-default chat">
                        <div class="panel-heading" id="accordion">
                            <svg class="glyph stroked two-messages">
                                <use xlink:href="#stroked-app-window-with-content"></use></svg><b> Sprint Backlog</b>

                            <%--RMU: This SQL is used for the page's buttons carrying URL's - Add Developers, Add User Stories and Assign Tasks--%>
                            <asp:SqlDataSource ID="backlogsource" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT *
                    FROM SCRUM_SPRINT 
                    WHERE (SCRUM_SPRINT.project = @id) AND (SCRUM_SPRINT.sprintID = @sID)">
                                <SelectParameters>
                                    <asp:QueryStringParameter QueryStringField="projectID" Name="ID" Type="Int32"></asp:QueryStringParameter>
                                    <asp:QueryStringParameter QueryStringField="sprintID" Name="sID" Type="Int32"></asp:QueryStringParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>

                            <%-- RMU: Sprint Backlog Buttons: Add User Stories & Assign Tasks --%>

                            <asp:ListView ID="AddButtons" runat="server" DataSourceID="backlogsource">
                                <ItemTemplate>

                                    <asp:HyperLink ID="AddMemberLink" runat="server" Style="float: right; margin-left: 10px; margin-top: 5px;" class="btn btn-primary" NavigateUrl='<%# "unassignedtask.aspx?UserID=0&projectID=" + Request.QueryString["projectid"].ToString() + "&SprintID=" + Request.QueryString["sprintID"].ToString() %>'>Assign Tasks</asp:HyperLink>

                                    <asp:HyperLink ID="SprintBacklog" runat="server" Style="float: right; margin-top: 5px;" class="btn btn-primary" NavigateUrl='<%#"sprintBacklog.aspx?sprintID=" + Request.QueryString["sprintID"].ToString() + "&projectID=" + Request.QueryString["projectid"].ToString() %>'>Add User Stories</asp:HyperLink>

                                </ItemTemplate>
                            </asp:ListView>

                        </div>

                        <div class="panel-body">

                            <!--BL -Displaying the backlog via listview in grid form, zero formatting -->
                            <asp:ListView ID="diaplayMembers" runat="server" DataSourceID="readfrombacklog">

                                <EmptyDataTemplate>
                                    <table runat="server" style="">
                                        <tr>
                                            <td>No Backlog Available for this Sprint.</td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>

                                <ItemTemplate>

                                    <tr style="">
                                        <td>
                                            <asp:Label Text='<%# Eval("asUser") %>' runat="server" ID="asUserLabel" /></td>
                                        <td>
                                            <asp:Label Text='<%# Eval("iWant") %>' runat="server" ID="iWantLabel" /></td>
                                        <td>
                                            <asp:Label Text='<%# Eval("soThat") %>' runat="server" ID="soThatLabel" /></td>
                                        <td>
                                            <asp:Label Text='<%# Eval("value") %>' runat="server" ID="valueLabel" /></td>
                                        <td style="padding-right: 100px;">
                                            <asp:Label Text='<%# Eval("point") %>' runat="server" ID="pointLabel" /></td>

                                        <!-- JD Removal of the add estimate button as it has been relocated on the add task page. The addTaskEst.aspx is no longer required.  <asp:HyperLink ID="AddEstTime" runat="server" class="btn btn-primary" style="margin-right:2px;" NavigateUrl='<%# "~/Scrum/AddTaskEst.aspx?projectID="+ Request.QueryString["projectid"].ToString()+"&sprintID="+ Request.QueryString["sprintID"].ToString()+"&backlogID="+Eval("backlogID")%>'>Add Estimate</asp:HyperLink> </td></td>
                               
                                    <!-- SM - add task -->
                                        <td>
                                            <asp:HyperLink ID="AddTask" runat="server" Style="margin-right: 5px; margin-bottom: 5px;" class="btn btn-primary" NavigateUrl='<%# "addTask.aspx?projectID=" + Request.QueryString["projectid"].ToString()+"&backlogID="+Eval("backlogID") + "&SprintID=" + Request.QueryString["sprintID"].ToString()%>'>Add Task</asp:HyperLink>
                                        </td>

                                        <!-- SM - view Task -->
                                        <td>
                                            <asp:HyperLink ID="viewtask" runat="server" Style="margin-right: 5px; margin-bottom: 5px;" class="btn btn-primary" NavigateUrl='<%# "viewTaskHome.aspx?&projectID=" + Request.QueryString["projectid"].ToString()+"&backlogID="+Eval("backlogID") + "&SprintID=" + Request.QueryString["sprintID"].ToString()%>'>View Task</asp:HyperLink>
                                        </td>
                                        <td>

                                            <!-- JD & BL - Planning Poker Link -->
                                            <asp:HyperLink ID="planningPoker" runat="server" Style="margin-right: 5px; margin-bottom: 5px;" class="btn btn-primary" NavigateUrl='<%# "planningPokerEst.aspx?&projectID=" + Request.QueryString["projectid"].ToString()+"&backlogID="+Eval("backlogID") + "&SprintID=" + Request.QueryString["sprintID"].ToString()%>'>Estimate Planning Poker</asp:HyperLink>
                                        </td>
                                        <td>

                                            <!-- JD & BL - Link for scrum master to set the story points -->
                                            <asp:HyperLink ID="setPlanningPoker" runat="server" Style="margin-right: 5px; margin-bottom: 5px;" class="btn btn-primary" NavigateUrl='<%# "pokerPlanning.aspx?&projectID=" + Request.QueryString["projectid"].ToString()+"&backlogID="+Eval("backlogID") + "&SprintID=" + Request.QueryString["sprintID"].ToString()%>'>Conduct Planning Poker</asp:HyperLink>
                                        </td>
                                    </tr>

                                </ItemTemplate>
                                <LayoutTemplate>
                                    <table runat="server">
                                        <tr runat="server">
                                            <td runat="server">
                                                <table runat="server" id="itemPlaceholderContainer" style="width: 100%; margin-bottom: 15px;" border="0">
                                                    <tr runat="server" style="">
                                                        <th runat="server" style="width: 15%; margin-right: 10px;">As User </th>
                                                        <th runat="server" style="width: 50%; margin-right: 10px;">I want </th>
                                                        <th runat="server" style="width: 30%; margin-right: 10px;">So that </th>
                                                        <th runat="server" style="width: 30%; margin-right: 10px;">Value</th>
                                                        <th runat="server" style="width: 30%; margin-right: 10px;">Story Point</th>
                                                        <th runat="server"></th>
                                                        <th runat="server"></th>

                                                    </tr>
                                                    <tr runat="server" id="itemPlaceholder"></tr>
                                                </table>
                                            </td>
                                        </tr>

                                    </table>
                                </LayoutTemplate>

                            </asp:ListView>

                            <!--Listing the sprint backlog SQL-->
                            <asp:SqlDataSource ID="readfrombacklog" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT SCRUM_BACKLOG.iWant, SCRUM_BACKLOG.soThat, SCRUM_BACKLOG.priority, SCRUM_BACKLOG.value, SCRUM_BACKLOG.asUser, SCRUM_SPRINTBACKLOG.backlogID, SCRUM_STORYOPTIONS.point
                        FROM SCRUM_BACKLOG INNER JOIN SCRUM_STORYOPTIONS ON SCRUM_BACKLOG.options = SCRUM_STORYOPTIONS.optionID
                        INNER JOIN SCRUM_SPRINTBACKLOG ON SCRUM_BACKLOG.ID = SCRUM_SPRINTBACKLOG.backlogID
                        WHERE (SCRUM_SPRINTBACKLOG.sprintID = @ID)">
                                <SelectParameters>
                                    <asp:QueryStringParameter QueryStringField="sprintID" Name="ID" Type="Int32"></asp:QueryStringParameter>
                                    <asp:QueryStringParameter QueryStringField="projectID" Name="PID" Type="Int32"></asp:QueryStringParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>



                            <div class="col-md-12">

                                <asp:SqlDataSource ID="SprintDetails" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM [SCRUM_SPRINT] WHERE projectID = @id">
                                    <SelectParameters>
                                        <asp:QueryStringParameter QueryStringField="projectID" Name="ID" Type="Int32"></asp:QueryStringParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>


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
