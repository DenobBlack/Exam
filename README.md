# Ароматный мир

 Приложение разработано для компании - ООО «Ароматный мир» - магазин по продаже парфюмерии и косметики. 

## Начало работы

Эти инструкции предоставят вам копию проекта и помогут запустить на вашем локальном компьютере для разработки и тестирования.

## Функции 

- Просмотр товаров: Пользователи могут просматривать товары.
- Сортировка: Пользователи могут сортировать товары по определённым значениям.
- Фильтрация: Пользователи могут фильтровать товары по определённым значениям.
- Создание заказа: Пользователи могут создавать заказы.
- Просмотр и изменение заказа: пользователи могут спросматривать и изменять свой заказ.
- Получение чека: Пользователи может получить чек после оформления и оплаты заказа.
- Авторизация: Пользователи могут войти в свою учётную запись

### Необходимые условия

- Visual Studio (рекомендуемая версия: Visual Studio 2022) - .NET Framework 8.0
- SQL Server Management Studio 20 и сервер (или компьютер для создания локальной базы данных)

### Установка

Пошаговая серия примеров для установки проекта:
1. Скопируйте репозиторий с помощью команды:
```
git clone https://github.com/DenobBlack/Exam.git
```
2. Настройка базы данных
    - Убедитесь, что у вас установлен SQL Server Management Studio и СУБД Microsoft SQL Server.
    - Откройте SSMS и подключитесь к вашему серверу баз данных.
    - Создайте новую базу данных и запустите SQL скрипт(SQLQuary.sql) проекта для создания таблиц, заполнения их начальными данными.
    - Нажмите ПКМ по вашему серверу → Свойства → Безопасность → Аутентификация через SQL Server и Windows → "OK" → Нажмите ПКМ по вашему серверу → Перезагрузка
3. Откройте проект в Visual Studio.

__ВАЖНО__

Впшите свою строку подключения к БД вместо строки "YOUR_CONNECTION_STRING" (FragrantWorldAPI - Contexts - FragrantWorldDbContext - метод OnConfiguring)
   
4. Запустите проект, нажав кнопку "Start" или F5.

__Пример работы приложения (Страница с товарами)__
![Picture](https://github.com/DenobBlack/Exam/blob/35d0578f2a33091f9f352fa9bc89c8da7490f72b/FragrantWorld/_1.png)
__Пример работы приложения (Окно авторизации)__

![Picture](https://github.com/DenobBlack/Exam/blob/35d0578f2a33091f9f352fa9bc89c8da7490f72b/FragrantWorld/_2.png)

## Авторы

* Баранов Егор Алексеевич - студент 3 курса группы ИСПП-21
  
