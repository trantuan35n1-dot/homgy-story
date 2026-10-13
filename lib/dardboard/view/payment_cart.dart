import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mvvm/core/constain/app_color.dart';
import 'package:mvvm/core/constain/app_size.dart';
import 'package:mvvm/core/extension/dola_model.dart';
import 'package:mvvm/dardboard/viewmodel/dardboad_view_model.dart';

import 'package:provider/provider.dart';

class PaymentCart extends StatelessWidget {
  const PaymentCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DardboadViewModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: AppColor.greyE8,
          appBar: AppBar(
            surfaceTintColor: Colors.white,
            backgroundColor: AppColor.white,
            leading: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
            title: Text(
              'Thanh toán',
              style: TextStyle(
                fontSize: AppSize.xl,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: AppSize.m),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: AppSize.m,
                    horizontal: AppSize.distance,
                  ),
                  color: AppColor.white,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.location_on_outlined),
                              Text('Nhập thông tin nhận hàng'),
                            ],
                          ),
                          Icon(Icons.keyboard_arrow_right),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: AppSize.distance),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: viewModel.paymentCartm.length,
                  itemBuilder: ((context, index) {
                    final cartV = viewModel.cart[index];
                    return Container(
                      color: AppColor.white,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Image.network(cartV.imageUrl),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${cartV.name}'),
                                Text(
                                  '${DolaModel.formatCurrency(cartV.price)} đ',
                                  style: TextStyle(
                                    color: AppColor.red,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${DolaModel.formatCurrency(cartV.originalPrice)} đ',

                                      style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: AppColor.grey8,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: AppSize.distance,
                                      ),
                                      child: Text('x${cartV.quantity}'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: AppSize.distance),
                  color: AppColor.white,
                  child: Column(
                    children: [
                      SizedBox(height: AppSize.distance),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.local_shipping_outlined),
                              Text(
                                'Phí vận chuyển & bàn giao  : ',
                                style: TextStyle(fontSize: AppSize.md),
                              ),
                            ],
                          ),
                          Text(
                            'Miễn phí vận chuyển',
                            style: TextStyle(color: AppColor.green),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.list_alt_outlined),
                              Text(
                                'Tổng đơn : ',
                                style: TextStyle(fontSize: AppSize.md),
                              ),
                            ],
                          ),
                          Text(
                            '${DolaModel.formatCurrency(viewModel.totalPrice)} đ',
                          ),
                        ],
                      ),
                      SizedBox(height: AppSize.m),
                    ],
                  ),
                ),
                SizedBox(height: AppSize.distance),
                Container(
                  color: AppColor.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSize.distance,
                    vertical: AppSize.m,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Homegy Voucher'),
                      Row(
                        children: [
                          Text('Chọn mã'),
                          Icon(Icons.keyboard_arrow_right),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppSize.distance),
                Container(
                  color: AppColor.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSize.distance,
                    vertical: AppSize.m,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tổng tiền hàng : ',
                            style: TextStyle(fontSize: AppSize.md),
                          ),
                          Text(
                            '${DolaModel.formatCurrency(viewModel.totalPrice)} đ',
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tổng tiền phí vận chuyển : ',
                            style: TextStyle(fontSize: AppSize.md),
                          ),
                          Text('0 đ'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Giảm giá phí vận chuyển : ',
                            style: TextStyle(fontSize: AppSize.md),
                          ),
                          Text(' -0 đ', style: TextStyle(color: AppColor.red)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Voucher : ',
                            style: TextStyle(fontSize: AppSize.md),
                          ),
                          Text(' -0 đ', style: TextStyle(color: AppColor.red)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSize.distance),
            height: 120,
            color: AppColor.white,
            child: Column(
              children: [
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
                      '${DolaModel.formatCurrency(viewModel.totalPrice)} đ',
                      style: TextStyle(
                        fontSize: AppSize.x,
                        fontWeight: FontWeight.w600,
                        color: AppColor.amberL,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppSize.m),
                GestureDetector(
                  onTap: () {
                    context.push('/payment');
                  },
                  child: Container(
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
