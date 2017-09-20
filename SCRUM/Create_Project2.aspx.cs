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

            //
            string projectName = Request.QueryString["projectName"];
            int projectManager = Convert.ToInt32(Request.QueryString["projectManager"]);

            //RMU - DB Connection:
            string connectionString = WebConfigurationManager.ConnectionStrings
                ["dbconnect"].ConnectionString;

            SqlConnection myConnection = new SqlConnection(connectionString);

            myConnection.Open();

            string query = "SELECT * FROM SCRUM_PROJECT WHERE projectName=@Name AND projectManager=@PM";

            SqlCommand myCommand = new SqlCommand(query, myConnection);

            myCommand.Parameters.AddWithValue("@Name", projectName);
            myCommand.Parameters.AddWithValue("@PM", projectManager);

            SqlDataReader rdr = myCommand.ExecuteReader();

            string projectID;

            while (rdr.Read())
            {
                projectID = rdr["projectID"].ToString();
                projectIDbox.Text = projectID;

                //RMU - Redirecting with all project information to create a project team:
                Response.Redirect("Create_ProjectTeam.aspx?ProjectName=" + projectName + "&projectManager=" + projectManager + "&ProjectID=" + projectID);
            }
   
        }


    }



