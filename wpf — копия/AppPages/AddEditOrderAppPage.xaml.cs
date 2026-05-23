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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Khrameeva3.AppPages
{
    /// <summary>
    /// Логика взаимодействия для AddEditOrderAppPage.xaml
    /// </summary>
    public partial class AddEditOrderAppPage : Page
    {
        DeDbContext _context;
        TextBlock _titleTB;
        User _user;
        Order _selectedOrder;
        public AddEditOrderAppPage(DeDbContext context, TextBlock titleTB, Models.User user, Order selectedOrder = null)
        {
            InitializeComponent();
            _context = context;
            _user = user;
            _titleTB = titleTB;
            _selectedOrder = selectedOrder;
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            var orderStatus = _context.Statuses.Select(x => x.Name).ToList();
            StatusCB.ItemsSource = orderStatus;

            var orderAdressPVZ = _context.AdressPVZs.Select(x => x.FullName).ToList();
            AdressPVZCB.ItemsSource = orderAdressPVZ;

            if (_selectedOrder == null)
            {
                _titleTB.Text = "Добавление заказа";
                _selectedOrder = new Order();
            }

            DataContext = _selectedOrder;
            if (_selectedOrder.Id != 0)
            {
                _titleTB.Text = "Редактирование заказа";
                DeleteBTN.Visibility = Visibility.Visible;
                StatusCB.SelectedItem = _selectedOrder.Status.Name;
                AdressPVZCB.SelectedItem = _selectedOrder.AdressPVZ.FullName;
            }


        }

        private void SaveBTN_Click(object sender, RoutedEventArgs e)
        {
            string statusName = (string)StatusCB.SelectedItem;
            var status = _context.Statuses.FirstOrDefault(x => x.Name == statusName);
            _selectedOrder.StatusId = status.Id;

            string pointName = (string)AdressPVZCB.SelectedItem;
            var point = _context.AdressPVZs.FirstOrDefault(x => x.FullName == pointName);
            _selectedOrder.PVZId = point.Id;

            if (_selectedOrder.Id == 0)
            {
                _context.Orders.Add(_selectedOrder);
            }

            _context.SaveChanges();
            MessageBox.Show("Успешно сохранено");
        }

        private void BackBTN_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void DeleteBTN_Click(object sender, RoutedEventArgs e)
        {
            _context.Orders.Remove(_selectedOrder);
            MessageBox.Show("Заказ удален");
        }
    }
}
