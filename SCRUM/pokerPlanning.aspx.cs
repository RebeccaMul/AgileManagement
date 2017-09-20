using System;//declaring namespaces included class library for poker planning
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using caltools;

//calc.mean(arryval) method - This method pulls values from textbox and uses the space as a separator, the array is then passed to caltools method, using a loop the mean is calculated and returned 
//calc.max(arryval)  method - This method pulls values from textbox and uses the space as a separator, the array is then passed to caltools method, using a loop the max value is calculated and returned 
//calc.min(arryval)method - This method pulls values from textbox and uses the space as a separator, the array is then passed to caltools method, using a loop the min value is calculated and returned 
//calc.median(arryval)method - This method pulls values from textbox and uses the space as a separator, the array is then passed to caltools method, using a LINX method the median value is calculated and returned 
//calc.mode(arryval)method - This method pulls values from textbox and uses the space as a separator, the array is then passed to caltools method, using a loop the median value is calculated and returned 

using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

//Authors: James Crozier, Joshua Drake and Barry Livingstone  
public partial class pokerPlanning : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else if ((Convert.ToInt32(Session["scrummaster"]) != 1))
        {
            Response.Redirect("sprintpage.aspx?projectID=" + Request.QueryString["projectID"].ToString() + "&sprintID=" + Request.QueryString["sprintID"].ToString());

            
        }
        else
        {
            string usern = Session["user"].ToString();
            username.Text = "" + usern + "";
        }

    }
    protected void but_Click(object sender, EventArgs e)
    {
        //JC - When user clicks button all methods are called and returned from class library
        if (box.Text.Contains(' '))//checking for you are entered single value or multiple values  
        {
            string[] arryval = box.Text.Split(' ');// JC - split values with ‘space’  
            Calculator calc = new Calculator();//calls calculator

            lab.Text = calc.mean(arryval).ToString();// JC - all values get converted to string to be displayed
            labmax.Text = calc.max(arryval).ToString();
            labmin.Text = calc.min(arryval).ToString();
            labmedian.Text = calc.median(arryval).ToString();
            labmode.Text = calc.mode(arryval).ToString();
        }
    }
    protected void updateSP_Click(object sender, EventArgs e)
    {

        string connectionString = WebConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(connectionString);
        myConnection.Open();

        // Author: SM  Edited by: JD and BL and JC - initialising Storypoints
        string storypoint = storypoints.SelectedValue;
        int sp = Convert.ToInt32(storypoint);

        int row = int.Parse(Request.QueryString["backlogID"]);

        // Author: SM  Edited by: JD and BL and JC - Query to update the SCRUM_BACKLOG. Whenever the inputs have been selected by the user this query will update the options column of the table based on the id of the backlog. 
        string query = "UPDATE SCRUM_BACKLOG SET options = @options WHERE ID = @id";

        SqlCommand myCommand = new SqlCommand(query, myConnection);

        //SM - Paramtising Story Point value
        myCommand.Parameters.AddWithValue("@options", sp);
        
        myCommand.Parameters.AddWithValue("@id", row);

        myCommand.ExecuteNonQuery();

        myConnection.Close();
    }
}