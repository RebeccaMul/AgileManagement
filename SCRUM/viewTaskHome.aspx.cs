using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class viewTaskHome : System.Web.UI.Page
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
    }
    protected void week1Btn_Click(object sender, EventArgs e)
    {
        Response.Redirect("viewTask.aspx?&projectID=" + Request.QueryString["projectid"].ToString() + "&backlogID=" + Request.QueryString["backlogID"].ToString() + "&SprintID=" + Request.QueryString["sprintID"].ToString() + "&WeekID=1");


    }
    protected void week2Btn_Click(object sender, EventArgs e)
    {
        Response.Redirect("viewTask.aspx?&projectID=" + Request.QueryString["projectid"].ToString() + "&backlogID=" + Request.QueryString["backlogID"].ToString() + "&SprintID=" + Request.QueryString["sprintID"].ToString() + "&WeekID=2");
    }
    protected void week3Btn_Click(object sender, EventArgs e)
    {
        Response.Redirect("viewTask.aspx?&projectID=" + Request.QueryString["projectid"].ToString() + "&backlogID=" + Request.QueryString["backlogID"].ToString() + "&SprintID=" + Request.QueryString["sprintID"].ToString() + "&WeekID=3");
    }
    protected void week4Btn_Click(object sender, EventArgs e)
    {
        Response.Redirect("viewTask.aspx?&projectID=" + Request.QueryString["projectid"].ToString() + "&backlogID=" + Request.QueryString["backlogID"].ToString() + "&SprintID=" + Request.QueryString["sprintID"].ToString() + "&WeekID=4");
    }
}