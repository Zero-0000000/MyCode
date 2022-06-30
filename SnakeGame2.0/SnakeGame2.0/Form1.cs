using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SnakeGame2._0
{
    public partial class Form1 : Form
    {
        private int rI, rJ;
        private PictureBox fruit;
        private PictureBox Redfruit;
        private PictureBox Bluefruit;
        private PictureBox Yellowfruit;
        private PictureBox[] snake = new PictureBox[400];
        private Label labelScore;
        private int DirX, DirY;
        private int _width = 720;
        private int _height = 680;
        private int _sizeofsize = 40;
        private int score = 0;

        public Form1()
        {
            InitializeComponent();
            this.Text = "Snake";
            this.BackColor = Color.Black; 

            this.Width = _width;
            this.Height = _height;

            DirX = 0;
            DirY = 1;

            labelScore = new Label();
            labelScore.Text = "Score: 0";
            labelScore.ForeColor = Color.White;
            labelScore.Location = new Point(_height - 30, 10);
            this.Controls.Add(labelScore);

            snake[0] = new PictureBox();
            snake[0].Location = new Point(201, 201);
            snake[0].Size = new Size(_sizeofsize - 1, _sizeofsize - 1);
            snake[0].BackColor = Color.White;
            this.Controls.Add(snake[0]);

            fruit = new PictureBox();
            fruit.BackColor = Color.Orange;
            fruit.Size = new Size(_sizeofsize, _sizeofsize);

            Redfruit = new PictureBox();
            Redfruit.BackColor = Color.Red;
            Redfruit.Size = new Size(_sizeofsize, _sizeofsize);

            Bluefruit = new PictureBox();
            Bluefruit.BackColor = Color.Blue;
            Bluefruit.Size = new Size(_sizeofsize, _sizeofsize);

            Yellowfruit = new PictureBox();
            Yellowfruit.BackColor = Color.Yellow;
            Yellowfruit.Size = new Size(_sizeofsize, _sizeofsize);

            map(); //вызов генерации карты

            _generateFruit(); //вызов генерации фрукта
            _generateRedFruit();
            _generateBlueFruit();
            _generateYellowFruit();

            timer1.Tick += new EventHandler(_rndfruit);
            timer1.Interval = 5000;
            timer1.Start();

            timer.Tick += new EventHandler(_ubdate);
            timer.Interval = 500;
            timer.Start();

            this.KeyDown += new KeyEventHandler(qwr); //вызов управления змейкой
        }
        private void _CheckBorders()
        {
            if (snake[0].Location.X < 40)
            {
                for (int _i = 1; _i <= score; _i++)
                {
                    this.Controls.Remove(snake[_i]);
                }
                score = 0;
                labelScore.Text = "Score: " + score;
                DirX = 1;
            }
            if (snake[0].Location.X > _height - 80)
            {
                for (int _i = 1; _i <= score; _i++)
                {
                    this.Controls.Remove(snake[_i]);
                }
                score = 0;
                labelScore.Text = "Score: " + score;
                DirX = -1;
            }
            if (snake[0].Location.Y < 40)
            {
                for (int _i = 1; _i <= score; _i++)
                {
                    this.Controls.Remove(snake[_i]);
                }
                score = 0;
                labelScore.Text = "Score: " + score;
                DirY = 1;
            }
            if (snake[0].Location.Y > _height - 80)
            {
                for (int _i = 1; _i <= score; _i++)
                {
                    this.Controls.Remove(snake[_i]);
                }
                score = 0;
                labelScore.Text = "Score: " + score;
                DirY = -1;
            }
        }
        private void _eatItSelf()
        {
            for (int j = 1; j < score; j++)
            {
                if (snake[0].Location == snake[j].Location)
                {
                    for (int _j = j; _j <= score; _j++)
                        this.Controls.Remove(snake[_j]);
                    score = score - (score - j + 1);
                }
            }
        }
        private void _eatYellowFruit()
        {
            if (snake[0].Location.X == rI && snake[0].Location.Y == rJ)
            {
                labelScore.Text = "Score: " + score + 1;
                snake[score] = new PictureBox();
                snake[score].Location = new Point(snake[score - 1].Location.X + 40 * DirX, snake[score - 1].Location.Y - 40 * DirY);
                snake[score].Size = new Size(_sizeofsize - 1, _sizeofsize - 1);
                snake[score].BackColor = Color.White;
                this.Controls.Add(snake[score]);
            }
        }
        private void _eatBlueFruit()
        {
            if (snake[0].Location.X == rI && snake[0].Location.Y == rJ)
            {
                labelScore.Text = "Score: " + score + 1;
                snake[score] = new PictureBox();
                snake[score].Location = new Point(snake[score - 1].Location.X + 40 * DirX, snake[score - 1].Location.Y - 40 * DirY);
                snake[score].Size = new Size(_sizeofsize - 1, _sizeofsize - 1);
                snake[score].BackColor = Color.White;
                this.Controls.Add(snake[score]);
            }
        }
        private void _eatRedFruit()
        {
            if (snake[0].Location.X == rI && snake[0].Location.Y == rJ)
            {
                labelScore.Text = "Score: " + score + 1;
                snake[score] = new PictureBox();
                snake[score].Location = new Point(snake[score - 1].Location.X + 40 * DirX, snake[score - 1].Location.Y - 40 * DirY);
                snake[score].Size = new Size(_sizeofsize - 1, _sizeofsize - 1);
                snake[score].BackColor = Color.White;
                this.Controls.Add(snake[score]);
                _generateRedFruit();
            }
        }
        private void _eatFruit()
        {
            if (snake[0].Location.X == rI && snake[0].Location.Y == rJ)
            {
                labelScore.Text = "Score: " + ++score;
                snake[score] = new PictureBox();
                snake[score].Location = new Point(snake[score - 1].Location.X + 40 * DirX, snake[score - 1].Location.Y - 40 * DirY);
                snake[score].Size = new Size(_sizeofsize - 1, _sizeofsize - 1);
                snake[score].BackColor = Color.White;
                this.Controls.Add(snake[score]);
                _generateFruit();
            }
        }
        private void _generateYellowFruit()
        {
            Random r = new Random();
            rI = r.Next(0, _height - _sizeofsize);
            int tempI = rI % _sizeofsize;
            rI -= tempI;
            rJ = r.Next(0, _height - _sizeofsize);
            int tempJ = rJ % _sizeofsize;
            rJ -= tempJ;
            rI++;
            rJ++;
            Yellowfruit.Location = new Point(rI, rJ);
            this.Controls.Add(Yellowfruit);
        }
        private void _generateBlueFruit()
        {
            Random r = new Random();
            rI = r.Next(0, _height - _sizeofsize);
            int tempI = rI % _sizeofsize;
            rI -= tempI;
            rJ = r.Next(0, _height - _sizeofsize);
            int tempJ = rJ % _sizeofsize;
            rJ -= tempJ;
            rI++;
            rJ++;
            Bluefruit.Location = new Point(rI, rJ);
            this.Controls.Add(Bluefruit);
        }
        private void _generateRedFruit()
        {
            Random r = new Random();
            rI = r.Next(0, _height - _sizeofsize);
            int tempI = rI % _sizeofsize;
            rI -= tempI;
            rJ = r.Next(0, _height - _sizeofsize);
            int tempJ = rJ % _sizeofsize;
            rJ -= tempJ;
            rI++;
            rJ++;
            Redfruit.Location = new Point(rI, rJ);
            this.Controls.Add(Redfruit);
        }
        private void _generateFruit()
        {
            Random r = new Random();
            rI = r.Next(0, _height - _sizeofsize);
            int tempI = rI % _sizeofsize;
            rI -= tempI;
            rJ = r.Next(0, _height - _sizeofsize);
            int tempJ = rJ % _sizeofsize;
            rJ -= tempJ;
            rI++;
            rJ++;
            fruit.Location = new Point(rI, rJ);
            this.Controls.Add(fruit);
        }
        private void _moveSnake()
        {
            for (int i = score; i >= 1; i--)
            {
                snake[i].Location = snake[i - 1].Location;
            }
            snake[0].Location = new Point(snake[0].Location.X + DirX * _sizeofsize, snake[0].Location.Y + DirY * _sizeofsize);
            _eatItSelf();
        }
        private void _rndfruit(object myObject, EventArgs eventArgs)
        {
            Random rnd = new Random();
            int a = rnd.Next(1, 3);
            switch(a)
            {
                case 1:
                    _generateRedFruit();
                    break;
                case 2:
                    _generateBlueFruit();
                    break;
                case 3:
                    _generateYellowFruit();
                    break;
            }
        }
        private void _ubdate(object myObject, EventArgs eventArgs)
        {
            _CheckBorders();
            _eatFruit();
            _eatBlueFruit();
            _eatRedFruit();
            _eatYellowFruit();
            _moveSnake();
            // cube.Location = new Point(cube.Location.X + DirX * _sizeofsize, cube.Location.Y + DirY * _sizeofsize);
        }
        private void map()
        {
            for (int i = 0; i < (_width / _sizeofsize) - 1; i++) //горизонтальные полоски карты
            {
                PictureBox pic = new PictureBox();
                pic.BackColor = Color.Yellow;
                pic.Location = new Point(0, _sizeofsize * i);
                pic.Size = new Size(_width - 80, 1);
                this.Controls.Add(pic);
            }
            for (int i = 0; i <= (_height / _sizeofsize) - 1; i++) //вертикальые полоски карты
            {
                PictureBox pic = new PictureBox();
                pic.BackColor = Color.Yellow;
                pic.Location = new Point(_sizeofsize * i, 0);
                pic.Size = new Size(1, _width - 79);
                this.Controls.Add(pic);
            }
        }
        private void qwr(object sender, KeyEventArgs e)
        {
            //MessageBox.Show(e.KeyCode.ToString()); Выводит нажатую кнопку.
            switch (e.KeyCode.ToString())
            {
                case "Right":
                    DirX = 1;
                    DirY = 0;
                    break;
                case "Left":
                    DirX = -1;
                    DirY = 0;
                    break;
                case "Up":
                    DirY = -1;
                    DirX = 0;
                    break;
                case "Down":
                    DirY = 1;
                    DirX = 0;
                    break;
            }
        }
    }
}
