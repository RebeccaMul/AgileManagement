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

//Authors: Sarah Mooney & Josh Drake

public partial class addTask1 : System.Web.UI.Page
{
    //SM - Page Load Method: If a user is not logged in, they will be redirected to the login page. 
    //If a user is logged in, their session will be stored and their username placed in the relevant field on the front end.
    protected void Page_Load(object sender, EventArgs e)
    {
        
       if (Session["user"] == null)
        {
            Response.Redirect("login.aspx");
        }
       
    
    }

    //SM -addTask_OnClick Method:
    //This method collects values from URL and the Selected Week from the Dropdown list. 
    //It then inserts details into the (SCRUM_SPRINT_TASK) Database table therefore updating the Database table with new values.

    protected void addTask_OnClick(object sender, EventArgs e)
    {

        //SM- Connection string to database
        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(connectionString);

        //SM - myConnection.ConnectionString is now set to connectionString.
        myConnection.Open();

        // SM - get backlog ID from URL
        string backlogID = Request.QueryString["backlogID"].ToString();
        string textdetail = task.Text;
        int sprintdetail = Convert.ToInt32(Request.QueryString["sprintID"].ToString());
        int userID = 0;
        string week = weekdropdown.SelectedValue;


       
      

        //SM - SQL insert query
        string query = "INSERT INTO SCRUM_SPRINT_TASK (sprintID, taskDetails, backlogID, userID, week) VALUES (@sprint, @taskDetails, @ID, @adduser, @weeklist)";
       
       
        SqlCommand myCommand = new SqlCommand(query, myConnection);

       //SM - Paramatising values
        myCommand.Parameters.AddWithValue("@taskDetails", textdetail);
        myCommand.Parameters.AddWithValue("@ID", backlogID);
        myCommand.Parameters.AddWithValue("@sprint", sprintdetail);
        myCommand.Parameters.AddWithValue("@adduser", userID);
        myCommand.Parameters.AddWithValue("@weeklist", week);

       
        myCommand.ExecuteNonQuery();
        myConnection.Close();

        //JD - Establishing a new connection as another SQL update query is to be executed.
        myConnection.Open();
        
        //JD - SQl update query
         string query1 = "UPDATE SCRUM_SPRINT_TASK SET estTime = @estTime WHERE backlogID=@ID";
        SqlCommand myCommand1 = new SqlCommand(query1, myConnection);
        string sEstimatedHours = estimatedTime.Text;
        int sEstimatedHours1 = Convert.ToInt16(sEstimatedHours);
        
        //JD - Paramtising values
        myCommand1.Parameters.AddWithValue("@estTime", sEstimatedHours1);
        myCommand1.Parameters.AddWithValue("@ID", backlogID);
        myCommand1.ExecuteNonQuery();
        myConnection.Close();


        task.Text = "";

        addedLabel.Text = "Task Added";

        
        
    }

}