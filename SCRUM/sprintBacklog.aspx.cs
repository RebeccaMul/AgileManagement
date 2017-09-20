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

//Author: Rebecca Mulholland

public partial class addSprint : System.Web.UI.Page
{

    //RMU - Page Load Method: If a user is not logged in, they will be redirected to the login page. If a user is logged in, their session will be stored and their username placed in the relevant field on the front end.
    //If a user's account is a Scrum Master the page will load as normal, and if not a Scrum Master, they will be redirect to the sprints page.
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
            Response.Redirect("sprints.aspx");
        }

    }

 
}