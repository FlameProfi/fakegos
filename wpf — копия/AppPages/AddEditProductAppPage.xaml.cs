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

            if (_selectionItem.CountInStock < 0)
            {
                MessageBox.Show("Количество на слкаде не может быть отрицательным!");
                return;
            }


            string selectionCategory = (string)CategoryCB.SelectedItem;
            var category = _context.Categories.FirstOrDefault(x => x.Name == selectionCategory);
            _selectionItem.CategoryId = category.Id;

            string selectionMacker = (string)MackerCB.SelectedItem;
            var Macker = _context.Mackers.FirstOrDefault(x => x.Name == selectionMacker);
            _selectionItem.MackerId = Macker.Id;

            string selectionSupllier = (string)SupllierCB.SelectedItem;
            var supplier = _context.Suplliers.FirstOrDefault(x => x.Name == selectionSupllier);
            _selectionItem.SupllierId = supplier.Id;

            string selectionUnit = (string)UnitCB.SelectedItem;
            var unit = _context.Units.FirstOrDefault(x => x.Name == selectionUnit);
            _selectionItem.UnitId = unit.Id;

            if (_selectionItem.Id == 0)
            {
                _selectionItem.Articul = "123";
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

            var productMacker = _context.Mackers.Select(x => x.Name).ToList();
            MackerCB.ItemsSource = productMacker;

            var productSupllier = _context.Suplliers.Select(x => x.Name).ToList();
            SupllierCB.ItemsSource = productSupllier;

            var productUnit = _context.Units.Select(x => x.Name).ToList();
            UnitCB.ItemsSource = productUnit;

            if (_selectionItem.Id != 0)
            {
                DeleteBTN.Visibility = Visibility.Visible;
                IdDP.Visibility = Visibility.Visible;
                CategoryCB.SelectedItem = _selectionItem.Category.Name;
                MackerCB.SelectedItem = _selectionItem.Macker.Name;
                SupllierCB.SelectedItem = _selectionItem.Supllier.Name;
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
