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
    public partial class FormSystem : Form
    {
        SqlConnection cn = new SqlConnection();
        SqlCommand cm = new SqlCommand();
        DBConnection DBCon = new DBConnection();

        public FormSystem()
        {
            InitializeComponent();
            cn = new SqlConnection();
            cn.Open();
            MessageBox.Show("Connected");
        }
    }
}
