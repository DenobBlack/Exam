   M S B A M L   `   `   `  ����H  DFragrantWorld, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null-clr-namespace:FragrantWorldFragrantWorld  5   	       FragrantWorld.MainWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   -localclr-namespace:FragrantWorld     5   	   -   5          � Title$  Ароматный мир��5   	   $	��450��5	   	   $	��730��6   .��5      �  � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      �� 5      $
��Auto �6   .+�5   
   �� $��0��6   .+�5      �  � Orientation$ 
Horizontal=�6   $��Right=�61   .+�5      �� -   5         ��Name$ 
loginLabel��5      $��
Гость��6(   $��0 0 20 0q�68   $��Right=�6J   �� 5      -   5         ��Name$ authorizationButton��5      $��
Войти��62   $��75��6B   $��Right=�6o   �� 5      -   5        $ logoutButton��5      $��
Выйти��6+   $y�	Collapsed=�6;   6R   �� 5      -   5        $ updateOrdersButton��5      $#��Изменить заказы��61   $y�	Collapsed=�6K   6b   5      �� 5      -   5        $��showOrderButton��5      $'��!Просмотреть заказ��6,   $y�	Collapsed=�6f   5      �� 5   
   $��1��6    �� Orientation$ 
Horizontal=�6"   .+�5      �� -   5        $��countProductTextBlock��5      $��5q�65   �� 5      -   5        $��manufacturerComboBox��5      63   �� 5      -	   5        $��sortCostComboBox��5      $	��150��6/   .@�5      �� $*��$По возрастанию цены��6   �� 5       $$��По убыванию цены��6   5!      �� 5"      $��Мин. цена��6   �� 5#      -
   5        $��MinCostTextBox��5#      $��70��6,   67   �� 5$      $��Макс. цена��6   �� 5%      -   5        $��MaxCostTextBox��5%      $��70��6,   67   � 5&      .+�5'      �� -   5        $��searchProductTextBox��5'      $	��150��66   6E   �� 5(      -   5        $��HintSearchTextBlock��5(      $��
Поиск��67    J� IsHitTestVisible$ False��6D   5)      5*      �� 5+   
   -   5        $��ProductsScrollViewer��5+      $
��Auto=�63   $��Hidden=�6V   $��Stretch=�5,      $��2��6+   .��5-      �� -   5        $��productsListBox��5-      ��5.      �� 5/       �� 
TargetType" ��6   .�50      ��  �� Property � ��	 �� Value$	 Stretch=�6G   51      ��53      �� 54      .R�55      �� 
���   �$��1q�65   $��5q�6I   
 �� Padding$
 5q�6T   ._�56      �� $��Stretch=�6)   .+�57   "   �� $
��Bold"�6I   ��6,   �� *ProductName+6I   �� 58   "   ��6,   �� *ProductDescription+�� 59   "   ��6,   ��  �� StringFormat$% Производитель: {0}�� �� Path$ ProductManufacturer�� 5:   "   .+�5;   &   �� ��60   �� $ Цена: {0}��$ ProductCostWithDiscount��� 5<   &   $��OrderButton��6-   -   5        $��Заказать��5<   @   $��Right=�6S   6o   5=   #   5>      5?      5@      5B      5C      5D      5E      