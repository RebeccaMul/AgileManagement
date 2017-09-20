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
public partial class viewTaskHours : System.Web.UI.Page
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
            if (monBox.Text == "0" || tuesBox.Text == "0" || wedBox.Text == "0" || thursBox.Text == "0" || friBox.Text == "0" || satBox.Text == "0" || sunBox.Text == "0")
            {
                taskLabel.Text = "The task has been completed.";
                addLabel.Visible = false;
            }
            else
            {
                
            }

            if (!IsPostBack)
            {
                ViewState["PreviousPage"] =
                Request.UrlReferrer;//Saves the Previous page url in ViewState

                int row = 0;
                if (Request.QueryString["taskID"] != null)
                {
                    row = int.Parse(Request.QueryString["taskID"]);

                }
                else
                {
                    Response.Redirect("viewTask.aspx");
                    string user = Session["user"].ToString();

                }

                //ET - set-up object to use the web.config file
                string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
                SqlConnection myConnection = new SqlConnection(connectionString);

                myConnection.Open();

                //ET - Retrieving data from SCRUM_BACKLOG table.

                string query = "SELECT * FROM SCRUM_SPRINT_TASK WHERE taskID=@rowid";

                SqlCommand myCommand = new SqlCommand(query, myConnection);

                myCommand.Parameters.AddWithValue("@rowid", row);

                SqlDataReader rdr = myCommand.ExecuteReader();


                //ET - Displays data from database

                while (rdr.Read())
                {

                    string sWeek = rdr["week"].ToString();
                    string sEstTime = rdr["estTime"].ToString();
                    string sMon = rdr["mon"].ToString();
                    string sTues = rdr["tues"].ToString();
                    string sWed = rdr["wed"].ToString();
                    string sThurs = rdr["thurs"].ToString();
                    string sFri = rdr["fri"].ToString();
                    string sSat = rdr["sat"].ToString();
                    string sSun = rdr["sun"].ToString();

                    weekBox.Text = sWeek;
                    esttimeBox.Text = sEstTime;
                    monBox.Text = sMon;
                    tuesBox.Text = sTues;
                    wedBox.Text = sWed;
                    thursBox.Text = sThurs;
                    friBox.Text = sFri;
                    satBox.Text = sSat;
                    sunBox.Text = sSun;
                }
            }
        }
    }

    
protected void addHoursBtn_Click(object sender, EventArgs e)
{
    string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
    SqlConnection myConnection = new SqlConnection(connectionString);

    // myConnection.ConnectionString is now set to connectionString.
    myConnection.Open();

    string sWeekUpdate = weekBox.Text;
    string sEstTimeUpdate = esttimeBox.Text;
    string sMonUpdate = monBox.Text;
    string sTuesUpdate = tuesBox.Text;
    string sWedUpdate = wedBox.Text;
    string sThursUpdate = thursBox.Text;
    string sFriUpdate = friBox.Text;
    string sSatUpdate = satBox.Text;
    string sSunUpdate = sunBox.Text;
    int row = int.Parse(Request.QueryString["taskID"]);
  
    // ET - Inserts values of Backlog into Table.
    string query = "UPDATE SCRUM_SPRINT_TASK SET week = @newWeek, estTime = @newEstTime, mon = @newMon, tues = @newTues, wed = @newWed, thurs = @newThurs, fri = @newFri, sat = @newSat, sun = @newSun  WHERE taskID = @id";

    SqlCommand myCommand = new SqlCommand(query, myConnection);

    myCommand.Parameters.AddWithValue("@newWeek", sWeekUpdate);
    myCommand.Parameters.AddWithValue("@newEstTime", sEstTimeUpdate);
    myCommand.Parameters.AddWithValue("@newMon", sMonUpdate);
    myCommand.Parameters.AddWithValue("@newTues", sTuesUpdate);
    myCommand.Parameters.AddWithValue("@newWed", sWedUpdate);
    myCommand.Parameters.AddWithValue("@newThurs", sThursUpdate);
    myCommand.Parameters.AddWithValue("@newFri", sFriUpdate);
    myCommand.Parameters.AddWithValue("@newSat", sSatUpdate);
    myCommand.Parameters.AddWithValue("@newSun", sSunUpdate);
    myCommand.Parameters.AddWithValue("@id", row);
    myCommand.ExecuteNonQuery();
    myConnection.Close();

   
    addLabel.Text = "The hours for the task has now been updated.";
 
}
protected void backtoSprintPage_Click(object sender, EventArgs e)
{
    if (ViewState["PreviousPage"] != null)	//Check if the ViewState 
						//contains Previous page URL
        {
            Response.Redirect(ViewState["PreviousPage"].ToString());//Redirect to 
		//Previous page by retrieving the PreviousPage Url from ViewState.
        }
    }

}
