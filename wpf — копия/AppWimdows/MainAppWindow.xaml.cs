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
    /// Логика взаимодействия для MainAppWindow.xaml
    /// </summary>
    public partial class MainAppWindow : Window
    {
        DeDbContext _context;
        User _user;

        public MainAppWindow(DeDbContext context = null, Models.User user = null)
        {
            InitializeComponent();
            _context = context;
            _user = user;

            if (_context == null)
            {
                _context = new DeDbContext();
                _user = new User()
                {
                    RoleId = 0
                };

            }

            if (user == null)
            {
                FioTB.Text = "Гость";

            }
            else
            {
                FioTB.Text = user.FullName;
            }

            if (_user.RoleId == 2 || _user.RoleId == 3)
            {
                OrdersBTN.Visibility = Visibility.Visible;
            }

        }

        private void ExitBTN_Click(object sender, RoutedEventArgs e)
        {
            var loginWindow = new LoginWindow();
            loginWindow.Show();
            this.Close();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            var productAppPage = new AppPages.ProductAppPage(_context, TitleTB, _user);
            MainFrame.Navigate(productAppPage);
        }

        private void OrdersBTN_Click(object sender, RoutedEventArgs e)
        {
            var orderPage = new AppPages.OrderAppPage(_context, TitleTB, _user);
            MainFrame.Navigate(orderPage);
        }
    }
}
