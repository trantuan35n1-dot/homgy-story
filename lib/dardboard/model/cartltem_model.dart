import 'package:mvvm/dardboard/model/dardboard_model.dart';
import 'package:mvvm/dardboard/model/smart_products.dart';

class CartltemModel extends DardboardModel {
  int quantity;
  bool buy;
  CartltemModel({
    required String name,
    required String imageUrl,
    required String description,
    required String details,
    required double price,
    required double originalPrice,
    required int quantitySold,
    required SmartProduct smartProduct,
    required int stockQuantity,
    this.quantity = 1,
    this.buy = true,
  }) : super(
         name: name,
         imageUrl: imageUrl,
         description: description,
         details: details,
         price: price,
         originalPrice: originalPrice,
         quantitySold: quantitySold,
         smartProduct: smartProduct,
         stockQuantity: stockQuantity,
       );
}
