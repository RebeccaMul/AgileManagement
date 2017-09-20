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

public partial class addBacklog : System.Web.UI.Page
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
        //ET - If user is product owner access, if not redirect to projects. 
        if ((Convert.ToInt32(Session["productowner"]) == 1))
        {

        }

        else
        {
            Response.Redirect("projects.aspx");
        }
        // ET - Saves the Previous page url in ViewState
        if (!IsPostBack)
        {
            ViewState["PreviousPage"] =
            Request.UrlReferrer;

        }
    }

    //ET - Adding user story to product backlog.
    protected void addBacklogBtn_Click(object sender, EventArgs e)
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(connectionString);

        myConnection.Open();

        string sAsText = asText.Text;
        string sIWant = iWantText.Text;
        string sSoThat = soThatText.Text;
        string sValue = valueText.Text;
        string sProject = Request.QueryString["projectID"];
        int optionID = 11;

        //ET - Inserts values of data, into db table.
        string query = "INSERT INTO SCRUM_BACKLOG (asUser,iWant, soThat, value, projectID, options) VALUES (@asUser, @iWant, @soThat, @value, @project, @option)";

        SqlCommand myCommand = new SqlCommand(query, myConnection);

        myCommand.Parameters.AddWithValue("@asUser", sAsText);
        myCommand.Parameters.AddWithValue("@iWant", sIWant);
        myCommand.Parameters.AddWithValue("@SoThat", sSoThat);
        myCommand.Parameters.AddWithValue("@value", sValue);
        myCommand.Parameters.AddWithValue("@option", optionID);
        myCommand.Parameters.AddWithValue("@project", sProject);

        myCommand.ExecuteNonQuery();
        myConnection.Close();


        //ET - Empty textbox, once submitted.
        asText.Text = "";
        iWantText.Text = "";
        soThatText.Text = "";
        valueText.Text = "";

        addLabel.Text = "Added to Backlog";

    }

    //ET - Check if the ViewState, contains Previous page URL
    //ET - Redirect to previous page by retrieving the PreviousPage Url from ViewState.
    protected void backtoProject_Click(object sender, EventArgs e)
    {

        if (ViewState["PreviousPage"] != null)
        {

            Response.Redirect(ViewState["PreviousPage"].ToString());
        }
    }
}
