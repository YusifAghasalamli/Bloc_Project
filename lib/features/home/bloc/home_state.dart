part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

// abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<GroceryProductModel> products;

  HomeLoadedSuccessState(this.products);
}

class HomeErrorState extends HomeState {}

class HomeNavigateToWishlistPageActionState extends HomeState {}

class HomeNavigateToCartPageActionState extends HomeState {}

class HomeCartAddedState extends HomeState {}

class HomeWishlistAddedState extends HomeState {}
