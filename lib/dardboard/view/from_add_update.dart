import 'package:flutter/material.dart';
import 'package:mvvm/core/constain/app_color.dart';
import 'package:mvvm/core/constain/app_size.dart';

class FromAddUpdate extends StatelessWidget {
  final TextEditingController nameProduct;
  final TextEditingController priceProduct;

  final TextEditingController quanlityProduct;

  final TextEditingController imagesProduct;
  final TextEditingController description;

  const FromAddUpdate({
    super.key,
    required this.nameProduct,
    required this.priceProduct,
    required this.quanlityProduct,
    required this.imagesProduct,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'TÊN SẢN PHẨM',
              style: TextStyle(
                fontSize: AppSize.md,
                color: AppColor.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: AppSize.xs),
              child: Icon(Icons.star, color: AppColor.red, size: AppSize.sm),
            ),
          ],
        ),
        SizedBox(height: AppSize.xs),
        Container(
          padding: EdgeInsets.symmetric(horizontal: AppSize.distance),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.md),
            border: Border.all(width: 1, color: AppColor.grey8),
          ),
          child: TextField(
            controller: nameProduct,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Ví dụ : Công tắc cảm ứng thông minh Homegy 4 nút',
              hintStyle: TextStyle(color: AppColor.grey8, fontSize: AppSize.md),
            ),
          ),
        ),
        SizedBox(height: AppSize.distance),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'DANH MỤC',
                        style: TextStyle(
                          fontSize: AppSize.md,
                          color: AppColor.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: AppSize.xs),
                        child: Icon(
                          Icons.star,
                          color: AppColor.red,
                          size: AppSize.sm,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.xs),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSize.distance,
                      vertical: AppSize.xs,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.md),
                      border: Border.all(width: 1, color: AppColor.grey8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('san pham'),
                        Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(left: AppSize.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'GIÁ BÁN (VNĐ) ',
                          style: TextStyle(
                            fontSize: AppSize.md,
                            color: AppColor.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: AppSize.xs),
                          child: Icon(
                            Icons.star,
                            color: AppColor.red,
                            size: AppSize.sm,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSize.xs),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSize.distance,
                        vertical: AppSize.xs,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSize.md),
                        border: Border.all(width: 1, color: AppColor.grey8),
                      ),
                      child: TextField(
                        controller: priceProduct,

                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          border: InputBorder.none,
                          hintText: '125000',
                          hintStyle: TextStyle(
                            color: AppColor.grey8,
                            fontSize: AppSize.md,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: AppSize.distance),
        Row(
          children: [
            Text(
              'MÔ TẢ SẢN PHẨM',
              style: TextStyle(
                fontSize: AppSize.md,
                color: AppColor.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: AppSize.xs),
              child: Icon(Icons.star, color: AppColor.red, size: AppSize.sm),
            ),
          ],
        ),
        SizedBox(height: AppSize.xs),
        Container(
          padding: EdgeInsets.symmetric(horizontal: AppSize.distance),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.md),
            border: Border.all(width: 1, color: AppColor.grey8),
          ),
          child: TextField(
            controller: description,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Ví dụ : Công dụng của sản phẩm ?',
              hintStyle: TextStyle(color: AppColor.grey8, fontSize: AppSize.md),
            ),
          ),
        ),

        SizedBox(height: AppSize.distance),

        Row(
          children: [
            Text(
              'SỐ LƯỢNG KHO ',
              style: TextStyle(
                fontSize: AppSize.md,
                color: AppColor.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: AppSize.xs),
              child: Icon(Icons.star, color: AppColor.red, size: AppSize.sm),
            ),
          ],
        ),
        SizedBox(height: AppSize.xs),
        Container(
          padding: EdgeInsets.symmetric(horizontal: AppSize.distance),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.md),
            border: Border.all(width: 1, color: AppColor.grey8),
          ),
          child: TextField(
            controller: quanlityProduct,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '20',
              hintStyle: TextStyle(color: AppColor.grey8, fontSize: AppSize.md),
            ),
          ),
        ),
        SizedBox(height: AppSize.distance),
        Row(
          children: [
            Text(
              'HÌNH ẢNH SẢN PHẨM',
              style: TextStyle(
                fontSize: AppSize.md,
                color: AppColor.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: AppSize.xs),
              child: Icon(Icons.star, color: AppColor.red, size: AppSize.sm),
            ),
          ],
        ),
        SizedBox(height: AppSize.xs),
        Container(
          padding: EdgeInsets.symmetric(horizontal: AppSize.distance),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.md),
            border: Border.all(width: 1, color: AppColor.grey8),
          ),
          child: TextField(
            controller: imagesProduct,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'https://... link images',
              hintStyle: TextStyle(color: AppColor.grey8, fontSize: AppSize.md),
            ),
          ),
        ),
      ],
    );
  }
}
