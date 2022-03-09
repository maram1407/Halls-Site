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
    public partial class HallView : System.Web.UI.Page
    {
        public static String CS = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;
        readonly Int32 myQty = 1;
        List<DateTime> dates = new List<DateTime>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["HID"] != null)
            {
                if (!IsPostBack)
                {
                    
                    BindProductImage2();
                    BindHallDetails();
                   

                }

            }
            else
            {
                Response.Redirect("~/Halls.aspx");
            }
        }
        //Получаем все даты бронирований
        private void BindBron()
        {
            Int64 HID = Convert.ToInt64(Request.QueryString["HID"]);
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand(" select DateBook from tblDateBook where HallID ='"+HID+ "'", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                for (int i = 0; i < dt.Rows.Count; i++) 
                {
                    var date=dt.Rows[i].ItemArray[0].ToString();
                    dates.Add(Convert.ToDateTime(date));
                }
            }
        }
        private void BindHallDetails()
        {
            Int64 HID = Convert.ToInt64(Request.QueryString["HID"]);
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SP_BindHallDetails", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@HID", HID);
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    rptrHallDetails.DataSource = dt;
                    rptrHallDetails.DataBind();
                   // Session["CartPID"] = Convert.ToInt32(dt.Rows[0]["PID"].ToString());
                    Session["myHName"] = dt.Rows[0]["HName"].ToString();
                    Session["myHPrice"] = dt.Rows[0]["HPrice"].ToString();

                }

            }
        }

        private void BindProductImage()
        {
            Int64 HID = Convert.ToInt64(Request.QueryString["HID"]);
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("select * from tblHallImages where HID='" + HID + "'", con))
                {
                    cmd.CommandType = CommandType.Text;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptrImage.DataSource = dt;
                        rptrImage.DataBind();
                    }
                }
            }
        }

        private void BindProductImage2()
        {
            Int64 HID = Convert.ToInt64(Request.QueryString["HID"]);
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SP_BindHallImages", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@HID", HID);
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    rptrImage.DataSource = dt;
                    rptrImage.DataBind();
                }
            }
        }

        public string GetActiveImg(int ItemIndex)
        {
            if (ItemIndex == 0)
            {
                return "active";
            }
            else
            {
                return "";

            }
        }

      

        protected void btnAddtoCart_Click(object sender, EventArgs e)
        {
            //MessageBox.Show(this, "Click");
            //MessageBox.ShowQuestion(this);
            Int64 HID = Convert.ToInt64(Request.QueryString["HID"]);

            AddToCartProduction();
            // Response.Redirect("Confirm.aspx?UserLogin=YES");
        }

        protected override void InitializeCulture()
        {
            CultureInfo ci = new CultureInfo("en-IN");
            ci.NumberFormat.CurrencySymbol = "₹";
            Thread.CurrentThread.CurrentCulture = ci;

            base.InitializeCulture();
        }

       
        private void AddToCartProduction()
        {
            //if (Session["USERNAME"] != null)
            //{
            //    DateTime dt = DateTime.ParseExact(TextDate.Text, "dd-mm-yyyy", null);
            //    string USERID = Session["USERID"].ToString();
            //    string dt1 = dt.ToString("mm/dd/yyyy");
            //    string EMAILID = Session["USEREMAIL"].ToString();
            //    using (SqlConnection con = new SqlConnection(CS))
            //    {
            //        SqlCommand cmd = new SqlCommand("insert into tblDate values('" + USERID + "','"
            //              + dt1  + "') select SCOPE_IDENTITY()", con);
            //        if (con.State == ConnectionState.Closed)
            //        {
            //            con.Open();
            //        }
            //          Int64 DateID = Convert.ToInt64(cmd.ExecuteScalar());


            //    }
            //}

            if (Session["USERNAME"] != null)
            {
                //foreach (GridViewRow gvr in gvHalls.Rows)
                //{

                    DateTime dt = DateTime.ParseExact(TextDate.Text, "mm-dd-yyyy", null);
                    string USERID = Session["USERID"].ToString();
                   // string HALLID = gvr.Cells[0].Text.ToString();
                    Int64 HID = Convert.ToInt64(Request.QueryString["HID"]);
                    string NAMEID = Session["USERNAME"].ToString();
                  //  string NHALLID = gvr.Cells[1].Text.ToString();
                   //  string NHALLID = Session["NAME"].ToString();

                    string EMAILID = Session["USEREMAIL"].ToString();
                string Hname = Session["myHName"].ToString();
                //string dt1 = dt.ToString("dd/mm/yyyy");
                string dt1 = dt.ToString("yyyy-mm-dd");
                using (SqlConnection con = new SqlConnection(CS))
                    {
                    SqlCommand cmd = new SqlCommand("insert into tblDateBook values('" + USERID + "','" + HID + "','" + NAMEID + "','"+ Hname + "','" + EMAILID + "','"
                               + dt1 + "') select SCOPE_IDENTITY()", con);
                        if (con.State == ConnectionState.Closed)
                        {
                            con.Open();
                        }
                        //cmd.ExecuteNonQuery();
                        var res = cmd.ExecuteScalar();
                        Int64 DateBookID = Convert.ToInt64(res);

                        Response.Redirect("Success.aspx?UserLogin=YES");
                    }
                }
           // }
            else
            {
                Response.Redirect("SignIn.aspx");
            }
        }

       

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            if (dates.Contains(Calendar1.SelectedDate))
                MessageBox.Show(this, "На такое число данный зал уже забронирован!");
            else
                TextDate.Text = Calendar1.SelectedDate.ToShortDateString();
        }

        protected void Calendar1_Load(object sender, EventArgs e)
        {
            BindBron();
            
        }
        //private void InsertOrderHalls()
        //{
        //    if (Session["Username"] != null)
        //    {
        //        DateTime dt = DateTime.ParseExact(TextDate.Text, "dd-mm-yyyy", null);
        //        string dt1 = dt.ToString("mm/dd/yyyy");

        //        Session["DateBooking"] = dt1;

        //        // Session["OrderNumber"] = OrderNumber.ToString();

        //        string USERID = Session["USERID"].ToString();

        //        string EMAILID = Session["USEREMAIL"].ToString();


        //        string FullName = Session["getFullName"].ToString();

        //        using (SqlConnection con = new SqlConnection(CS))
        //        {
        //            foreach (GridViewRow gvr in gvHalls.Rows)
        //            {
        //                SqlCommand cmd = new SqlCommand("SP_InsertOrder", con);
        //                cmd.CommandType = CommandType.StoredProcedure;
        //                cmd.Parameters.AddWithValue("@UserID", USERID);
        //                cmd.Parameters.AddWithValue("@HID", gvr.Cells[0].Text);

        //                cmd.Parameters.AddWithValue("@Hall", gvr.Cells[1].Text);
        //                cmd.Parameters.AddWithValue("@Email", EMAILID);
        //                cmd.Parameters.AddWithValue("@DateBooking", dt1);

        //                if (con.State == ConnectionState.Closed) { con.Open(); }
        //                Int64 OrderID = Convert.ToInt64(cmd.ExecuteScalar());
        //                Response.Redirect("Success.aspx?UserLogin=YES");
        //            }

        //        }
        //    }
        //}


    }
}