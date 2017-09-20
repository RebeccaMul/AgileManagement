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

//Authors: Eugelito Troyo

public partial class editprofile : System.Web.UI.Page
{

    //ET - Pre-populate page with details of logged in user.
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            string usern = Session["user"].ToString();
            usernameLabel.Text = "" + usern + "";

        }

        if (!IsPostBack)
        {
            int row = 0;
            if (Request.QueryString["userid"] != null)
            {
                row = int.Parse(Request.QueryString["userid"]);
            }
            else
            {

            }

            string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection myConnection = new SqlConnection(connectionString);


            myConnection.Open();

            string query = "SELECT * FROM SCRUM_USERS WHERE userID=@rowid";
            SqlCommand myCommand = new SqlCommand(query, myConnection);

            myCommand.Parameters.AddWithValue("@rowid", row);

            SqlDataReader rdr = myCommand.ExecuteReader();

            while (rdr.Read())
            {
                string sFirstname = rdr["firstName"].ToString();
                string sLastname = rdr["lastName"].ToString();
                string sEmail = rdr["email"].ToString();
                string sUsername = rdr["username"].ToString();
                string sPassword = rdr["password"].ToString();
                string sSkillset = rdr["skillset"].ToString();
                string sImagepath = rdr["imagepath"].ToString();

                firstnameText.Text = sFirstname;
                lastnameText.Text = sLastname;
                emailText.Text = sEmail;
                usernameText.Text = sUsername;
                passwordText.Text = sPassword;
                skillsetText.Text = sSkillset;


            }

        }
    }

    //ET - Updates the details given of logged in user.
    protected void savechangesBtn_Click(object sender, EventArgs e)
    {
        {
            //ET - User ability to search for image.
            string UpPath = Server.MapPath("~/files");

            Random r = new Random();
            int rInt = r.Next(0, 10000);

            if (!Directory.Exists(UpPath))
            {
                Directory.CreateDirectory(UpPath);
                myinfo.Text = UpPath + " folder files does not exist";
            }
            else
            {
                int imgSize = myimage.PostedFile.ContentLength;
                string imgName = myimage.FileName;
                string imgPath = "~/files/" + rInt + imgName;

                if (myimage.PostedFile.ContentLength > 1500000)
                {
                    Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('File is too big.')",

    true);
                }
                else
                {

                    myimage.SaveAs(Server.MapPath(imgPath));

                }

                myinfo.Text = "file " + imgPath + " uploaded";
            }

            //ET - Updating details using SQL query.

            string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection myConnection = new SqlConnection(connectionString);


            myConnection.Open();

            string firstnameUpdate = firstnameText.Text;
            string lastnameUpdate = lastnameText.Text;
            string emailUpdate = emailText.Text;
            string usernameUpdate = usernameText.Text;
            string passwordUpdate = passwordText.Text;
            string skillsetUpdate = skillsetText.Text;
            string img = "../files/" + rInt + myimage.FileName;




            //New int row to string row.
            string row = Session["userid"].ToString();


            //ET - If no image selected do not update image, Else directed to next query with image update.

            if (img == rInt.ToString())
            {
                string query = "UPDATE [SCRUM_USERS] SET firstName = @newfirstname, lastName = @newlastname, username = @newusername, password=@newpassword, email=@newemail, skillset=@newskillset, WHERE userID = @id";


                SqlCommand myCommand = new SqlCommand(query, myConnection);

                myCommand.Parameters.AddWithValue("@newfirstname", firstnameUpdate);
                myCommand.Parameters.AddWithValue("@newlastname", lastnameUpdate);
                myCommand.Parameters.AddWithValue("@newusername", usernameUpdate);
                myCommand.Parameters.AddWithValue("@newpassword", passwordUpdate);
                myCommand.Parameters.AddWithValue("@newemail", emailUpdate);
                myCommand.Parameters.AddWithValue("@newskillset", skillsetUpdate);
                myCommand.Parameters.AddWithValue("@id", row);
                myCommand.ExecuteNonQuery();

                myConnection.Close();
                Response.Redirect("profile.aspx");
            }
            else
            {

                //ET - If image selected, update image.
                string query = "UPDATE [SCRUM_USERS] SET firstName = @newfirstname, lastName = @newlastname, username = @newusername, password=@newpassword, email=@newemail, skillset=@newskillset, imagepath=@newimage WHERE userID = @id";

                SqlCommand myCommand = new SqlCommand(query, myConnection);

                myCommand.Parameters.AddWithValue("@newfirstname", firstnameUpdate);
                myCommand.Parameters.AddWithValue("@newlastname", lastnameUpdate);
                myCommand.Parameters.AddWithValue("@newusername", usernameUpdate);
                myCommand.Parameters.AddWithValue("@newpassword", passwordUpdate);
                myCommand.Parameters.AddWithValue("@newemail", emailUpdate);
                myCommand.Parameters.AddWithValue("@newskillset", skillsetUpdate);
                myCommand.Parameters.AddWithValue("@newimage", img);
                myCommand.Parameters.AddWithValue("@id", row);


                myCommand.ExecuteNonQuery();

                myConnection.Close();
                Response.Redirect("profile.aspx");
            }
        }
    }

    //ET - Back to Profile.
    protected void cancelBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("profile.aspx");
    }
}