import 'package:mvvm/dardboard/model/smart_products.dart';

int index = 1;

class DardboardModel {
  int _id;

  String name;
  String imageUrl;
  String description;
  String details;
  double price;
  double originalPrice;
  int quantitySold;
  int stockQuantity;
  SmartProduct smartProduct;

  DardboardModel({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.details,
    required this.price,
    required this.originalPrice,
    required this.quantitySold,
    required this.smartProduct,
    required this.stockQuantity,
  }) : _id = index++;
}
