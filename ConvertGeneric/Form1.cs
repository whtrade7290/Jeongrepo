using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.IO;


namespace ConvertGeneric
{
    public partial class Form1 : Form
    {
        string[] lines = null;
        double scale = 1.0;
        string genPath = "";
        Graphics g;
        int index = 0;

        TreeNode rootNode = new TreeNode();
        TreeNode childNode = new TreeNode();
        
        geometry geo = new geometry();

        public Form1()
        {
            InitializeComponent();
        }

        /// <summary>
        /// 트리노드 메서드
        /// </summary>
        /// <param name="pNode">부모노드</param>
        /// <param name="lines">파일 내용이 담긴 배열</param>
        /// <param name="num">배열의 index</param>
        private void LoadData(TreeNode pNode, string[] lines, int num)
        {

            while (index < lines.Length)
            {
                // =를 포함하지 않는 root의 하위노드
                if (lines[index].Contains('=') == false)
                {
                    // END_OF를 만나면 재귀 탈출
                    if (lines[index].IndexOf("END_OF_") == 0)
                    {
                        return;
                    }
                    // ROOT 아래에 추가
                    childNode = new TreeNode(lines[index]);
                    pNode.Nodes.Add(childNode);

                    // 다음 노드를 검사해서 갖고 =을 갖고 있으면 재귀 진입
                    index++;
                    if (lines[index].Contains('=') == true)
                    {
                        LoadData(childNode, lines, index);
                    }

                }

                // =을 갖고 있으면 자식노드로 추가
                else if (lines[index].Contains('=') == true)
                {
                    childNode = new TreeNode(lines[index]);

                    pNode.Nodes.Add(childNode);

                }

                index++;

            }
            
        } // LoadData


        private void btn_OnfileDialog_Click(object sender, EventArgs e)
        {
            // 트리뷰 초기화
            treeView1.Nodes.Clear();

            // 판넬 드로우 초기화
            ui_plCanvas.Invalidate();

            openFileDialog1.InitialDirectory = @"c:\\";

            if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                genPath = openFileDialog1.FileName;

                lines = File.ReadAllLines(genPath);

                // Root Node 생성
                TreeNode rootNode = new TreeNode("Root");

                // 파일 읽기
                LoadData(rootNode, lines, index);

                index = 0;

                treeView1.Nodes.Add(rootNode);

            }

            g = ui_plCanvas.CreateGraphics();

            if (lines == null)
            {
                return;
            }

            List<geometry> tempList = new List<geometry>();

            // 판넬의 폭(x축)
            double width = ui_plCanvas.Width;
            // 판넬의 높이(y축)
            double height = ui_plCanvas.Height;

            bool isDraw = false;
            bool inGeometry = true;
            double su = 0.0;
            double sv = 0.0;
            double u = 0.0;
            double v = 0.0;
            double radius = 0.0;
            double sweep = 0.0;
            double ou = 0.0;
            double ov = 0.0;

            foreach (string line in lines)
            {
                // null이거나 빈문자열인지 확인
                if (String.IsNullOrEmpty(line) == true)
                {
                    continue;
                }
                // 대소문자 관계 없이 문자열 검사
                // START를 만나면 그리기 시작
                else if (String.Equals(line, "START_OF_CONTOUR", StringComparison.OrdinalIgnoreCase))
                {
                    isDraw = true;
                }
                else if (String.Equals(line, "END_OF_CONTOUR", StringComparison.OrdinalIgnoreCase))
                {
                    isDraw = false;
                }
                // GEOMETRY_TYPE=CVBA_GRAPH 부터 END_OF_GEOMETRY_DATA 까지는 그리지 않음
                else if (String.Equals(line, "GEOMETRY_TYPE=CVBA_GRAPH", StringComparison.OrdinalIgnoreCase))
                {
                    inGeometry = false;
                }
                else if (String.Equals(line, "END_OF_GEOMETRY_DATA", StringComparison.OrdinalIgnoreCase))
                {
                    inGeometry = true;
                }
                else
                {
                    // START_OF_CONTOUR를 만난 후로 부터의 데이터
                    if (isDraw == true && inGeometry == true)
                    {
                        // x1 값
                        if (line.IndexOf("START_U") == 0)
                        {
                            // gen 파일의 값을 받을 변수 생성
                            double temp = 0.0;

                            // line 배열에 저장된ex)[0]U ('=') [1] 123.456 이면
                            // =을 기준으로 자르고 뒤에 [1] 값만 temp에 담아 출력
                            Double.TryParse(line.Split('=')[1], out temp);

                            su = temp;
                        }
                        // y1 값
                        else if (line.IndexOf("START_V=") == 0)
                        {
                            double temp = 0.0;

                            Double.TryParse(line.Split('=')[1], out temp);

                            sv = temp;
                        }

                        // RADIUS
                        else if (line.IndexOf("RADIUS=") == 0)
                        {
                            double temp = 0.0;

                            Double.TryParse(line.Split('=')[1], out temp);

                            radius = temp;

                        }
                        // SWEEP
                        else if (line.IndexOf("SWEEP=") == 0)
                        {
                            double temp = 0.0;

                            Double.TryParse(line.Split('=')[1], out temp);

                            sweep = temp;

                        }
                        // ORIGIN_U
                        else if (line.IndexOf("ORIGIN_U=") == 0)
                        {
                            double temp = 0.0;

                            Double.TryParse(line.Split('=')[1], out temp);

                            ou = temp;

                        }
                        // ORIGIN_V
                        else if (line.IndexOf("ORIGIN_V=") == 0)
                        {
                            double temp = 0.0;

                            Double.TryParse(line.Split('=')[1], out temp);

                            ov = temp;

                        }
                        // x2 값
                        else if (line.IndexOf("U=") == 0)
                        {
                            double temp = 0.0;

                            Double.TryParse(line.Split('=')[1], out temp);

                            u = temp;
                        }
                        // 마지막 (x1. y1) (x2. y2) 의 마지막 y2까지 입력이 되면 
                        else if (line.IndexOf("V=") == 0)
                        {
                            double temp = 0.0;

                            Double.TryParse(line.Split('=')[1], out temp);

                            v = temp;

                            geometry genDatas = null;

                            genDatas = new geometry();
                            genDatas.sx = su;
                            genDatas.sy = sv;
                            genDatas.ex = u;
                            genDatas.ey = v;
                            genDatas.cx = ou;
                            genDatas.cy = ov;
                            genDatas.radius = radius;
                            genDatas.sweep = sweep;

                            if (genDatas != null)
                            {
                                tempList.Add(genDatas);
                            }

                            su = u;
                            sv = v;
                        }

                    } // isDraw == true
                } // else

            } // foreach

            // 부재 뒤집기 y 값이 가장 높은 수에 -를 붙여주면 가장 낮아짐
            foreach (geometry geo in tempList)
            {
                geo.sy *= -1;
                geo.ey *= -1;
                geo.cy *= -1;
            }


            float min_X = 99999999;
            float min_Y = 99999999;
            float max_X = -99999999;
            float max_Y = -99999999;

            // 부재의 최단 아래, 위 양옆의 좌표 얻기
            foreach (geometry geo in tempList)
            {

                if (min_X > geo.sx)
                {
                    min_X = (float)geo.sx;
                }

                if (min_X > geo.ex)
                {
                    min_X = (float)geo.ex;
                }

                if (max_X < geo.sx)
                {
                    max_X = (float)geo.sx;
                }

                if (max_X < geo.ex)
                {
                    max_X = (float)geo.ex;
                }

                if (min_Y > geo.sy)
                {
                    min_Y = (float)geo.sy;
                }

                if (min_Y > geo.ey)
                {
                    min_Y = (float)geo.ey;
                }

                if (max_Y < geo.sy)
                {
                    max_Y = (float)geo.sy;
                }

                if (max_Y < geo.ey)
                {
                    max_Y = (float)geo.ey;
                }
            }

            // 부재 자체 폭
            double partWidth = Math.Abs(min_X - max_X);

            // 부재 자체 높이
            double partHeight = Math.Abs(min_Y - max_Y);

            // 부재와 화면과의 비율
            // 폭과 높이의 비율 중 낮은 비율을 scale에 대입 후 scale보다 0.1 작게(전체 출력)
            this.scale = ((width / partWidth) < (height / partHeight) ? (width / partWidth) : (height / partHeight)) - 0.1;
  
            if (scale < 0) scale *= -1;
            
            // 0 에서 시작하기
            foreach (geometry geo in tempList)
            {
                geo.sx -= min_X;
                geo.sy -= min_Y;
                geo.ex -= min_X;
                geo.ey -= min_Y;
                geo.cx -= min_X;
                geo.cy -= min_Y;
            }

            DrawLineOrArc(tempList);
        }
        /// <summary>
        /// 선 or 호 그리기
        /// </summary>
        /// <param name="tempList">geometry 클래스 List</param>
        private void DrawLineOrArc(List<geometry> tempList)
        {
            g = ui_plCanvas.CreateGraphics();

            foreach (geometry geo in tempList)
            {
                // radius가 0이면 선
                if (geo.radius == 0)
                {
                    // START_U
                    float x1 = (float)(geo.sx * scale);
                    // START_V
                    float y1 = (float)(geo.sy * scale);
                    // END_U
                    float x2 = (float)(geo.ex * scale);
                    // END_V
                    float y2 = (float)(geo.ey * scale);

                    // 시작 포인트
                    PointF p1 = new PointF(x1, y1);
                    // 선의 끝 포인트
                    PointF p2 = new PointF(x2, y2);

                    g.DrawLine(new Pen(Brushes.Black, 1), p1, p2);
                }
                // radius 0이 아니면 호
                else
                {   // START_U
                    float x1 = (float)(geo.sx * scale);
                    // START_V
                    float y1 = (float)(geo.sy * scale);
                    // ORIGIN_U
                    float cx = (float)(geo.cx * scale);
                    // ORIGIN_V
                    float cy = (float)(geo.cy * scale);
                    // RADIUS
                    float arcRadius = (float)(geo.radius * scale);

                    // 바인딩 렉탱글 x축
                    float square_x = (float)(cx - arcRadius);
                    // 바인딩 렉탱글 y축
                    float square_y = (float)(cy - arcRadius);
                    // 바인딩 렉탱글 폭
                    float squareWidth = (float)(arcRadius * 2);
                    // 바인딩 렉탱글 높이
                    float squareHeight = (float)(arcRadius * 2);
                    // 호 그리기 시작 각도
                    float startAngle = ArcTan2(x1, y1, cx, cy);
                    // 호의 각도
                    float sweepAngle = ((float)geo.sweep * 180 / (float)Math.PI);

                    g.DrawArc(new Pen(Brushes.Red, 1), square_x, square_y, squareWidth, squareHeight, startAngle, sweepAngle);
                }

            }
        }




        /// <summary>
        /// StartAngle 구하는 메서드(역탄젠트)
        /// </summary>
        /// <param name="sp_X">움직인 축 x</param>
        /// <param name="sp_Y">움직인 축 y</param>
        /// <param name="origin_u">기준 축 x</param>
        /// <param name="origin_v">기준 축 y</param>
        /// <returns></returns>
        private float ArcTan2(float sp_X, float sp_Y, float origin_u, float origin_v)
        {
            float degreeAngle = 0.0f;

            // 호의 중심점 x 축에서 StartPoint의 x축까지 움직인 거리
            float start_X = sp_X - origin_u;

            // 호의 중심점 y 축에서 StartPoint의 y축까지 움직인 거리
            float start_Y = sp_Y - origin_v;

            // 역탄젠트 함수
            float radian = (float)Math.Atan2(start_Y, start_X);

            // radian 값 >> degree로 환산
            degreeAngle = (radian * 180 / (float)Math.PI);

            return degreeAngle;
        }

        private void ui_plCanvas_MouseMove(object sender, MouseEventArgs e)
        {
            label1.Text = e.X.ToString();
            label2.Text = e.Y.ToString();
        }
    }
}
