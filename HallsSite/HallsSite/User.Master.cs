using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace HallsSite
{
    public partial class User : System.Web.UI.MasterPage
    {
        public static String CS = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Username"] != null)
            {
               
                btnlogout.Visible = true;
               
                Button1.Text = "Welcome: " + Session["Username"].ToString().ToUpper();

            }
            else
            {
                btnlogout.Visible = false;
                //btnLogin.Visible = true;


            }
        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session["Username"] = null;

            Response.Redirect("Index.aspx");

        }
    }
}