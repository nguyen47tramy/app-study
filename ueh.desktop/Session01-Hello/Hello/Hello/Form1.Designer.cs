namespace Hello
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.txt_hoten = new System.Windows.Forms.TextBox();
            this.lb_hoten = new System.Windows.Forms.Label();
            this.btn_hoten = new System.Windows.Forms.Button();
            this.btn_thoat = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // txt_hoten
            // 
            this.txt_hoten.AcceptsReturn = true;
            this.txt_hoten.AcceptsTab = true;
            this.txt_hoten.Location = new System.Drawing.Point(121, 23);
            this.txt_hoten.Name = "txt_hoten";
            this.txt_hoten.Size = new System.Drawing.Size(285, 26);
            this.txt_hoten.TabIndex = 0;
            this.txt_hoten.TextChanged += new System.EventHandler(this.textBox1_TextChanged);
            // 
            // lb_hoten
            // 
            this.lb_hoten.AutoSize = true;
            this.lb_hoten.Location = new System.Drawing.Point(17, 29);
            this.lb_hoten.Name = "lb_hoten";
            this.lb_hoten.Size = new System.Drawing.Size(77, 20);
            this.lb_hoten.TabIndex = 1;
            this.lb_hoten.Text = "Họ và tên";
            this.lb_hoten.Click += new System.EventHandler(this.label1_Click);
            // 
            // btn_hoten
            // 
            this.btn_hoten.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.btn_hoten.Location = new System.Drawing.Point(309, 77);
            this.btn_hoten.Name = "btn_hoten";
            this.btn_hoten.Size = new System.Drawing.Size(97, 36);
            this.btn_hoten.TabIndex = 2;
            this.btn_hoten.Text = "Hiển thị";
            this.btn_hoten.UseVisualStyleBackColor = false;
            this.btn_hoten.Click += new System.EventHandler(this.btn_hoten_Click);
            // 
            // btn_thoat
            // 
            this.btn_thoat.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.btn_thoat.Location = new System.Drawing.Point(309, 119);
            this.btn_thoat.Name = "btn_thoat";
            this.btn_thoat.Size = new System.Drawing.Size(97, 33);
            this.btn_thoat.TabIndex = 3;
            this.btn_thoat.Text = "Thoát";
            this.btn_thoat.UseVisualStyleBackColor = false;
            this.btn_thoat.Click += new System.EventHandler(this.btn_thoat_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(435, 450);
            this.Controls.Add(this.btn_thoat);
            this.Controls.Add(this.btn_hoten);
            this.Controls.Add(this.lb_hoten);
            this.Controls.Add(this.txt_hoten);
            this.KeyPreview = true;
            this.Name = "Form1";
            this.StartPosition = System.Windows.Forms.FormStartPosition.WindowsDefaultBounds;
            this.Text = "Form1";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.Form1_FormClosing);
            this.Load += new System.EventHandler(this.Form1_Load);
            this.KeyDown += new System.Windows.Forms.KeyEventHandler(this.Form1_KeyDown);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox txt_hoten;
        private System.Windows.Forms.Label lb_hoten;
        private System.Windows.Forms.Button btn_hoten;
        private System.Windows.Forms.Button btn_thoat;
    }
}

