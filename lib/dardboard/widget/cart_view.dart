import 'package:flutter/material.dart';
import 'package:mvvm/core/constain/app_color.dart';
import 'package:mvvm/core/constain/app_size.dart';

class CartView extends StatelessWidget {
  final String image;
  final String nameProduct;
  final String decriptionProduct;
  final double priceProduct;
  final int quantityProduct;
  final double origanal;
  final VoidCallback add;
  final VoidCallback remove;
  final VoidCallback removeat;
  final VoidCallback onTapisbuy;
  final Color backColor;
  final Color colorBorder;

  const CartView({
    super.key,
    required this.image,
    required this.nameProduct,
    required this.decriptionProduct,
    required this.priceProduct,
    required this.quantityProduct,
    required this.origanal,
    required this.add,
    required this.remove,
    required this.removeat,
    required this.onTapisbuy,
    required this.backColor,
    required this.colorBorder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: AppSize.xs, horizontal: AppSize.m),
      padding: const EdgeInsets.symmetric(vertical: AppSize.distance),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.distance),
        color: AppColor.white,
        border: Border.all(width: 1, color: AppColor.greyE8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onTapisbuy,
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: AppSize.md,
                vertical: AppSize.distance,
              ),
              height: AppSize.xl,
              width: AppSize.xl,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: colorBorder),
                color: backColor,
              ),
              child: Icon(Icons.check, color: AppColor.white),
            ),
          ),
          Expanded(
            child: Image.network(
              image,
              fit: BoxFit.fitHeight,
              width: double.infinity,
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.distance),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          nameProduct,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: AppSize.mm,

                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: removeat,
                        child: Icon(Icons.delete_forever),
                      ),
                    ],
                  ),

                  Text(
                    '${priceProduct.toStringAsFixed(3)}',
                    style: TextStyle(
                      color: AppColor.red,
                      fontSize: AppSize.lg,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        origanal.toStringAsFixed(3),
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: AppSize.md,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: AppSize.xs),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSize.s),
                          color: AppColor.greyE8,
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: remove,
                              child: Icon(Icons.remove),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppSize.xs,
                              ),
                              child: SizedBox(
                                height: AppSize.mm,
                                child: VerticalDivider(
                                  width: 2,
                                  color: AppColor.grey8,
                                  thickness: 1,
                                  indent: 1,
                                  endIndent: 1,
                                ),
                              ),
                            ),
                            Text('${quantityProduct}'),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppSize.xs,
                              ),
                              child: SizedBox(
                                height: AppSize.mm,
                                child: VerticalDivider(
                                  width: 2,
                                  color: AppColor.grey8,
                                  thickness: 1,
                                  indent: 1,
                                  endIndent: 1,
                                ),
                              ),
                            ),
                            GestureDetector(onTap: add, child: Icon(Icons.add)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
