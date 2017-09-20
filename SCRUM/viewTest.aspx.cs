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
                string user = Session["theuser"].ToString();

            }

            string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection myConnection = new SqlConnection(connectionString);

            myConnection.Open();

            

            string query = "SELECT * FROM SCRUM_BACKLOG WHERE ID=@rowid";

            SqlCommand myCommand = new SqlCommand(query, myConnection);

            myCommand.Parameters.AddWithValue("@rowid", row);

            SqlDataReader rdr = myCommand.ExecuteReader();



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

}

   