using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace POS
{
    public partial class FormBackend : Form
    {
        //SqlConnection cn = new SqlConnection();
        //SqlCommand cm = new SqlCommand();
        //DBConnection DBCon = new DBConnection();

        public FormBackend()
        {
            InitializeComponent();
            //cn = new SqlConnection();
            //cn.Open();
        }

        private void btnOrder_Click(object sender, EventArgs e)
        {
            FormOrder frm = new FormOrder();
            frm.ShowDialog();
        }

        private void btnOrder_MouseMove(object sender, MouseEventArgs e)
        {
            btnOrder.ForeColor = Color.FromArgb(0, 98, 65);
        }
        private void btnOrder_MouseLeave(object sender, EventArgs e)
        {
            btnOrder.ForeColor = Color.Black;
        }

        private void btnProduct_Click(object sender, EventArgs e)
        {
            FormProduct frm = new FormProduct();
            frm.ShowDialog();
        }

        private void btnProduct_MouseMove(object sender, MouseEventArgs e)
        {
            btnProduct.ForeColor = Color.FromArgb(0, 98, 65);
        }

        private void btnProduct_MouseLeave(object sender, EventArgs e)
        {
            btnProduct.ForeColor = Color.Black;
        }

        private void btnMember_Click(object sender, EventArgs e)
        {
            FormMember frm = new FormMember();
            frm.ShowDialog();
        }

        private void btnMember_MouseMove(object sender, MouseEventArgs e)
        {
            btnMember.ForeColor = Color.FromArgb(0, 98, 65);
        }

        private void btnMember_MouseLeave(object sender, EventArgs e)
        {
            btnMember.ForeColor = Color.Black;
        }

        private void btnSystem_Click(object sender, EventArgs e)
        {
            FormSystem frm = new FormSystem();
            frm.ShowDialog();
        }

        private void btnSystem_MouseMove(object sender, MouseEventArgs e)
        {
            btnSystem.ForeColor = Color.FromArgb(0, 98, 65);
        }

        private void btnSystem_MouseLeave(object sender, EventArgs e)
        {
            btnSystem.ForeColor = Color.Black;
        }

        private void btnX_Click(object sender, EventArgs e)
        {
            // 建立一個新的表單集合
            Form[] openForms = Application.OpenForms.Cast<Form>().ToArray();

            // 關閉應用程式中的所有表單
            foreach (Form form in openForms)
            {
                form.Close();
            }
        }
    }
}
