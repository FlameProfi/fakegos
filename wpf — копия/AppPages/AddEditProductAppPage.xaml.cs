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
    /// Логика взаимодействия для AddEditProductAppPage.xaml
    /// </summary>
    public partial class AddEditProductAppPage : Page
    {
        TextBlock _title;
        DeDbContext _context;
        Product _selectionItem;
        public AddEditProductAppPage(DeDbContext context, TextBlock title, Models.Product selectionItem = null)
        {
            InitializeComponent();
            _title = title;
            _context = context;
            if (selectionItem == null)
            {
                _title.Text = "Добавление продукта";
                selectionItem = new Models.Product();
            }
            else
                _title.Text = "Редактирование продукта";

            DataContext = selectionItem;

            _selectionItem = selectionItem;
        }

        private void SaveBTN_Click(object sender, RoutedEventArgs e)
        {
            if (_selectionItem.Price < 0)
            {
                MessageBox.Show("Стоимость не может быть отрицательной!");
                return;
            }

            if (_selectionItem.QuanityInStock < 0)
            {
                MessageBox.Show("Количество на слкаде не может быть отрицательным!");
                return;
            }


            string selectionCategory = (string)CategoryCB.SelectedItem;
            var category = _context.Categories.FirstOrDefault(x => x.Name == selectionCategory);
            _selectionItem.CategoryId = category.Id;

            string selectionManufacturer = (string)ManufacturerCB.SelectedItem;
            var Manufacturer = _context.Manufacturers.FirstOrDefault(x => x.Name == selectionManufacturer);
            _selectionItem.Manufacturer = Manufacturer;

            string selectionSupplier = (string)SupplierCB.SelectedItem;
            var supplier = _context.Suppliers.FirstOrDefault(x => x.Name == selectionSupplier);
            _selectionItem.SupplierId = supplier.Id;

            string selectionUnit = (string)UnitCB.SelectedItem;
            var unit = _context.Units.FirstOrDefault(x => x.Name == selectionUnit);
            _selectionItem.UnitId = unit.Id;

            if (_selectionItem.Id == 0)
            {
                _selectionItem.Article = "123";
                _context.Products.Add(_selectionItem);
            }

            _context.SaveChanges();
            MessageBox.Show("Успешно сохранено");
            NavigationService.GoBack();
        }

        private void BackBTN_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {


            var productTypes = _context.Products.Select(x => x.Name).ToList();
            TypeCB.ItemsSource = productTypes;

            var productCategoty = _context.Categories.Select(x => x.Name).ToList();
            CategoryCB.ItemsSource = productCategoty;

            var productManufacturer = _context.Manufacturers.Select(x => x.Name).ToList();
            ManufacturerCB.ItemsSource = productManufacturer;

            var productSupplier = _context.Suppliers.Select(x => x.Name).ToList();
            SupplierCB.ItemsSource = productSupplier;

            var productUnit = _context.Units.Select(x => x.Name).ToList();
            UnitCB.ItemsSource = productUnit;

            if (_selectionItem.Id != 0)
            {
                DeleteBTN.Visibility = Visibility.Visible;
                IdDP.Visibility = Visibility.Visible;
                CategoryCB.SelectedItem = _selectionItem.Category.Name;
                ManufacturerCB.SelectedItem = _selectionItem.Manufacturer.Name;
                SupplierCB.SelectedItem = _selectionItem.Supplier.Name;
                UnitCB.SelectedItem = _selectionItem.Unit.Name;
            }


        }

        private void DeleteBTN_Click(object sender, RoutedEventArgs e)
        {

            _context.Products.Remove(_selectionItem);
            _context.SaveChanges();
            MessageBox.Show("Успешно удалено");
            NavigationService.GoBack();
        }
    }
}
