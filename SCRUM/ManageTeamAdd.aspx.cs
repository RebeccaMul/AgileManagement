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

//Authors: Rebecca Mulholland & Josh Drake

public partial class ManageTeam : System.Web.UI.Page
{

    //RMU - Page Load Method: If a user is not logged in, they will be redirected to the login page. 
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
        }


    }

    //RMU - UpdateBtn_Click Method:
    //This method collects values from URL and the Selected Role from the dropdown list. It then determines if a team member should be automatically added to a sprint team via their role. Then stores this information in the Database (SCRUM_TEAM table)
    protected void UpdateBtn_Click(object sender, EventArgs e)
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;

        SqlConnection myConnection = new SqlConnection(connectionString);

        myConnection.Open();

        string project = Request.QueryString["projectID"];
        int projectID = Convert.ToInt32(Request.QueryString["projectID"]);
        int UserID = int.Parse(Request.QueryString["userID"]);
        string name = Request.QueryString["firstname"];
        string email = Request.QueryString["email"];
        string roletitle = RoleList.SelectedItem.Text;
        string role = RoleList.SelectedValue;
        int RoleID = Convert.ToInt16(role);
        int inSprint;
        int newproductowner = 1;
        bool NewPO = false;

        //RMU - If role is a scrum master, project manager or product owner they automatically become a sprint member in the Database. All other roles are then made not sprint members, by setting the insprint value to 0 (false). 

        //Project Manager (role 2):
        if (role == "2")
        {
            inSprint = 1;
        }
        //Scrum Master (role 4):
        else if (role == "4")
        {
            inSprint = 1;
        }
        //Product Owner (role 5):
        else if (role == "5")
        {
            inSprint = 1;
            NewPO = true;

        }
        //All other roles
        else
        {
            inSprint = 0;
        }

        string query = "UPDATE SCRUM_TEAM SET roleID = @newroleid, sprintMember = @sprint WHERE userID = @id";

        if (NewPO == true)
        {
            string query2 = "UPDATE SCRUM_PROJECT SET productOwner = @newPO WHERE projectID = @id";
            string query3 = "UPDATE SCRUM_USERS SET productOwner = @One WHERE userID = @id";

            SqlCommand myCommand2 = new SqlCommand(query2, myConnection);
            SqlCommand myCommand3 = new SqlCommand(query3, myConnection);

            myCommand2.Parameters.AddWithValue("@newPO", UserID);
            myCommand2.Parameters.AddWithValue("@id", projectID);

            myCommand3.Parameters.AddWithValue("@One", newproductowner);
            myCommand3.Parameters.AddWithValue("@id", UserID);

            myCommand2.ExecuteNonQuery();
            myCommand3.ExecuteNonQuery();
        }
        else { }

        SqlCommand myCommand = new SqlCommand(query, myConnection);


        myCommand.Parameters.AddWithValue("@newroleid", RoleID);

        myCommand.Parameters.AddWithValue("@id", UserID);

        myCommand.Parameters.AddWithValue("@sprint", inSprint);

        myCommand.ExecuteNonQuery();


        myConnection.Close();


        //RME Email set up to notify users when they are assigned a role.

        email = @email;
        MailMessage msg = new MailMessage();
        msg.From = new MailAddress("agiletester057@gmail.com");
        msg.To.Add(email);
        msg.Subject = "Scrum Role";
        msg.Body = "Hi " + @name + " You have been asssigned the role as " + @roletitle;
        SmtpClient smt = new SmtpClient("smtp.gmail.com", 587);
        smt.Credentials = new System.Net.NetworkCredential("agiletester057@gmail.com", "(password)");
        smt.EnableSsl = true;
        smt.Send(msg);

        //RMU- Redirect back with relevant project ID (required for page to load correctly)
        Response.Redirect("ManageTeam.aspx?projectID=" + project);
    }
}