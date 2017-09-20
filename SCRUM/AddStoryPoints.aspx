<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddStoryPoints.aspx.cs" Inherits="AddStoryPoints" %>

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
      <<form id="form1" runat="server">
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
                <li class="ative">Add Story Points</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Story Point </h1>

			</div>
		</div><!--/.row-->
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
		
					<div class="panel-body">

                        <%-- SM - Displays each unique User Story --%>
				
            <asp:SqlDataSource ID="readfromtask" runat="server" ConnectionString='<%$ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SCRUM_BACKLOG WHERE (SCRUM_BACKLOG.ID = @id)">  

                 <SelectParameters>
             <asp:QueryStringParameter QueryStringField="BacklogID" Name="ID" Type="Int32"></asp:QueryStringParameter>
             </SelectParameters>
            
                        </asp:SqlDataSource>
            

                     <%-- SM - Displays each User Story's attributes --%>

          <asp:ListView ID="projecttask" runat="server" DataSourceID="readfromtask">

          <ItemTemplate>
           <b>User Story Below:</b>
          <br />
          <br />
          <span>
          <asp:HyperLink ID="HyperLink1" runat="server"
          NavigateUrl='<%# "~/AddStoryPoints.aspx?BacklogID="+Eval("ID")%>'> 
              </asp:HyperLink>
          <b>As: </b>
          <asp:Label ID="As" runat="server" Text= '<%# Eval("asUser") %>' />
          &nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp;
          <b>I want: </b>
          <asp:Label ID="Iwant" runat="server" Text='<%# Eval("iWant") %> ' />
          &nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp;
          <b>So That</b>
          <asp:Label ID="soThat" runat="server" Text='<%# Eval("soThat") %> ' />
          &nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp;
          <b>Value: </b>
          <asp:Label ID="Label5" runat="server" Text='<%# Eval("value") %> ' />
          
          </span>
           </>
        
                       
        </ItemTemplate>

        </asp:ListView>
           <br />
           <br />
           <br />

                           <%-- SM - Story Point Drop Down List --%>

          <asp:SqlDataSource ID="storydropdown" runat="server" ConnectionString='<%$ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SCRUM_STORY_OPTIONS"></asp:SqlDataSource>

         <label for="storypointlabel" class="col-sm-2 control-label">Add Story Point</label>
            <div class="col-sm-2">

                <asp:DropDownList ID="storypoints" runat="server" CssClass="form-control" DataSourceID="storydropdown" DataTextField="value" DataValueField="optionID"></asp:DropDownList>

          
                   <%-- SM - Text and Button to add Story Point --%>
         <br />

         <br />
         <br />
        <asp:Button ID="Storypointbtn" runat="server" Text="Add Story Point" CssClass="btn btn-default" OnClick="Storypointbtn_Click" />


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
