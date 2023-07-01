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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        public void AddProductToCart(string productName, int amount, int productPrice, string opitionText)
        {
            Button newButton = new Button();
            newButton.Text = $"{productName} x {amount} {productPrice}\n{opitionText}";
            // 设置按钮的位置和大小
            int buttonWidth = 310;
            int buttonHeight = 120;
            int spacing = 100; // 按钮之间的间距
            int x = 200;
            int y = 200;


            // 设置按钮的位置
            newButton.Location = PointToClient(new Point(x, y));

            // 设置按钮的大小
            newButton.Size = new Size(buttonWidth, buttonHeight);

            // 将按钮添加到 FormCart 中
            this.Controls.Add(newButton);

            // 更新下一个按钮的位置
            y += buttonHeight + spacing;
        }
    }
}
