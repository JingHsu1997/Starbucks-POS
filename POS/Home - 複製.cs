using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
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
            guna2PictureBox1.ImageLocation = string.Format(""+Application.StartupPath+"\\Image\\sale{0}.png", imgno);
            imgno++;
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            imageslideshow();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
           
        }

        private void guna2Button1_Click(object sender, EventArgs e)
        {

        }

        private void guna2Button4_Click(object sender, EventArgs e)
        {
            FrmQuickMenu frm = new FrmQuickMenu();
            frm.ShowDialog();
        }
    }
}
