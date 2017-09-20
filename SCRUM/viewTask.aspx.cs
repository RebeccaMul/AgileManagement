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

//Authors: Sarah Mooney  


public partial class viewTask : System.Web.UI.Page
{

    //SM - Page Load Method: If a user is not logged in, they will be redirected to the login page. 
    //If a user is logged in, their session will be stored and their username placed in the relevant field on the front end.
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
    }


    //SM - blockbutton Method:
    //This method redirects user to blockedTask page.
    protected void blockedbutton(object sender, EventArgs e)
    {
        Response.Redirect("blockedTask.aspx");
    }

    //SM - unblockbutton Method:
    //This method collects values from URL and and blocked task section. 
    //It then updates the (SCRUM_SPRINT_TASK) Database table with new values.
    protected void unblockbutton(object sender, EventArgs e)
    {

        //SM- Connection string to database
        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(connectionString);

        //SM - myConnection.ConnectionString is now set to connectionString.
        myConnection.Open();

        int taskID = int.Parse(Request.QueryString["taskID"]);

        string unblockedDesc = " ";


        //SM - SQL insert query
        string query = "UPDATE SCRUM_SPRINT_TASK SET blockedDescription = @blocked WHERE taskID = @taskID";


        SqlCommand myCommand = new SqlCommand(query, myConnection);

        //SM - Paramatising values
        myCommand.Parameters.AddWithValue("@taskID", taskID);
        myCommand.Parameters.AddWithValue("@blocked", unblockedDesc);




        myCommand.ExecuteNonQuery();
        myConnection.Close();


    }

    //SM - blockbutton Method:
    //This method redirects user to unassignedtask page with links.
    protected void addBtn_Click(object sender, System.EventArgs e)
    {
        Response.Redirect("unassignedtask.aspx?UserID=0&projectID=" + Request.QueryString["projectid"].ToString() + "&SprintID=" + Request.QueryString["sprintID"].ToString());
    }
}