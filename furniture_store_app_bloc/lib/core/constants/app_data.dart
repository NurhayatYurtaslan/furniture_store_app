import 'package:flutter/material.dart';
import 'package:furniture_store_app_bloc/app/model/bottom_navigation_item.dart';


class AppData {
  const AppData._();

  static const List<BottomNavigationItem> bottomNavigationItems = [
    BottomNavigationItem(Icon(Icons.home), 'Home'),
    BottomNavigationItem(Icon(Icons.add_shopping_cart_rounded), 'Shopping cart'),
    BottomNavigationItem(Icon(Icons.bookmark), 'Favorite'),
    BottomNavigationItem(Icon(Icons.person), 'Profile')
  ];
}