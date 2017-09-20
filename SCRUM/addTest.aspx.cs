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
public partial class viewBacklog : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        // ET - Use QueryString to navigate on ID using specific backlogID.
        if (!IsPostBack)
        {


            int row = 0;
            if (Request.QueryString["backlogID"] != null)
            {
                row = int.Parse(Request.QueryString["backlogID"]);

            }
            else
            {
                Response.Redirect("projectlist.aspx");
                string user = Session["user"].ToString();

            }

            string projectId = Request.QueryString["projectID"];

            if ((Convert.ToInt32(Session["productOwner"]) == 1))
            {
            }
            else
            {
                // If not Products, user is brought back to sprints page
                Response.Redirect("projectlist.aspx?ProjectID=" + projectId);
            }

            //ET - set-up object to use the web.config file
            string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection myConnection = new SqlConnection(connectionString);

            myConnection.Open();

            //ET - Retrieving data from SCRUM_BACKLOG table.

            string query = "SELECT * FROM SCRUM_BACKLOG WHERE ID=@rowid";

            SqlCommand myCommand = new SqlCommand(query, myConnection);

            myCommand.Parameters.AddWithValue("@rowid", row);

            SqlDataReader rdr = myCommand.ExecuteReader();


            //ET - Displays data from database

            while (rdr.Read())
            {

                string sAsText = rdr["asUser"].ToString();
                string sIwanttext = rdr["iWant"].ToString();
                string sSothattext = rdr["soThat"].ToString();
                
             
                astext.Text = sAsText;
                iwanttext.Text = sIwanttext;
                sothattext.Text = sSothattext;
             
               
            }

        }
    }

   // ET - Submit Button Event, updates details of SCRUM_BACKLOG table.

    protected void submitBtn_Click(object sender, EventArgs e)
    {
       string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(connectionString);

  
        myConnection.Open();
        
            
          
        int row = int.Parse(Request.QueryString["backlogID"]);
        string test = AcceptanceTest.Text;
       

        string query = "INSERT INTO SCRUM_TEST (backlogID, testDetails) VALUES (@id, @newTest)";

       SqlCommand myCommand = new SqlCommand(query, myConnection);


        myCommand.Parameters.AddWithValue("@newTest", test);


        myCommand.Parameters.AddWithValue("@id", row);

        myCommand.ExecuteNonQuery();

        myConnection.Close();

        viewLabel.Text = "User acceptance test has been added";
 
        
       
    }

}

   