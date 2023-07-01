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
    public partial class FormMenu : Form
    {
        SqlConnectionStringBuilder scsb = new SqlConnectionStringBuilder();
        List<int> listPid = new List<int>();
        List<string> listProductName = new List<string>();
        List<string> listCategory = new List<string>();
        List<int> listPrice = new List<int>();
        string strDBConnectionString = "";
        string strImageDir = @"C:\Users\user\Desktop\POS\POS\bin\Debug\Image\Product";

        public FormMenu()
        {
            InitializeComponent();
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

        private void FormMenu_Load(object sender, EventArgs e)
        {
            scsb.DataSource = @".";
            scsb.InitialCatalog = "POS";
            scsb.IntegratedSecurity = true;
            strDBConnectionString = scsb.ConnectionString;

            loadingProduct();
            showProduct();

        }

        void loadingProduct()
        {
            SqlConnection con = new SqlConnection(strDBConnectionString);
            con.Open();
            string strSQL = "select * from Products";
            SqlCommand cmd = new SqlCommand(strSQL, con);
            SqlDataReader reader = cmd.ExecuteReader();

            int count = 0;

            while (reader.Read() == true)
            {
                listPid.Add((int)reader["ProductID"]);
                listProductName.Add((string)reader["ProductName"]);
                listCategory.Add((string)reader["Category"]);
                listPrice.Add((int)reader["UnitPrice"]);
                string image_name = (string)reader["image"];
                string imagepath = strImageDir + "\\" + image_name;
                Image imgPFile = Image.FromFile(imagepath);
                imageListPFile.Images.Add(imgPFile);
                count++;
            }
            reader.Close();
            con.Close();
            Console.WriteLine($"reading {count} data");
        }

        void showProduct()
        {
            listViewProduct.Clear();
            listViewProduct.View = View.LargeIcon; //LargeIcon, SmallIcon, List, Tile
            imageListPFile.ImageSize = new Size(160, 160);
            listViewProduct.LargeImageList = imageListPFile;
            listViewProduct.SmallImageList = imageListPFile;
            

            for (int i = 0; i < imageListPFile.Images.Count; i += 1)
            {
                ListViewItem item = new ListViewItem();
                item.ImageIndex = i;
                item.Text = $"{listProductName[i]} ${listPrice[i]}";
                item.Font = new Font("Segoe UI", 12, FontStyle.Bold);
                item.Tag = listPid[i];
           
                listViewProduct.Items.Add(item);

            }
        }
        public void AddProductToCart(string productName,int amount, int productPrice, string opitionText)
        {
            Button newButton = new Button();
            newButton.Text = $"{productName} x {amount} {productPrice}\n{opitionText}";
            // 设置按钮的位置和大小
            int buttonWidth = 310;
            int buttonHeight = 200;
            int spacing = 10; // 按钮之间的间距
            int x = 100;
            int y = 100;

            
            // 设置按钮的位置
            newButton.Location = panelList.PointToClient(new Point(x, y));

            // 设置按钮的大小
            newButton.Size = new Size(buttonWidth, buttonHeight);

            // 将按钮添加到 FormCart 中
            panelCart.Controls.Add(newButton);

            // 更新下一个按钮的位置
            y += buttonHeight + spacing;
        }

        private void btnMenu_MouseMove(object sender, MouseEventArgs e)
        {
            btnMenu.ForeColor = Color.FromArgb(0, 98, 65);
        }

        private void btnMenu_MouseLeave(object sender, EventArgs e)
        {
            btnMenu.ForeColor = Color.Black;
        }

        private void listViewProduct_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void listViewProduct_ItemActivate(object sender, EventArgs e)
        {
            //if (listViewProduct.SelectedItems.Count > 0)
            //{
            //    // 取得所選項目的索引
            //    int selectedIndex = listViewProduct.SelectedItems[0].Index;

            //    // 取得所選項目的產品名稱和價格
            //    string productName = listProductName[selectedIndex];
            //    int unitPrice = listPrice[selectedIndex];

            //    // 將產品名稱和價格傳送到購物車 labOrderList 中
            //    labOrderList.Text += $"{productName} ${unitPrice}\n";
            //}
        }

        private void listViewProduct_Click(object sender, EventArgs e)
        {
            // 取得所選項目的索引
            int selectedIndex = listViewProduct.SelectedItems[0].Index;
            // 取得所選項目的產品名稱和價格
            string productName = listProductName[selectedIndex];
            int unitPrice = listPrice[selectedIndex];

            FormOpition frm = new FormOpition();
            frm.ProductName = productName;
            frm.UnitPrice = unitPrice;
            frm.Show();
        }

        //public void SetLabelText(string text)
        //{
        //    btnCart.Text = text;
        //}

    }
}

