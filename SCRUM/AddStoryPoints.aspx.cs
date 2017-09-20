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
public partial class AddStoryPoints : System.Web.UI.Page
{
    //If Scrum Master, user logs in and goes to Add Story Points Page
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Convert.ToInt32(Session["scrummaster"]) == 1))
        {
            
        }

        else
        {
            // If not Scrum Master, user is brought back to Projects page.
            Response.Redirect("projects.aspx");
        }
        
    }

    protected void Storypointbtn_Click(object sender, EventArgs e)
    {
        //SM - Connection to database
        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(connectionString);

        //SM - myConnection.ConnectionString is now set to connectionString.
        myConnection.Open();

       // Input stored into storypoint variable
        int backlogid;
        string storypoint = storypoints.SelectedValue;
        int storypointid;
        int sp = Convert.ToInt32(storypoint);


        //SM - Getting BacklogID from URL
        backlogid = int.Parse(Request.QueryString["BacklogID"]);
        storypointid = int.Parse(Request.QueryString["storyID"]);


        //SM - SQL Insert Query

        string query = "UPDATE SCRUM_STORY_POINTS SET options = @options WHERE storyID = @storyID";


        SqlCommand myCommand = new SqlCommand(query, myConnection);

        //create a parameterised object
        myCommand.Parameters.AddWithValue("@storypoint", storypoint);
        myCommand.Parameters.AddWithValue("@backlog", backlogid);
        myCommand.Parameters.AddWithValue("@options", sp);
        myCommand.Parameters.AddWithValue("@storyID", storypointid);



        myCommand.ExecuteNonQuery();
        myConnection.Close();

      



    }
}

