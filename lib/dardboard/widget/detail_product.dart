import 'package:flutter/material.dart';
import 'package:mvvm/core/constain/app_color.dart';
import 'package:mvvm/core/constain/app_size.dart';
import 'package:mvvm/core/extension/dola_model.dart';
import 'package:mvvm/dardboard/viewmodel/dardboad_view_model.dart';
import 'package:provider/provider.dart';

class DetailProduct extends StatelessWidget {
  final String src;
  final String textProduct;
  final double price;
  final double originalPrice;
  final int quantitySold;
  final VoidCallback remove;
  final VoidCallback ontap;

  const DetailProduct({
    super.key,
    required this.src,
    required this.textProduct,
    required this.price,
    required this.originalPrice,
    required this.quantitySold,
    required this.remove,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<DardboadViewModel>(
      builder: (context, dardboadViewModel, child) {
        return Container(
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppSize.borderRadius),
              topRight: Radius.circular(AppSize.borderRadius),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: AppSize.m),
              Center(
                child: SizedBox(
                  width: AppSize.xxl,
                  child: Divider(height: 1, color: AppColor.greyD6),
                ),
              ),
              SizedBox(height: AppSize.m),
              Image.network(src, height: 300, width: double.infinity),
              Divider(height: 1, color: AppColor.greyE8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  textProduct,
                  style: TextStyle(fontSize: AppSize.xl),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Column(
                  children: [
                    Wrap(
                      children: [
                        Text(
                          '${DolaModel.formatCurrency(price)} đ',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColor.red,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            ' ${DolaModel.formatCurrency(originalPrice)}',
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 4),
                child: Text(
                  'Đã bán : $quantitySold',
                  style: TextStyle(fontSize: 11, color: Color(0xff888888)),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSize.distance,
                ),
                child: Row(
                  children: [
                    Expanded(flex: 1, child: Icon(Icons.storefront_outlined)),
                    Expanded(
                      flex: 1,
                      child: Icon(Icons.chat_bubble_outline_outlined),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: ontap,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: AppSize.xs),
                          padding: EdgeInsets.all(AppSize.m),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppSize.xs),
                            color: AppColor.amberS.withValues(alpha: 0.85),
                          ),
                          child: Icon(
                            Icons.add_shopping_cart,
                            size: AppSize.lg,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: AppSize.xs),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            AppSize.borderRadius,
                          ),
                          color: AppColor.amberL,
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Mua Ngay',
                              style: TextStyle(
                                fontSize: AppSize.md,
                                color: AppColor.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '${DolaModel.formatCurrency(price)} FREESHIP',
                              style: TextStyle(
                                color: AppColor.black,
                                fontSize: AppSize.m,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: AppSize.distance),
            ],
          ),
        );
      },
    );
  }
}
