<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sprintDevelopers.aspx.cs" Inherits="addSprint" %>

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
                    <h1 class="page-header">Add Developers</h1>

                </div>
            </div>
            <!--/.row-->
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">

                        <div class="panel-body">

                            <%--Available Backlog Datasource--%>
                            <asp:SqlDataSource ID="UserDetails" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SCRUM_USERS WHERE 
                ([skillset] LIKE '%' + @skill + '%') ">

                                <SelectParameters>
                                    <asp:QueryStringParameter QueryStringField="searchquery" Name="skill" Type="String"></asp:QueryStringParameter>

                                </SelectParameters>


                            </asp:SqlDataSource>





                            <asp:Panel ID="ShowName" runat="server">
                                <asp:ListView ID="ListView1" runat="server">
                                    <ItemTemplate>
                                        <asp:Label ID="DisplayTeamName" runat="server" Text="Updated Name"></asp:Label>
                                    </ItemTemplate>
                                </asp:ListView>
                            </asp:Panel>

                            <%-- RME Search bar: --%>
                            <br />
                            <label class="col-md-3 control-label" for="name">Search:</label>
                            <br />
                            <asp:TextBox ID="searchskill" runat="server" Text=""></asp:TextBox>
                            <asp:Button ID="Searchbtn" runat="server" Class="btn btn-primary" Text="Search" OnClick="Searchbtn_Click" />



                            <%-- RME ListView Display Users / From Search R--%>
                            <asp:Panel ID="SearchResults" runat="server">



                                <asp:ListView ID="Displaysearch" runat="server" DataSourceID="UserDetails">


                                    <ItemTemplate>

                                        <br />
                                        <asp:Image ID="image1" runat="server" Style="width: 100px; height: 100px" ImageUrl='<%# "../" + Eval("imagepath")  %>' />
                                        <br />
                                        <b>First Name:</b>
                                        <asp:Label Text='<%# Eval("firstName") %>' runat="server" ID="firstNameLabel" /><br />
                                        <b>Last Name:</b>
                                        <asp:Label Text='<%# Eval("lastName") %>' runat="server" ID="lastNameLabel" /><br />
                                        <b>Skillset:</b>
                                        <asp:Label Text='<%# Eval("Skillset") %>' runat="server" ID="Skillsetlabel" /><br />

                                        <!-- RME add developers button -->

                                        <asp:HyperLink ID="AddMemberLink" runat="server" class="btn btn-primary" NavigateUrl='<%# "sprintDevelopersAdd.aspx?userID=" + Eval("userID") + 
                           
                            "&email=" + Eval("email") + "&name=" + Eval("firstname") + "&projectID=" + Request.QueryString["projectid"].ToString()  %>'>Add</asp:HyperLink>

                                        <br />
                                        <br />
                                    </ItemTemplate>

                                    <EmptyDataTemplate><i>No Search Results</i></EmptyDataTemplate>

                                </asp:ListView>


                            </asp:Panel>
                        </div>
                    </div>

                    <div class="panel panel-default">


                        <%--Available Backlog Datasource--%>
                        <asp:SqlDataSource ID="AvailableBacklog" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>'
                            SelectCommand="SELECT SCRUM_TEAM.*, SCRUM_USERS.imagepath, SCRUM_USERS.firstName, SCRUM_USERS.lastName, SCRUM_USERS.email, SCRUM_ROLE.roleTitle                         FROM SCRUM_TEAM INNER JOIN SCRUM_PROJECT ON SCRUM_TEAM.projectID = SCRUM_PROJECT.projectID INNER JOIN SCRUM_ROLE ON SCRUM_TEAM.roleID = SCRUM_ROLE.roleID INNER JOIN                 SCRUM_USERS ON SCRUM_TEAM.userID = SCRUM_USERS.userID WHERE SCRUM_PROJECT.projectID = @ID AND SCRUM_TEAM.roleID = '3' AND SCRUM_TEAM.sprintMember = 'false'">
                            <SelectParameters>
                                <asp:QueryStringParameter QueryStringField="projectID" Name="ID" Type="Int32"></asp:QueryStringParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>

                        <div class="panel-body">

                            <asp:ListView ID="UserStories" runat="server" DataSourceID="AvailableBacklog">


                                <ItemTemplate>
                                    <div id="developer" style="float: left; width: 25%;">
                                        <br />
                                        <br />

                                        <asp:Image ID="image" runat="server" Style="width: 125px; height: 100px" ImageUrl='<%# Eval("imagepath")  %>' />
                                        <br />
                                        <b>First Name:</b>
                                        <asp:Label Text='<%# Eval("firstName") %>' runat="server" ID="firstNameLabel" /><br />
                                        <b>Last Name:</b>
                                        <asp:Label Text='<%# Eval("lastName") %>' runat="server" ID="lastNameLabel" /><br />
                                        <b>Role:</b>
                                        <asp:Label Text='<%# Eval("roleTitle") %>' runat="server" ID="roleTitleLabel" /><br />
                                        <b>Email</b>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("email") %>' />
                                        <br />



                                        <!-- RME add developers button -->

                                        <asp:HyperLink ID="AddMemberLink" runat="server" class="btn btn-primary" NavigateUrl='<%# "sprintDevelopersAdd.aspx?userID=" + Eval("userID") + "&email=" + Eval("email") + "&name=" + Eval("firstname") + "&projectID=" + Request.QueryString["projectid"].ToString()  %>'>Add</asp:HyperLink>
                                    </div>


                                </ItemTemplate>

                                <EmptyDataTemplate>No developers available</EmptyDataTemplate>

                            </asp:ListView>
                        </div>
                    </div>




                    <br />

                    <br />
                    <br />



                    <div class="col-sm-10">
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


</form>
</body>
</html>