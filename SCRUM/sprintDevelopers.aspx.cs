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

public partial class addSprint : System.Web.UI.Page
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

        if ((Convert.ToInt32(Session["scrummaster"]) == 1))
        {

        }

        else
        {
            Response.Redirect("sprintpage.aspx?sprintID=" + Request.QueryString["sprintID"] + "&projectid=" + Request.QueryString["projectID"]);
        }

        
    }
    protected void Searchbtn_Click(object sender, EventArgs e)
    {
        String stext = searchskill.Text;

        Response.Redirect("sprintDevelopers.aspx?searchquery=" + stext + "&projectid=" + Request.QueryString["projectID"] );
        //    SearchResults.Visible = true;

    }  
}