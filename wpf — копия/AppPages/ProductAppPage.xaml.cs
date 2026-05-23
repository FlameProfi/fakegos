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
    /// Логика взаимодействия для ProductAppPage.xaml
    /// </summary>
    public partial class ProductAppPage : Page
    {
        DeDbContext _context;
        List<Product> _products;
        User _user;
        TextBlock _title;
        public ProductAppPage(DeDbContext context, TextBlock titleTB, User user)
        {
            InitializeComponent();
            _context = context;
            _user = user;
            _title = titleTB;


        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            _title.Text = "Просмотр продуктов";
            var products = _context.Products
                .Include(x => x.Category)
                .Include(x => x.Macker)
                .Include(x => x.Supllier)
                .Include(x => x.Unit)
                .ToList();

            ProductsLW.ItemsSource = products;
            _products = products;

            List<string> suppliers = new List<string>();
            suppliers.Add("Все поставщики");
            suppliers.AddRange(_context.Suplliers.Select(x => x.Name).ToList());
            FiltrCB.ItemsSource = suppliers;
            if (_user.RoleId == 0 || _user.RoleId == 1)
                ProductDP.Visibility = Visibility.Hidden;

        }

        private void Sort_Filter_Search()
        {

            List<Product> productsDone = _products;

            // Фильтрация
            if (FiltrCB.SelectedItem != null)
            {
                string filtrSelectedItem = (string)FiltrCB.SelectedItem;
                if (filtrSelectedItem != "Все поставщики")
                {
                    productsDone = productsDone.Where(x => x.Supllier.Name == filtrSelectedItem).ToList();
                }
            }

            // Поиск
            if (SearchTB.Text != "")
            {
                var searchText = SearchTB.Text.Trim().ToLower();

                productsDone = productsDone
                    .Where(x =>
                        x.Category.Name.ToLower().Contains(searchText) ||
                        x.Discription.ToLower().Contains(searchText) ||
                        x.Supllier.Name.ToLower().Contains(searchText) ||
                        x.Unit.Name.ToLower().Contains(searchText) ||
                        x.Macker.Name.ToLower().Contains(searchText)
                    )
                    .ToList();
            }

            // Сортировка
            if (SortCB.SelectedItem != null)
            {
                ComboBoxItem sortSelectedItem = (ComboBoxItem)SortCB.SelectedItem;
                string sortSelectedValue = (string)sortSelectedItem.Tag; // CountPlus CountMinus

                if (sortSelectedValue == "CountPlus")
                {
                    productsDone = productsDone.OrderBy(x => x.CountInStock).ToList();
                }
                else if (sortSelectedValue == "CountMinus")
                {
                    productsDone = productsDone.OrderByDescending(x => x.CountInStock).ToList();
                }
            }

            // Вывод

            ProductsLW.ItemsSource = productsDone;
        }

        private void SortCB_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Sort_Filter_Search();
        }

        private void FiltrCB_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

            Sort_Filter_Search();
        }

        private void SearchTB_TextChanged(object sender, TextChangedEventArgs e)
        {
            Sort_Filter_Search();
        }

        private void AddBTN_Click(object sender, RoutedEventArgs e)
        {
            if (_user.RoleId != 2)
            {
                MessageBox.Show("У вас недостаточно прав для добавления товара");
                return;
            }

            var editPage = new AddEditProductAppPage(_context, _title);
            NavigationService.Navigate(editPage);

        }

        private void ProductsLW_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (ProductsLW.SelectedItem == null)
            {
                return;
            }
            if (_user.RoleId != 2)
            {
                MessageBox.Show("У вас недостаточно прав для редактирования товара");
                return;
            }

            Product selectionItem = (Product)ProductsLW.SelectedItem;

            var editPage = new AddEditProductAppPage(_context, _title, selectionItem);
            NavigationService.Navigate(editPage);
        }
    }
}
