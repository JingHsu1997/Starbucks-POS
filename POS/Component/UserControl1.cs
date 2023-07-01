using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace POS.Component
{
    public partial class UserControl1 : UserControl
    {
        public UserControl1()
        {
            InitializeComponent();
        }


        private void btnProducts_MouseMove(object sender, MouseEventArgs e)
        {
            btnProducts.ForeColor = Color.FromArgb(0, 98, 65);
            btnProducts.BorderColor = Color.FromArgb(0, 98, 65);
        }

        private void btnProducts_MouseUp(object sender, MouseEventArgs e)
        {
            btnProducts.ForeColor = Color.Black;
            btnProducts.BorderColor = Color.LightGray;
        }
    }
}
