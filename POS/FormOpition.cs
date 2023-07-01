using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using static System.Net.Mime.MediaTypeNames;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.Button;

namespace POS
{
    public partial class FormOpition : Form
    {
        SqlConnectionStringBuilder scsb = new
            SqlConnectionStringBuilder();
        string strDBConnectionstring = "";

        public string ProductName { get; set; }
        public int UnitPrice { get; set; }
        int totalPrice = 0;
        int amount = 1;
        //private string opitionText = "";
        //List<string> listSizeHotCold = new List<string>();
        //List<string> listIce = new List<string>();
        //List<string> listMilk = new List<string>();
        //List<string> listExtraE = new List<string>();
        string selectSizeHotCold = "";
        string selectIce = "";
        string selectMilk = "";
        string selectExtraE = "";

        public FormOpition()
        {
            InitializeComponent();
        }

        private void FormOpition_Load(object sender, EventArgs e)
        {
            scsb.DataSource = @".";
            scsb.InitialCatalog = "POS";
            scsb.IntegratedSecurity = true;
            strDBConnectionstring = scsb.ConnectionString;

            labDrink.Text = ProductName;
            labPrice.Text = UnitPrice.ToString();
            txtAmount.Text = amount.ToString();

            //int checkBoxCount = gBoxSelect.Controls.OfType<System.Windows.Forms.CheckBox>().Count();


            //when checkbox in groupbox be checked, other checkboxes Enable.false
            foreach (System.Windows.Forms.CheckBox checkBox in gBoxSelect.Controls.OfType<System.Windows.Forms.CheckBox>())
            {
                checkBox.CheckedChanged += Selection;
            }

            foreach (System.Windows.Forms.CheckBox checkBox in gBoxIce.Controls.OfType<System.Windows.Forms.CheckBox>())
            {
                checkBox.CheckedChanged += Selection;
            }

            foreach (System.Windows.Forms.CheckBox checkBox in gBoxMilk.Controls.OfType<System.Windows.Forms.CheckBox>())
            {
                checkBox.CheckedChanged += Selection;
            }
        }

        private void txtAmount_TextChanged(object sender, EventArgs e)
        {
            if(txtAmount.Text != "")
            {
                bool isAmountCorrect = Int32.TryParse(txtAmount.Text, out int amount);

                if((isAmountCorrect == false) || (amount == 1))
                {
                    txtAmount.Text = amount.ToString();
                }
                countTotalPrice();
            }
        }

        void countTotalPrice()
        {
            string productName = ProductName;
            int unitPrice = UnitPrice;

            totalPrice = UnitPrice * amount;
            labPrice.Text = totalPrice.ToString();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            amount++;
            txtAmount.Text = amount.ToString();
            countTotalPrice();
            btnSub.Enabled = true;
        }

        private void btnSub_Click(object sender, EventArgs e)
        {

            if(amount <= 2)
            {
                amount--;
                txtAmount.Text = amount.ToString();
                countTotalPrice();
                btnSub.Enabled = false;
            }

            else
            {
                amount--;
                txtAmount.Text = amount.ToString();
                countTotalPrice();
                btnSub.Enabled = true;
            }
        }

        private void Selection(object sender, EventArgs e)
        {
            System.Windows.Forms.CheckBox selectedCheckBox = (System.Windows.Forms.CheckBox)sender;
            System.Windows.Forms.GroupBox groupBox = (System.Windows.Forms.GroupBox)selectedCheckBox.Parent;

            foreach (System.Windows.Forms.CheckBox checkBox in groupBox.Controls.OfType<System.Windows.Forms.CheckBox>())
            {
                if (checkBox != selectedCheckBox)
                {
                    checkBox.Enabled = !selectedCheckBox.Checked;
                }
            }
        }

        private void ckBoxHotGrande_CheckedChanged(object sender, EventArgs e)
        {
            if (ckBoxHotGrande.Checked)
            {
                //opitionText += ckBoxHotGrande.Text+"\n";
                selectSizeHotCold = ckBoxHotGrande.Text;
                ckBoxLessIce.Enabled = false;
                ckBoxNoIce.Enabled = false;
            }
            else
            {
                //將本ckBox.text刪除，而不影響opitionText的其他資料
                //opitionText = opitionText.Replace(ckBoxHotGrande.Text+"\n", "");
                selectSizeHotCold = selectSizeHotCold.Replace(ckBoxHotGrande.Text, "");
                ckBoxLessIce.Enabled = true;
                ckBoxNoIce.Enabled = true;
            }
        }
        private void ckBoxHotGrandeE_CheckedChanged(object sender, EventArgs e)
        {
            if (ckBoxHotGrandeE.Checked)
            {
                UnitPrice = UnitPrice + 10;
                //opitionText += ckBoxHotGrandeE.Text + "\n";
                selectSizeHotCold = ckBoxHotGrandeE.Text;
                ckBoxLessIce.Enabled = false;
                ckBoxNoIce.Enabled = false;
            }
            else
            {
                UnitPrice = UnitPrice - 10;
                //opitionText = opitionText.Replace(ckBoxHotGrandeE.Text + "\n", "");
                selectSizeHotCold = selectSizeHotCold.Replace(ckBoxHotGrandeE.Text, "");
                ckBoxLessIce.Enabled = true;
                ckBoxNoIce.Enabled = true;
            }
            countTotalPrice();
        }

        private void ckBoxHotVenti_CheckedChanged(object sender, EventArgs e)
        {
            if (ckBoxHotVenti.Checked)
            {
                UnitPrice = UnitPrice + 15;
                //opitionText += ckBoxHotVenti.Text + "\n";
                selectSizeHotCold = ckBoxHotVenti.Text;
                ckBoxLessIce.Enabled = false;
                ckBoxNoIce.Enabled = false;
            }
            else
            {
                UnitPrice = UnitPrice - 15;
                //opitionText = opitionText.Replace(ckBoxHotVenti.Text + "\n", "");
                selectSizeHotCold = selectSizeHotCold.Replace(ckBoxHotVenti.Text, "");
                ckBoxLessIce.Enabled = true;
                ckBoxNoIce.Enabled = true;
            }
            countTotalPrice();
        }

        private void ckBoxHotVentiE_CheckedChanged(object sender, EventArgs e)
        {
            if (ckBoxHotVentiE.Checked)
            {
                UnitPrice = UnitPrice + 25;
                //opitionText += ckBoxHotVentiE.Text + "\n";
                selectSizeHotCold = ckBoxHotVentiE.Text;
                ckBoxLessIce.Enabled = false;
                ckBoxNoIce.Enabled = false;
            }
            else
            {
                UnitPrice = UnitPrice - 25;
                //opitionText = opitionText.Replace(ckBoxHotVentiE.Text + "\n", "");
                selectSizeHotCold = selectSizeHotCold.Replace(ckBoxHotVentiE.Text, "");
                ckBoxLessIce.Enabled = true;
                ckBoxNoIce.Enabled = true;
            }
            countTotalPrice();
        }

        private void ckBoxIcedGrande_CheckedChanged(object sender, EventArgs e)
        {
            if (ckBoxIcedGrande.Checked)
            {
                //opitionText += ckBoxIcedGrande.Text + "\n";
                selectSizeHotCold = ckBoxIcedGrande.Text;
            }
            else
            {
                //opitionText = opitionText.Replace(ckBoxIcedGrande.Text + "\n", "");
                selectSizeHotCold = selectSizeHotCold.Replace(ckBoxIcedGrande.Text, "");
            }
        }

        private void ckBoxIcedGrandeE_CheckedChanged(object sender, EventArgs e)
        {
            if (ckBoxIcedGrandeE.Checked)
            {
                UnitPrice = UnitPrice + 10;
                //opitionText += ckBoxIcedGrandeE.Text + "\n";
                selectSizeHotCold = ckBoxIcedGrandeE.Text;
            }
            else
            {
                UnitPrice = UnitPrice - 10;
                //opitionText = opitionText.Replace(ckBoxIcedGrandeE.Text + "\n", "");
                selectSizeHotCold = selectSizeHotCold.Replace(ckBoxIcedGrandeE.Text, "");
            }
            countTotalPrice();
        }

        private void ckBoxIcedVenti_CheckedChanged(object sender, EventArgs e)
        {
            if (ckBoxIcedVenti.Checked)
            {
                UnitPrice = UnitPrice + 15;
                //opitionText += ckBoxIcedVenti.Text + "\n";
                selectSizeHotCold = ckBoxIcedVenti.Text;
            }
            else
            {
                UnitPrice = UnitPrice - 15;
                //opitionText = opitionText.Replace(ckBoxIcedVenti.Text + "\n", "");
                selectSizeHotCold = selectSizeHotCold.Replace(ckBoxIcedVenti.Text, "");
            }
            countTotalPrice();
        }

        private void ckBoxIcedVentiE_CheckedChanged(object sender, EventArgs e)
        {
            if (ckBoxIcedVentiE.Checked)
            {
                UnitPrice = UnitPrice + 25;
                //opitionText += ckBoxIcedVentiE.Text + "\n";
                selectSizeHotCold = ckBoxIcedVentiE.Text;
            }
            else
            {
                UnitPrice = UnitPrice - 25;
                //opitionText = opitionText.Replace(ckBoxIcedVentiE.Text + "\n", "");
                selectSizeHotCold = selectSizeHotCold.Replace(ckBoxIcedVentiE.Text, "");
            }
            countTotalPrice();
        }

        private void ckBoxLessIce_CheckedChanged(object sender, EventArgs e)
        {
            if(ckBoxLessIce.Checked)
            {
                //opitionText += ckBoxLessIce.Text+"\n";
                selectIce = ckBoxLessIce.Text;
            }
            else
            {
                //opitionText = opitionText.Replace(ckBoxLessIce.Text+ "\n", "");
                selectIce = selectIce.Replace(ckBoxLessIce.Text, "");
            }
        }

        private void ckBoxNoIce_CheckedChanged(object sender, EventArgs e)
        {
            if (ckBoxNoIce.Checked)
            {
                //opitionText += ckBoxNoIce.Text + "\n";
                selectIce = ckBoxNoIce.Text;
            }
            else
            {
                //opitionText = opitionText.Replace(ckBoxNoIce.Text + "\n", "");
                selectIce = selectIce.Replace(ckBoxNoIce.Text, "");
            }
        }

        private void ckBoxWholeMilk_CheckedChanged(object sender, EventArgs e)
        {
            if (ckBoxWholeMilk.Checked)
            {
                //opitionText += ckBoxWholeMilk.Text + "\n";
                selectMilk = ckBoxWholeMilk.Text;

            }
            else
            {
                //opitionText = opitionText.Replace(ckBoxWholeMilk.Text + "\n", "");
                selectMilk = selectMilk.Replace(ckBoxWholeMilk.Text, "");

            }
        }

        private void ckBoxLowFatMilk_CheckedChanged(object sender, EventArgs e)
        {
            if (ckBoxLowFatMilk.Checked)
            {
                //opitionText += ckBoxLowFatMilk.Text + "\n";
                selectMilk = ckBoxLowFatMilk.Text;

            }
            else
            {
                //opitionText = opitionText.Replace(ckBoxLowFatMilk.Text + "\n", "");
                selectMilk = selectMilk.Replace(ckBoxLowFatMilk.Text, "");
            }
        }

        private void ckBoxSoyFree_CheckedChanged(object sender, EventArgs e)
        {
            if (ckBoxSoyFree.Checked)
            {
                //opitionText += ckBoxSoyFree.Text + "\n";
                selectMilk = ckBoxSoyFree.Text;
            }
            else
            {
                //opitionText = opitionText.Replace(ckBoxSoyFree.Text + "\n", "");
                selectMilk = selectMilk.Replace(ckBoxSoyFree.Text, "");
            }
        }

        private void ckBoxCoconutMilk_CheckedChanged(object sender, EventArgs e)
        {
            if (ckBoxCoconutMilk.Checked)
            {
                //opitionText += ckBoxCoconutMilk.Text + "\n";
                selectMilk = ckBoxCoconutMilk.Text;
            }
            else
            {
                //opitionText = opitionText.Replace(ckBoxCoconutMilk.Text + "\n", "");
                selectMilk = selectMilk.Replace(ckBoxCoconutMilk.Text, "");
            }
        }

        private void ckBoxOatmilk_CheckedChanged(object sender, EventArgs e)
        {
            if (ckBoxOatmilk.Checked)
            {
                UnitPrice = UnitPrice + 20;
                //opitionText += ckBoxOatmilk.Text + "\n";
                selectMilk = ckBoxOatmilk.Text;
            }
            else
            {
                UnitPrice = UnitPrice - 20;
                //opitionText = opitionText.Replace(ckBoxOatmilk.Text + "\n", "");
                selectMilk = selectMilk.Replace(ckBoxOatmilk.Text, "");
            }
            countTotalPrice();
        }

        private void ckBoxAlmondMilk_CheckedChanged(object sender, EventArgs e)
        {
            if (ckBoxAlmondMilk.Checked)
            {
                UnitPrice = UnitPrice + 20;
                //opitionText += ckBoxAlmondMilk.Text + "\n";
                selectMilk = ckBoxAlmondMilk.Text;
            }
            else
            {
                UnitPrice = UnitPrice - 20;
                //opitionText = opitionText.Replace(ckBoxAlmondMilk.Text + "\n", "");
                selectMilk = selectMilk.Replace(ckBoxAlmondMilk.Text, "");
            }
            countTotalPrice();
        }

        private void ckBoxE_CheckedChanged(object sender, EventArgs e)
        {
            if (ckBoxE.Checked)
            {
                UnitPrice = UnitPrice + 15;
                //opitionText += ckBoxE.Text + "\n";
                selectExtraE = ckBoxE.Text;
            }
            else
            {
                UnitPrice = UnitPrice - 15;
                //opitionText = opitionText.Replace(ckBoxE.Text + "\n", "");
                selectExtraE = selectMilk.Replace(ckBoxE.Text, "");
            }
            countTotalPrice();
        }

        private void btnAddToCart_Click(object sender, EventArgs e)
        {
            //Form1 frm = new Form1();
            //frm.AddProductToCart(ProductName, amount,UnitPrice, opitionText);
            //frm.Show();
            bool isSizeSelected = gBoxSelect.Controls.OfType<System.Windows.Forms.CheckBox>().Any(cb => cb.Checked);
            bool isMilkSelected = gBoxMilk.Controls.OfType<System.Windows.Forms.CheckBox>().Any(cb => cb.Checked);
            if (isSizeSelected && isMilkSelected)
            {
                SqlConnection con = new SqlConnection(strDBConnectionstring);
                con.Open();

                string strSQL = "insert into dbo.OrderDetail(ProductName,Price,Amount,TotalPrice,Variation,Ice,Milk,Extra) values (@NewProductName,@NewPrice,@NewAmount,@NewTotalPrice,@NewVariation,@NewIce, @NewMilk, @NewExtra);";
                SqlCommand cmd = new SqlCommand(strSQL, con);

                cmd.Parameters.AddWithValue("@NewProductName", ProductName);
                cmd.Parameters.AddWithValue("@NewPrice", UnitPrice);
                cmd.Parameters.AddWithValue("@NewAmount", amount);
                cmd.Parameters.AddWithValue("@NewTotalPrice", totalPrice);
                cmd.Parameters.AddWithValue("@NewVariation", selectSizeHotCold);
                cmd.Parameters.AddWithValue("@NewIce", selectIce);
                cmd.Parameters.AddWithValue("@NewMilk", selectMilk);
                cmd.Parameters.AddWithValue("@NewExtra", selectExtraE);


                cmd.ExecuteNonQuery();
                con.Close();
                
                this.Close();
            }
            else
            {
                MessageBox.Show("Variation and milk are required.");
            }
            
        }
    }
}
