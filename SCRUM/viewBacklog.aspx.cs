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

//Authors: Eugelito Troyo & Sarah Mooney
public partial class viewBacklog : System.Web.UI.Page
{

    //ET - Developers prevented from accessing page.
    protected void Page_Load(object sender, EventArgs e)
    {


        if ((Convert.ToInt32(Session["scrummaster"]) == 1) || (Convert.ToInt32(Session["productOwner"]) == 1))
        {
            string usern = Session["user"].ToString();
            username.Text = "" + usern + "";
        }
        else if ((Convert.ToInt32(Session["developer"]) == 1))
        {
            //Response.Redirect("projectlist.aspx?projectID=" + Request.QueryString["projectID"]);
            Response.Redirect("projects.aspx");
        }

        //ET - Use QueryString to navigate on ID using specific backlogID.
        if (!IsPostBack)
        {

            storypoints.Enabled = false;
            valuetext.ReadOnly = true;
            ViewState["PreviousPage"] =
            Request.UrlReferrer;//Saves the Previous page url in ViewState

            int row = 0;
            if (Request.QueryString["viewbacklogID"] != null)
            {
                row = int.Parse(Request.QueryString["viewbacklogID"]);

            }
            else
            {
                Response.Redirect("projectlist.aspx");
                string user = Session["theuser"].ToString();

            }


            // SM - if scrum master you can view and edit story points

            if ((Convert.ToInt32(Session["scrummaster"]) == 1)) // 
            {

                storypoints.Enabled = true;


            }


            // SM - if product owner you can edit value 

            if ((Convert.ToInt32(Session["productOwner"]) == 1))
            {
                valuetext.ReadOnly = false;
            }


            //ET - set-up object to use the web.config file
            string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            SqlConnection myConnection = new SqlConnection(connectionString);

            myConnection.Open();

            //ET - Retrieving data from SCRUM_BACKLOG table to display.

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
                string sValuetext = rdr["value"].ToString();




                astext.Text = sAsText;
                iwanttext.Text = sIwanttext;
                sothattext.Text = sSothattext;
                valuetext.Text = sValuetext;

            }
        }
    }

    // ET - Submit Button Event, updates details of SCRUM_BACKLOG table.

    protected void submitBtn_Click(object sender, EventArgs e)
    {



        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(connectionString);


        myConnection.Open();

        string sValuetextupdate = valuetext.Text;
        // SM - initialising Storypoints
        string storypoint = storypoints.SelectedValue;
        int sp = Convert.ToInt32(storypoint);

        int row = int.Parse(Request.QueryString["viewbacklogID"]);


        // SM - SQL Insert Query (Storypoints) 
        string query = "UPDATE SCRUM_BACKLOG SET value = @newvalue, options = @options WHERE ID = @id";

        SqlCommand myCommand = new SqlCommand(query, myConnection);



        //SM - Paramtising Story Point value
        myCommand.Parameters.AddWithValue("@options", sp);
        myCommand.Parameters.AddWithValue("@newValue", sValuetextupdate);


        myCommand.Parameters.AddWithValue("@id", row);

        myCommand.ExecuteNonQuery();

        myConnection.Close();

        viewLabel.Text = "User Story has now been reordered on the product Backlog." + "\nStory point has now been assigned";
    }


    //ET - Check if the ViewState, contains Previous page URL
    //ET - Redirect to previous page by retrieving the PreviousPage Url from ViewState.
    protected void backtoViewTask_Click(object sender, EventArgs e)
    {
        if (ViewState["PreviousPage"] != null)
        {
            Response.Redirect(ViewState["PreviousPage"].ToString());
        }
    }
}

