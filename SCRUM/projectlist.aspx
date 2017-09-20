<%@ Page Language="C#" AutoEventWireup="true" CodeFile="projectlist.aspx.cs" Inherits="projectlist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Scrum Management System</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/datepicker3.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<link rel="icon" href="img/scrum.png" />
<style>
    #sortable {
        list-style-type: none;
        margin: 0;
        padding: 0;
        width: 60%;
    }

        #sortable li {
            margin: 0 3px 3px 3px;
            padding: 0.4em;
            padding-left: 1.5em;
            font-size: 1.4em;
            height: 18px;
        }

            #sortable li span {
                position: absolute;
                margin-left: -1.3em;
            }
</style>
  

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
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><svg class="glyph stroked eye"><use xlink:href="#stroked-eye"></use></svg> <asp:Label ID="username" runat="server" Text=""></asp:Label><span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#"><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg> Profile</a></li>
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
				<li><a href="projects.aspx"><svg class="glyph stroked open folder"><use xlink:href="#stroked-open-folder"></use></svg></a></li>
				<li class="active">View a different project</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Projects</h1>
			</div>
		</div><!--/.row-->


									
		<div class="row">
			<div class="col-xs-12 col-md-6 col-lg-3">
				<div class="panel panel-blue panel-widget ">
					<div class="row no-padding">
						<div class="col-sm-3 col-lg-5 widget-left">
							<svg class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg>
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
							<svg class="glyph stroked clipboard with paper"><use xlink:href="#stroked-clipboard-with-paper"></use></svg>
						</div>
						<div class="col-sm-9 col-lg-7 widget-right">
							<div class="large"><a href="sprints.aspx">Sprints</a></div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-md-6 col-lg-3">
				<div class="panel panel-teal panel-widget">
					<div class="row no-padding">
						<div class="col-sm-3 col-lg-5 widget-left">
							<svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg>
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
							<svg class="glyph stroked app-window-with-content"><use xlink:href="#stroked-app-window-with-content"></use></svg>
						</div>
						<div class="col-sm-9 col-lg-7 widget-right">
							<div class="large"><a href="burndown.aspx">Burndown</a></div>
							<div class="text-muted"></div>
						</div>
					</div>
				</div>
			</div>
		</div><!--/.row-->

     
  
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading"><svg class="glyph stroked open folder"><use xlink:href="#stroked-open-folder"></use></svg> <b>Project Details</b>
                        <asp:Button ID="newSprintBTN" runat="server" Width="200px" style="float:right; margin-top:5px;" Text="Create Sprint" class="btn btn-primary"  OnClick="newSprintBTN_Click" />

					</div>
					<div class="panel-body">

             <%-- SM - Displays unique project selected in Projects Page --%>

            <asp:SqlDataSource ID="readfromproject" runat="server" ConnectionString='<%$ConnectionStrings:dbconnect %>' SelectCommand="SELECT * FROM SCRUM_PROJECT INNER JOIN SCRUM_USERS ON SCRUM_USERS.userID = SCRUM_PROJECT.projectManager WHERE SCRUM_PROJECT.projectID = @ID">  

                 <SelectParameters>
                    <asp:QueryStringParameter QueryStringField="projectID" Name="ID" Type="Int32"></asp:QueryStringParameter>
                </SelectParameters>
            </asp:SqlDataSource>

                         <%-- SM - Display Project's details --%>

                        <asp:ListView ID="projectdata" runat="server" DataSourceID="readfromproject">

          <ItemTemplate>
               <span class="">
                   <!-- ET - User story will direct to specific details for the user to edit value  -->
                        <asp:HyperLink ID="HyperLink1" runat="server" 
            NavigateUrl='<%# "~/Scrum/addbacklog.aspx?projectID="+Eval("projectID")%>'>
              
          </asp:HyperLink>  
                       
        
          <%-- SM - Displays unique project details --%>
         <span> 
          <b>Project Name:  </b>
          <asp:Label ID="projectNamel" runat="server" Text= '<%# Eval("projectName") %>' />
          &nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp;
          <b>Project Manager: </b>
          <asp:Label ID="projectOwner" runat="server" Text='<%# Eval("firstName") %> ' />
        
           <asp:Label ID="Label1" runat="server" Text='<%# Eval("lastName") %> ' />
          
        
          </span>
                       
        </ItemTemplate>

        </asp:ListView>
          
                
				</div>
				</div> 
		


				<div class="panel panel-default chat">
					<div class="panel-heading" id="accordion"><svg class="glyph stroked two-messages"><use xlink:href="#stroked-app-window-with-content"></use></svg><b> Product Backlog</b>

                        

   
                        <asp:Button ID="addBtn" runat="server" Text="Add User Story" style="float:right; margin-right:5px;" CssClass="btn btn-primary" OnClick="addBtn_Click" />


					</div>
				<div class="panel-body" style="height:650px;">

             <!-- ET and SM - Display User Story from the Product Backlog -->

                    <asp:SqlDataSource ID="readfrombacklog" runat="server" ConnectionString='<%$ConnectionStrings:dbconnect %>' 
                        SelectCommand="SELECT SCRUM_BACKLOG.asUser, SCRUM_BACKLOG.iWant, SCRUM_BACKLOG.soThat, SCRUM_BACKLOG.Value, SCRUM_STORYOPTIONS.point, SCRUM_BACKLOG.ID FROM SCRUM_PROJECT 
                        INNER JOIN SCRUM_BACKLOG ON SCRUM_BACKLOG.projectID = SCRUM_PROJECT.projectID 
                        INNER JOIN SCRUM_STORYOPTIONS ON SCRUM_BACKLOG.options = SCRUM_STORYOPTIONS.optionID
                        WHERE SCRUM_BACKLOG.projectID = 
                        @ID ORDER BY SCRUM_BACKLOG.value DESC">

             

                        <SelectParameters>
                            <asp:QueryStringParameter QueryStringField="projectID" Name="ID" Type="Int32"></asp:QueryStringParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                   

                    <ul id="sortable">
                           
           <asp:ListView ID="viewBacklog" name="backlogID" runat="server" DataSourceID="readfrombacklog">
              
               <ItemTemplate> 
                  <asp:HyperLink ID="HyperLink1" runat="server" Font-Underline="false" style="color:#5f6468" NavigateUrl='<%# "viewBacklog.aspx?viewbacklogID="+Eval("ID") %>'>
                 
                   <div class="col-md-12" style="width:1500px" height:"800px">
                    
                      <b>As:</b> 
               <i> <asp:Label ID="asLabel" runat="server" Text= '<%# Eval("asUser") %>' /></i>
                     <b>I want: </b>
               <i> <asp:Label ID="iWantLabel" runat="server" Text='<%# Eval("iWant") %> ' /> </i>
                     <b>So That: </b>
               <i> <asp:Label ID="sothatLabel" runat="server" Text= '<%# Eval("soThat") %>' /></i>
                     <b>Value: </b>
               <i> <asp:Label ID="valueLabel" runat="server" Text= '<%# Eval("Value") %>' /></i>
                    <b>Story Point: </b>
               <i> <asp:Label ID="Label2" runat="server" Text= '<%# Eval("point") %>' /></i>
          </asp:HyperLink>
                 &nbsp;&nbsp;&nbsp;
                 <div id="testbutton" style="float:right;">
                     
             
                          
                     <asp:HyperLink ID="editButton" runat="server" cssclass="btn btn-success" NavigateUrl='<%# "viewBacklog.aspx?viewbacklogID=" + Eval("ID")%>'> Edit</asp:HyperLink>   
                   <asp:HyperLink ID="HyperLink2" runat="server" cssclass="btn btn-primary" NavigateUrl='<%# "addTest.aspx?backlogID=" + Eval("ID")%>'> Add Acceptance Test</asp:HyperLink>
                   <asp:HyperLink ID="HyperLink3" runat="server" cssclass="btn btn-primary" NavigateUrl='<%# "viewTest.aspx?backlogID=" + Eval("ID")%>'> View Acceptance Test</asp:HyperLink>
                   
                    
               </div>   <hr />
            </div>
                   
                    
        </ItemTemplate>  
                
         </asp:ListView>
                        </ul>


                    <br />
               </div>		
         </div>
     </div>
    </div><!--/.col-->
</div><!--/.row-->

		  

	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/chart.min.js"></script>
	<script src="js/chart-data.js"></script>
	<script src="js/easypiechart.js"></script>
	<script src="js/easypiechart-data.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
           <script>
               $(function () {
                   $("#sortable").sortable();
                   $("#sortable").disableSelection();
               });
  </script>
         <script>
             function viewBacklogconfirm() {
                 if (alert("Only the *Product Owner* and *Scrum Master* have access to amend values.")) {
                     return true;
                 } else {
                     return false;
                 }
             }</script>
    </form>
</body>
</html>
