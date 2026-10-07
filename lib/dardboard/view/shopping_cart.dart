import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mvvm/core/constain/app_color.dart';
import 'package:mvvm/core/constain/app_size.dart';
import 'package:mvvm/dardboard/viewmodel/dardboad_view_model.dart';
import 'package:mvvm/dardboard/widget/cart_view.dart';
import 'package:provider/provider.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DardboadViewModel>(
      builder: (context, dardboadViewModel, child) {
        return Scaffold(
          backgroundColor: AppColor.white,
          appBar: AppBar(
            backgroundColor: AppColor.greyF6,
            leading: GestureDetector(
              onTap: () {
                dardboadViewModel.changeScreent(0);
                context.push('/');
              },
              child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: AppSize.sm,
                  horizontal: AppSize.sm,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.m),
                  color: AppColor.amberL,
                ),
                child: Icon(Icons.shopping_cart, color: AppColor.black),
              ),
            ),
            title: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Giỏ Hàng',
                    style: TextStyle(
                      fontSize: AppSize.xxl,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '${dardboadViewModel.cart.length} sản phẩm trong giỏ hàng',
                    style: TextStyle(
                      fontSize: AppSize.m,
                      fontWeight: FontWeight.w400,
                      color: AppColor.grey8,
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: Icon(Icons.backspace),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(AppSize.m),
              child: Divider(height: 1, color: AppColor.amberS),
            ),
          ),
          body: dardboadViewModel.cart.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.delete_forever_outlined,
                          size: AppSize.xxxl,
                          color: AppColor.amberL,
                        ),
                      ),
                      Text(
                        'Giỏ hàng đang trống',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: dardboadViewModel.cart.length,
                  itemBuilder: (context, index) {
                    final cartShoping = dardboadViewModel.cart[index];
                    return CartView(
                      colorBorder: cartShoping.buy != true
                          ? AppColor.grey8
                          : AppColor.amberL,
                      onTapisbuy: () {
                        dardboadViewModel.isBuy(index);
                      },
                      backColor: cartShoping.buy == true
                          ? AppColor.amberL
                          : AppColor.white,

                      removeat: () {
                        dardboadViewModel.removeCartShophing(index);
                      },
                      remove: () {
                        dardboadViewModel.removeProductCart(index);
                      },
                      add: () {
                        dardboadViewModel.increaseQuantity(index);
                      },
                      origanal: cartShoping.originalPrice,
                      image: cartShoping.imageUrl,
                      nameProduct: cartShoping.name,
                      decriptionProduct: cartShoping.description,
                      priceProduct: cartShoping.price,
                      quantityProduct: cartShoping.quantity,
                    );
                  },
                ),
          bottomNavigationBar: SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.distance),
              height: 160,
              color: AppColor.greyF6,
              child: Column(
                children: [
                  SizedBox(height: AppSize.distance),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tạm tính niêm yết : '),
                      Text(
                        '${dardboadViewModel.totalPrice.toStringAsFixed(3)} đ',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Phí vận chuyển & bàn giao  : '),
                      Text(
                        'Miễn phí vận chuyển',
                        style: TextStyle(color: AppColor.green),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.m),
                  Divider(height: 1, color: AppColor.greyE8),
                  SizedBox(height: AppSize.m),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tổng thanh toán : ',
                        style: TextStyle(
                          fontSize: AppSize.x,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '${dardboadViewModel.totalPrice.toStringAsFixed(3)} đ',
                        style: TextStyle(
                          fontSize: AppSize.x,
                          fontWeight: FontWeight.w600,
                          color: AppColor.amberL,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.m),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: AppSize.m),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.md),
                      color: AppColor.amberL,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Tiến Hành Đặt Hàng ',
                          style: TextStyle(
                            color: AppColor.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Icon(Icons.arrow_right_alt),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
