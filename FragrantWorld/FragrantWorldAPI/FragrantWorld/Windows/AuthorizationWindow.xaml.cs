using FragrantWorld.Models;
using FragrantWorld.Services;
using System.Net.Http;
using System.Windows;

namespace FragrantWorld.Windows
{
    /// <summary>
    /// Логика взаимодействия для AuthorizationWindow.xaml
    /// </summary>
    public partial class AuthorizationWindow : Window
    {
        private AuthorizationService _authorizationService = new();
        public User User = new();
        public bool IsLoggedIn = false;
        public AuthorizationWindow()
        {
            InitializeComponent();
        }

        private async void GuestButton_Click(object sender, RoutedEventArgs e)
        {
            User.UserLogin = "Guest";
            User.UserPassword = "Guest";
            User.UserFullName = "Гость";
            IsLoggedIn = true;
            Close();
        }

        private async void AuthorizeButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                User.UserLogin = authorizationLoginTextBox.Text;
                User.UserPassword = authorizationPasswordTextBox.Password;
                await _authorizationService.Login(User);
                User.UserFullName = await _authorizationService.GetUserFullname(User);
                User.UserRole = await _authorizationService.GetUserRole(User);
                IsLoggedIn = true;
            }
            catch
            {
                MessageBox.Show($"Не удалось авторизоваться. Неправильный логин или пароль", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            DialogResult = true;
        }

        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            if (IsLoggedIn == true)
            {
                e.Cancel = false;
                return;
            }
            if (MessageBox.Show("Вы хотите остаться в роли гостя?", "Выход", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                User.UserLogin = "Guest";
                User.UserPassword = "Guest";
                User.UserFullName = "Гость";
                e.Cancel = false;
            }
            else
                e.Cancel = true;
        }
    }
}
