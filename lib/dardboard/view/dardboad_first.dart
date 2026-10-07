import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mvvm/core/constain/app_color.dart';
import 'package:mvvm/core/constain/app_size.dart';
import 'package:mvvm/dardboard/view/Screent3.dart';
import 'package:mvvm/dardboard/view/add_products.dart';
import 'package:mvvm/dardboard/view/custum_cart.dart';
import 'package:mvvm/dardboard/view/home_homegy_store.dart';
import 'package:mvvm/dardboard/viewmodel/dardboad_view_model.dart';
import 'package:provider/provider.dart';

class DardboadFirst extends StatelessWidget {
  const DardboadFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DardboadViewModel>(
      builder: (context, dardboadViewModel, child) {
        return Scaffold(
          extendBody: true,
          backgroundColor: Color(0xffF8FAFC),
          appBar: AppBar(
            backgroundColor: AppColor.white,
            leading: GestureDetector(
              onTap: () {
                dardboadViewModel.changeScreent(0);
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(16, 8, 0, 4),
                height: AppSize.lg,
                width: AppSize.sm,
                decoration: BoxDecoration(
                  color: AppColor.amberM,
                  borderRadius: BorderRadius.circular(AppSize.xs),
                ),
                child: Icon(Icons.stacked_bar_chart),
              ),
            ),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text(
                        'HOMEGY',
                        style: TextStyle(
                          fontSize: AppSize.xxl,
                          color: AppColor.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: AppSize.xs),
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSize.sm,
                          vertical: AppSize.s,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.amberL,
                          borderRadius: BorderRadius.circular(AppSize.xs),
                        ),
                        child: Text(
                          'STORE',
                          style: TextStyle(
                            fontSize: AppSize.md,
                            color: AppColor.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Giải Pháp Nhà Thông Minh & Tiện Ích',
                  style: TextStyle(fontSize: AppSize.md),
                ),
              ],
            ),
            actions: [
              CustumCart(
                ontap: () {
                  context.push('/shoppingCart');
                },
                icon: Icon(Icons.card_travel_outlined),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(AppSize.md),
              child: Divider(height: 1, thickness: 1, color: AppColor.amberM),
            ),

            shadowColor: Colors.amber,
          ),
          body: changeScreent(context, dardboadViewModel.selected),
          bottomNavigationBar: dardboadViewModel.selected != 1
              ? Container(
                  padding: EdgeInsets.symmetric(vertical: AppSize.md),
                  decoration: BoxDecoration(
                    color: Color(0xff0F172A).withValues(alpha: 0.9),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          dardboadViewModel.changeScreent(0);
                        },
                        icon: const Icon(Icons.home),
                        color: Colors.white,
                      ),
                      IconButton(
                        onPressed: () {
                          dardboadViewModel.changeScreent(1);
                        },
                        icon: const Icon(Icons.add),
                        color: Colors.white,
                      ),
                      IconButton(
                        onPressed: () {
                          dardboadViewModel.changeScreent(2);
                        },
                        icon: const Icon(Icons.list_rounded),
                        color: Colors.white,
                      ),
                    ],
                  ),
                )
              : SizedBox(),
        );
      },
    );
  }

  Widget changeScreent(BuildContext context, int selected) {
    switch (selected) {
      case 0:
        return HomeHomegyStore();
      case 1:
        return AddProducts();
      case 2:
        return Screent3();
      case 3:
        return Text('man 4', style: TextStyle(color: Colors.white));

      default:
        return SizedBox.fromSize();
    }
  }
}
