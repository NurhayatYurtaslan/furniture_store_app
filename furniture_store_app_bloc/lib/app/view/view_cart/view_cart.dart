import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_store_app_bloc/app/model/furniture.dart';
import 'package:furniture_store_app_bloc/app/view/bloc/app_bloc.dart';
import 'package:furniture_store_app_bloc/core/constants/app_color.dart';
import 'package:furniture_store_app_bloc/core/constants/text_style.dart';
import 'package:furniture_store_app_bloc/core/widgets/bottom_bar.dart';
import 'package:furniture_store_app_bloc/core/widgets/cart_list_view.dart';
import 'package:furniture_store_app_bloc/core/widgets/counter_button.dart';
import 'package:furniture_store_app_bloc/core/widgets/empty_widget.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Furniture> cartList = context.watch<FurnitureBloc>().getCartList;

    final totalPrice = context.watch<FurnitureBloc>().state.totalPrice;

    PreferredSizeWidget appBar() {
      return AppBar(
        title: const Text("Cart", style: h2Style),
        actions: [
          IconButton(
            splashRadius: 20.0,
            onPressed: () {
              context.read<FurnitureBloc>().add(const ClearCartEvent());
            },
            icon: const Icon(Icons.delete, color: AppColor.lightBlack),
          )
        ],
      );
    }

    return Scaffold(
      appBar: appBar(),
      bottomNavigationBar: BottomBar(
        priceLabel: "Total price",
        priceValue: "\$${totalPrice.toStringAsFixed(2)}",
        buttonLabel: "Checkout",
        onTap: totalPrice > 0 ? () {} : null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: cartList.isNotEmpty
            ? CartListView(
                furnitureItems: cartList,
                counterButton: (furniture, index) {
                  return CounterButton(
                    orientation: Axis.vertical,
                    onIncrementSelected: () => context
                        .read<FurnitureBloc>()
                        .add(IncreaseQuantityEvent(furniture: furniture)),
                    onDecrementSelected: () => context
                        .read<FurnitureBloc>()
                        .add(DecreaseQuantityEvent(furniture: furniture)),
                    label: cartList[index].quantity,
                  );
                },
              )
            : const EmptyWidget(title: "Empty cart"),
      ),
    );
  }
}