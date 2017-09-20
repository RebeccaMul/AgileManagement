using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

//Author: Rebecca Mulholland

public partial class addSprint : System.Web.UI.Page
{

    //RMU - Page_Load Method:  
    //Session: If a user is not logged in, they will be redirected to the login page. If a user is logged in, their session will be stored and their username placed in the relevant field on the front end. Also, If a user's account is a Scrum Master the page will load as normal, and if not a Scrum Master, they will be redirect to the sprints page.
    //This method also collects the backlog, project and sprint ID's from the URL and inserts the relevant details into the Database (SCRUM_SPRINTBACKLOG Table)
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["user"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            string usern = Session["user"].ToString();
            username.Text = "" + usern + "";
        }

        if ((Convert.ToInt32(Session["scrummaster"]) == 1))
        {

        }

        else
        {
            Response.Redirect("sprints.aspx");
        }

        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(connectionString);

        myConnection.Open();

        int backlog = int.Parse(Request.QueryString["backlogID"]);
        int project = int.Parse(Request.QueryString["projectID"]);
        int sprint = int.Parse(Request.QueryString["sprintID"]);

        string query = "INSERT INTO SCRUM_SPRINTBACKLOG (backlogID, sprintID, UserID) VALUES ('" + @backlog + "', '" + @sprint + "', '0')";

        SqlCommand myCommand = new SqlCommand(query, myConnection);

        myCommand.Parameters.AddWithValue("@backlog", backlog);
        myCommand.Parameters.AddWithValue("@project", project);
        myCommand.Parameters.AddWithValue("@sprint", sprint);

        myCommand.ExecuteNonQuery();

        myConnection.Close();

        //RMU- Redirect back with relevant project & sprint IDs (required for page to load correctly)
        Response.Redirect("sprintpage.aspx?backlogID=" + backlog + "&sprintID=" + sprint + "&projectID=" + project);

    }
}