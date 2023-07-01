using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace POS
{

    public partial class FormMemberSign : Form
    {
        SqlConnectionStringBuilder scsb = new SqlConnectionStringBuilder();
        string strDBConnectionString = "";
        List<string> searchResultIDs = new List<string>();
        string seachstatus = "";
        

        public FormMemberSign()
        {
            InitializeComponent();
        }

        private void FormMemberSign_Load(object sender, EventArgs e)
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
            string strSQL = "select ELastname, EStatus, ETitle from Employees where EAccount = @Account AND EPassword = @Password;";
            SqlCommand cmd = new SqlCommand(strSQL, con);

            cmd.Parameters.AddWithValue("@Account", txtAccount.Text);
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
            

            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read() == true)
                {
                string name = reader["ELastname"].ToString();
                string title = reader["ETitle"].ToString();

                if (title == "Administrator")
                {
                    MessageBox.Show($"Welcome,Administrator {name}.");
                    this.Close();
                    FormBackend frm = new FormBackend();
                    frm.ShowDialog();
                }
                else if(title == "Manager")
                {
                    MessageBox.Show($"Welcome,Manager {name}.");
                    this.Close();
                    FormBackend frm = new FormBackend();
                    frm.ShowDialog();
                }
                else if (title == "Employee")
                {
                    MessageBox.Show($"Welcome,Staff {name}.");
                    this.Close();
                    FormBackend frm = new FormBackend();
                    frm.ShowDialog();
                }
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
