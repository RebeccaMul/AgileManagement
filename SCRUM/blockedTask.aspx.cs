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

    string blockedvalue;


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

            if (!IsPostBack)
            {
                ViewState["PreviousPage"] =
                Request.UrlReferrer;//Saves the Previous page url in ViewState
            }

        }

        //On page load it collects values from URL and the Session. 

            string backlogID = Request.QueryString["backlogID"].ToString();
            string sprintID = Request.QueryString["sprintID"].ToString();
            string projectID = Request.QueryString["projectID"].ToString();
            string weekID = Request.QueryString["weekID"].ToString();
            string user = Request.QueryString["userID"].ToString();
            string session = Session["userID"].ToString();
        
            //SM- Connection string to database
            string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection myConnection = new SqlConnection(connectionString);

            //SM - myConnection.ConnectionString is now set to connectionString.
            myConnection.Open();

            string task = Request.QueryString["taskID"];

            //SM - SQL insert query
            string query = "SELECT * FROM SCRUM_SPRINT_TASK WHERE taskID = @task";
            
            SqlCommand myCommand = new SqlCommand(query, myConnection);
            
            myCommand.Parameters.AddWithValue("@task", task);

            SqlDataReader rdr = myCommand.ExecuteReader();

            //SM - if statement - if blocked Task is already blocked - redirect user to view Task Page or else redirect user to blocked Task page.
            //If user is logged in, only that user can block a task otherwise nothing happens.
            while (rdr.Read())
            {

                blockedvalue = rdr["blocked"].ToString();
                blockedbox.Text = blockedvalue;

                if (blockedvalue == "true" || blockedvalue == "True" || blockedvalue == "1")
                {
                    Response.Redirect("viewTask.aspx?backlogID=" + backlogID + "&SprintID=" + sprintID + "&ProjectID=" + projectID + "&weekID=" + weekID);
                }

                if (user != session) {
                    Response.Redirect("viewTask.aspx?backlogID=" + backlogID + "&SprintID=" + sprintID + "&ProjectID=" + projectID + "&weekID=" + weekID);
                }
                else if (user == session)
                {

                }

            }
            


        myConnection.Close();

    }

    //SM -updateButton Method:
    //This method collects values from URL and from blocked Task section. 
    //It then updates the (SCRUM_SPRINT_TASK) Database table with new values.
    protected void updateButton(object sender, EventArgs e)
    {

        //SM- Connection string to database
        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(connectionString);

        //SM - myConnection.ConnectionString is now set to connectionString.
        myConnection.Open();

        // SM - get backlog ID from URL

        int taskID = int.Parse(Request.QueryString["taskID"]);
        string blockedDesc = blockeddescription.Text;
        string blocked = "True";

        //SM - SQL insert query
        string query = "UPDATE SCRUM_SPRINT_TASK SET blocked = @block, blockedDescription = @blocked WHERE taskID = @taskID";


        SqlCommand myCommand = new SqlCommand(query, myConnection);

        //SM - Paramatising values
        myCommand.Parameters.AddWithValue("@taskID", taskID);
        myCommand.Parameters.AddWithValue("@blocked", blockedDesc);
        myCommand.Parameters.AddWithValue("@block", blocked);


        myCommand.ExecuteNonQuery();
        myConnection.Close();


        blockeddescription.Text = "";



    }
    protected void backtoViewTask_Click(object sender, EventArgs e)
    {
        if (ViewState["PreviousPage"] != null)	//Check if the ViewState 
						//contains Previous page URL
        {
            Response.Redirect(ViewState["PreviousPage"].ToString());//Redirect to 
		//Previous page by retrieving the PreviousPage Url from ViewState.
        }
    }
    
}

