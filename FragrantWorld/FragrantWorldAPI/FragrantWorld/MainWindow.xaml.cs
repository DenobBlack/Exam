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
            IEnumerable<Product> filteredProducts = _products;
            if (SearchProductTextBox.Text.Trim() != "")
                filteredProducts = filteredProducts.Where(p => p.ProductName.ToLower()
                .Contains(SearchProductTextBox.Text.Trim().ToLower()));
            var manufacturer = ManufacturerComboBox.SelectedItem.ToString();
            if (manufacturer != "Все производители")
                filteredProducts = filteredProducts.Where(p => p.ProductManufacturer == manufacturer);
            if (minCost != 0)
                filteredProducts = filteredProducts.Where(p => p.ProductCost >= minCost);
            if (maxCost != 0)
                filteredProducts = filteredProducts.Where(p => p.ProductCost <= maxCost);
            filteredProducts = SortCostComboBox.SelectedIndex == 0 ?
                filteredProducts.OrderBy(p => p.ProductCost) :
                filteredProducts.OrderByDescending(p => p.ProductCost);
            CountProductTextBlock.Text = $"{filteredProducts.Count()}/{_products.Count()}";
            ProductsListBox.ItemsSource = filteredProducts.ToList();
        }

        private async Task UpdateManufacturers()
        {
            await UpdateProductsAsync();
            var manufacturers = _products.Select(p => p.ProductManufacturer).Distinct().ToList();
            manufacturers.Insert(0, "Все производители");
            ManufacturerComboBox.ItemsSource = manufacturers;
            ManufacturerComboBox.SelectedIndex = 0;
            SortCostComboBox.SelectedIndex = 0;
        }

        private async void Window_Loaded(object sender, RoutedEventArgs e)
        {
            await UpdateManufacturers();
            var one = ManufacturerComboBox.SelectedItem.ToString();
            var four = SortCostComboBox.SelectedItem.ToString();
            Thread.Sleep(1500);
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
            if (MinCostTextBox.Text.Trim() == "")
                minCost = 0;
            if (Decimal.TryParse(MinCostTextBox.Text, out minCost))
                await FilterProductsAsync();
        }

        private async void MaxCostTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (MaxCostTextBox.Text.Trim() == "")
                maxCost = 0;
            if (Decimal.TryParse(MaxCostTextBox.Text, out maxCost))
                await FilterProductsAsync();
        }

        private async void SearchProductTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (String.IsNullOrEmpty(SearchProductTextBox.Text))
                HintSearchTextBlock.Visibility = Visibility.Visible;
            else
                HintSearchTextBlock.Visibility = Visibility.Collapsed;
            await FilterProductsAsync();
        }

        private void ShowOrderButton_Click(object sender, RoutedEventArgs e)
        {
            OrderWindow window = new(_order);
            window.ShowDialog();
        }

        private async void OrderButton_Click(object sender, RoutedEventArgs e)
        {
            var button = sender as Button;
            Product product = button.DataContext as Product;
            if (_order == null)
            {
                _order = new() { OrderStatus = "Новый" };
                var pickupPoints = await _pickupPointService.GetPickupPointsAsync();
                _order.OrderPickupPoint = pickupPoints.FirstOrDefault().PickupPointId;
                _order.OrderDate = DateTime.Now;
                _order.OrderDeliveryDate = DateTime.Now.AddDays(7);
                try
                {
                    _order = await _orderService.AddOrderAsync(_order);
                }
                catch (HttpRequestException ex)
                {
                    MessageBox.Show($"Не удалось добавить заказ. Код ошибки - {(int)ex.StatusCode}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
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
                    try
                    {
                        await _orderService.AddProductToOrderAsync(orderProduct);
                    }
                    catch (HttpRequestException ex)
                    {
                        MessageBox.Show($"Не удалось добавить взаимосвязь продукта с заказом. Код ошибки - {(int)ex.StatusCode}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    }
                }
                else
                {
                    orderProduct.ProductAmount++;
                    try
                    { 
                    await _orderService.UpdateProductOrderAsync(orderProduct);
                    }
                    catch (HttpRequestException ex)
                    {
                        MessageBox.Show($"Не удалось изменить взаимосвязь продукта с заказом. Код ошибки - {(int)ex.StatusCode}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    }
                    ShowOrderButton.Visibility = Visibility.Visible;
                }
            }
            catch (HttpRequestException ex)
            {
                MessageBox.Show($"Не удалось получить список взаимосвязанных товаров с продуктами. Код ошибки - {(int)ex.StatusCode}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            
            
        }
    }
}
