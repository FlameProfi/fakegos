using Khrameeva3.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace Khrameeva3.AppWimdows
{
    /// <summary>
    /// Логика взаимодействия для LoginWindow.xaml
    /// </summary>
    public partial class LoginWindow : Window
    {
        public LoginWindow()
        {

            InitializeComponent();
        }

        private void LogibBTN_Click(object sender, RoutedEventArgs e)
        {
            var _context = new DeDbContext();
            var logibTB = LoginTB.Text;
            var passwordTB = PasswordTB.Text;

            var user = _context.Users.FirstOrDefault(x => x.Login == logibTB && x.Password == passwordTB);
            if (user == null)
            {
                MessageBox.Show("Неверный логин или пароль. Введите снова");
                return;
            }

            MessageBox.Show($"добро пожаловать, {user.Name} ");

            var mainWindow = new MainAppWindow(_context, user);
            mainWindow.Show();
            Close();
        }

        private void GuestBTN_Click(object sender, RoutedEventArgs e)
        {
            var mainWindow = new MainAppWindow();
            mainWindow.Show();
            Close();
        }
    }
}
