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
    public partial class Taz : System.Web.UI.Page
    {
        public static String CS = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                if (!IsPostBack)
                {
                    if (Request.QueryString["BuyNow"] == "YES")
                    {

                    }
                    BindProductRepeater();


                }
            }
            else
            {
                if (Request.QueryString["BuyNow"] == "YES")
                {
                    Response.Redirect("SignIn.aspx");
                }
                else
                {
                    Response.Redirect("~/Index.aspx");
                }
            }
        }

        private void BindProductRepeater()
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("procBindAllHallsTaz", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptrProducts.DataSource = dt;
                        rptrProducts.DataBind();
                        if (dt.Rows.Count <= 0)
                        {
                            // Label1.Text = "Sorry! Currently no products in this category.";
                        }
                        else
                        {
                            //Label1.Text = "Showing All Products";
                        }
                    }
                }
            }
        }

        //protected override void InitializeCulture()
        //{
        //    CultureInfo ci = new CultureInfo("en-IN");
        //    ci.NumberFormat.CurrencySymbol = "₹";
        //    Thread.CurrentThread.CurrentCulture = ci;

        //    base.InitializeCulture();
        //}



    }
}


