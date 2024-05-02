import 'package:flutter/material.dart';
import 'package:furniture_store_app_bloc/core/constants/text_style.dart';
import 'package:furniture_store_app_bloc/gen/assets.gen.dart';


enum EmptyWidgetType { cart, favorite }

class EmptyWidget extends StatelessWidget {
  final EmptyWidgetType type;
  final String title;

  const EmptyWidget({
    super.key,
    this.type = EmptyWidgetType.cart,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          type == EmptyWidgetType.cart
              ? Expanded(child: Image.asset(Assets.images.emptyCart.path))
              : Image.asset(Assets.images.emptyFavorite.path),
          const SizedBox(height: 10),
          Text(title, style: h2Style)
        ],
      ),
    );
  }
}