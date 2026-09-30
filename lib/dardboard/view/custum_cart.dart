import 'package:flutter/material.dart';
import 'package:mvvm/core/constain/app_color.dart';
import 'package:mvvm/core/constain/app_size.dart';
import 'package:mvvm/dardboard/viewmodel/dardboad_view_model.dart';
import 'package:provider/provider.dart';

class CustumCart extends StatelessWidget {
  final VoidCallback ontap;
  final Icon icon;

  const CustumCart({super.key, required this.ontap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Consumer<DardboadViewModel>(
      builder: (contex, dardboadViewModal, child) {
        return Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: IconButton(onPressed: ontap, icon: icon),
            ),
            Positioned(
              right: 4,
              top: 4,
              child: dardboadViewModal.cart.isEmpty
                  ? SizedBox()
                  : Container(
                      padding: EdgeInsets.all(AppSize.xs),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.red,
                      ),
                      child: Text(
                        '${dardboadViewModal.cart.length}',
                        style: TextStyle(
                          fontSize: AppSize.m,
                          color: AppColor.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
            ),
          ],
        );
      },
    );
  }
}
