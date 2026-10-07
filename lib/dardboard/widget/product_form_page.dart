import 'package:flutter/material.dart';
import 'package:mvvm/core/constain/app_color.dart';
import 'package:mvvm/core/constain/app_size.dart';
import 'package:mvvm/dardboard/model/smart_products.dart';
import 'package:mvvm/dardboard/viewmodel/dardboad_view_model.dart';
import 'package:mvvm/dardboard/widget/from_add.dart';
import 'package:provider/provider.dart';

class ProductFormPage extends StatelessWidget {
  final TextEditingController nameProduct;
  final TextEditingController priceProduct;

  final TextEditingController description;

  final TextEditingController quanlityProduct;
  final TextEditingController imagesProduct;

  const ProductFormPage({
    super.key,
    required this.nameProduct,
    required this.priceProduct,
    required this.description,
    required this.quanlityProduct,
    required this.imagesProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<DardboadViewModel>(
      builder: (context, dardboadViewModel, child) {
        return Column(
          children: [
            FromAdd(
              type: TextInputType.text,
              nameProduct: nameProduct,
              hinttext: 'Ví dụ : Công tắc cảm ứng thông minh Homegy 4 nút',
              title: 'TÊN SẢN PHẨM',
              colorBorder: dardboadViewModel.isNameEror
                  ? AppColor.red
                  : AppColor.grey8,
            ),
            dardboadViewModel.isNameEror
                ? Padding(
                    padding: const EdgeInsets.only(top: 4, left: 4),
                    child: Row(
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 14,
                          color: AppColor.red,
                        ),
                        SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            'errorMessage!',
                            style: TextStyle(
                              color: AppColor.red,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox(),
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
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                color: AppColor.white,
                                child: Column(
                                  children: [
                                    SizedBox(height: AppSize.xs),
                                    SizedBox(
                                      width: AppSize.xxxl,
                                      child: Divider(height: 1, thickness: 1),
                                    ),
                                    Expanded(
                                      child: GridView.builder(
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              mainAxisSpacing: AppSize.distance,
                                              mainAxisExtent: AppSize.xxxl,
                                              crossAxisSpacing:
                                                  AppSize.distance,
                                            ),
                                        physics: NeverScrollableScrollPhysics(),

                                        padding: EdgeInsets.symmetric(
                                          horizontal: AppSize.distance,
                                          vertical: AppSize.distance,
                                        ),

                                        itemCount:
                                            SmartProduct.values.length - 1,
                                        itemBuilder: (context, index) {
                                          final product =
                                              SmartProduct.values[index + 1];
                                          return Center(
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.pop(context);
                                                dardboadViewModel.setProduct(
                                                  product,
                                                );
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                width: double.infinity,
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: AppSize.distance,
                                                  vertical: AppSize.xs,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        AppSize.distance,
                                                      ),
                                                  border: Border.all(
                                                    width: 1,
                                                    color: AppColor.grey8,
                                                  ),
                                                ),
                                                child: Text(
                                                  '${SmartProduct.values[index + 1].label} ',
                                                  style: TextStyle(
                                                    overflow: TextOverflow.clip,
                                                    color: AppColor.black,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSize.distance,
                            vertical: AppSize.xs,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppSize.md),
                            border: Border.all(width: 1, color: AppColor.grey8),
                          ),
                          child: Wrap(
                            children: [
                              Text(
                                '${dardboadViewModel.Product.label} ',

                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,

                                style: TextStyle(overflow: TextOverflow.clip),
                              ),
                              Icon(Icons.keyboard_arrow_down),
                            ],
                          ),
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
                      children: [
                        FromAdd(
                          type: TextInputType.number,
                          nameProduct: priceProduct,
                          hinttext: 'Ví dụ : Công dụng của sản phẩm ?',
                          title: 'GIÁ SẢN PHẨM',
                          colorBorder: dardboadViewModel.isPriceError
                              ? AppColor.red
                              : AppColor.grey8,
                        ),
                        if (dardboadViewModel.isPriceError)
                          Padding(
                            padding: const EdgeInsets.only(top: 4, left: 4),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.error_outline,
                                  size: 14,
                                  color: AppColor.red,
                                ),
                                SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    'errorMessage!',
                                    style: TextStyle(
                                      color: AppColor.red,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            FromAdd(
              type: TextInputType.text,
              colorBorder: dardboadViewModel.isDescription
                  ? AppColor.red
                  : AppColor.grey8,
              nameProduct: description,
              hinttext: 'Ví dụ : Công dụng của sản phẩm ?',
              title: 'MÔ TẢ SẢN PHẨM',
            ),
            dardboadViewModel.isDescription
                ? Padding(
                    padding: const EdgeInsets.only(top: 4, left: 4),
                    child: Row(
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 14,
                          color: AppColor.red,
                        ),
                        SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            'errorMessage!',
                            style: TextStyle(
                              color: AppColor.red,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox(),
            SizedBox(height: AppSize.distance),

            FromAdd(
              type: TextInputType.number,
              nameProduct: quanlityProduct,
              hinttext: '20',
              title: 'SỐ LƯỢNG KHO',
              colorBorder: dardboadViewModel.isQuantityError
                  ? AppColor.red
                  : AppColor.grey8,
            ),
            dardboadViewModel.isQuantityError
                ? Padding(
                    padding: const EdgeInsets.only(top: 4, left: 4),
                    child: Row(
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 14,
                          color: AppColor.red,
                        ),
                        SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            'errorMessage!',
                            style: TextStyle(
                              color: AppColor.red,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox(),
            SizedBox(height: AppSize.distance),
            FromAdd(
              type: TextInputType.url,
              nameProduct: imagesProduct,
              hinttext: 'http://... link images',
              title: 'HÌNH ẢNH SẢN PHẨM',
              colorBorder: dardboadViewModel.isImageError
                  ? AppColor.red
                  : AppColor.grey8,
            ),
            dardboadViewModel.isImageError
                ? Padding(
                    padding: const EdgeInsets.only(top: 4, left: 4),
                    child: Row(
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 14,
                          color: AppColor.red,
                        ),
                        SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            'errorMessage!',
                            style: TextStyle(
                              color: AppColor.red,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox(),
          ],
        );
      },
    );
  }
}
