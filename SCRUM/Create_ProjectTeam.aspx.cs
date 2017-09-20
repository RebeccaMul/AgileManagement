using System;
using System.Windows;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class projects : System.Web.UI.Page
{

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

        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(connectionString);

        // myConnection.ConnectionString is now set to connectionString.
        myConnection.Open();

        int userID = Convert.ToInt32(Request.QueryString["projectManager"].ToString());
        int projectID = Convert.ToInt32(Request.QueryString["projectID"].ToString());

        //Project manager is inserted as logged in user - ProductOwner = 0 as no longer needed
        string query = "INSERT INTO [SCRUM_TEAM] (projectID, userID, roleID, sprintMember) VALUES(@projectID, @ID, '2', 'True');";

        SqlCommand myCommand = new SqlCommand(query, myConnection);

        //create a parameterised object
        myCommand.Parameters.AddWithValue("@ID", userID);
        myCommand.Parameters.AddWithValue("@projectID", projectID);

        myCommand.ExecuteNonQuery();

        myConnection.Close();

        //RMU - Redirecting to projects page with both project & team created:
        Response.Redirect("projects.aspx");
    }


    }



