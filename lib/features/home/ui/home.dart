import 'package:bloc_project/features/cart/ui/cart.dart';
import 'package:bloc_project/features/home/bloc/home_bloc.dart';
import 'package:bloc_project/features/home/ui/home_widget.dart';
import 'package:bloc_project/features/wishlist/ui/wishlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  // final HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Grocery App"),
        actions: [
          IconButton(
            onPressed: () {
              context.read<HomeBloc>().add(HomeWishlistButtonNavigateEvent());
            },
            icon: const Icon(Icons.favorite),
          ),
          const SizedBox(width: 5),
          IconButton(
            onPressed: () {
              context.read<HomeBloc>().add(HomeCartButtonNavigateEvent());
            },
            icon: const Icon(Icons.shopping_cart),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeNavigateToWishlistPageActionState) {
            Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => const WishList()))
                .then((value) =>
                    context.read<HomeBloc>().add(HomeInitialEvent()));
          } else if (state is HomeNavigateToCartPageActionState) {
            Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => const Cart()))
                .then((value) =>
                    context.read<HomeBloc>().add(HomeInitialEvent()));
          }
          // else if (state is HomeCartAddedState) {
          //   // ScaffoldMessenger.of(context).showSnackBar(
          //   //     const SnackBar(content: Text("Item added to Cart")));
          // } else if (state is HomeWishlistAddedState) {
          //   // ScaffoldMessenger.of(context).showSnackBar(
          //   //     const SnackBar(content: Text("Item added to Wishlist")));
          // }
        },
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (state is HomeLoadedSuccessState) {
            return HomeWidget(state.products);
          } else if (state is HomeErrorState) {
            return const Center(
              child: Text("ERROR OCCURED"),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
