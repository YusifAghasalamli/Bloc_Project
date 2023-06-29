part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishlistButtonClickedEvent extends HomeEvent {
  final GroceryProductModel product;

  HomeProductWishlistButtonClickedEvent(this.product);
}

class HomeProductCartButtonClickedEvent extends HomeEvent {
  final GroceryProductModel product;

  HomeProductCartButtonClickedEvent(this.product);
}

class HomeWishlistButtonNavigateEvent extends HomeEvent {}

class HomeCartButtonNavigateEvent extends HomeEvent {}
