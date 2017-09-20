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

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
protected void setsession_Click(object sender, EventArgs e)// method to search the user database, if user is present session variables are set.
    {
        //pass login info
        string user = userdata.Text;
        string pass = passdata.Text;
        
        //connection to db
        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(connectionString);

        myConnection.Open();

        string query = "SELECT * FROM [SCRUM_USERS] WHERE username=@username AND password=@password";
        SqlCommand myCommand = new SqlCommand(query, myConnection);

        myCommand.Parameters.AddWithValue("@username", user);
        myCommand.Parameters.AddWithValue("@password", pass);
        

        SqlDataReader rdr = myCommand.ExecuteReader();
        //if database contains username and pasword it will then assign session variables which can be used by other web pages
        if (rdr.HasRows)
        {
            while(rdr.Read())
            {
                string myname = rdr["username"].ToString();

                string myuserid = rdr["userid"].ToString();
                string productowner = rdr["productOwner"].ToString();
                string scrummaster = rdr["scrumMaster"].ToString();
                string developer = rdr["developer"].ToString();

                //set the sesttion to username
                Session["user"] = myname;
                Session["userid"]=myuserid;
                Session["productowner"] = productowner;
                Session["scrummaster"] = scrummaster;
                Session["developer"] = developer;
                //Session["accounttype"] = myaccounttype;

                Response.Redirect("default.aspx");
            }
        }
            else
            {
            Response.Redirect("login.aspx");
            }

        }
}