using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Hello
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void btn_hoten_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Ten cua ban la: " + txt_hoten.Text);
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            if (MessageBox.Show("Ban co muon mo chuong trinh khong?", 
                                "Hoi nguoi dung",
                                MessageBoxButtons.OKCancel, 
                                MessageBoxIcon.Question) == DialogResult.Cancel)
                Dispose(); //close form
        }

        private void btn_thoat_Click(object sender, EventArgs e)
        {
            DialogResult dg = MessageBox.Show("Ban co muon dong chuong trinh",
                                                "Hoi nguoi dung",
                                                MessageBoxButtons.YesNo,
                                                MessageBoxIcon.Question);
            if (dg == DialogResult.Yes)
            {
                Application.Exit();
            }
        }

        private void Form1_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Modifiers == Keys.Alt && e.KeyCode == Keys.H) 
                {
                txt_hoten.Text = "Hello!";
                }
        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            DialogResult r;
            r = MessageBox.Show ("Ban co muon dong chuong trinh?",
                                "Xac nhan",
                                MessageBoxButtons.YesNo,
                                MessageBoxIcon.Question,
                                MessageBoxDefaultButton.Button1 );
            if (r == DialogResult.No)
                e.Cancel = true;
        }
    }
}
