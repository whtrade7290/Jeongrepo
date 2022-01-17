namespace ConvertGeneric
{
    partial class Form1
    {
        /// <summary>
        /// 필수 디자이너 변수입니다.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 사용 중인 모든 리소스를 정리합니다.
        /// </summary>
        /// <param name="disposing">관리되는 리소스를 삭제해야 하면 true이고, 그렇지 않으면 false입니다.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form 디자이너에서 생성한 코드

        /// <summary>
        /// 디자이너 지원에 필요한 메서드입니다.
        /// 이 메서드의 내용을 코드 편집기로 수정하지 마십시오.
        /// </summary>
        private void InitializeComponent()
        {
            this.ui_plCanvas = new System.Windows.Forms.Panel();
            this.treeView1 = new System.Windows.Forms.TreeView();
            this.label_X = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.label_Y = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.btn_OnfileDialog = new System.Windows.Forms.Button();
            this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            this.SuspendLayout();
            // 
            // ui_plCanvas
            // 
            this.ui_plCanvas.AutoScroll = true;
            this.ui_plCanvas.AutoSize = true;
            this.ui_plCanvas.BackColor = System.Drawing.SystemColors.Window;
            this.ui_plCanvas.Location = new System.Drawing.Point(487, 15);
            this.ui_plCanvas.Name = "ui_plCanvas";
            this.ui_plCanvas.Size = new System.Drawing.Size(917, 635);
            this.ui_plCanvas.TabIndex = 1;
            this.ui_plCanvas.MouseMove += new System.Windows.Forms.MouseEventHandler(this.ui_plCanvas_MouseMove);
            // 
            // treeView1
            // 
            this.treeView1.Location = new System.Drawing.Point(86, 15);
            this.treeView1.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.treeView1.Name = "treeView1";
            this.treeView1.Size = new System.Drawing.Size(385, 635);
            this.treeView1.TabIndex = 0;
            // 
            // label_X
            // 
            this.label_X.AutoSize = true;
            this.label_X.Location = new System.Drawing.Point(12, 15);
            this.label_X.Name = "label_X";
            this.label_X.Size = new System.Drawing.Size(16, 15);
            this.label_X.TabIndex = 2;
            this.label_X.Text = "X";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 30);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(63, 15);
            this.label1.TabIndex = 3;
            this.label1.Text = "check_X";
            // 
            // label_Y
            // 
            this.label_Y.AutoSize = true;
            this.label_Y.Location = new System.Drawing.Point(12, 45);
            this.label_Y.Name = "label_Y";
            this.label_Y.Size = new System.Drawing.Size(15, 15);
            this.label_Y.TabIndex = 4;
            this.label_Y.Text = "Y";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 60);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(62, 15);
            this.label2.TabIndex = 5;
            this.label2.Text = "check_Y";
            // 
            // btn_OnfileDialog
            // 
            this.btn_OnfileDialog.Location = new System.Drawing.Point(86, 657);
            this.btn_OnfileDialog.Name = "btn_OnfileDialog";
            this.btn_OnfileDialog.Size = new System.Drawing.Size(75, 23);
            this.btn_OnfileDialog.TabIndex = 6;
            this.btn_OnfileDialog.Text = "Upload";
            this.btn_OnfileDialog.UseVisualStyleBackColor = true;
            this.btn_OnfileDialog.Click += new System.EventHandler(this.btn_OnfileDialog_Click);
            // 
            // openFileDialog1
            // 
            this.openFileDialog1.FileName = "openFileDialog1";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoScroll = true;
            this.AutoSize = true;
            this.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.ClientSize = new System.Drawing.Size(1435, 695);
            this.Controls.Add(this.btn_OnfileDialog);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label_Y);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.label_X);
            this.Controls.Add(this.ui_plCanvas);
            this.Controls.Add(this.treeView1);
            this.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Panel ui_plCanvas;
        private System.Windows.Forms.TreeView treeView1;
        private System.Windows.Forms.Label label_X;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label_Y;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button btn_OnfileDialog;
        private System.Windows.Forms.OpenFileDialog openFileDialog1;
    }
}

