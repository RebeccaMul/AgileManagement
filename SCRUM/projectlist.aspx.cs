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

//Authors: Eugelito Troyo & Barry Livingstone
public partial class projectlist : System.Web.UI.Page
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
            addBtn.Visible = false;

        }
        if ((Convert.ToInt32(Session["productOwner"]) == 1))
        {
            addBtn.Visible = true;
        }


    }
    // ET - Add user story page, and carrying the project into the next page.
    protected void addBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("addBacklog.aspx?projectID=" + Request.QueryString["projectID"]);
    }
    // ET - view user story and carrying the project into the next page.
    protected void viewBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("viewBacklog.aspx?projectID=" + Request.QueryString["projectID"]);
    }
    protected void newSprintBTN_Click(object sender, EventArgs e)
    {
        Response.Redirect("addsprint.aspx?projectID=" + Request.QueryString["projectID"]);

    }

    //BL - Updating SCRUM_BACKLOG
    public void updateRecord(string backlogID, int sortOrder)
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(connectionString);

        myConnection.Open();

        string query = "UPDATE SCRUM_BACKLOG SET sort_order = @sort_order WHERE ID = @id";
        SqlCommand myCommand = new SqlCommand(query, myConnection);

        myCommand.Parameters.AddWithValue("@id", backlogID);
        myCommand.Parameters.AddWithValue("@sort_order", sortOrder);

    }
}

    


