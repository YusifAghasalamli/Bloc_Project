// import 'package:bloc_project/features/home/bloc/home_bloc.dart';
import 'package:bloc_project/features/home/model/product_model.dart';
import 'package:bloc_project/features/home/ui/card_widget.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget(this.products, {super.key});
  final List<GroceryProductModel> products;

  @override
  Widget build(BuildContext context) {
    print(products[0].isFavorite);
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return CardWidget(product);
      },
    );
  }
}
