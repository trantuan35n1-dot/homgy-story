import 'package:flutter/material.dart';
import 'package:mvvm/core/constain/app_color.dart';
import 'package:mvvm/core/constain/app_size.dart';
import 'package:mvvm/dardboard/model/dardboard_model.dart';
import 'package:mvvm/dardboard/viewmodel/dardboad_view_model.dart';
import 'package:mvvm/dardboard/widget/product_form_page.dart';
import 'package:provider/provider.dart';

class AddProducts extends StatelessWidget {
  const AddProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameProduct = TextEditingController();
    final TextEditingController priceProduct = TextEditingController();
    final TextEditingController quanlityProduct = TextEditingController();
    final TextEditingController imagesProduct = TextEditingController();
    final TextEditingController description = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.distance),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppSize.distance),
            Container(
              width: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.distance),
                color: AppColor.amberS,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.xs),
                    child: Icon(Icons.add),
                  ),
                  Text(
                    'Đăng bán hàng mới ',
                    style: TextStyle(fontSize: AppSize.md),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSize.distance),
            Text(
              'Thêm sản phẩm vào HomyStore ',
              style: TextStyle(fontSize: AppSize.xl, color: AppColor.black),
            ),

            Text(
              'Sản phẩm sau khi thêm sẽ lập tức hiển thị trên quầy hàng và khách hàng có thể đặt mua ngay.',
              style: TextStyle(fontSize: AppSize.md, color: AppColor.grey8),
            ),
            SizedBox(height: AppSize.md),
            Divider(height: 1, color: AppColor.greyE8),
            SizedBox(height: AppSize.md),
            ProductFormPage(
              nameProduct: nameProduct,
              priceProduct: priceProduct,
              description: description,
              quanlityProduct: quanlityProduct,
              imagesProduct: imagesProduct,
            ),
            SizedBox(height: AppSize.distance),
            Consumer<DardboadViewModel>(
              builder: (context, dardboadViewModel, child) {
                return GestureDetector(
                  onTap: () {
                    final isValid = dardboadViewModel.validateProduct(
                      name: nameProduct.text,
                      price: priceProduct.text,
                      description: description.text,
                      quantity: quanlityProduct.text,
                      image: imagesProduct.text,
                    );

                    if (!isValid) {
                      return;
                    }
                    final product = DardboardModel(
                      name: nameProduct.text,
                      imageUrl: imagesProduct.text,
                      description: description.text,
                      details: description.text,
                      price: double.parse(priceProduct.text),
                      originalPrice: double.parse(quanlityProduct.text),
                      quantitySold: int.parse(quanlityProduct.text),
                      smartProduct: dardboadViewModel.Product,
                      stockQuantity: int.parse(priceProduct.text),
                    );
                    dardboadViewModel.addDarboardModel(product);
                    dardboadViewModel.changeScreent(0);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSize.distance,
                      vertical: AppSize.md,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.md),
                      color: AppColor.amberL,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.cloud_upload_outlined),
                        Text(
                          'Lưu & Đăng sản phẩm  ',
                          style: TextStyle(fontSize: AppSize.lg),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
