using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;
using System.Threading;

namespace HallsSite
{
    public partial class Confirm : System.Web.UI.Page
    {
        public static String CS = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {


               // Session["Address"] = TextDate.Text;
                
               //// Session["OrderNumber"] = OrderNumber.ToString();
               // Session["PayMethod"] = "Place n Pay";

               // string USERID = Session["USERID"].ToString();
                
               // string EMAILID = Session["USEREMAIL"].ToString();
                
               // string FullName = Session["getFullName"].ToString();

               // using (SqlConnection con = new SqlConnection(CS))
               // {
               //     foreach (GridViewRow gvr in gvHalls.Rows)
               //     {
               //         SqlCommand cmd = new SqlCommand("SP_InsertOrder", con);
               //         cmd.CommandType = CommandType.StoredProcedure;
               //         cmd.Parameters.AddWithValue("@UserID", USERID);
               //         cmd.Parameters.AddWithValue("@HID", gvr.Cells[0].Text);
      
               //         cmd.Parameters.AddWithValue("@Hall", gvr.Cells[1].Text);
               //         cmd.Parameters.AddWithValue("@Email", EMAILID);
               //         cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                       
               //         if (con.State == ConnectionState.Closed) { con.Open(); }
               //         Int64 OrderID = Convert.ToInt64(cmd.ExecuteScalar());
               //         Response.Redirect("Success.aspx?UserLogin=YES");
               //     }

               // }
            }
            else
            {
                Response.Redirect("SignIn.aspx?RtPP=yes");
            }

        }
    }
}
        // Response.Redirect("Success.aspx?UserLogin=YES");
    

