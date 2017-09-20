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

//Author: Rebecca Mulholland / RMU

public partial class ManageTeam : System.Web.UI.Page
{

    //RMU - Page Load Method: 
    //Session variable & redirect
    //Also takes the values from the URL (carried from CreateTeam page) and deletes the relevant user out of the Team table in Database
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

        //Updating Team Member Role:
        //DB:
        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;

        SqlConnection myConnection = new SqlConnection(connectionString);

        myConnection.Open();

        //Getting userID from URL:
        int UserID = int.Parse(Request.QueryString["userID"]);

        string query = "DELETE FROM SCRUM_TEAM WHERE userID = @ID";

        SqlCommand myCommand = new SqlCommand(query, myConnection);

        myCommand.Parameters.AddWithValue("@ID", UserID);

        myCommand.ExecuteNonQuery();

        myConnection.Close();

        Response.Redirect("Teams.aspx");

    }
}