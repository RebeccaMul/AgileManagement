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

public partial class addSprint : System.Web.UI.Page
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

        if ((Convert.ToInt32(Session["scrummaster"]) == 1))
        {

        }

        else
        {

        }

        



   // ET - Set up of email system, notifies user if they've been added to sprint team.

        
        
        //Rachael code for adding developer to sprint
        //DB:
        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;

        SqlConnection myConnection = new SqlConnection(connectionString);

        myConnection.Open();

        //UserID & add to sprint
        int UserID = int.Parse(Request.QueryString["userID"]);
        int inSprint = 1;

        string query = "UPDATE SCRUM_TEAM SET sprintMember = @sprint WHERE userID = @id";

        SqlCommand myCommand = new SqlCommand(query, myConnection);

        myCommand.Parameters.AddWithValue("@id", UserID);

        myCommand.Parameters.AddWithValue("@sprint", inSprint);

        myCommand.ExecuteNonQuery();

        myConnection.Close();

        string email = Request.QueryString["email"];
        string name = Request.QueryString["name"];
  

        myCommand.Parameters.AddWithValue("@email", email);
        myCommand.Parameters.AddWithValue("@name", name);
        


        email = @email;

        // ET - Email setup

        MailMessage msg = new MailMessage();
        msg.From = new MailAddress("agiletester057@gmail.com");
        msg.To.Add(email);
        msg.Subject = "Sprint Team Notification";
        msg.Body = "Hi " + @name + " You have been added to a sprint team ";
        SmtpClient smt = new SmtpClient("smtp.gmail.com", 587);
        smt.Credentials = new System.Net.NetworkCredential("agiletester057@gmail.com", "(password)");
        smt.EnableSsl = true;
        smt.Send(msg);

        string projectid = Request.QueryString["projectID"];
     


        Response.Redirect("SprintDevelopers.aspx?projectid=" + projectid);
    }

}
