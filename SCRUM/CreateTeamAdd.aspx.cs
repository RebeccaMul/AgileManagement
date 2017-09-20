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

//Authors: Joshua Drake and Rebecca Mullholland 
public partial class CreateTeam : System.Web.UI.Page
{

    //RMU - This method includes the session for the page
    //It carries over the values and info selected on the CreateTeam page, and adds the relevant user to the relevant team in the database.
    //An email is also then sent to notify the user.
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


        //RMU - Connection to database
        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;

        SqlConnection myConnection = new SqlConnection(connectionString);

        myConnection.Open();

        //RMU - Getting userID from URL:
        int UserID = int.Parse(Request.QueryString["userID"]);

        //RMU - ProjectID needs inherited - will need to be changed
        int projectID = Convert.ToInt32(Request.QueryString["projectID"]);
        //int projectID = 1;

        // RMU - 1 for Default - Unassigned - Role needs to be allocated
        int roleID = 1;

        //RMU - SQL Insert Query
        string query = "INSERT INTO SCRUM_TEAM (projectID, UserID, roleID) VALUES ('" + projectID + "', '" + UserID + "', '" + roleID + "')";

        //JD - Initialize a new instance of the SqlCommand class
        SqlCommand myCommand = new SqlCommand(query, myConnection);

        //JD - Data Manipulation
        myCommand.ExecuteNonQuery();

        myConnection.Close();

        //JD - Initialising of strings. All requested from the URL
        string email = Request.QueryString["email"];
        string name = Request.QueryString["name"];
        string projectName = Request.QueryString["pName"];

        //JD - Parametrisation of strings
        myCommand.Parameters.AddWithValue("@email", email);
        myCommand.Parameters.AddWithValue("@name", name);
        myCommand.Parameters.AddWithValue("@projectName", projectName );


        email = @email;

        //JD- Mail message set-up

        MailMessage msg = new MailMessage();
        msg.From = new MailAddress("agiletester057@gmail.com");
        msg.To.Add(email);
        msg.Subject = "Scrum Team";
        msg.Body = "Hi " + @name + " You have been added to a team for project " + projectName;
        SmtpClient smt = new SmtpClient("smtp.gmail.com", 587);
        smt.Credentials = new System.Net.NetworkCredential("agiletester057@gmail.com", "(password)");
        smt.EnableSsl = true;
        smt.Send(msg);
        

        string projectid = Request.QueryString["projectID"];
        string projectname = Request.QueryString["pname"];


        //RMU- redirect query
       Response.Redirect("CreateTeam.aspx?projectid=" + projectid + "&projectname="+projectname);
    }
        
    }