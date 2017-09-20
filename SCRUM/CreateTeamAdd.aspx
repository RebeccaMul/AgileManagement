<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreateTeamAdd.aspx.cs" Inherits="CreateTeam" %>

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

                <%-- SEARCH --%>


                <asp:SqlDataSource ID="UserDetails" runat="server" ConnectionString='<%$ ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SCRUM_USERS WHERE 
                ([firstName] LIKE '%' + @FName + '%') OR ([lastName] LIKE '%' + @LName + '%') OR ([email] LIKE '%' + @EmailAdd + '%')">

                    <SelectParameters>
                        <asp:QueryStringParameter QueryStringField="searchquery" Name="Fname" Type="String"></asp:QueryStringParameter>
                        <asp:QueryStringParameter QueryStringField="searchquery" Name="Lname"></asp:QueryStringParameter>
                        <asp:QueryStringParameter QueryStringField="searchquery" Name="EmailAdd"></asp:QueryStringParameter>
                    </SelectParameters>


                </asp:SqlDataSource>

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <svg class="glyph stroked clipboard-with-paper">
                            <use xlink:href="#stroked-clipboard-with-paper"></use></svg>Create Project Team
                    </div>
                    <div class="panel-body">

                        <!-- input-->
                        <div class="form-group">
                            <div class="col-md-9">

                                <label class="col-md-3 control-label" for="name">Team Name:</label>


                            </div>
                        </div>
                    </div>
                </div>


                <div class="panel-body">
                </div>

                <div class="panel-heading dark-overlay2">Current Team:</div>
                <div class="panel-body">
                    <ul class="todo-list">
                        <li class="todo-list-item">
                            <div class="checkbox">
                                <input type="checkbox" id="checkbox" />
                                <label for="checkbox">Team Member 1</label>
                            </div>
                            <div class="pull-right action-buttons">
                                <a href="#">
                                    <svg class="glyph stroked pencil">
                                        <use xlink:href="#stroked-pencil"></use></svg></a>
                                <a href="#" class="flag">
                                    <svg class="glyph stroked flag">
                                        <use xlink:href="#stroked-flag"></use></svg></a>
                                <a href="#" class="trash">
                                    <svg class="glyph stroked trash">
                                        <use xlink:href="#stroked-trash"></use></svg></a>
                            </div>
                        </li>
                        <li class="todo-list-item">
                            <div class="checkbox">
                                <input type="checkbox" id="checkbox" />
                                <label for="checkbox">Team Member 2</label>
                            </div>
                            <div class="pull-right action-buttons">
                                <a href="#">
                                    <svg class="glyph stroked pencil">
                                        <use xlink:href="#stroked-pencil"></use></svg></a>
                                <a href="#" class="flag">
                                    <svg class="glyph stroked flag">
                                        <use xlink:href="#stroked-flag"></use></svg></a>
                                <a href="#" class="trash">
                                    <svg class="glyph stroked trash">
                                        <use xlink:href="#stroked-trash"></use></svg></a>
                            </div>
                        </li>

                    </ul>
                </div>



            </div>

        </div>
        <!--/.col-->

        <div class="col-md-4">
        </div>
        <!--/.col-->
        </div><!--/.row-->
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
