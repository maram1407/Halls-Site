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
    public partial class AddHall : System.Web.UI.Page
    {
        public static String CS = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //when page first time run then this code will execute
                BindCity();
                
                BindGridview1();

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

        protected void btnAdd_Click(object sender, EventArgs e)
        {
           
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("sp_InsertHalls", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@HName", txtProductName.Text);
                cmd.Parameters.AddWithValue("@HPrice", txtPrice.Text);

                cmd.Parameters.AddWithValue("@HCityID", ddlType.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Number", txtQuantity.Text);
                cmd.Parameters.AddWithValue("@Place", txtPlace.Text);
                cmd.Parameters.AddWithValue("@NumberPhone", txtPhone.Text);
                

                if (con.State == ConnectionState.Closed) { con.Open(); }
                Int64 HID = Convert.ToInt64(cmd.ExecuteScalar());

                //Insert and upload images
                if (fuImg01.HasFile)
                {
                    string SavePath = Server.MapPath("~/Image/HallImage/") + HID;
                    if (!Directory.Exists(SavePath))
                    {
                        Directory.CreateDirectory(SavePath);

                    }
                    string Extention = Path.GetExtension(fuImg01.PostedFile.FileName);
                    fuImg01.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "01" + Extention);

                    
                    SqlCommand cmd3 = new SqlCommand("insert into tblHallImages(HID,Name,Extention) values(@HID,@Name,@Extention)", con);
                    cmd3.Parameters.AddWithValue("@HID", Convert.ToInt32(HID));
                    cmd3.Parameters.AddWithValue("@Name", txtProductName.Text.ToString().Trim() + "01");
                    cmd3.Parameters.AddWithValue("@Extention", Extention);
                    cmd3.ExecuteNonQuery();
                }
                //2nd fileupload
                if (fuImg02.HasFile)
                {
                    string SavePath = Server.MapPath("~/Image/HallImage/") + HID;
                    if (!Directory.Exists(SavePath))
                    {
                        Directory.CreateDirectory(SavePath);

                    }
                    string Extention = Path.GetExtension(fuImg02.PostedFile.FileName);
                    fuImg02.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "02" + Extention);

                    
                    SqlCommand cmd4 = new SqlCommand("insert into tblHallImages(HID,Name,Extention) values(@HID,@Name,@Extention)", con);
                    cmd4.Parameters.AddWithValue("@HID", Convert.ToInt32(HID));
                    cmd4.Parameters.AddWithValue("@Name", txtProductName.Text.ToString().Trim() + "02");
                    cmd4.Parameters.AddWithValue("@Extention", Extention);
                    cmd4.ExecuteNonQuery();
                }

                //3rd file upload 
                if (fuImg03.HasFile)
                {
                    string SavePath = Server.MapPath("~/Image/HallImage/") + HID;
                    if (!Directory.Exists(SavePath))
                    {
                        Directory.CreateDirectory(SavePath);

                    }
                    string Extention = Path.GetExtension(fuImg03.PostedFile.FileName);
                    fuImg03.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "03" + Extention);

                    
                    SqlCommand cmd5 = new SqlCommand("insert into tblHallImages(HID,Name,Extention) values(@HID,@Name,@Extention)", con);
                    cmd5.Parameters.AddWithValue("@HID", Convert.ToInt32(HID));
                    cmd5.Parameters.AddWithValue("@Name", txtProductName.Text.ToString().Trim() + "03");
                    cmd5.Parameters.AddWithValue("@Extention", Extention);
                    cmd5.ExecuteNonQuery();
                    //Response.Write("<script>alert('зал успешно добавлена')</script>");
                    MessageBox.Show(this, "Зал успешно добавлен!");
                    BindGridview1();
                    
                }

                
            }
            
        }
       

        private void BindGridview1()
        {
            
            SqlConnection con = new SqlConnection(CS);


            // SqlCommand cmd = new SqlCommand(" select distinct t1.PID,t1.PName,t1.PPrice,t2.Name as Type,t3.CatName, t4.ColorName ,t5.Quantity from tblProducts as t1  inner join tblTypes as t2 on t2.TypeID=t1.PTypeID  inner join tblCategory as t3 on t3.CatID=t1.PCategoryID  inner join tblColors as t4 on t4.CategoryID=t1.PCategoryID     inner join tblProductColorQuantity as t5 on t5.PID=t1.PID order by t1.PName", con);
            SqlCommand cmd = new SqlCommand(" select distinct t1.HID,t1.HName,t1.HPrice,t1.Number,t1.Place,t1.NumberPhone,t2.Name as City from tblHalls as t1  inner join tblCitys as t2 on t2.CityID=t1.HCityID", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
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
    }
}