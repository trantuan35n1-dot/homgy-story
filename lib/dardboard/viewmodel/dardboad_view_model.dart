import 'package:flutter/material.dart';
import 'package:mvvm/dardboard/model/cartltem_model.dart';
import 'package:mvvm/dardboard/model/dardboard_model.dart';
import 'package:mvvm/dardboard/model/smart_products.dart';
import 'package:mvvm/login/model/loginmodel.dart';
import 'package:mvvm/login/model/type_role.dart';

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
      smartProduct: SmartProduct.light,
      name: 'Đèn LED thông minh Smart Light',
      imageUrl:
          'https://homegy.vn/wp-content/uploads/2023/01/local-1_MSA015S_RC_2.jpg',
      description: 'Đèn thông minh điều chỉnh 16 triệu màu',
      details: 'Tiết kiệm điện năng',
      price: 350000,
      originalPrice: 420000,
      quantitySold: 780,
      stockQuantity: 120,
    ),
    DardboardModel(
      smartProduct: SmartProduct.homegySmartSwitches,
      name: 'Công tắc BLE kính phẳng',
      imageUrl: 'https://homegy.vn/wp-content/uploads/2025/01/Ma-vang-2.png',
      description: 'Công tắc Homgy mạ vàng',
      details: 'Công tắc BLE kính phẳng',
      price: 850000,
      originalPrice: 9000000,
      quantitySold: 10,
      stockQuantity: 120,
    ),
    DardboardModel(
      smartProduct: SmartProduct.smartSwitches,
      name: 'Công tắc Homgy mạ vàng',
      imageUrl:
          'https://homegy.vn/wp-content/uploads/2025/01/VP-4-nut-copy.png',
      description: 'Công tắc BLE kính phẳng',
      details: 'Tiết kiệm điện năng',
      price: 3500000,
      originalPrice: 420000,
      quantitySold: 780,
      stockQuantity: 102,
    ),
    DardboardModel(
      smartProduct: SmartProduct.homegySmartSwitches,
      name: 'Công tắc Homgy mạ vàng',
      imageUrl: 'https://homegy.vn/wp-content/uploads/2025/01/CNTMV-copy.png',
      description: 'Công tắc cảm ứng cảm biến thông minh ',
      details: 'Tiết kiệm điện năng',
      price: 6500000,
      originalPrice: 4200000,
      quantitySold: 780,
      stockQuantity: 102,
    ),
    DardboardModel(
      smartProduct: SmartProduct.centralControllers,
      name: 'Bộ điều khiển trung tâm HC',
      imageUrl: 'https://homegy.vn/wp-content/uploads/2024/06/Hc-copy.png',
      description: 'Bộ điều khiển trung tâm HC',
      details: 'Tiết kiệm điện năng',
      price: 6080000,
      originalPrice: 10420000,
      quantitySold: 780,
      stockQuantity: 102,
    ),
    DardboardModel(
      smartProduct: SmartProduct.centralControllers,
      name: 'BỘ ĐIỀU KHIỂN TRUNG TÂM HC MINI',
      imageUrl: 'https://homegy.vn/wp-content/uploads/2025/04/hc-mini.png',
      description: 'BỘ ĐIỀU KHIỂN TRUNG TÂM HC MINI',
      details: 'Tiết kiệm điện năng',
      price: 2080000,
      originalPrice: 5420000,
      quantitySold: 780,
      stockQuantity: 102,
    ),
    DardboardModel(
      smartProduct: SmartProduct.centralControllers,
      name: 'BỘ ĐIỀU KHIỂN TRUNG TÂM HC MINI',
      imageUrl: 'https://homegy.vn/wp-content/uploads/2025/04/hc-mini.png',
      description: 'BỘ ĐIỀU KHIỂN TRUNG TÂM HC MINI',
      details: 'Tiết kiệm điện năng',
      price: 2080000,
      originalPrice: 5420000,
      quantitySold: 780,
      stockQuantity: 102,
    ),
    DardboardModel(
      smartProduct: SmartProduct.centralControllers,
      name: 'Cảm Biến Hiện Diện Local Loại 2',
      imageUrl: 'https://homegy.vn/wp-content/uploads/2024/12/Hien-dien-2.png',
      description: 'Cảm Biến Hiện Diện Local Loại 2',
      details: 'Tiết kiệm điện năng',
      price: 1780000,
      originalPrice: 2420000,
      quantitySold: 780,
      stockQuantity: 102,
    ),
    DardboardModel(
      smartProduct: SmartProduct.securityDevices,
      name: 'Bộ An Ninh Trung Tâm',
      imageUrl:
          'https://homegy.vn/wp-content/uploads/2025/01/bo-an-ninh-trung-tam-homegy-e1738719715394.jpg',
      description: 'Bộ An Ninh Trung Tâm',
      details: 'Tiết kiệm điện năng',
      price: 6780000,
      originalPrice: 12420000,
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

  // list hien san pham tu => list cu
  List<DardboardModel> get filteredProducts {
    return dardboardModel.where((item) {
      final matchCategory =
          item.smartProduct == _selectedProduct ||
          selectedProduct == SmartProduct.all;
      //  final name = removeVietnameseDiacritics(item.name.trim().toLowerCase());
      final matchSeach = item.name.toLowerCase().contains(
        _searchKeyword.toLowerCase(),
      );
      return matchSeach && matchCategory;
    }).toList();
  }

  SmartProduct smart = SmartProduct.centralControllers;

  List<DardboardModel> get fill {
    return dardboardModel.where((item) {
      return smart == item.smartProduct;
    }).toList();
  }

  //sap xep theo ten a->z
  void sortByPrice() {
    dardboardModel.sort(((a, b) => a.name.compareTo(b.name)));
    notifyListeners();
  }

  // List gio hang
  List<CartltemModel> cart = [];
  List<CartltemModel> get paymentCartm {
    return cart.where((item) {
      return item.buy == true;
    }).toList();
  }

  // xoa sp trong gio hang
  void removeCartShophing(int index) {
    cart.removeAt(index);
    notifyListeners();
  }

  //doi trang thai isbuy
  void isBuy(int index) {
    cart[index].buy = !cart[index].buy;
    notifyListeners();
  }

  // them san pham
  void increaseQuantity(int index) {
    cart[index].quantity++;
    notifyListeners(); // Báo cho UI vẽ lại
  }

  // remove sanpham
  void removeProductCart(int index) {
    if (cart[index].quantity > 1 &&
        cart[index].stockQuantity >= cart[index].quantity) {
      cart[index].quantity--;
    }
    notifyListeners();
  }

  //them phan tu vao gio hang
  void addCartShopping(CartltemModel model) {
    cart.add(model);
    notifyListeners();
  }

  // tinh tong tien
  double get totalPrice {
    double total = 0;
    for (int i = 0; i < cart.length; i++) {
      if (cart[i].buy == true) {
        total += cart[i].price;
        total *= cart[i].quantity;
      }
    }
    return total;
  }

  // điều kiện để chọn loại sản phẩm
  SmartProduct _Product = SmartProduct.all;

  SmartProduct get Product => _Product;

  void setProduct(SmartProduct selected) {
    if (selected != SmartProduct.all) {
      _Product = selected;
    }
    notifyListeners();
  }

  // điều kiện thêm sản phẩm
  bool isNameEror = false;
  bool isCategoryError = false;
  bool isPriceError = false;
  bool isDescription = false;
  bool isQuantityError = false;
  bool isImageError = false;
  bool validateProduct({
    required String name,
    required String price,
    required String description,
    required String quantity,
    required String image,
  }) {
    isNameEror = name.trim().isEmpty;
    isCategoryError = name.trim().isEmpty;
    isPriceError = price.trim().isEmpty;
    isDescription = description.trim().isEmpty;
    isQuantityError = quantity.trim().isEmpty;
    isImageError = image.trim().isEmpty;
    notifyListeners();
    return !isNameEror &&
        !isCategoryError &&
        !isPriceError &&
        !isDescription &&
        !isQuantityError &&
        !isImageError;
  }

  void deleteProduct(int index) {
    dardboardModel.removeAt(index);
    notifyListeners();
  }

  bool _productTyper = false;
  bool get productTyper => _productTyper;
  void changeproductTyper() {
    _productTyper = !productTyper;
    notifyListeners();
  }

  //danh sach tai khoan mat khau
  List<Loginmodel> user = [
    Loginmodel(
      id: 1,
      userName: 'anh1',
      passWord: '1',
      typeRole: TypeRole.admin,
    ),
    Loginmodel(
      id: 2,
      userName: 'anh2',
      passWord: '1',
      typeRole: TypeRole.agent,
    ),
    Loginmodel(id: 3, userName: 'anh3', passWord: '1', typeRole: TypeRole.user),
  ];
  // mac dinh phan dang ky la user
  TypeRole type = TypeRole.user;
  //them tai khoan la tu them id
  int nextID = 1;
  void adddUser(String name, String password) {
    Loginmodel model = Loginmodel(
      id: nextID,
      userName: name,
      passWord: password,
      typeRole: type,
    );
    user.add(model);
    nextID++;
  }

  // So sanh tai khoan mat khau xem co khop khong
  Loginmodel? loginFind(String name, String password) {
    for (final item in user) {
      if (item.userName.trim() == name.trim() &&
          item.passWord.trim() == password.trim()) {
        return item;
      }
    }
    return null;
  }

  // bien luu tai khoan
  Loginmodel? currentUser;

  bool Login(String name, String password) {
    final result = loginFind(name, password);
    if (result != null) {
      currentUser = result;
      return true;
    }
    return false;
  }

  // kieerm tra xem co nhap khong
  bool isName = true;
  bool isPassword = true;
  bool valisted({required String name, required String password}) {
    isName = name.trim().isEmpty;
    isPassword = password.trim().isEmpty;
    notifyListeners();
    return !isName && !isPassword;
  }

  void resetValition() {
    isName = true;
    isPassword = true;
    notifyListeners();
  }
}
