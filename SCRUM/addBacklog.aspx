<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addBacklog.aspx.cs" Inherits="addBacklog" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<title>Scrum Management System</title>

<link href="css/bootstrap.min.css" rel="stylesheet"/>
<link href="css/datepicker3.css" rel="stylesheet"/>
<link href="css/styles.css" rel="stylesheet"/>
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
					<span class="icon-bar"></span> <a href="viewBacklog.aspx" type="button" class="btn">Add Backlog</></a>
				</button>
				<a class="navbar-brand" href="Default.aspx"><span>Scrum Management</span> System</a>
				<ul class="user-menu">
					<li class="dropdown pull-right">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"><svg class="glyph stroked eye"><use xlink:href="#stroked-eye"></use></svg> <asp:Label ID="username" runat="server" Text=""></asp:Label><span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#"><svg class="glyph stroked eye"><use xlink:href="#stroked-eye"></use></svg> Profile</a></li>
							<li><a href="#"><svg class="glyph stroked gear"><use xlink:href="#stroked-gear"></use></svg> Settings</a></li>
                           <li><a href="login.aspx"><svg class="glyph stroked cancel"><use xlink:href="#stroked-cancel"></use></svg> Logout</a></li>
                        </ul>
					</li>
				</ul>
			</div>
							
		</div><!-- /.container-fluid -->
	</nav>
		
	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<ul class="nav menu">
			<li><a href="Default.aspx"><svg class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg> Dashboard</a></li>
           	<li class="active"><a href="projects.aspx"><svg class="glyph stroked open folder"><use xlink:href="#stroked-open-folder"></use></svg> Projects</a></li>
			<li><a href="sprints.aspx"><svg class="glyph stroked clipboard with paper"><use xlink:href="#stroked-clipboard-with-paper"></use></svg> Sprints</a></li>
			<li><a href="teams.aspx"><svg class="glyph stroked male user"><use xlink:href="#stroked-male-user"></use></svg> Teams</a></li>
			<li><a href="burndown.aspx"><svg class="glyph stroked line-graph"><use xlink:href="#stroked-line-graph"></use></svg> Burndown</a></li>
            <li role="presentation" class="divider"></li>
			<li><a href="profile.aspx"><svg class="glyph stroked eye"><use xlink:href="#stroked-eye"></use></svg> Profile</a></li>
		
		
			
        </ul>

	</div><!--/.sidebar-->
		
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="projects.aspx"><svg class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg></a></li>
				<li class="">Projects</li>
                <li class="ative">Add Backlog</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Backlog</h1>

			</div>
		</div><!--/.row-->
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
		
					<div class="panel-body">
				<!-- ET - Creating Data Source to use SCRUM_PROJECT table to retrieve data to display. -->
                         <asp:SqlDataSource ID="projectName" runat="server" ConnectionString='<%$ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SCRUM_PROJECT WHERE SCRUM_PROJECT.projectID = @ID">  

                 <SelectParameters>
                    <asp:QueryStringParameter QueryStringField="projectID" Name="ID" Type="Int32"></asp:QueryStringParameter>
                </SelectParameters>

                         </asp:SqlDataSource>

            <!-- ET - TextBoxes are going to be populated using C# Query -->
        <asp:ListView ID="projectList" runat="server" DataSourceID="projectName">
            <ItemTemplate>
            <label for="projectLabel" class="col-sm-2 control-label">Project: </label>
            <div class="col-sm-10">
            <asp:TextBox ID="projectBox" Text='<%# Eval ("projectName") %>' runat="server" CssClass="form-control" enabled="false">  </asp:TextBox>
            </div>

                </ItemTemplate>
            </asp:ListView>



            <label for="asTextLabel" class="col-sm-2 control-label">As: </label>
            <div class="col-sm-10">
            <asp:TextBox ID="asText" runat="server" CssClass="form-control" >  </asp:TextBox>
            </div>
            <br />
            <br />
            <label for="iWantLabel" class="col-sm-2 control-label">I Want: </label>
            <div class="col-sm-10">
            <asp:TextBox ID="iWantText" runat="server" CssClass="form-control"> </asp:TextBox>
            </div>
            <br />
            <br />
            <label for="soThatLabel" class="col-sm-2 control-label">So That: </label>
            <div class="col-sm-10">
            <asp:TextBox ID="soThatText" runat="server" CssClass="form-control"> </asp:TextBox>
            </div>
            <br />
            <br />
            <label for="valueLabel" class="col-sm-2 control-label">Value: </label>
            <div class="col-sm-10">
            <asp:TextBox ID="valueText" runat="server" CssClass="form-control"> </asp:TextBox>
            </div>
            <br />
            <br />   

                <!-- ET - Creating Button to click once ready to submit. -->
                <asp:Button ID="addBacklogBtn" runat="server" Text="Add Backlog" CssClass="btn btn-primary" OnClick="addBacklogBtn_Click" />
                 <asp:Button ID="backtoProject" runat="server" Text="Back" CssClass="btn btn-primary" onclick="backtoProject_Click" /> 
                <asp:Label ID="addLabel" runat="server" Text=""></asp:Label>
                        

</div>
									</div>
								
						
							
					
					</div>
				</div>
                </div>
	</div>	<!--/.main-->
				
			
			
			
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
		    $(document).on("click","ul.nav li.parent > a > span.icon", function(){          
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
