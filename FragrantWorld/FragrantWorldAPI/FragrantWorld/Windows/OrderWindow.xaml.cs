using FragrantWorld.Models;
using FragrantWorld.Services;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;

namespace FragrantWorld.Windows
{
    /// <summary>
    /// Логика взаимодействия для OrderWindow.xaml
    /// </summary>
    public partial class OrderWindow : Window
    {
        PickupPointService _pickupPointService = new();
        ProductService _productService = new();
        OrderService _orderService = new();
        public double CostOrder { get; set; }
        public Order Order { get; set; }
        public List<Product> Products { get; set; }
        public List<OrderProduct> OrderProducts { get; set; }

        public OrderWindow(Order order)
        {
            InitializeComponent();
            Order = order;
            Random random = new();
            Order.OrderPickupCode = Convert.ToInt16(random.Next(100, 500));
            DataContext = this;
            ReceiptCodeTextBlock.DataContext = order;
            OrderDateTextBlock.DataContext = order;
            OrderIdTextBlock.DataContext = order;
        }

        private async Task UpdateOrderProductsAsync()
        {
            try
            {
                OrderProducts = await _orderService.GetOrderProductsByOrderAsync(Order);
                Products = await _productService.GetProductsByOrderProductsAsync(OrderProducts);
                ProductsListBox.ItemsSource = Products;
                Products.ForEach(async p => p.Amount = OrderProducts
                    .Where(op => op.ProductArticleNumber == p.ProductArticleNumber).FirstOrDefault().ProductAmount);
                CostOrder = Products.Sum(p => (double)p.ProductCostWithDiscount * p.Amount);
                OrderCostTextBlock.Text = string.Format("Итоговая стоимость: {0:f2} руб.", CostOrder);
            }
            catch (HttpRequestException ex)
            {
                MessageBox.Show($"Не удалось получить данные. Код ошибки - {(int)ex.StatusCode}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private async Task UpdatePickupPointsAsync()
        {
            var pickupPoints = await _pickupPointService.GetPickupPointsAsync();
            PickupPointsComboBox.ItemsSource = pickupPoints;
            PickupPointsComboBox.SelectedIndex = pickupPoints.IndexOf(
                pickupPoints.Where(p => Order.OrderPickupPoint == p.PickupPointId)
                .FirstOrDefault());
        }

        private async void Window_Loaded(object sender, RoutedEventArgs e)
        {
            await UpdateOrderProductsAsync();
            await UpdatePickupPointsAsync();

        }

        private async void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            var button = sender as Button;
            Product product = button.DataContext as Product;
            try
            {
                var orderProduct = OrderProducts.Where(op => op.ProductArticleNumber == product.ProductArticleNumber)
                    .FirstOrDefault();
                orderProduct.ProductAmount--;
                if (orderProduct.ProductAmount > 0)
                    await _orderService.UpdateProductOrderAsync(orderProduct);
                else
                    await _orderService.DeleteProductFromOrderAsync(orderProduct);
                await UpdateOrderProductsAsync();
            }
            catch (HttpRequestException ex)
            {
                MessageBox.Show($"Не удалось удалить товар из заказа. Код ошибки - {(int)ex.StatusCode}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void SaveTicketButton_Click(object sender, RoutedEventArgs e)
        {
            var fileDialog = new SaveFileDialog() { Filter = "txt|*.txt" };

            if (fileDialog.ShowDialog() == true)
            {
                string filePath = fileDialog.FileName;
                try
                {
                    using (StreamWriter sw = File.CreateText(filePath))
                    {
                        sw.WriteLine(
                            $"{OrderDateTextBlock.Text}\n" +
                            $"{OrderIdTextBlock.Text}\n" +
                            $"{OrderCostTextBlock.Text}\n" +
                            $"Пункт выдачи: {((PickupPoint)PickupPointsComboBox.SelectedItem).PickupPointAddress}\n" +
                            $"Код получения: {Order.OrderPickupCode}\n" +
                            $"{ReceiptCodeTextBlock.Text}\n" +
                            $"Состав заказа: {GetOrderList()}"
                            );
                    }

                    MessageBox.Show("Талон успешно сохранен в файл", "Успешно", MessageBoxButton.OK, MessageBoxImage.Information);
                }
                catch
                {
                    MessageBox.Show("Не удалось создать талон", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        private async void PickupPointsComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            try
            {
                var pickupPoint = PickupPointsComboBox.SelectedItem as PickupPoint;
                Order.OrderPickupPoint = pickupPoint.PickupPointId;
                await _orderService.UpdateOrderAsync(Order);
            }
            catch (HttpRequestException ex)
            {
                MessageBox.Show($"Не удалось изменить пункт выдачи. Код ошибки - {(int)ex.StatusCode}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private string GetOrderList()
        {
            string orderList = "";
            foreach (Product product in Products)
            {
                orderList += $"\n-{product.ProductName}";
            }
            return orderList;
        }
    }
}
