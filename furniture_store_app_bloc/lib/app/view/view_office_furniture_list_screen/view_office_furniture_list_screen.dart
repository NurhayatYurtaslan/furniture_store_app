import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_store_app_bloc/app/model/furniture.dart';
import 'package:furniture_store_app_bloc/app/view/bloc/app_bloc.dart';
import 'package:furniture_store_app_bloc/app/view/view_office_furniture_detail_screen/view_office_furniture_detail_screen.dart';
import 'package:furniture_store_app_bloc/core/constants/text_style.dart';

import '../../../core/widgets/furniture_list_view.dart';

class OfficeFurnitureListScreen extends StatelessWidget {
  const OfficeFurnitureListScreen({super.key});

  PreferredSize _appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(120),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hello Nurhayat", style: h2Style),
                  Text("Buy Your favorite desk", style: h3Style),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: const Icon(Icons.search, color: Colors.grey),
            suffixIcon: const Icon(Icons.menu, color: Colors.grey),
            contentPadding: const EdgeInsets.all(20),
            border: textFieldStyle,
            focusedBorder: textFieldStyle),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Furniture> items =
        context.watch<FurnitureBloc>().state.mainItems;

    Future<Widget?> navigate(Furniture furniture, int index) {
      return Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(seconds: 1),
          pageBuilder: (_, __, ___) =>
              OfficeFurnitureDetailScreen(furniture: furniture, index: index),
        ),
      );
    }

    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            _searchBar(),
            FurnitureListView(
              furnitureList: items,
              onTap: navigate,
            ),
            const Text("Popular", style: h2Style),
            FurnitureListView(
              furnitureList: items,
              isHorizontal: false,
              onTap: navigate,
            ),
          ],
        ),
      ),
    );
  }
}