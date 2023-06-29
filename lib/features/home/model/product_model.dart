class GroceryProductModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;
  bool isCart;

  GroceryProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.isFavorite,
    required this.isCart,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'imageurl': imageUrl,
      'isFavorite': isFavorite,
      'isCart': isCart,
    };
  }

  factory GroceryProductModel.fromJson(Map<String, dynamic> json) {
    return GroceryProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      imageUrl: json['imageurl'],
      isFavorite: json["isFavorite"],
      isCart: json["isCart"],
    );
  }
}
