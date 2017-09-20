<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SprintBacklog.aspx.cs" Inherits="addSprint" %>

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
                    <li><a href="sprints.aspx">
                        <svg class="glyph stroked home">
                            <use xlink:href="#stroked-home"></use></svg></a></li>
                    <li class="">Sprints</li>
                    <li class="ative">Add to Sprint Backlog</li>
                </ol>
            </div>
            <!--/.row-->

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Add to Sprint Backlog</h1>

                </div>
            </div>
            <!--/.row-->

            <div class="col-md-12">
                <div class="panel panel-default">


                    <%--RMU: Available Backlog Datasource
                            This selects everything from Backlog and Project tables where the Backlog (User Story) has not alreasy been added to the sprintbacklog table (already been added to sprint) --%>
                    <asp:SqlDataSource ID="AvailableBacklog" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>'
                        SelectCommand="SELECT SCRUM_BACKLOG.ID, SCRUM_BACKLOG.asUser, SCRUM_BACKLOG.iWant, SCRUM_BACKLOG.soThat, SCRUM_BACKLOG.estimatedTime, SCRUM_BACKLOG.runningTime, SCRUM_BACKLOG.completionTime, SCRUM_BACKLOG.priority, SCRUM_BACKLOG.value, SCRUM_BACKLOG.projectID, SCRUM_PROJECT.projectName 
                            FROM SCRUM_BACKLOG 
                            INNER JOIN SCRUM_PROJECT 
                            ON SCRUM_BACKLOG.projectID = SCRUM_PROJECT.projectID 
                            WHERE SCRUM_PROJECT.projectID = @ID
                            AND NOT EXISTS 
                            (SELECT * FROM SCRUM_SPRINTBACKLOG
                            WHERE SCRUM_BACKLOG.ID = SCRUM_SPRINTBACKLOG.backlogID)
                            ">

                        <SelectParameters>
                            <asp:QueryStringParameter QueryStringField="projectID" Name="ID" Type="Int32"></asp:QueryStringParameter>
                        </SelectParameters>

                    </asp:SqlDataSource>
                    <div class="panel-heading">
                        <svg class="glyph stroked open folder">
                            <use xlink:href="#stroked-open-folder"></use></svg>
                        <b>Available User Stories:</b></div>
                    <br />

                    <%-- Backlog Listview to view user stories:--%>
                    <asp:ListView ID="UserStories" runat="server" DataSourceID="AvailableBacklog">
                        <ItemTemplate>
                            <b>As: </b>
                            <asp:Label ID="asLabel" runat="server" Text='<%# Eval("asUser") %>' />
                            <b>I want: </b>
                            <asp:Label ID="iWantLabel" runat="server" Text='<%# Eval("iWant") %> ' />
                            <b>So That: </b>
                            <asp:Label ID="sothatLabel" runat="server" Text='<%# Eval("soThat") %>' /><br />

                            <%-- Add to backlog button:--%>
                            <br />
                            <asp:HyperLink ID="AddToBacklog" runat="server" Style="margin-left: 20px;" class="btn btn-primary" NavigateUrl='<%# "SprintBacklogAdd.aspx?backlogID=" + Eval("ID") + "&sprintID=" + Request.QueryString["sprintid"].ToString() + "&projectID=" + Request.QueryString["projectid"].ToString() %>'>Add to Sprint Backlog</asp:HyperLink><br />
                            <br />
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <asp:Label ID="Label1" runat="server" Text="There are no available User Stories for this sprint - they have all been added to the Sprint Backlog."></asp:Label><br />
                            <br />
                            <asp:Label ID="Label2" runat="server" Text="You can add more User Stories for this project via the "></asp:Label><asp:HyperLink ID="ProjectLink" NavigateUrl="~/SCRUM/projects.aspx" runat="server">Project Section.</asp:HyperLink>


                        </EmptyDataTemplate>
                    </asp:ListView>
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


</form>
</body>
</html>
