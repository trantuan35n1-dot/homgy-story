import 'package:flutter/material.dart';
import 'package:mvvm/core/constain/app_color.dart';
import 'package:mvvm/core/constain/app_size.dart';
import 'package:mvvm/dardboard/model/dardboard_model.dart';
import 'package:mvvm/dardboard/model/smart_products.dart';
import 'package:mvvm/dardboard/view/product_card.dart';
import 'package:mvvm/dardboard/viewmodel/dardboad_view_model.dart';
import 'package:provider/provider.dart';

class HomeHomegyStore extends StatelessWidget {
  const HomeHomegyStore({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = SmartProduct.values;
    return Consumer<DardboadViewModel>(
      builder: (context, dardboadViewModel, child) {
        return Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: AppSize.lg,
                vertical: AppSize.md,
              ),
              padding: EdgeInsets.symmetric(horizontal: AppSize.lg),

              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.borderRadius),
                color: Color(0xff0F172A),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 8, 90, 8),
                    decoration: BoxDecoration(
                      color: AppColor.amberL.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(AppSize.md),
                      border: Border.all(width: 1, color: AppColor.amberL),
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: AppSize.xs,
                            vertical: AppSize.xs,
                          ),
                          width: AppSize.md,
                          height: AppSize.md,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.amberM,
                          ),
                        ),
                        Text(
                          'Hệ sinh thái HOMEGY OFFICIAL 2026',
                          style: TextStyle(
                            color: AppColor.amberS,
                            fontSize: AppSize.md,
                          ),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Nâng Tầm Cuộc Sống Với',
                          style: TextStyle(
                            fontSize: AppSize.x,
                            color: AppColor.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: ' Công Nghệ Thông Minh',
                          style: TextStyle(
                            fontSize: AppSize.x,
                            color: AppColor.amberS,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: AppSize.sm),
                    child: Text(
                      'Khám phá trọn bộ công tắt cảm ứng, bộ điều khiển trung tâm , khóa vân tay và giải pháp chiếu sáng cao cấp phong cách sang trọng ',
                      style: TextStyle(
                        fontSize: AppSize.md,
                        color: AppColor.white,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSize.distance,
                            vertical: AppSize.sm,
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppSize.md),
                            color: AppColor.amberL,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.card_travel_outlined,
                                color: AppColor.black,
                                size: AppSize.lg,
                              ),
                              Text(
                                'Mua sắm ngay ',
                                style: TextStyle(
                                  color: AppColor.black,
                                  fontSize: AppSize.md,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: AppSize.xs),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            dardboadViewModel.changeScreent(1);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: AppSize.sm),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppSize.md),
                              color: AppColor.white.withValues(alpha: 0.1),
                              border: Border.all(
                                width: 1,
                                color: AppColor.white,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add,
                                  color: AppColor.white,
                                  size: AppSize.md,
                                ),
                                Text(
                                  'Đăng sản phẩm',
                                  style: TextStyle(
                                    color: AppColor.white,
                                    fontSize: AppSize.md,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.lg),
                ],
              ),
            ),
            SizedBox(height: AppSize.distance),
            Container(
              margin: EdgeInsets.symmetric(horizontal: AppSize.distance),
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.distance,
                vertical: AppSize.m,
              ),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColor.greyE8),
                borderRadius: BorderRadius.circular(AppSize.m),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: AppSize.xs),
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSize.m,
                      vertical: AppSize.sm,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColor.grey8),
                      borderRadius: BorderRadius.circular(AppSize.m),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: AppSize.sm),
                          child: Icon(
                            Icons.search,
                            color: AppColor.grey8,
                            size: AppSize.mm,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            onChanged: (searchDevice) {
                              dardboadViewModel.searchProduct(searchDevice);
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                              hintText: 'Tìm kiếm công tắc, camera,khóa,...',
                              hintStyle: TextStyle(
                                color: AppColor.grey8,
                                fontSize: AppSize.mm,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSize.md),
                  SizedBox(
                    height: AppSize.xxl,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        final isSelected =
                            dardboadViewModel.selectedProduct == category;
                        return GestureDetector(
                          onTap: () {
                            dardboadViewModel.changeProductCategory(category);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                              vertical: AppSize.xs,
                              horizontal: AppSize.m,
                            ),
                            margin: EdgeInsets.only(right: AppSize.m),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppSize.m),
                              color: isSelected
                                  ? AppColor.amberM
                                  : AppColor.greyE8,
                            ),
                            child: Text(
                              category.label,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSize.distance),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: dardboadViewModel.filteredProducts.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search_off_rounded,
                              size: 48,
                              color: AppColor.grey8,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Không tìm thấy sản phẩm nào',
                              style: TextStyle(
                                color: AppColor.grey8,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      )
                    : GridView.builder(
                        shrinkWrap: false,

                        itemCount: dardboadViewModel.filteredProducts.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 4,
                          crossAxisCount: 2,
                          childAspectRatio: 0.68,
                        ),
                        itemBuilder: (context, index) {
                          final dardBoardbuil =
                              dardboadViewModel.filteredProducts[index];
                          return ProductCard(
                            ontap: () {
                              dardboadViewModel.addCartShopping(
                                DardboardModel(
                                  name: dardBoardbuil.name,
                                  imageUrl: dardBoardbuil.imageUrl,
                                  description: dardBoardbuil.description,
                                  details: dardBoardbuil.details,
                                  price: dardBoardbuil.price,
                                  originalPrice: dardBoardbuil.originalPrice,
                                  quantitySold: dardBoardbuil.quantitySold,
                                  smartProduct: dardBoardbuil.smartProduct,
                                  stockQuantity: dardBoardbuil.stockQuantity,
                                ),
                              );
                            },
                            imageProduct: dardBoardbuil.imageUrl,
                            textProduct: dardBoardbuil.description,
                            price: dardBoardbuil.price,
                            originalPrice: dardBoardbuil.originalPrice,
                            quantitySold: dardBoardbuil.quantitySold,
                          );
                        },
                      ),
              ),
            ),
          ],
        );
      },
    );
  }
}
