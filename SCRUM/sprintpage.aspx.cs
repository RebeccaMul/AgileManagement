using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//Authors: Rebecca Mulholland & Barry Livingstone

public partial class projectlist : System.Web.UI.Page
{

    //RMU & BL - Page load method:
    //RMU - Databind the list of blocked tasks to make sure it's up to date, perform a count on the number of rows returned.
    //If the count is 0, null, or empty - hide the list, else if not empty, display it.
    protected void Page_Load(object sender, EventArgs e)
    {
        //BL - Session
        if (Session["user"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            string usern = Session["user"].ToString();
            username.Text = "" + usern + "";

        }

        //RMU - Databind the list of blocked tasks to make sure it's up to date, perform a count on the number of rows returned.
        //If the count is 0, null, or empty - hide the list, else if not empty, display it.
        displayBlocked.DataBind();
        int blockedTaskNum = Convert.ToInt32(displayBlocked.Items.Count());

        if (blockedTaskNum == 0 || blockedTaskNum == null)
        {
            BlockList.Visible = false;
        }
        else if (blockedTaskNum > 0 || blockedTaskNum != null)
        {
            BlockList.Visible = true;
        }

    }




}
