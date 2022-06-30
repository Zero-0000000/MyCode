using System;
using System.IO;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Diagnostics;

namespace Анаграммы
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        static string Shuffle(string s)
        {
            var chars = s.ToArray();
            for (int i = chars.Length - 1; i > 0; i--)
            {
                int j = rand.Next(i);
                (chars[i], chars[j]) = (chars[j], chars[i]);
            }

            return new string(chars);
        }
        private void newWord()
        {
            word = input[rand.Next(0, input.Length)];
            textBox1.Text = Shuffle(word);
            //textBox1.Text = word;
        }
        static readonly Random rand = new Random();
        private static string txt = File.ReadAllText(Environment.CurrentDirectory + "\\ovoshi.txt", Encoding.Default);
        private string[] input = txt.Split('\n');
        private string word;
        private int time = 60;
        private int correctWords = 0;
        private void button1_Click(object sender, EventArgs e)
        {
            Process.Start(Environment.CurrentDirectory + "\\ovoshi.txt");
        }
        private void timer1_Tick(object sender, EventArgs e)
        {
            time--; 
            label2.Text = "Оставшееся время: " + Convert.ToString(time);
            if (time == 0) 
            { 
                timer1.Stop(); 
                MessageBox.Show("Время вышло, слово: " + word); 
            }
        }
        private void Form1_Load(object sender, EventArgs e)
        {
            newWord();
        }
        private void checkWord()
        {
            if (textBox2.Text == word)
            {
                correctWords++; 
                time = 60; 
                label3.Text = "Угадано слов: " + Convert.ToString(correctWords);
                newWord(); 
                textBox2.Text = "";
            }
            else textBox2.Text = "";
        }
        private void button2_Click(object sender, EventArgs e)
        {
            checkWord();
        }
    }
}
