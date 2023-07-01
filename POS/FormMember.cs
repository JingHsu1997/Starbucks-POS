using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace POS
{
    public partial class FormMember : Form

    {
        SqlConnectionStringBuilder scsb = new SqlConnectionStringBuilder();
        string strDBConnectionString = "";
        List<string> searchResultIDs = new List<string>();
        string seachstatus = "";
        public FormMember()
        {
            InitializeComponent();
        }



        private void FormMember_Load(object sender, EventArgs e)
        {
            scsb.DataSource = @".";
            scsb.InitialCatalog = "POS";
            scsb.IntegratedSecurity = true;

            strDBConnectionString = scsb.ConnectionString;
        }

        private void btnSignin_Click(object sender, EventArgs e)
        {
            if ((txtAccount.Text != "") && (txtPassword.Text != ""))
            {
                loadingMember();
            }
            else
            {
                MessageBox.Show("Please enter your account and password!");
            }
        }
        private void loadingMember()
        {
            SqlConnection con = new SqlConnection(strDBConnectionString);
            con.Open();
            string strSQL = "select CLastname, from Costomers where CAccount = @Account AND CPassword = @Password;";
            SqlCommand cmd = new SqlCommand(strSQL, con);

            cmd.Parameters.AddWithValue("@Account", txtAccount.Text);
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text);

            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read() == true)
            {
                string name = reader["CLastname"].ToString();
                MessageBox.Show($"Welcome,Member {name}.");
                this.Close();
                //FormBackend frm = new FormBackend(); 打開結帳頁面
                //frm.ShowDialog();
            }
            else
            {
                MessageBox.Show("Invalid Account or Password, please try again.");
            }
            reader.Close();
            con.Close();
        }
        private void btnX_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
