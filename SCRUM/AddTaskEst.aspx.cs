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

//Authors: Sarah Mooney & Josh Drake

public partial class addTask : System.Web.UI.Page
{
    //SM - Page Load Method: If a user's role is a Scrum Master, they will remain on the page otherwise they will be redirected to the sprintpage.
    //If a user's role is a Product Owner, they will remain on the page otherwise they will be redirected to the Sprintpage.
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Convert.ToInt32(Session["scrummaster"]) == 1))
        {

        }

        else if

            ((Convert.ToInt32(Session["productowner"]) == 1)) {

        }
        
        else
        {
          
            // If not Scrum Master or Project Manager, user is brought back to Sprints page.
            Response.Redirect("sprintpage.aspx");
        }

    }

    //SM - addTask_OnClick Method:
    //This method collects values from URL and task. 
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
       
      

        //SM - SQL insert query
        string query = "INSERT INTO SCRUM_SPRINT_TASK (taskDetails, backlogID) VALUES (@taskDetails, @ID)";
       
       
        SqlCommand myCommand = new SqlCommand(query, myConnection);

       //SM - Paramatising values
        myCommand.Parameters.AddWithValue("@taskDetails", textdetail);
        myCommand.Parameters.AddWithValue("@ID", backlogID);
       
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