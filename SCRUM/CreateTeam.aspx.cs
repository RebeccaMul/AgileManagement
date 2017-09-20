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

//Author: Rebecca Mulholland / RMU

public partial class CreateTeam : System.Web.UI.Page
{

    //RMU - Page load method:
    //Session variable stored
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
            string projectIDquery = Request.QueryString["projectID"];
            TextBox1.Text = projectIDquery;
        }

    }

    //RMU - Searchbtn_Click method:
    //Takes the value entered into the search bar, and redirects back to the createTeam page with the relevant details & search query in the URL (in order to display results)
    protected void Searchbtn_Click(object sender, EventArgs e)
    {
        String stext = searchtitle.Text;

        Response.Redirect("CreateTeam.aspx?searchquery=" + stext + "&projectid=" + Request.QueryString["projectID"] + "&projectname=" + Request.QueryString["projectName"]);
        //    SearchResults.Visible = true;

    }


}
