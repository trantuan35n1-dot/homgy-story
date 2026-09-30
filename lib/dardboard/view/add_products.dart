import 'package:flutter/material.dart';
import 'package:mvvm/core/constain/app_color.dart';
import 'package:mvvm/core/constain/app_size.dart';
import 'package:mvvm/dardboard/model/dardboard_model.dart';
import 'package:mvvm/dardboard/model/smart_products.dart';
import 'package:mvvm/dardboard/viewmodel/dardboad_view_model.dart';
import 'package:provider/provider.dart';

class AddProducts extends StatelessWidget {
  const AddProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameProduct = TextEditingController();
    final TextEditingController deviceProduct = TextEditingController();
    final TextEditingController priceProduct = TextEditingController();
    final TextEditingController quanlityProduct = TextEditingController();
    final TextEditingController imagesProduct = TextEditingController();

    return Consumer<DardboadViewModel>(
      builder: (context, dardboadViewModel, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.distance),
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSize.xs,
                      ),
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
                padding: EdgeInsets.symmetric(horizontal: AppSize.distance),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.md),
                  border: Border.all(width: 1, color: AppColor.grey8),
                ),
                child: TextField(
                  controller: nameProduct,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText:
                        'Ví dụ : Công tắc cảm ứng thông minh Homegy 4 nút',
                    hintStyle: TextStyle(
                      color: AppColor.grey8,
                      fontSize: AppSize.md,
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppSize.distance),
              Row(
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
                padding: EdgeInsets.symmetric(horizontal: AppSize.distance),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.md),
                  border: Border.all(width: 1, color: AppColor.grey8),
                ),
                child: TextField(
                  controller: deviceProduct,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText:
                        'Ví dụ : Công tắc cảm ứng thông minh Homegy 4 nút',
                    hintStyle: TextStyle(
                      color: AppColor.grey8,
                      fontSize: AppSize.md,
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppSize.distance),
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
                padding: EdgeInsets.symmetric(horizontal: AppSize.distance),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.md),
                  border: Border.all(width: 1, color: AppColor.grey8),
                ),
                child: TextField(
                  controller: priceProduct,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '125000',
                    hintStyle: TextStyle(
                      color: AppColor.grey8,
                      fontSize: AppSize.md,
                    ),
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
                    hintStyle: TextStyle(
                      color: AppColor.grey8,
                      fontSize: AppSize.md,
                    ),
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
                    hintStyle: TextStyle(
                      color: AppColor.grey8,
                      fontSize: AppSize.md,
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppSize.distance),
              GestureDetector(
                onTap: () {
                  dardboadViewModel.addDarboardModel(
                    DardboardModel(
                      name: nameProduct.text,
                      imageUrl: imagesProduct.text,
                      description: 'mota ',
                      details: priceProduct.text,
                      price: double.parse(priceProduct.text),
                      originalPrice: double.parse(quanlityProduct.text),
                      quantitySold: int.parse(quanlityProduct.text),
                      smartProduct: SmartProduct.all,
                      stockQuantity: int.parse(priceProduct.text),
                    ),
                  );
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
              ),
            ],
          ),
        );
      },
    );
  }
}
