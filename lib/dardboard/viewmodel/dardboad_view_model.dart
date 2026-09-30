import 'package:flutter/material.dart';
import 'package:mvvm/dardboard/model/dardboard_model.dart';
import 'package:mvvm/dardboard/model/smart_products.dart';

class DardboadViewModel extends ChangeNotifier {
  int _selected = 0;

  int get selected => _selected;

  void changeScreent(int selected) {
    _selected = selected;
    notifyListeners();
  }

  // Product category
  SmartProduct _selectedProduct = SmartProduct.all;

  SmartProduct get selectedProduct => _selectedProduct;

  void changeProductCategory(SmartProduct selected) {
    _selectedProduct = selected;
    notifyListeners();
  }

  // List Product
  List<DardboardModel> dardboardModel = [
    DardboardModel(
      smartProduct: SmartProduct.centralControllers,
      name: 'Đèn LED thông minh Smart Light',
      imageUrl: 'assets/images/contac.png',
      description: 'Đèn thông minh điều chỉnh 16 triệu màu',
      details: 'Tiết kiệm điện năng',
      price: 350,
      originalPrice: 420,
      quantitySold: 780,
      stockQuantity: 120,
    ),
    DardboardModel(
      smartProduct: SmartProduct.centralControllers,
      name: 'an nhieu nhe',
      imageUrl: 'assets/images/product1.png',
      description: 'Đèn thông minh điều chỉnh 16 triệu màu',
      details: 'Tiết kiệm điện năng',
      price: 3500,
      originalPrice: 420,
      quantitySold: 780,
      stockQuantity: 120,
    ),
    DardboardModel(
      smartProduct: SmartProduct.centralControllers,
      name: 'ssaan nhieu nhe',
      imageUrl: 'assets/images/Profile.png',
      description: 'Đèn thông minh điều chỉnh 16 triệu màu',
      details: 'Tiết kiệm điện năng',
      price: 3500,
      originalPrice: 420,
      quantitySold: 780,
      stockQuantity: 102,
    ),
  ];

  // Them Product
  void addDarboardModel(DardboardModel model) {
    dardboardModel.add(model);
    notifyListeners();
  }

  //filter Product
  String _searchKeyword = '';

  void searchProduct(String keyword) {
    _searchKeyword = keyword;
    notifyListeners();
  }

  String removeVietnameseDiacritics(String text) {
    const withDiacritics =
        'áàảãạăắằẳẵặâấầẩẫậéèẻẽẹêếềểễệíìỉĩịóòỏõọôốồổỗộơớờởỡợúùủũụưứừửữựýỳỷỹỵđ'
        'ÁÀẢÃẠĂẮẰẲẴẶÂẤẦẨẪẬÉÈẺẼẸÊẾỀỂỄỆÍÌỈĨỊÓÒỎÕỌÔỐỒỔỖỘƠỚỜỞỠỢÚÙỦŨỤƯỨỪỬỮỰÝỲỶỸỴĐ';
    const withoutDiacritics =
        'aaaaaaaaaaaaaaaaaeeeeeeeeeeeiiiiiooooooooooooooooouuuuuuuuuuuyyyyyd'
        'AAAAAAAAAAAAAAAAAEEEEEEEEEEEIIIIIOOOOOOOOOOOOOOOOOUUUUUUUUUUUYYYYYD';
    for (int i = 0; i < withoutDiacritics.length; i++) {
      text = text.replaceAll(withDiacritics[i], withoutDiacritics[i]);
    }
    return text;
  }

  List<DardboardModel> get filteredProducts {
    return dardboardModel.where((item) {
      final query = removeVietnameseDiacritics(_searchKeyword);
      final matchCategory =
          item.smartProduct == _selectedProduct ||
          selectedProduct == SmartProduct.all;
      final name = removeVietnameseDiacritics(item.name.trim().toLowerCase());
      final matchSeach = item.name.toLowerCase().contains(
        _searchKeyword.toLowerCase(),
      );
      return matchSeach && matchCategory;
    }).toList();
  }

  // List gio hang
  List<DardboardModel> cart = [];

  //them phan tu vao gio hang
  void addCartShopping(DardboardModel model) {
    cart.add(model);
    notifyListeners();
  }

  // tinh tong tien
  double get totalPrice {
    double total = 0;
    for (int i = 0; i < cart.length; i++) {
      total += cart[i].price;
    }
    return total;
  }
}
