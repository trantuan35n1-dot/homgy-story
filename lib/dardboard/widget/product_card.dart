import 'package:flutter/material.dart';
import 'package:mvvm/core/constain/app_color.dart';
import 'package:mvvm/core/constain/app_size.dart';

class ProductCard extends StatelessWidget {
  final String imageProduct;
  final String textProduct;
  final double price;
  final double originalPrice;
  final int quantitySold;
  final VoidCallback ontap;
  final VoidCallback remove;

  const ProductCard({
    super.key,
    required this.imageProduct,
    required this.textProduct,
    required this.price,
    required this.originalPrice,
    required this.quantitySold,
    required this.ontap,
    required this.remove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 1),
        border: Border.all(width: 1, color: AppColor.amberM),
        borderRadius: BorderRadius.circular(AppSize.md),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSize.md),
                topRight: Radius.circular(AppSize.md),
              ),
              child: Image.network(
                imageProduct,
                fit: BoxFit.fill,
                width: double.infinity,
              ),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              textProduct,
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
                      '${price.toStringAsFixed(3)} đ',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColor.red,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        ' ${originalPrice.toStringAsFixed(3)}',
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 4),
                child: Text(
                  'Đã bán : $quantitySold',
                  style: TextStyle(fontSize: 11, color: Color(0xff888888)),
                ),
              ),
              IconButton(onPressed: remove, icon: Icon(Icons.remove_circle)),
              GestureDetector(
                onTap: ontap,
                child: Container(
                  margin: EdgeInsets.only(
                    right: AppSize.distance,
                    bottom: AppSize.m,
                  ),
                  padding: EdgeInsets.all(AppSize.xs),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.xs),
                    color: AppColor.amberL,
                  ),
                  child: Icon(Icons.add_shopping_cart, size: AppSize.lg),
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
        ],
      ),
    );
  }
}
