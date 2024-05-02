import 'package:flutter/material.dart';
import 'package:furniture_store_app_bloc/app/model/furniture.dart';
import 'package:furniture_store_app_bloc/core/constants/text_style.dart';
import 'package:furniture_store_app_bloc/core/extension/app_extension.dart';

class CartListView extends StatelessWidget {
  const CartListView({
    super.key,
    required this.counterButton,
    required this.furnitureItems,
  });

  final Widget Function(Furniture furniture, int index) counterButton;
  final List<Furniture> furnitureItems;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: furnitureItems.length,
      itemBuilder: (_, index) {
        Furniture furniture = furnitureItems[index];
        return Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(furniture.images[0]),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(furniture.title.addOverFlow, style: h4Style),
                  const SizedBox(height: 5),
                  Text("${furniture.price}", style: h2Style),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Text("Color : ", style: h4Style),
                      CircleAvatar(
                        radius: 15,
                        child: Container(
                          decoration: BoxDecoration(
                            color: furniture.colors
                                .where((element) => element.isSelected)
                                .toList()
                                .first
                                .color,
                            shape: BoxShape.circle,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              // Spacer(),
              counterButton(furniture, index)
            ],
          ).fadeAnimation(0.4 * index),
        );
      },
      separatorBuilder: (_, __) {
        return const Padding(padding: EdgeInsets.only(bottom: 15));
      },
    );
  }
}