import 'package:flutter/material.dart';
import 'package:mvvm/core/constain/app_color.dart';
import 'package:mvvm/core/constain/app_size.dart';
import 'package:mvvm/dardboard/viewmodel/dardboad_view_model.dart';
import 'package:provider/provider.dart';

class Screent3 extends StatelessWidget {
  const Screent3({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DardboadViewModel>(
      builder: (context, dardboadViewModel, child) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.distance),
          child: Column(
            children: [
              SizedBox(height: AppSize.distance),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.distance,
                  vertical: AppSize.distance,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.lg),
                  color: AppColor.amberL,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tra Cứu & Theo Dõi Đơn Hàng',
                      style: TextStyle(
                        fontSize: AppSize.x,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Nhập mã đơn hàng(ví dụ : HGY - 7892) hoặc số điện thoại người  nhận để kiểm tra lộ trình theo thời gian thực.',
                      style: TextStyle(
                        fontSize: AppSize.m,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: AppSize.distance),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSize.distance,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSize.m),
                        color: AppColor.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: AppSize.m),
                            child: Icon(
                              Icons.list_alt_outlined,
                              color: AppColor.grey8,
                              size: AppSize.md,
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Nhập mã đơn hoặc SĐT',
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
                    SizedBox(height: AppSize.m),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: AppSize.m),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSize.m),
                        color: AppColor.black,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: AppSize.xs),
                            child: Icon(
                              Icons.search,
                              color: AppColor.white,
                              size: AppSize.md,
                            ),
                          ),
                          Text(
                            'Search ',
                            style: TextStyle(
                              color: AppColor.white,
                              fontSize: AppSize.md,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSize.distance),
              /* Container(
                padding: EdgeInsets.all(AppSize.distance),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.distance),
                  border: Border.all(width: 1, color: AppColor.amberS),
                  color: AppColor.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CHI TIẾT LỘ TRÌNH VẬN CHUYỂN ',
                      style: TextStyle(
                        color: AppColor.amberL,
                        fontSize: AppSize.m,
                      ),
                    ),
                  ],
                ),
              ),*/
            ],
          ),
        );
      },
    );
  }
}
