<%@ Page Language="C#" AutoEventWireup="true" CodeFile="planningPokerEst.aspx.cs" Inherits="planningPokerEst" %>

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
                            <b>User Story</b>
                        </div>
                        <div class="panel-body">


                            <%-- Author: SM   Edited by: JD and BL - Displays User Stories for each Project  --%>

                            <asp:SqlDataSource ID="backlog" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>'
                                SelectCommand="SELECT * FROM SCRUM_BACKLOG INNER JOIN SCRUM_STORYOPTIONS ON SCRUM_BACKLOG.options = SCRUM_STORYOPTIONS.optionID
                        WHERE SCRUM_BACKLOG.ID = 
                        @backlogID">


                                <SelectParameters>
                                    <asp:QueryStringParameter QueryStringField="backlogID" Name="backlogID" Type="Int32"></asp:QueryStringParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>



                            <%--Author: SM   Edited by: JD and BL - Listview display of User Story's Attributes for that specific task  --%>

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
          <br />

                                </ItemTemplate>

                            </asp:ListView>
                            



                        </div>
                    </div>

                    <%--Author: JD and BL - Panel to contain the poker planning user input options and instructions  --%>

                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class=" text-center">
                                Planning Poker Instructions
                            </div>
                        </div>
                        <div class="panel-body">
                            <p>In order to provide a story point estimation for the user story seen above, please select your name from the drop-down menu. After you have selected your name choose the value/difficulty from the second dropdown-menu. Once you have selected both your name and your value, please give a brief description as to why you have decided upon this estimation in the text box which is provided. When you are happy with your estimation and explanation click on the "submit" button to submit your valuation. </p>

                            <%--Author: JD and BL - Datasource to display the usernames of sprint team members in a dropdown --%>

                            <asp:SqlDataSource ID="listTeamMembers" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT SCRUM_TEAM.teamID, SCRUM_TEAM.projectID, SCRUM_TEAM.userID, SCRUM_TEAM.roleID, SCRUM_PROJECT.projectName, SCRUM_USERS.firstName, SCRUM_USERS.lastName, SCRUM_USERS.email, SCRUM_ROLE.roleTitle, SCRUM_USERS.imagepath 
                            FROM SCRUM_TEAM 
                            INNER JOIN SCRUM_USERS ON SCRUM_TEAM.userID = SCRUM_USERS.userID 
                            INNER JOIN SCRUM_PROJECT ON SCRUM_TEAM.projectID = SCRUM_PROJECT.projectID 
                            INNER JOIN SCRUM_ROLE ON SCRUM_TEAM.roleID = SCRUM_ROLE.roleID 
                            WHERE SCRUM_TEAM.projectID = @ID AND SCRUM_TEAM.sprintMember = 'True'
                              AND NOT EXISTS 
                            (SELECT * FROM SCRUM_PLANING_POKER
                            WHERE SCRUM_PLANING_POKER.name = SCRUM_TEAM.userID AND SCRUM_PLANING_POKER.backlogID = @backlogID AND SCRUM_PLANING_POKER.sprintID = @sprintID   ) ">




                                <SelectParameters>
                                    <asp:QueryStringParameter QueryStringField="projectID" Name="ID" Type="Int32"></asp:QueryStringParameter>
                                    <asp:QueryStringParameter QueryStringField="backlogID" Name="backlogID" Type="Int32"></asp:QueryStringParameter>
                                    <asp:QueryStringParameter QueryStringField="sprintID" Name="sprintID" Type="Int32"></asp:QueryStringParameter>
                                    <asp:SessionParameter Name="userid" SessionField="userid" />
                                </SelectParameters>

                            </asp:SqlDataSource>

                            <%--Author: JD and BL - Datascource used to display available story point options in a dropdown menu --%>
                            <asp:SqlDataSource ID="storydropdown" runat="server" ConnectionString='<%$ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SCRUM_STORYOPTIONS"></asp:SqlDataSource>

                            <div class="col-sm-10">

                                <asp:Label ID="teamMembersLabel" runat="server" Text="Your Name"></asp:Label>
                                <asp:DropDownList ID="teamMembers" runat="server" CssClass="form-control" Style="width: 120px;" DataSourceID="listTeamMembers" DataTextField="firstName" DataValueField="userID"></asp:DropDownList>
                                <br />
                                <br />
                            </div>

                            <div class="col-sm-10">

                                <asp:Label ID="PokerValueLabel" runat="server" Text="Poker Value"></asp:Label>
                                <asp:DropDownList ID="pokerValue" runat="server" CssClass="form-control" DataSourceID="storydropdown" DataTextField="point" DataValueField="point">
                                </asp:DropDownList>
                                <br />
                                <br />

                                <asp:Label ID="DescLabel" runat="server" Text="Description"></asp:Label>
                                <asp:TextBox ID="description" runat="server" CssClass="form-control" TextMode="MultiLine" Width="1460px"></asp:TextBox>
                                <br />
                                <br />
                            </div>
                        </div>

                        <%--Author: JD and BL - Button to submit selected user inputs  --%>
                        <asp:Button ID="InsertPokerBTN" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="InsertPokerBTN_Click" />

                        <asp:Label ID="status" runat="server" Text=""></asp:Label>

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
