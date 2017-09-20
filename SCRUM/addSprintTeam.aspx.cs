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

public partial class addSprintTeam : System.Web.UI.Page
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
}


/*        //Adding Team Member:
        //DB:
        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;

        SqlConnection myConnection = new SqlConnection(connectionString);

        myConnection.Open();

        //Getting userID from URL:
        int UserID = int.Parse(Request.QueryString["userID"]);

        //** ProjectID needs inherited - will need to be changed
        int projectID = Convert.ToInt32(Request.QueryString["projectID"]);
        //int projectID = 1;

        //1 for Default - Unassigned - Role needs to be allocated
        int roleID = 1;

     //   string query = "INSERT INTO SCRUM_SPRINT(sprintID, sprintTeam, User) VALUES ('" + sprintID + "', '" + User)";

        SqlCommand myCommand = new SqlCommand(query, myConnection);

        myCommand.ExecuteNonQuery();

        myConnection.Close();

        string email = Request.QueryString["email"];
        string name = Request.QueryString["name"];
        string sprintName = Request.QueryString["sName"];
       
        myCommand.Parameters.AddWithValue("@email", email);
        myCommand.Parameters.AddWithValue("@name", name);
        myCommand.Parameters.AddWithValue("@sprintName", sprintName );


        email = @email;

        MailMessage msg = new MailMessage();
        msg.From = new MailAddress("agiletester057@gmail.com");
        msg.To.Add(email);
        msg.Subject = "Sprint Team Notification";
        msg.Body = "Hi " + @name + " You have been added to a sprint team " + sprintName;
        SmtpClient smt = new SmtpClient("smtp.gmail.com", 587);
        smt.Credentials = new System.Net.NetworkCredential("agiletester057@gmail.com", "(password)");
        smt.EnableSsl = true;
        smt.Send(msg);


       Response.Redirect("addSprint.aspx");
    }
}*/