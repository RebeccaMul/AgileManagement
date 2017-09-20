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

// Authors: Josh Drake, Barry Livingstone and James Crozier
public partial class planningPokerEst : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void InsertPokerBTN_Click(object sender, EventArgs e)
    {
        
            string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection myConnection = new SqlConnection(connectionString);

            // JC-  myConnection.ConnectionString is now set to connectionString.
            myConnection.Open();

            //JD & BL & JC- Initialising strings for parametrisation. The sTeamMembers string relates to a selected value from a dropdown menu.  
            string sTeamMembers = teamMembers.SelectedValue;
            string sPokerValue = pokerValue.Text;
            string sdesc = description.Text;
            string pvalue = Request.QueryString["projectID"];
            string bvalue = Request.QueryString["backlogID"];
            string svalue = Request.QueryString["sprintID"];

            //JD & BL- Query to update planning poker db. Query inserts the values selected by the user (on the aspx page) into the SCRUM_PLANING_POKER table which is then used to display the results to the scrum master (on a different page) to help with planning poker. 
            string query = "INSERT INTO SCRUM_PLANING_POKER (Name, Story_Est, [Desc], projectID, backlogID, sprintID) VALUES (@Name, @Story_Est, @Desc, @projectID, @backlogID, @sprintID)";

            SqlCommand myCommand = new SqlCommand(query, myConnection);

            //JD & BL- Parametrisation of string vales  . 
            myCommand.Parameters.AddWithValue("@Name", sTeamMembers);
            myCommand.Parameters.AddWithValue("@Story_Est", sPokerValue);
            myCommand.Parameters.AddWithValue("@Desc", sdesc);
            myCommand.Parameters.AddWithValue("@projectID", pvalue);
            myCommand.Parameters.AddWithValue("@backlogID", bvalue);
            myCommand.Parameters.AddWithValue("@sprintID", svalue);
            
            myCommand.ExecuteNonQuery();

            //JD & BL- Connection closed. 
            myConnection.Close();

            status.Text = "Value Submitted";

            
           
            description.Text = "";

        //JD & BL - Code to refresh the page. Whenever the page is refreshed the users name should now be removed from the dropdown menu meaning that a team member can only submit one estimate for each story point. The sprintID backlogID and projectID need to be carried over as query strings in the URL to ensure the page reload is for the same task. 
            Response.Redirect("planningPokerEst.aspx?projectID=" + Request.QueryString["projectID"].ToString() + "&backlogID=" + Request.QueryString["backlogID"].ToString() + "&sprintID=" + Request.QueryString["sprintID"].ToString());
        
    }
}