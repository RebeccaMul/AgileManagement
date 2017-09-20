<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageTeam.aspx.cs" Inherits="ManageTeam" %>

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

            <div class="form-group">
            </div>

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
                <li class="active"><a href="teams.aspx">
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
                    <li><a href="#">
                        <svg class="glyph stroked home">
                            <use xlink:href="#stroked-home"></use></svg></a></li>
                    <li class="active">Projects</li>
                </ol>
            </div>
            <!--/.row-->



            <div class="row">

                <div class="panel panel-default">
                </div>




                <asp:SqlDataSource ID="TeamDetails" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>'
                    SelectCommand="SELECT SCRUM_TEAM.teamID, SCRUM_TEAM.projectID, SCRUM_TEAM.userID, SCRUM_TEAM.roleID, SCRUM_PROJECT.projectName, SCRUM_USERS.firstName, SCRUM_USERS.lastName, SCRUM_USERS.email, SCRUM_ROLE.roleTitle, SCRUM_USERS.imagepath FROM SCRUM_TEAM INNER JOIN SCRUM_USERS ON SCRUM_TEAM.userID = SCRUM_USERS.userID INNER JOIN SCRUM_PROJECT ON SCRUM_TEAM.projectID = SCRUM_PROJECT.projectID INNER JOIN SCRUM_ROLE ON SCRUM_TEAM.roleID = SCRUM_ROLE.roleID WHERE (SCRUM_TEAM.projectID = @ID)">

                    <SelectParameters>
                        <asp:QueryStringParameter QueryStringField="projectID" Name="ID" Type="Int32"></asp:QueryStringParameter>
                    </SelectParameters>


                </asp:SqlDataSource>

                <asp:SqlDataSource ID="RoleDetails" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>'
                    SelectCommand="SELECT * FROM SCRUM_ROLE "></asp:SqlDataSource>


                <div class="panel panel-default">
                    <div class="panel-heading">
                        <svg class="glyph stroked clipboard-with-paper">
                            <use xlink:href="#stroked-clipboard-with-paper"></use></svg>Manage Team
                    </div>
                    <div class="panel-body">

                        <!-- input-->
                        <div class="form-group">
                            <div class="col-md-9">

                                <label class="col-md-3 control-label" for="name">Team Details:</label><br />

                                <div class="panel-body" style="margin-left: auto; margin-right: auto;">

                                    <%-- ListView Display TEAM --%>
                                    <asp:Panel ID="TeamList" runat="server" Style="margin-left: auto; margin-right: auto;">

                                        <asp:ListView ID="Display" runat="server" DataSourceID="TeamDetails" DataKeyNames="teamID" GroupItemCount="3" Style="margin-left: auto; margin-right: auto;">

                                            <ItemTemplate>
                                                <td runat="server" style="padding: 10px; margin-left: auto; margin-right: auto;">

                                                    <ul class="todo-list">
                                                        <li class="todo-list-item" style="padding: 30px;">
                                                            <div class="checkbox">
                                                                <label for="checkbox">
                                                                    <asp:Image ID="image" runat="server" Style="width: 70px; height: 70px" ImageUrl='<%# Eval("imagepath")  %>' />
                                                                    <asp:Label Text='<%# Eval("firstName") %> ' runat="server" ID="firstNameLabel" />
                                                                    <asp:Label Text='<%# Eval("lastName") %>' runat="server" ID="lastNameLabel" /></label>

                                                                <div class="pull-right action-buttons">

                                                                    <%--Delete icon:--%>
                                                                    <asp:HyperLink ID="Delete" runat="server" class="trash" NavigateUrl='<%# "ManageTeamDelete.aspx?UserID=" + Eval("userID") %>'><svg class="glyph stroked trash" ><use xlink:href="#stroked-trash"></use></svg></asp:HyperLink>
                                                                </div>
                                                                <br />
                                                                <br />
                                                                <b>Project:</b><br />
                                                                <br />
                                                                <asp:Label Text='<%# Eval("projectName") %>' runat="server" ID="projectNameLabel" /><br />
                                                                <br />
                                                                <b>Current role:</b><br />
                                                                <br />
                                                                <asp:Label Text='<%# Eval("roleTitle") %>' runat="server" ID="Label1" />


                                                                <%--Update Button:--%>
                                                                <asp:HyperLink ID="Update" runat="server" NavigateUrl='<%# "ManageTeamAdd.aspx?userID=" + Eval("userID") + "&email=" + Eval("email")+ "&firstname=" + Eval("firstName") + "&projectID=" + Eval("projectID") %>'><svg class="glyph stroked pencil"><use xlink:href="#stroked-pencil"></use></svg></asp:HyperLink>
                                                            </div>

                                                            </div>
                                                        </li>
                                                    </ul>



                                                </td>

                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <td runat="server" style="">teamID:
                                        <asp:Label Text='<%# Eval("teamID") %>' runat="server" ID="teamIDLabel1" /><br />
                                                    projectID:
                                        <asp:TextBox Text='<%# Bind("projectID") %>' runat="server" ID="projectIDTextBox" /><br />
                                                    userID:
                                        <asp:TextBox Text='<%# Bind("userID") %>' runat="server" ID="userIDTextBox" /><br />
                                                    roleID:
                                        <asp:TextBox Text='<%# Bind("roleID") %>' runat="server" ID="roleIDTextBox" /><br />
                                                    projectName:
                                        <asp:TextBox Text='<%# Bind("projectName") %>' runat="server" ID="projectNameTextBox" /><br />
                                                    firstName:
                                        <asp:TextBox Text='<%# Bind("firstName") %>' runat="server" ID="firstNameTextBox" /><br />
                                                    lastName:
                                        <asp:TextBox Text='<%# Bind("lastName") %>' runat="server" ID="lastNameTextBox" /><br />
                                                    <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton" /><br />
                                                    <asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" /><br />
                                                </td>
                                            </EditItemTemplate>
                                            <EmptyDataTemplate>
                                                <table runat="server" style="">
                                                    <tr>
                                                        <td>No data was returned.</td>
                                                    </tr>
                                                </table>
                                            </EmptyDataTemplate>
                                            <EmptyItemTemplate>
                                                <td runat="server" />
                                            </EmptyItemTemplate>
                                            <GroupTemplate>
                                                <tr runat="server" id="itemPlaceholderContainer">
                                                    <td runat="server" id="itemPlaceholder"></td>
                                                </tr>
                                            </GroupTemplate>
                                            <InsertItemTemplate>
                                                <td runat="server" style="">projectID:
                                        <asp:TextBox Text='<%# Bind("projectID") %>' runat="server" ID="projectIDTextBox" /><br />
                                                    userID:
                                        <asp:TextBox Text='<%# Bind("userID") %>' runat="server" ID="userIDTextBox" /><br />
                                                    roleID:
                                        <asp:TextBox Text='<%# Bind("roleID") %>' runat="server" ID="roleIDTextBox" /><br />
                                                    projectName:
                                        <asp:TextBox Text='<%# Bind("projectName") %>' runat="server" ID="projectNameTextBox" /><br />
                                                    firstName:
                                        <asp:TextBox Text='<%# Bind("firstName") %>' runat="server" ID="firstNameTextBox" /><br />
                                                    lastName:
                                        <asp:TextBox Text='<%# Bind("lastName") %>' runat="server" ID="lastNameTextBox" /><br />
                                                    <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton" /><br />
                                                    <asp:Button runat="server" CommandName="Cancel" Text="Clear" ID="CancelButton" /><br />
                                                </td>
                                            </InsertItemTemplate>

                                            <LayoutTemplate>
                                                <table runat="server">
                                                    <tr runat="server">
                                                        <td runat="server">
                                                            <table runat="server" id="groupPlaceholderContainer" style="" border="0">
                                                                <tr runat="server" id="groupPlaceholder"></tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr runat="server">
                                                        <td runat="server" style=""></td>
                                                    </tr>
                                                </table>
                                            </LayoutTemplate>
                                            <SelectedItemTemplate>
                                                <td runat="server" style="">teamID:
                                        <asp:Label Text='<%# Eval("teamID") %>' runat="server" ID="teamIDLabel" /><br />
                                                    projectID:
                                        <asp:Label Text='<%# Eval("projectID") %>' runat="server" ID="projectIDLabel" /><br />
                                                    userID:
                                        <asp:Label Text='<%# Eval("userID") %>' runat="server" ID="userIDLabel" /><br />
                                                    roleID:
                                        <asp:Label Text='<%# Eval("roleID") %>' runat="server" ID="roleIDLabel" /><br />
                                                    projectName:
                                        <asp:Label Text='<%# Eval("projectName") %>' runat="server" ID="projectNameLabel" /><br />
                                                    firstName:
                                        <asp:Label Text='<%# Eval("firstName") %>' runat="server" ID="firstNameLabel" /><br />
                                                    lastName:
                                        <asp:Label Text='<%# Eval("lastName") %>' runat="server" ID="lastNameLabel" /><br />
                                                </td>
                                            </SelectedItemTemplate>
                                            <EmptyDataTemplate>
                                                <table runat="server" style="">
                                                    <tr>
                                                        <td>No results.</td>
                                                    </tr>
                                                </table>
                                            </EmptyDataTemplate>


                                        </asp:ListView>

                                    </asp:Panel>
                                </div>


                            </div>

                        </div>
                        <!--/.col-->

                        <div class="col-md-4">
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
