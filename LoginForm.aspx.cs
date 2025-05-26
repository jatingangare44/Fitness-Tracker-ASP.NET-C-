using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using Oracle.ManagedDataAccess.Client;
using System.Data;

namespace Fitness_Tracker
{
    public partial class LoginForm : System.Web.UI.Page
    {
        SqlConnection conn =new  SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\jatin\source\repos\Fitness_Tracker\Fitness_Tracker\App_Data\Database1.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                
                Response.Redirect("HomeForm.aspx");
            }
            if (conn.State==ConnectionState.Open)
            {
                conn.Close();
            }
            conn.Open();
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select count(*) from users where un=@username and ps=@password";
            cmd.Parameters.AddWithValue("@username", uname.Text);
            cmd.Parameters.AddWithValue("@password", passw.Text);
            int count = (int)cmd.ExecuteScalar();
            if (count > 0)
            {
                Session["username"] = uname.Text;
                Response.Redirect("HomeForm.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Wrong username or password!');", true);
            }
            cmd.ExecuteNonQuery();
            uname.Text = "";
            passw.Text = "";


        }
    }
}