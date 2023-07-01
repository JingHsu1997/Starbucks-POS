namespace POS.Component
{
    partial class UserControl2
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(UserControl2));
            this.picBoxPimg = new Guna.UI2.WinForms.Guna2CirclePictureBox();
            this.labPprice = new Guna.UI2.WinForms.Guna2HtmlLabel();
            this.labPname = new Guna.UI2.WinForms.Guna2HtmlLabel();
            ((System.ComponentModel.ISupportInitialize)(this.picBoxPimg)).BeginInit();
            this.SuspendLayout();
            // 
            // picBoxPimg
            // 
            this.picBoxPimg.BackColor = System.Drawing.Color.Transparent;
            this.picBoxPimg.FillColor = System.Drawing.Color.Transparent;
            this.picBoxPimg.Image = ((System.Drawing.Image)(resources.GetObject("picBoxPimg.Image")));
            this.picBoxPimg.ImageRotate = 0F;
            this.picBoxPimg.Location = new System.Drawing.Point(0, 0);
            this.picBoxPimg.Name = "picBoxPimg";
            this.picBoxPimg.ShadowDecoration.Mode = Guna.UI2.WinForms.Enums.ShadowMode.Circle;
            this.picBoxPimg.Size = new System.Drawing.Size(150, 150);
            this.picBoxPimg.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.picBoxPimg.TabIndex = 14;
            this.picBoxPimg.TabStop = false;
            this.picBoxPimg.UseTransparentBackground = true;
            // 
            // labPprice
            // 
            this.labPprice.BackColor = System.Drawing.Color.Transparent;
            this.labPprice.Font = new System.Drawing.Font("Segoe UI Semibold", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labPprice.Location = new System.Drawing.Point(48, 189);
            this.labPprice.Name = "labPprice";
            this.labPprice.Size = new System.Drawing.Size(49, 27);
            this.labPprice.TabIndex = 17;
            this.labPprice.Text = "$ 135";
            this.labPprice.TextAlignment = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // labPname
            // 
            this.labPname.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.labPname.BackColor = System.Drawing.Color.Transparent;
            this.labPname.Font = new System.Drawing.Font("Segoe UI Semibold", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labPname.Location = new System.Drawing.Point(48, 156);
            this.labPname.Name = "labPname";
            this.labPname.Size = new System.Drawing.Size(51, 27);
            this.labPname.TabIndex = 16;
            this.labPname.Text = "Lattle";
            // 
            // UserControl2
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.Transparent;
            this.Controls.Add(this.labPprice);
            this.Controls.Add(this.labPname);
            this.Controls.Add(this.picBoxPimg);
            this.Name = "UserControl2";
            this.Size = new System.Drawing.Size(150, 218);
            ((System.ComponentModel.ISupportInitialize)(this.picBoxPimg)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private Guna.UI2.WinForms.Guna2CirclePictureBox picBoxPimg;
        private Guna.UI2.WinForms.Guna2HtmlLabel labPprice;
        private Guna.UI2.WinForms.Guna2HtmlLabel labPname;
    }
}
