using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
namespace HallsSite
{
    public partial class EditHall : System.Web.UI.Page
    {
        string HPrice = "";
        string HName = "";
       
        string HCityID = "";
        string Place = "";
        string Number = "";
        string NumberPhone="";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {
                if (!IsPostBack)
                {

                    BindGender();
                    BindGridview();
                }
            }
            else
            {
                Response.Redirect("SignIn.aspx");
            }
        }
        protected void txtID_TextChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString);
            if (con.State == ConnectionState.Closed) { con.Open(); }
            SqlCommand cmd = new SqlCommand("select HName ,HPrice,HCityID ,Place,Number,NumberPhone from tblHalls where HID=@ID", con);
            cmd.Parameters.AddWithValue("@ID", Convert.ToInt32(txtID.Text));
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            da.Fill(ds, "dt");
            con.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                HPrice = ds.Tables[0].Rows[0]["HPrice"].ToString();

                txtPrice.Text = HPrice;

                HName = ds.Tables[0].Rows[0]["HName"].ToString();
                txtSize.Text = HName;

                HCityID = ds.Tables[0].Rows[0]["HCityID"].ToString();
                BindGender();
                ddlType.SelectedValue = HCityID;


                Place = ds.Tables[0].Rows[0]["Place"].ToString();
                txtPlace.Text = Place;

               Number = ds.Tables[0].Rows[0]["Number"].ToString();
                txtQuantity.Text = Number;

                NumberPhone = ds.Tables[0].Rows[0]["NumberPhone"].ToString();
                txtphone.Text = NumberPhone;
            }
            else
            {

            }
            con.Close();
        }

        private void BindGridview()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString);
            if (con.State == ConnectionState.Closed) { con.Open(); }
            SqlDataAdapter da = new SqlDataAdapter("select distinct t1.HID,t1.HName,t1.HPrice,t1.Number,t1.Place,t1.NumberPhone,t2.Name as City from tblHalls as t1  inner join tblCitys as t2 on t2.CityID=t1.HCityID", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            if (dt.Rows.Count > 0)
            {

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            else
            {
                GridView1.DataSource = null;
                GridView1.DataBind();
            }
        }

        protected void btnUpdateSubCategory_Click(object sender, EventArgs e)
        {
            if (txtID.Text != string.Empty && txtSize.Text != string.Empty )
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString);
                if (con.State == ConnectionState.Closed) { con.Open(); }
                SqlCommand cmd = new SqlCommand("update tblHalls set HName=@HName,HPrice=@HPrice,HCityID=@HCityID, Number=@Number,Place=@Place,NumberPhone=@NumberPhone  where HID=@HID", con);
                cmd.Parameters.AddWithValue("@HID", Convert.ToInt32(txtID.Text));
                cmd.Parameters.AddWithValue("@HName", txtSize.Text);
                cmd.Parameters.AddWithValue("@HPrice", txtPrice.Text);
                cmd.Parameters.AddWithValue("@HCityID", ddlType.SelectedValue);
                cmd.Parameters.AddWithValue("@Number", txtQuantity.Text);
                cmd.Parameters.AddWithValue("@Place", txtPlace.Text);
                cmd.Parameters.AddWithValue("@NumberPhone", txtphone.Text);


                cmd.ExecuteNonQuery();
                //con.Close();
                //Response.Write("<script>alert('Update successfully')</script>");
                MessageBox.Show(this, "Данные успешно обновлены!");
                BindGridview();
               

                
               

            }
        }

       

       

        private void BindGender()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from tblCitys", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    ddlType.DataSource = dt;
                    ddlType.DataTextField = "Name";
                    ddlType.DataValueField = "CityID";
                    ddlType.DataBind();
                    ddlType.Items.Insert(0, new ListItem("-Select-", "0"));

                }
            }
        }





    }
}