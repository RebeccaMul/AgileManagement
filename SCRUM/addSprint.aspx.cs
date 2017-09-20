//author: James

using System;//declaring namespaces
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Drawing;

public partial class addSprint : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        startdate.Text = "";
        enddate.Text = "";

        if (Session["user"] == null)
        {
            Response.Redirect("login.aspx");
        }

        else if ((Convert.ToInt32(Session["scrummaster"]) != 1)) 
        {
            Response.Redirect("sprints.aspx");
        }
        else
        {
            string usern = Session["user"].ToString();
            username.Text = "" + usern + "";

        }

        

    }

    protected void addsprint_Click(object sender, EventArgs e)//this method adds new sprint information into database linking to Project
    {
        //create connection to database
        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(connectionString);

        // myConnection.ConnectionString is now set to connectionString.
        myConnection.Open();

        string sStart = startdate.Text;
        string sEnd = enddate.Text;
        string sDays = days.Text;
        string pvalue = Request.QueryString["projectID"];
        //adding the sprint to the database assigning the correct projectID also
        string query = "INSERT INTO SCRUM_SPRINT (sprintStartDate,sprintEndDate, sprintNoOfDays, project) VALUES ( @start, @end, @days, @projectName)";

        SqlCommand myCommand = new SqlCommand(query, myConnection);

        myCommand.Parameters.AddWithValue("@start", sStart);
        myCommand.Parameters.AddWithValue("@end", sEnd);
        myCommand.Parameters.AddWithValue("@days", sDays);
        myCommand.Parameters.AddWithValue("@projectName", pvalue);


        myCommand.ExecuteNonQuery();
        myConnection.Close();

        //reset fields and calendars within addSprint page once a sprint has been created
        enddate.Text = "";
        startdate.Text = "";
        days.Text = "";
        Calendar1.SelectedDates.Clear();
        Calendar2.SelectedDates.Clear();

        
        addLabel.Text = "Add Sprint Complete";

    }
    protected void Calendar1_DayRender(object sender, System.Web.UI.WebControls.DayRenderEventArgs e)
    {
        //method to disable previous dates than the current day
        DateTime pastday = e.Day.Date;
        DateTime date = DateTime.Now;
        int year = date.Year;
        int month = date.Month;
        int day = date.Day;
        DateTime today = new DateTime(year, month, day);
        if (pastday.CompareTo(today) < 0)
        {
            e.Cell.BackColor = System.Drawing.Color.LightGray;
            e.Day.IsSelectable = false;
        }
        else
        {

            startdate.Text = Calendar1.SelectedDate.ToString("MM/dd/yyyy");
        }
        
    }
    protected void Calendar2_DayRender(object sender, System.Web.UI.WebControls.DayRenderEventArgs e)
    {
        //method to disable previous dates than the current day
        DateTime pastday = e.Day.Date;
        DateTime date = DateTime.Now;
        int year = date.Year;
        int month = date.Month;
        int day = date.Day;
        DateTime today = new DateTime(year, month, day);
        if (pastday.CompareTo(today) < 0)
        {
            e.Cell.BackColor = System.Drawing.Color.LightGray;
            e.Day.IsSelectable = false;
        }
        else
        {

         enddate.Text = Calendar2.SelectedDate.ToString("MM/dd/yyyy");  
        }
       
    }
    protected void cancelsprint_Click(object sender, EventArgs e)
    {
        //cancel button to redirect user to previous page
        Response.Redirect("projectlist.aspx?projectID=" + Request.QueryString["projectID"]);
    }
}