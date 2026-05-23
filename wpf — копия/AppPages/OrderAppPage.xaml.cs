using Khrameeva3.Models;
using Microsoft.EntityFrameworkCore;
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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Khrameeva3.AppPages
{
    /// <summary>
    /// Логика взаимодействия для OrderAppPage.xaml
    /// </summary>
    public partial class OrderAppPage : Page
    {
        DeDbContext _context;
        TextBlock _titleTB;
        User _user;
        public OrderAppPage(DeDbContext context, TextBlock titleTB, Models.User user)
        {
            InitializeComponent();
            _context = context;
            _titleTB = titleTB;
            _user = user;

            if (_user.RoleId == 2)
            {
                AddOrderBTN.Visibility = Visibility.Visible;
            }
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            _titleTB.Text = "Заказы";
            var orders = _context.Orders
                .Include(x => x.Status)
                .Include(x => x.AdressPVZ)
                .ToList();

            OrdersLW.ItemsSource = orders;
        }

        private void OrdersLW_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (_user.RoleId != 2)
            {
                MessageBox.Show("У вас нет прав для реадактирования заказа");
                return;
            }


            var selectedOrder = OrdersLW.SelectedItem as Order;


            var addEditOrderPage = new AddEditOrderAppPage(_context, _titleTB, _user, selectedOrder);
            NavigationService.Navigate(addEditOrderPage);

        }

        private void AddOrderBTN_Click(object sender, RoutedEventArgs e)
        {
            var addEditOrderPage = new AddEditOrderAppPage(_context, _titleTB, _user);
            NavigationService.Navigate(addEditOrderPage);
        }
    }
}
