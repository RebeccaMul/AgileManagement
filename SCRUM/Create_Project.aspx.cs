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
    }

    //Barry - Inserting into SCRUM_PROJECT. 
    protected void ProjectButton_Click(object sender, EventArgs e)
    {

        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(connectionString);

        //Barry  myConnection.ConnectionString is now set to connectionString.
        myConnection.Open();

        //Barry - Textboxes
        string projectname = projectName.Text;
        string projectmanager = Session["userid"].ToString();
        string projectdesc = projectDesc.Text;
        string projectdate = projectDate.Text;

        //Barry - Project manager is inserted as logged in user - ProductOwner = 0 as no longer needed
        string query = "INSERT INTO [SCRUM_PROJECT] (projectName, productOwner, projectManager, projectDesc, projectDate) VALUES(@projectName, '0', @projectManager, @projectDesc, @projectDate);";

        SqlCommand myCommand = new SqlCommand(query, myConnection);

        //Barry - Create a parameterised object
        myCommand.Parameters.AddWithValue("@projectName", projectname);
        myCommand.Parameters.AddWithValue("@projectManager", projectmanager);
        myCommand.Parameters.AddWithValue("@projectDesc", projectdesc);
        myCommand.Parameters.AddWithValue("@projectDate", projectdate);

        myCommand.ExecuteNonQuery();

        myConnection.Close();

        //RMU - Redirecting to second page in order to create a team for the project
        Response.Redirect("Create_Project2.aspx?ProjectName=" + projectname + "&projectManager=" + projectmanager);

        done.Text = "Project Added";
    }

    //Barry - Calender. Inserts into textbox 
    protected void Calendar1_DayRender(object sender, System.Web.UI.WebControls.DayRenderEventArgs e)
    {

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

            projectDate.Text = Calendar1.SelectedDate.ToString("MM/dd/yyyy");
        }

    }

    protected void cancelsprint_Click(object sender, EventArgs e)
    {
        //Barry - Cancel button to redirect user to previous page
        Response.Redirect("projectlist.aspx?projectID=" + Request.QueryString["projectID"]);
    }

}



