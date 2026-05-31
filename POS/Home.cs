using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace POS
{
    public partial class Home : Form
    {
        int imgno = 1;
        public Home()
        {
            InitializeComponent();
        }


        private void imageslideshow()
        {
            if (imgno == 3)
            {
                imgno = 1;
            }
            string resourceDir = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Resources");
            string imageName = $"sale{imgno}.png";
            guna2PictureBox1.ImageLocation = Path.Combine(resourceDir, imageName);
            imgno++;
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            imageslideshow();
        }

        private void btnTakeOut_Click(object sender, EventArgs e)
        {
            FormMenu frm = new FormMenu();
            frm.ShowDialog();
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

        private void btnStaff_Click(object sender, EventArgs e)
        {
            FormSignin frm = new FormSignin();
            frm.ShowDialog();
        }

        private void btnDineIn_Click(object sender, EventArgs e)
        {
            FormPickTable frm = new FormPickTable();
            frm.ShowDialog();
        }
    }
}
