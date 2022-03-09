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
    public partial class Halls : System.Web.UI.Page
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
                    BindCity();
                    BindHallRepeater();
                    // BindCartNumber();

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
        protected override void InitializeCulture()
        {
            CultureInfo ci = new CultureInfo("en-IN");
            ci.NumberFormat.CurrencySymbol = "₹";
            Thread.CurrentThread.CurrentCulture = ci;

            base.InitializeCulture();
        }

        private void BindHallRepeater()
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("procBindAllHalls", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptrHalls.DataSource = dt;
                        rptrHalls.DataBind();
                       
                    }
                }
            }
        }

 
        protected void txtFilterGrid1Record_TextChanged(object sender, EventArgs e)
        {
            if (txtFilterGrid1Record.Text != string.Empty)
            {
                SqlConnection con = new SqlConnection(CS);
                con.Open();
                string qr = "select A.*,B.*,A.HPrice,B.Name as ImageName from tblHalls A   cross apply( select top 1 * from tblHallImages B where B.HID= A.HID order by B.HID desc )B where  A.HName like '" + txtFilterGrid1Record.Text + "%' order by A.HID desc";
                SqlDataAdapter da = new SqlDataAdapter(qr, con);
                string text = ((TextBox)sender).Text;
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    rptrHalls.DataSource = ds.Tables[0];
                    rptrHalls.DataBind();
                }
                else
                {

                }
            }
            else
            {
                BindHallRepeater();
            }

        }

        private void BindCity()
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from tblCitys", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                /*
                if (dt.Rows.Count != 0)
                {
                    ddlType.DataSource = dt;
                    ddlType.DataTextField = "Name";
                    ddlType.DataValueField = "CityID";
                    ddlType.DataBind();
                    ddlType.Items.Insert(0, new ListItem("-Select-", "0"));

                }
                */
                if (!ddlType.Items.Contains(new ListItem("-Select-", "0")))
                    ddlType.Items.Insert(0, new ListItem("-Select-", "0"));

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    if (!ddlType.Items.Contains(new ListItem(dt.Rows[i].ItemArray[1].ToString(),
                                                            dt.Rows[i].ItemArray[0].ToString())))
                    {
                        ddlType.Items.Insert(i + 1, new ListItem(dt.Rows[i].ItemArray[1].ToString(),
                                                                dt.Rows[i].ItemArray[0].ToString()));
                    }
                }
            }
        }
        protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
        {
            string message = ddlType.SelectedItem.Text + " - " + ddlType.SelectedItem.Value;
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + message + "');", true);
        }

        protected void ImageButtonFilter_Click(object sender, ImageClickEventArgs e)
        {
            if (!PanelFilters.Visible)
                PanelFilters.Visible = true;
            else
                PanelFilters.Visible = false;
        }

        protected void ButtonFind_Click(object sender, EventArgs e)
        {
            if (ddlType.SelectedIndex == 0)
            {
                MessageBox.Show(this, "Выбирете город!");
            }
            else if (PriceStart.Text == string.Empty)
            {
                MessageBox.Show(this, "Введите начальную стоимость!");
            }
            else if (PriceEnd.Text == string.Empty)
            {
                MessageBox.Show(this, "Введите конечную стоимость!");
            }
            else if (CountPeople.Text == string.Empty)
            {
                MessageBox.Show(this, "Введите количество людей!");
            }
            //начало запроса
            if ((ddlType.SelectedIndex != 0) && (PriceEnd.Text != string.Empty) &&
                (CountPeople.Text != string.Empty) && (PriceStart.Text != string.Empty))
            {
                SqlConnection con = new SqlConnection(CS);
                con.Open();
                string qr = "select A.*,B.*,A.HPrice,B.Name as ImageName from tblHalls A   " +
                    "cross apply( select top 1 * from tblHallImages B where B.HID= A.HID order by B.HID desc )B " +
                    "where  A.HPrice <= " + PriceEnd.Text + "and A.HPrice >= " + PriceStart.Text +
                    " and A.HCityID = " + ddlType.SelectedItem.Value +
                    " and A.Number >= " + CountPeople.Text +
                    " order by A.HID desc";

                SqlDataAdapter da = new SqlDataAdapter(qr, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    rptrHalls.DataSource = ds.Tables[0];
                    rptrHalls.DataBind();
                }
                else
                {

                }
            }
            else
            {
                BindHallRepeater();
            }
            //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + "Click" + "');", true);
        }
    }
}