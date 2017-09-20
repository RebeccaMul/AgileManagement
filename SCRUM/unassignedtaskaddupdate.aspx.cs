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

using System.Net.Mail;
using System.Net;

//Authors: Sarah Mooney

public partial class unassignedtaskaddupdate : System.Web.UI.Page
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
          //  username.Text = "" + usern + "";
           
        }

    
    }

    //SM -update_Click Method:
    //This method collects values from URL. 
    //It then updates the (SCRUM_SPRINT_TASK) Database table with new values.

    protected void update_Click(object sender, EventArgs e)
    {
        //SM - Connection to database
        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;

        SqlConnection myConnection = new SqlConnection(connectionString);

        //SM - myConnection.ConnectionString is now set to connectionString.
        myConnection.Open();

        //SM - Getting BacklogID and ProjectID from URL
        int taskID = int.Parse(Request.QueryString["taskID"]);
        int project = int.Parse(Request.QueryString["projectID"]);
        int backlog = int.Parse(Request.QueryString["backlogID"]);
        int sprint = int.Parse(Request.QueryString["sprintID"]);



        string user = team.SelectedValue;

        // SQL Insert Query
        string query = "UPDATE SCRUM_SPRINT_TASK SET userID = @user WHERE taskID = @taskID";


        SqlCommand myCommand = new SqlCommand(query, myConnection);

        // create a parameterised object

        myCommand.Parameters.AddWithValue("@user", user);
        myCommand.Parameters.AddWithValue("@taskID", taskID);


        myCommand.ExecuteNonQuery();

        myConnection.Close();

       Response.Redirect("sprintpage.aspx?sprintID=" + sprint + "&projectID=" + project);
        
            
  
    }
}