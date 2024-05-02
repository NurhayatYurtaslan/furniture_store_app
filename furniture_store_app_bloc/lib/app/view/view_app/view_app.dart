import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:furniture_store_app_bloc/app/view/view_cart/view_cart.dart';
import 'package:furniture_store_app_bloc/app/view/view_favorite/view_favorite.dart';
import 'package:furniture_store_app_bloc/app/view/view_office_furniture_list_screen/view_office_furniture_list_screen.dart';
import 'package:furniture_store_app_bloc/app/view/view_profile_screen/view_profile_screen.dart';
import 'package:furniture_store_app_bloc/core/constants/app_color.dart';
import 'package:furniture_store_app_bloc/core/constants/app_data.dart';

class HomeScreen extends HookWidget {
  final List<Widget> screens = const [
    OfficeFurnitureListScreen(),
    CartScreen(),
    FavoriteScreen(),
    ProfileScreen()
  ];

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState(0);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          currentIndex: selectedIndex.value,
          showUnselectedLabels: true,
          onTap: (int index) {
            selectedIndex.value = index;
          },
          fixedColor: AppColor.lightBlack,
          items: AppData.bottomNavigationItems
              .map(
                (element) => BottomNavigationBarItem(
                    icon: element.icon, label: element.label),
              )
              .toList(),
        ),
        body: screens[selectedIndex.value],
      ),
    );
  }
}