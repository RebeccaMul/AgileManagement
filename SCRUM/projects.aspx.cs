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

    }

    protected void newProjectBTN_Click(object sender, EventArgs e)
    {


        Response.Redirect("Create_Project.aspx");


    }
}