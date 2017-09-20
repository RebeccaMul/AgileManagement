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
using System.Configuration;
using System.Drawing;

//Author: Rebecca Mulholland / RMU

public partial class burndownpage : System.Web.UI.Page
{
    //RMU - Week 1-4 Weekday values - used later for weekly calculations
    int monTotal1 = 0; int tuesTotal1 = 0; int wedTotal1 = 0; int thursTotal1 = 0; int friTotal1 = 0; int satTotal1 = 0; int sunTotal1 = 0;
    //RMU - week 2 values:
    int monTotal2 = 0; int tuesTotal2 = 0; int wedTotal2 = 0; int thursTotal2 = 0; int friTotal2 = 0; int satTotal2 = 0; int sunTotal2 = 0;
    //RMU - week 3 values:
    int monTotal3 = 0; int tuesTotal3 = 0; int wedTotal3 = 0; int thursTotal3 = 0; int friTotal3 = 0; int satTotal3 = 0; int sunTotal3 = 0;
    //RMU - week 4 values:
    int monTotal4 = 0; int tuesTotal4 = 0; int wedTotal4 = 0; int thursTotal4 = 0; int friTotal4 = 0; int satTotal4 = 0; int sunTotal4 = 0;
    //RMU total values:
    int mondayTotal = 0; int tuesdayTotal = 0; int wednesdayTotal = 0; int thursdayTotal = 0; int fridayTotal = 0; int saturdayTotal;


    //RMU - Page load method: 
    //This method takes the weekly values above, calculates them using the 4 TaskHourValues_Databind methods (see below) and then stores these values in the relevant chart.
    //It also calculates if a week's task/estimates are empty and displays only the number of weeks populated with data so that the correct chart will be displayed.
    //Session code to store username in logout bar
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

        //RMU - Sets all charts to invisible (correct chart will be made visible later)
        BurndownTaskHours.Visible = false;
        BurndownTaskHours2.Visible = false;
        BurndownTaskHours3.Visible = false;
        BurndownTaskHours4.Visible = false;

        //RMU - Databind listviews and count rows (checks if empty for if statement below)
        TaskHourValues1.DataBind();
        int CountWeek1 = TaskHourValues1.Items.Count();
        TaskHourValues2.DataBind();
        int CountWeek2 = TaskHourValues2.Items.Count();
        TaskHourValues3.DataBind();
        int CountWeek3 = TaskHourValues3.Items.Count();
        TaskHourValues4.DataBind();
        int CountWeek4 = TaskHourValues4.Items.Count();

        //RMU - If listviews are not empty (i.e. do contain data for that week) set the relevant chart visibility to true:
        if (CountWeek1 != 0)
        {
            BurndownTaskHours.Visible = true;
        }
        if (CountWeek2 != 0)
        {
            BurndownTaskHours.Visible = false;
            BurndownTaskHours2.Visible = true;
        }
        if (CountWeek3 != 0)
        {
            BurndownTaskHours.Visible = false;
            BurndownTaskHours2.Visible = false;
            BurndownTaskHours3.Visible = true;
        }
        if (CountWeek4 != 0)
        {
            BurndownTaskHours.Visible = false;
            BurndownTaskHours2.Visible = false;
            BurndownTaskHours3.Visible = false;
            BurndownTaskHours4.Visible = true;
        }


        //RMU - Calculating Week 1 Hours:
        TaskHourValues1.DataBind();
        int Week1Hours = monTotal1 + tuesTotal1 + wedTotal1 + thursTotal1 + friTotal1 + satTotal1 + sunTotal1;
        string HoursRemaining = Convert.ToString(Week1Hours);
        Total.Text = HoursRemaining;

        //RMU - Calculating Week 2 Hours:
        TaskHourValues2.DataBind();
        int Week2Hours = monTotal2 + tuesTotal2 + wedTotal2 + thursTotal2 + friTotal2 + satTotal2 + sunTotal2;
        string HoursRemaining2 = Convert.ToString(Week2Hours);
        Total2.Text = HoursRemaining2;

        //RMU - Calculating Week 3 Hours:
        TaskHourValues3.DataBind();
        int Week3Hours = monTotal3 + tuesTotal3 + wedTotal3 + thursTotal3 + friTotal3 + satTotal3 + sunTotal3;
        string HoursRemaining3 = Convert.ToString(Week3Hours);
        Total3.Text = HoursRemaining3;

        //RMU - Calculating Week 4 Hours:
        TaskHourValues4.DataBind();
        int Week4Hours = monTotal4 + tuesTotal4 + wedTotal4 + thursTotal4 + friTotal4 + satTotal4 + sunTotal4;
        string HoursRemaining4 = Convert.ToString(Week4Hours);
        Total4.Text = HoursRemaining4;

        //RMU - Week 1 chart:
        string[] xValues = { "Mon", "Tues", "Wed", "Thurs", "Fri", "Sat", "Sun" };
        int[] yValues = { monTotal1, tuesTotal1, wedTotal1, thursTotal1, friTotal1, satTotal1, sunTotal1 };
        //RMU - Adding values to chart:
        BurndownTaskHours.Series["TaskHoursSeries"].Points.DataBindXY(xValues, yValues);
        BurndownTaskHours.Series["TaskHoursSeries"].Font = new Font("Calibri", 11, FontStyle.Bold);
        BurndownTaskHours.ChartAreas["TaskHoursAreas"].AxisX.Title = "Sprint Day";
        BurndownTaskHours.ChartAreas["TaskHoursAreas"].AxisY.Title = "Hours Remaining";
        //RMU - Styling chart:
        BurndownTaskHours.ChartAreas["TaskHoursAreas"].AxisY.Interval = 5;
        BurndownTaskHours.ChartAreas["TaskHoursAreas"].AxisX.Interval = 0;
        BurndownTaskHours.ChartAreas["TaskHoursAreas"].AxisX.Minimum = 1;
        BurndownTaskHours.ChartAreas["TaskHoursAreas"].AxisX.Maximum = 7;
        BurndownTaskHours.ChartAreas["TaskHoursAreas"].AxisY.Minimum = 0;
        BurndownTaskHours.ChartAreas["TaskHoursAreas"].AxisY.Maximum = BurndownTaskHours.Series["TaskHoursSeries"].Points.FindMaxByValue("Y1", 0).YValues[0] + 10;

        //RMU - Week 2 Chart:
        string[] xValues2 = { "Mon 1", "Tues 1", "Wed 1", "Thurs 1", "Fri 1", "Sat 1", "Sun 1", "Mon 2", "Tues 2", "Wed 2", "Thurs 2", "Fri 2", "Sat 2", "Sun 2" };
        int[] yValues2 = { monTotal1, tuesTotal1, wedTotal1, thursTotal1, friTotal1, satTotal1, sunTotal1, monTotal2, tuesTotal2, wedTotal2, thursTotal2, friTotal2, satTotal2, sunTotal2 };
        //RMU - Adding values to chart:
        BurndownTaskHours2.Series["TaskHoursSeries"].Points.DataBindXY(xValues2, yValues2);
        //RMU - Styling chart:
        BurndownTaskHours2.Series["TaskHoursSeries"].Font = new Font("Calibri", 11, FontStyle.Bold);
        BurndownTaskHours2.ChartAreas["TaskHoursAreas"].AxisX.Title = "Sprint Day";
        BurndownTaskHours2.ChartAreas["TaskHoursAreas"].AxisY.Title = "Hours Remaining";
        BurndownTaskHours2.ChartAreas["TaskHoursAreas"].AxisY.Minimum = 0;
        BurndownTaskHours2.ChartAreas["TaskHoursAreas"].AxisY.Interval = 5;
        BurndownTaskHours2.ChartAreas["TaskHoursAreas"].AxisX.Interval = 1;
        BurndownTaskHours2.ChartAreas["TaskHoursAreas"].AxisX.Minimum = 1;
        BurndownTaskHours2.ChartAreas["TaskHoursAreas"].AxisX.Maximum = 14;
        BurndownTaskHours2.ChartAreas["TaskHoursAreas"].AxisY.Maximum = BurndownTaskHours2.Series["TaskHoursSeries"].Points.FindMaxByValue("Y1", 0).YValues[0] + 10;
        //RMU - Styling week 2 values to be a separate colour:
        BurndownTaskHours2.Series["TaskHoursSeries"].Points[8].Color = Color.Teal;
        BurndownTaskHours2.Series["TaskHoursSeries"].Points[9].Color = Color.Teal;
        BurndownTaskHours2.Series["TaskHoursSeries"].Points[10].Color = Color.Teal;
        BurndownTaskHours2.Series["TaskHoursSeries"].Points[11].Color = Color.Teal;
        BurndownTaskHours2.Series["TaskHoursSeries"].Points[12].Color = Color.Teal;
        BurndownTaskHours2.Series["TaskHoursSeries"].Points[13].Color = Color.Teal;

        //RMU - Week 3 Chart:
        string[] xValues3 = { "Mon 1", "Tues 1", "Wed 1", "Thurs 1", "Fri 1", "Sat 1", "Sun 1", "Mon 2", "Tues 2", "Wed 2", "Thurs 2", "Fri 2", "Sat 2", "Sun 2", "Mon 3", "Tues 3", "Wed 3", "Thurs 3", "Fri 3", "Sat 3", "Sun 3" };
        int[] yValues3 = { monTotal1, tuesTotal1, wedTotal1, thursTotal1, friTotal1, satTotal1, sunTotal1, monTotal2, tuesTotal2, wedTotal2, thursTotal2, friTotal2, satTotal2, sunTotal2, monTotal3, tuesTotal3, wedTotal3, thursTotal3, friTotal3, satTotal3, sunTotal3 };
        //RMU - Adding values to chart:
        BurndownTaskHours3.Series["TaskHoursSeries"].Points.DataBindXY(xValues3, yValues3);
        //RMU - Styling chart:
        BurndownTaskHours3.Series["TaskHoursSeries"].Font = new Font("Calibri", 11, FontStyle.Bold);
        BurndownTaskHours3.ChartAreas["TaskHoursAreas"].AxisX.Title = "Sprint Day";
        BurndownTaskHours3.ChartAreas["TaskHoursAreas"].AxisY.Title = "Hours Remaining";
        BurndownTaskHours3.ChartAreas["TaskHoursAreas"].AxisY.Minimum = 0;
        BurndownTaskHours3.ChartAreas["TaskHoursAreas"].AxisY.Interval = 5;
        BurndownTaskHours3.ChartAreas["TaskHoursAreas"].AxisX.Minimum = 1;
        BurndownTaskHours3.ChartAreas["TaskHoursAreas"].AxisX.Maximum = 21;
        BurndownTaskHours3.ChartAreas["TaskHoursAreas"].AxisY.Maximum = BurndownTaskHours3.Series["TaskHoursSeries"].Points.FindMaxByValue("Y1", 0).YValues[0] + 10;
        BurndownTaskHours3.ChartAreas["TaskHoursAreas"].AxisX.Interval = 1;
        //RMU - Styling week 2 values to be a separate colour:
        BurndownTaskHours3.Series["TaskHoursSeries"].Points[8].Color = Color.Teal;
        BurndownTaskHours3.Series["TaskHoursSeries"].Points[9].Color = Color.Teal;
        BurndownTaskHours3.Series["TaskHoursSeries"].Points[10].Color = Color.Teal;
        BurndownTaskHours3.Series["TaskHoursSeries"].Points[11].Color = Color.Teal;
        BurndownTaskHours3.Series["TaskHoursSeries"].Points[12].Color = Color.Teal;
        BurndownTaskHours3.Series["TaskHoursSeries"].Points[13].Color = Color.Teal;
        BurndownTaskHours3.Series["TaskHoursSeries"].Points[14].Color = Color.Teal;
        //RMU - Styling week 3 values to be a third colour:
        BurndownTaskHours3.Series["TaskHoursSeries"].Points[15].Color = Color.DarkSlateGray;
        BurndownTaskHours3.Series["TaskHoursSeries"].Points[16].Color = Color.DarkSlateGray;
        BurndownTaskHours3.Series["TaskHoursSeries"].Points[17].Color = Color.DarkSlateGray;
        BurndownTaskHours3.Series["TaskHoursSeries"].Points[18].Color = Color.DarkSlateGray;
        BurndownTaskHours3.Series["TaskHoursSeries"].Points[19].Color = Color.DarkSlateGray;
        BurndownTaskHours3.Series["TaskHoursSeries"].Points[20].Color = Color.DarkSlateGray;

        //RMU - Week 4 Chart:
        string[] xValues4 = { "Mon 1", "Tues 1", "Wed 1", "Thurs 1", "Fri 1", "Sat 1", "Sun 1", "Mon 2", "Tues 2", "Wed 2", "Thurs 2", "Fri 2", "Sat 2", "Sun 2", "Mon 3", "Tues 3", "Wed 3", "Thurs 3", "Fri 3", "Sat 3", "Sun 3", "Mon 4", "Tues 4", "Wed 4", "Thurs 4", "Fri 4", "Sat 4", "Sun 4" };
        int[] yValues4 = { monTotal1, tuesTotal1, wedTotal1, thursTotal1, friTotal1, satTotal1, sunTotal1, monTotal2, tuesTotal2, wedTotal2, thursTotal2, friTotal2, satTotal2, sunTotal2, monTotal3, tuesTotal3, wedTotal3, thursTotal3, friTotal3, satTotal3, sunTotal3, monTotal4, tuesTotal4, wedTotal4, thursTotal4, friTotal4, satTotal4, sunTotal4 };
        //RMU - Adding values to chart:
        BurndownTaskHours4.Series["TaskHoursSeries"].Points.DataBindXY(xValues4, yValues4);
        //RMU - Styling chart:
        BurndownTaskHours4.Series["TaskHoursSeries"].Font = new Font("Calibri", 11, FontStyle.Bold);
        BurndownTaskHours4.ChartAreas["TaskHoursAreas"].AxisX.Title = "Sprint Day";
        BurndownTaskHours4.ChartAreas["TaskHoursAreas"].AxisY.Title = "Hours Remaining";
        BurndownTaskHours4.ChartAreas["TaskHoursAreas"].AxisY.Minimum = 0;
        BurndownTaskHours4.ChartAreas["TaskHoursAreas"].AxisY.Interval = 5;
        BurndownTaskHours4.ChartAreas["TaskHoursAreas"].AxisX.Minimum = 1;
        BurndownTaskHours4.ChartAreas["TaskHoursAreas"].AxisX.Maximum = 29;
        BurndownTaskHours4.ChartAreas["TaskHoursAreas"].AxisY.Maximum = BurndownTaskHours4.Series["TaskHoursSeries"].Points.FindMaxByValue("Y1", 0).YValues[0] + 10;
        BurndownTaskHours4.ChartAreas["TaskHoursAreas"].AxisX.Interval = 2;
        //RMU - Styling week 2 values to be a separate colour:
        BurndownTaskHours4.Series["TaskHoursSeries"].Points[8].Color = Color.Teal;
        BurndownTaskHours4.Series["TaskHoursSeries"].Points[9].Color = Color.Teal;
        BurndownTaskHours4.Series["TaskHoursSeries"].Points[10].Color = Color.Teal;
        BurndownTaskHours4.Series["TaskHoursSeries"].Points[11].Color = Color.Teal;
        BurndownTaskHours4.Series["TaskHoursSeries"].Points[12].Color = Color.Teal;
        BurndownTaskHours4.Series["TaskHoursSeries"].Points[13].Color = Color.Teal;
        BurndownTaskHours4.Series["TaskHoursSeries"].Points[14].Color = Color.Teal;
        //RMU - Styling week 3 values to be a third colour:
        BurndownTaskHours4.Series["TaskHoursSeries"].Points[15].Color = Color.DarkSlateGray;
        BurndownTaskHours4.Series["TaskHoursSeries"].Points[16].Color = Color.DarkSlateGray;
        BurndownTaskHours4.Series["TaskHoursSeries"].Points[17].Color = Color.DarkSlateGray;
        BurndownTaskHours4.Series["TaskHoursSeries"].Points[18].Color = Color.DarkSlateGray;
        BurndownTaskHours4.Series["TaskHoursSeries"].Points[19].Color = Color.DarkSlateGray;
        BurndownTaskHours4.Series["TaskHoursSeries"].Points[20].Color = Color.DarkSlateGray;
        //RMU - Styling week 4 values to be a fourth colour:
        BurndownTaskHours4.Series["TaskHoursSeries"].Points[21].Color = Color.DimGray;
        BurndownTaskHours4.Series["TaskHoursSeries"].Points[22].Color = Color.DimGray;
        BurndownTaskHours4.Series["TaskHoursSeries"].Points[23].Color = Color.DimGray;
        BurndownTaskHours4.Series["TaskHoursSeries"].Points[24].Color = Color.DimGray;
        BurndownTaskHours4.Series["TaskHoursSeries"].Points[25].Color = Color.DimGray;
        BurndownTaskHours4.Series["TaskHoursSeries"].Points[26].Color = Color.DimGray;
        BurndownTaskHours4.Series["TaskHoursSeries"].Points[27].Color = Color.DimGray;
    }

    //RMU -  TaskHours1_DataBinding Method:
    //This Method occurs when the TaskHourValues1 listview is databound.
    //It takes each task's daily hour remaining estimate from the listview (i.e. monquantity)
    //It then adds the daily estimate to the overall week total for each day (i.e. monTotal1 = Monday, week 1) 
    //Then does this for all values returned in the listview
    //The weekly total for all tasks is then stored in the Literal lt's text field - to be used in the chart above.
    protected void TaskHourValues1_DataBinding(object sender, EventArgs e)
    {
        Literal lt = (Literal)(sender);
        int monquantity = Convert.ToInt32((Eval("mon")));
        monTotal1 += monquantity;
        lt.Text = monquantity.ToString();

        int tuesquantity = Convert.ToInt32((Eval("tues")));
        tuesTotal1 += tuesquantity;
        lt.Text = tuesquantity.ToString();

        int wedquantity = Convert.ToInt32((Eval("wed")));
        wedTotal1 += wedquantity;
        lt.Text = wedquantity.ToString();

        int thursquantity = Convert.ToInt32((Eval("thurs")));
        thursTotal1 += thursquantity;
        lt.Text = thursquantity.ToString();

        int friquantity = Convert.ToInt32((Eval("fri")));
        friTotal1 += friquantity;
        lt.Text = friquantity.ToString();

        int satquantity = Convert.ToInt32((Eval("sat")));
        satTotal1 += satquantity;
        lt.Text = satquantity.ToString();

        int sunquantity = Convert.ToInt32((Eval("sun")));
        sunTotal1 += sunquantity;
        lt.Text = sunquantity.ToString();

    }

    //RMU -  TaskHours2_DataBinding Method:
    //This Method occurs when the TaskHourValues2 listview is databound.
    //It takes each task's daily hour remaining estimate from the listview (i.e. monquantity)
    //It then adds the daily estimate to the overall week total for each day (i.e. monTotal2 = Monday, week 2) 
    //Then does this for all values returned in the listview
    //The weekly total for all tasks is then stored in the Literal lt's text field - to be used in the chart above.
    protected void TaskHourValues2_DataBinding(object sender, EventArgs e)
    {
        Literal lt = (Literal)(sender);
        int monquantity = Convert.ToInt32((Eval("mon")));
        monTotal2 += monquantity;
        lt.Text = monquantity.ToString();

        int tuesquantity = Convert.ToInt32((Eval("tues")));
        tuesTotal2 += tuesquantity;
        lt.Text = tuesquantity.ToString();

        int wedquantity = Convert.ToInt32((Eval("wed")));
        wedTotal2 += wedquantity;
        lt.Text = wedquantity.ToString();

        int thursquantity = Convert.ToInt32((Eval("thurs")));
        thursTotal2 += thursquantity;
        lt.Text = thursquantity.ToString();

        int friquantity = Convert.ToInt32((Eval("fri")));
        friTotal2 += friquantity;
        lt.Text = friquantity.ToString();

        int satquantity = Convert.ToInt32((Eval("sat")));
        satTotal2 += satquantity;
        lt.Text = satquantity.ToString();

        int sunquantity = Convert.ToInt32((Eval("sun")));
        sunTotal2 += sunquantity;
        lt.Text = sunquantity.ToString();

    }

    //RMU -  TaskHours3_DataBinding Method:
    //This Method occurs when the TaskHourValues3 listview is databound.
    //It takes each task's daily hour remaining estimate from the listview (i.e. monquantity)
    //It then adds the daily estimate to the overall week total for each day (i.e. monTotal3 = Monday, week 3) 
    //Then does this for all values returned in the listview
    //The weekly total for all tasks is then stored in the Literal lt's text field - to be used in the chart above.
    protected void TaskHourValues3_DataBinding(object sender, EventArgs e)
    {
        Literal lt = (Literal)(sender);
        int monquantity = Convert.ToInt32((Eval("mon")));
        monTotal3 += monquantity;
        lt.Text = monquantity.ToString();

        int tuesquantity = Convert.ToInt32((Eval("tues")));
        tuesTotal3 += tuesquantity;
        lt.Text = tuesquantity.ToString();

        int wedquantity = Convert.ToInt32((Eval("wed")));
        wedTotal3 += wedquantity;
        lt.Text = wedquantity.ToString();

        int thursquantity = Convert.ToInt32((Eval("thurs")));
        thursTotal3 += thursquantity;
        lt.Text = thursquantity.ToString();

        int friquantity = Convert.ToInt32((Eval("fri")));
        friTotal3 += friquantity;
        lt.Text = friquantity.ToString();

        int satquantity = Convert.ToInt32((Eval("sat")));
        satTotal3 += satquantity;
        lt.Text = satquantity.ToString();

        int sunquantity = Convert.ToInt32((Eval("sun")));
        sunTotal3 += sunquantity;
        lt.Text = sunquantity.ToString();

    }

    //RMU -  TaskHours4_DataBinding Method:
    //This Method occurs when the TaskHourValues4 listview is databound.
    //It takes each task's daily hour remaining estimate from the listview (i.e. monquantity)
    //It then adds the daily estimate to the overall week total for each day (i.e. monTotal4 = Monday, week 4) 
    //Then does this for all values returned in the listview
    //The weekly total for all tasks is then stored in the Literal lt's text field - to be used in the chart above.
    protected void TaskHourValues4_DataBinding(object sender, EventArgs e)
    {
        Literal lt = (Literal)(sender);
        int monquantity = Convert.ToInt32((Eval("mon")));
        monTotal4 += monquantity;
        lt.Text = monquantity.ToString();

        int tuesquantity = Convert.ToInt32((Eval("tues")));
        tuesTotal4 += tuesquantity;
        lt.Text = tuesquantity.ToString();

        int wedquantity = Convert.ToInt32((Eval("wed")));
        wedTotal4 += wedquantity;
        lt.Text = wedquantity.ToString();

        int thursquantity = Convert.ToInt32((Eval("thurs")));
        thursTotal4 += thursquantity;
        lt.Text = thursquantity.ToString();

        int friquantity = Convert.ToInt32((Eval("fri")));
        friTotal4 += friquantity;
        lt.Text = friquantity.ToString();

        int satquantity = Convert.ToInt32((Eval("sat")));
        satTotal4 += satquantity;
        lt.Text = satquantity.ToString();

        int sunquantity = Convert.ToInt32((Eval("sun")));
        sunTotal4 += sunquantity;
        lt.Text = sunquantity.ToString();

    }
}
