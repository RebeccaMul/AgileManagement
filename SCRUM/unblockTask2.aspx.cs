using System;
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

public partial class viewTask : System.Web.UI.Page
{

    //SM - On page load, this method collects values from URL.
    //It then updates the (SCRUM_SPRINT_TASK) Database table with new values.
    protected void Page_Load(object sender, EventArgs e)
    {

        //SM- Connection string to database
        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(connectionString);

        //SM - myConnection.ConnectionString is now set to connectionString.
        myConnection.Open();

        int taskID = int.Parse(Request.QueryString["taskID"]);
        string backlogID = Request.QueryString["backlogID"].ToString();
        string sprintID = Request.QueryString["sprintID"].ToString();
        string projectID = Request.QueryString["projectID"].ToString();
        string weekID = Request.QueryString["weekID"].ToString();





        string unblockedDesc = " ";
        string unblock = "False";


        //SM - SQL insert query
        string query = "UPDATE SCRUM_SPRINT_TASK SET blocked = @unblock, blockedDescription = @blocked WHERE taskID = @taskID";


        SqlCommand myCommand = new SqlCommand(query, myConnection);

        //SM - Paramtising values
        myCommand.Parameters.AddWithValue("@taskID", taskID);
        myCommand.Parameters.AddWithValue("@blocked", unblockedDesc);
        myCommand.Parameters.AddWithValue("@unblock", unblock);





        myCommand.ExecuteNonQuery();
        myConnection.Close();

        //SM - Redirect Link
        Response.Redirect("sprintpage.aspx?&projectID=" + projectID + "&sprintID=" + sprintID);

    }
}