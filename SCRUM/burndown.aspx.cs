using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//Authors: Rebecca Mulholland / RMU

public partial class burndown : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //RMU - Session
        if (Session["user"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            string usern = Session["user"].ToString();
            username.Text = "" + usern + "";
        }
    }
}