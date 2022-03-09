using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
namespace HallsSite
{
    public partial class UserHome : System.Web.UI.Page
    {
        public static String CS = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (Session["Username"] != null)
            {
                btnlogout.Visible = true;
               
                lblSuccess.Text = "  Добро Пожаловать <b>" + Session["Username"].ToString() + "</b>";
                Button1.Text = "Welcome: " + Session["Username"].ToString().ToUpper();
            }
            else
            {
                btnlogout.Visible = false;
               
                Response.Redirect("SignIn.aspx");
            }
        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            //Session.Abandon();
            Session["Username"] = null;
            Response.Redirect("~/Index.aspx");

        }

    }
}