namespace POS.Component
{
    partial class UserControl1
    {
        /// <summary> 
        /// 設計工具所需的變數。
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// 清除任何使用中的資源。
        /// </summary>
        /// <param name="disposing">如果應該處置受控資源則為 true，否則為 false。</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region 元件設計工具產生的程式碼

        /// <summary> 
        /// 此為設計工具支援所需的方法 - 請勿使用程式碼編輯器修改
        /// 這個方法的內容。
        /// </summary>
        private void InitializeComponent()
        {
            this.guna2HtmlLabel4 = new Guna.UI2.WinForms.Guna2HtmlLabel();
            this.labPname = new Guna.UI2.WinForms.Guna2HtmlLabel();
            this.picBoxPimg = new Guna.UI2.WinForms.Guna2CirclePictureBox();
            this.guna2CustomGradientPanel1 = new Guna.UI2.WinForms.Guna2CustomGradientPanel();
            this.labPprice = new Guna.UI2.WinForms.Guna2HtmlLabel();
            this.btnProducts = new Guna.UI2.WinForms.Guna2Button();
            ((System.ComponentModel.ISupportInitialize)(this.picBoxPimg)).BeginInit();
            this.guna2CustomGradientPanel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // guna2HtmlLabel4
            // 
            this.guna2HtmlLabel4.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.guna2HtmlLabel4.BackColor = System.Drawing.Color.Transparent;
            this.guna2HtmlLabel4.Font = new System.Drawing.Font("Segoe UI Semibold", 14F, System.Drawing.FontStyle.Bold);
            this.guna2HtmlLabel4.Location = new System.Drawing.Point(131, 49);
            this.guna2HtmlLabel4.Name = "guna2HtmlLabel4";
            this.guna2HtmlLabel4.Size = new System.Drawing.Size(49, 27);
            this.guna2HtmlLabel4.TabIndex = 11;
            this.guna2HtmlLabel4.Text = "$ 135";
            // 
            // labPname
            // 
            this.labPname.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.labPname.BackColor = System.Drawing.Color.Transparent;
            this.labPname.Font = new System.Drawing.Font("Segoe UI Semibold", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labPname.ForeColor = System.Drawing.Color.Black;
            this.labPname.Location = new System.Drawing.Point(44, 14);
            this.labPname.Name = "labPname";
            this.labPname.Size = new System.Drawing.Size(51, 27);
            this.labPname.TabIndex = 12;
            this.labPname.Text = "Lattle";
            // 
            // picBoxPimg
            // 
            this.picBoxPimg.BackColor = System.Drawing.Color.Transparent;
            this.picBoxPimg.Dock = System.Windows.Forms.DockStyle.Right;
            this.picBoxPimg.FillColor = System.Drawing.Color.Transparent;
            this.picBoxPimg.ImageRotate = 0F;
            this.picBoxPimg.Location = new System.Drawing.Point(200, 0);
            this.picBoxPimg.Name = "picBoxPimg";
            this.picBoxPimg.ShadowDecoration.Mode = Guna.UI2.WinForms.Enums.ShadowMode.Circle;
            this.picBoxPimg.Size = new System.Drawing.Size(100, 100);
            this.picBoxPimg.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.picBoxPimg.TabIndex = 13;
            this.picBoxPimg.TabStop = false;
            this.picBoxPimg.UseTransparentBackground = true;
            // 
            // guna2CustomGradientPanel1
            // 
            this.guna2CustomGradientPanel1.Controls.Add(this.picBoxPimg);
            this.guna2CustomGradientPanel1.Controls.Add(this.labPprice);
            this.guna2CustomGradientPanel1.Controls.Add(this.labPname);
            this.guna2CustomGradientPanel1.Controls.Add(this.btnProducts);
            this.guna2CustomGradientPanel1.Location = new System.Drawing.Point(0, 0);
            this.guna2CustomGradientPanel1.Name = "guna2CustomGradientPanel1";
            this.guna2CustomGradientPanel1.Size = new System.Drawing.Size(300, 100);
            this.guna2CustomGradientPanel1.TabIndex = 15;
            // 
            // labPprice
            // 
            this.labPprice.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.labPprice.BackColor = System.Drawing.Color.Transparent;
            this.labPprice.Font = new System.Drawing.Font("Segoe UI Semibold", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labPprice.ForeColor = System.Drawing.Color.Black;
            this.labPprice.Location = new System.Drawing.Point(44, 59);
            this.labPprice.Name = "labPprice";
            this.labPprice.Size = new System.Drawing.Size(49, 27);
            this.labPprice.TabIndex = 15;
            this.labPprice.Text = "$ 135";
            // 
            // btnProducts
            // 
            this.btnProducts.BorderColor = System.Drawing.Color.LightGray;
            this.btnProducts.BorderRadius = 50;
            this.btnProducts.BorderThickness = 1;
            this.btnProducts.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnProducts.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnProducts.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnProducts.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnProducts.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btnProducts.FillColor = System.Drawing.Color.Transparent;
            this.btnProducts.Font = new System.Drawing.Font("Segoe UI Semibold", 15.75F, System.Drawing.FontStyle.Bold);
            this.btnProducts.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(98)))), ((int)(((byte)(65)))));
            this.btnProducts.Location = new System.Drawing.Point(0, 0);
            this.btnProducts.Name = "btnProducts";
            this.btnProducts.Size = new System.Drawing.Size(300, 100);
            this.btnProducts.TabIndex = 14;
            this.btnProducts.MouseMove += new System.Windows.Forms.MouseEventHandler(this.btnProducts_MouseMove);
            this.btnProducts.MouseUp += new System.Windows.Forms.MouseEventHandler(this.btnProducts_MouseUp);
            // 
            // UserControl1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.Controls.Add(this.guna2CustomGradientPanel1);
            this.Controls.Add(this.guna2HtmlLabel4);
            this.Name = "UserControl1";
            this.Size = new System.Drawing.Size(300, 100);
            ((System.ComponentModel.ISupportInitialize)(this.picBoxPimg)).EndInit();
            this.guna2CustomGradientPanel1.ResumeLayout(false);
            this.guna2CustomGradientPanel1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private Guna.UI2.WinForms.Guna2HtmlLabel guna2HtmlLabel4;
        private Guna.UI2.WinForms.Guna2HtmlLabel labPname;
        private Guna.UI2.WinForms.Guna2CirclePictureBox picBoxPimg;
        private Guna.UI2.WinForms.Guna2CustomGradientPanel guna2CustomGradientPanel1;
        private Guna.UI2.WinForms.Guna2HtmlLabel labPprice;
        private Guna.UI2.WinForms.Guna2Button btnProducts;
    }
}
