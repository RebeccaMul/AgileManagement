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


public partial class register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void registerbutton_Click(object sender, EventArgs e)//register method is called to add new user to the database
    {
        //image upload
        string UpPath = Server.MapPath("../files/");

        if (!Directory.Exists(UpPath))
        {
            myinfo.Text = UpPath + " folder does not exist";
        }

        Random r = new Random();
        int rInt = r.Next(0, 10000);

        int imgSize = FileUpload1.PostedFile.ContentLength;

        string imgName = FileUpload1.FileName;
        string imgPath = "../files/" + rInt + imgName;

        if (FileUpload1.PostedFile.ContentLength > 10000000)
        {
            Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('File is too big.')", true);
        }
        else
        {
            // JC - then save it to the folder
            FileUpload1.SaveAs(Server.MapPath(imgPath));

            string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection myConnection = new SqlConnection(connectionString);

            // JC - myConnection.ConnectionString is now set to connectionString.
            myConnection.Open();

            string img = "../files/" + rInt + FileUpload1.FileName;


            string accountfirstname = firstname.Text;
            string accountlastname = lastname.Text;

            string accountusername = username1.Text;
            string accountpassword = password.Text;
            string accountemail = email.Text;
            string userskillset = skillset.Text;

            int productownerdata = Convert.ToInt16(accountproductowner.SelectedValue);
            int scrummasterdata = Convert.ToInt16(accountscrummaster.SelectedValue);
            int developerdata = Convert.ToInt16(accountdeveloper.SelectedValue);
            
            //JC - insert new user information into the database
            string query = "INSERT INTO [SCRUM_USERS] (firstName, lastName, username, password, email, productOwner, scrumMaster, developer, imagepath, skillset) VALUES(@firstname, @lastname, @username,@password, @email, @productowner, @scrummaster, @developer,@image,@skill)";

            SqlCommand myCommand = new SqlCommand(query, myConnection);
            //JC - create a parameterised object

            myCommand.Parameters.AddWithValue("@firstname", accountfirstname);
            myCommand.Parameters.AddWithValue("@lastname", accountlastname);
            myCommand.Parameters.AddWithValue("@username", accountusername);
            myCommand.Parameters.AddWithValue("@password", accountpassword);
            myCommand.Parameters.AddWithValue("@email", accountemail);
            myCommand.Parameters.AddWithValue("@productowner", productownerdata);
            myCommand.Parameters.AddWithValue("@scrummaster", scrummasterdata);
            myCommand.Parameters.AddWithValue("@developer", developerdata);
            myCommand.Parameters.AddWithValue("@image", img);
            myCommand.Parameters.AddWithValue("@skill", userskillset);

            myCommand.ExecuteNonQuery();

            myConnection.Close();
            //JC - display the users username to allow them to log onto the website
            registerLabel.Text = "You are now registered: " + "<b>" + accountfirstname + " " + accountlastname + "." + "</b>" + "\n Please log in using your username: " + "<b>" + accountusername + "</b>" + ".";
            registerbutton.Visible = false;
          
        }
    }


}