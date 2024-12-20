using FragrantWorld.Models;
using FragrantWorld.Services;
using FragrantWorld.Windows;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;

namespace FragrantWorld
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        ProductService _productService = new();
        PickupPointService _pickupPointService = new();
        OrderService _orderService = new();
        List<Product> _products;
        public User currentUser = new () { UserFullName = "Гость", UserRole="Клиент"};
        Order _order;
        Decimal minCost = 0;
        Decimal maxCost = 0;

        public MainWindow()
        {
            InitializeComponent();
        }

        private async Task UpdateProductsAsync()
        {
            try
            {
                _products = await _productService.GetProductsAsync();
            }
            catch (HttpRequestException ex)
            {
                MessageBox.Show($"Не удалось получить список товаров. Код ошибки - {(int)ex.StatusCode}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private async Task FilterProductsAsync()
        {
            await UpdateProductsAsync();
            if (_products == null)
                return;
            IEnumerable<Product> filteredProducts = _products;
            if (searchProductTextBox.Text.Trim() != "")
                filteredProducts = filteredProducts.Where(p => p.ProductName.ToLower()
                .Contains(searchProductTextBox.Text.Trim().ToLower()));
            var manufacturer = manufacturerComboBox.SelectedItem.ToString();
            if (manufacturer != "Все производители")
                filteredProducts = filteredProducts.Where(p => p.ProductManufacturer == manufacturer);
            if (minCost != 0)
                filteredProducts = filteredProducts.Where(p => p.ProductCostWithDiscount >= minCost);
            if (maxCost != 0)
                filteredProducts = filteredProducts.Where(p => p.ProductCostWithDiscount <= maxCost);
            filteredProducts = sortCostComboBox.SelectedIndex == 0 ?
                filteredProducts.OrderBy(p => p.ProductCost) :
                filteredProducts.OrderByDescending(p => p.ProductCost);
            countProductTextBlock.Text = $"{filteredProducts.Count()}/{_products.Count()}";
            productsListBox.ItemsSource = filteredProducts.ToList();
        }

        private async Task UpdateManufacturers()
        {
            await UpdateProductsAsync();
            if (_products == null)
                return;
            var manufacturers = _products.Select(p => p.ProductManufacturer).Distinct().ToList();
            manufacturers.Insert(0, "Все производители");
            manufacturerComboBox.ItemsSource = manufacturers;
            manufacturerComboBox.SelectedIndex = 0;
            sortCostComboBox.SelectedIndex = 0;
        }

        private async void Window_Loaded(object sender, RoutedEventArgs e)
        {
            await UpdateManufacturers();
            await FilterProductsAsync();
        }

        private async void SortCostComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            await FilterProductsAsync();
        }

        private async void ManufacturerComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            await FilterProductsAsync();
        }

        private async void MinCostTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            Decimal.TryParse(MinCostTextBox.Text, out minCost);
            await FilterProductsAsync();
        }

        private async void MaxCostTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            Decimal.TryParse(MinCostTextBox.Text, out minCost);
            await FilterProductsAsync();
        }

        private async void SearchProductTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (String.IsNullOrEmpty(searchProductTextBox.Text))
                HintSearchTextBlock.Visibility = Visibility.Visible;
            else
                HintSearchTextBlock.Visibility = Visibility.Collapsed;
            await FilterProductsAsync();
        }

        private void ShowOrderButton_Click(object sender, RoutedEventArgs e)
        {
            OrderWindow window = new(_order, currentUser);
            window.ShowDialog();
        }

        private async void OrderButton_Click(object sender, RoutedEventArgs e)
        {
            var button = sender as Button;
            Product product = button.DataContext as Product;
            if (product.ProductStatus == "Нет в наличии")
            {
                MessageBox.Show($"Товар распродан, дождитесь нового поступления", "Товара нет в наличии", MessageBoxButton.OK, MessageBoxImage.Information);
                return;
            }
            if (_order == null)
            {
                _order = new() { OrderStatus = "Новый" };
                var pickupPoints = await _pickupPointService.GetPickupPointsAsync();
                _order.OrderPickupPoint = pickupPoints.FirstOrDefault().PickupPointId;
                _order.OrderDate = DateTime.Now;
                _order.OrderDeliveryDate = DateTime.Now.AddDays(7);
                _order = await _orderService.AddOrderAsync(_order);
            }
            try
            {
                var orderProducts = await _orderService.GetOrderProductsByOrderAsync(_order);
                var orderProduct = orderProducts.Where(op => op.ProductArticleNumber == product.ProductArticleNumber).FirstOrDefault();
                if (orderProduct == null)
                {
                    orderProduct = new()
                    {
                        OrderId = _order.OrderId,
                        ProductAmount = 1,
                        ProductArticleNumber = product.ProductArticleNumber
                    };
                    await _orderService.AddProductToOrderAsync(orderProduct);
                }
                else
                {
                    orderProduct.ProductAmount++;
                    await _orderService.UpdateProductOrderAsync(orderProduct);
                } 
                showOrderButton.Visibility = Visibility.Visible;
            }
            catch (HttpRequestException ex)
            {
                MessageBox.Show($"Не удалось добавить товар в заказ", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            
            
        }

        private void AuthorizationButton_Click(object sender, RoutedEventArgs e)
        {
            AuthorizationWindow authorizationWindow = new();
            authorizationWindow.ShowDialog();
            currentUser = authorizationWindow.User;
            if (currentUser.UserLogin != "Guest")
            {
                loginLabel.Content = currentUser.UserFullName;
                authorizationButton.Visibility = Visibility.Collapsed;
                logoutButton.Visibility = Visibility.Visible;
                if(currentUser.UserRole != "Клиент")
                    updateOrdersButton.Visibility = Visibility.Visible;
            }
        }

        private void LogoutButton_Click(object sender, RoutedEventArgs e)
        {
            currentUser = new() { UserFullName = "Гость", UserRole="Клиент"};
            loginLabel.Content = currentUser.UserFullName;
            authorizationButton.Visibility = Visibility.Visible;
            logoutButton.Visibility = Visibility.Collapsed;
            updateOrdersButton.Visibility = Visibility.Collapsed;
        }

        private void UpdateOrdersButton_Click(object sender, RoutedEventArgs e)
        {
            UpdateOrders updateOrders = new UpdateOrders();
            updateOrders.ShowDialog();
        }
    }
}
