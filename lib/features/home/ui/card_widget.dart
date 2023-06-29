import 'package:bloc_project/features/home/bloc/home_bloc.dart';
import 'package:bloc_project/features/home/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardWidget extends StatelessWidget {
  const CardWidget(this.product, {super.key});
  final GroceryProductModel product;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product.imageUrl,
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8),
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              product.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: product.isCart
                      ? const Icon(Icons.shopping_cart, color: Colors.red)
                      : const Icon(Icons.shopping_cart_outlined),
                  onPressed: () {
                    // product.isCart = true;
                    context
                        .read<HomeBloc>()
                        .add(HomeProductCartButtonClickedEvent(product));
                  },
                ),
                IconButton(
                  icon: product.isCart
                      ? const Icon(Icons.favorite, color: Colors.red)
                      : const Icon(Icons.favorite_border),
                  onPressed: () {
                    // product.isFavorite = true;
                    context
                        .read<HomeBloc>()
                        .add(HomeProductWishlistButtonClickedEvent(product));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
