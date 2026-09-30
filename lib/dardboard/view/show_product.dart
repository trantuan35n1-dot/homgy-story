import 'package:flutter/material.dart';
import 'package:mvvm/core/constain/app_size.dart';
import 'package:mvvm/dardboard/viewmodel/dardboad_view_model.dart';
import 'package:provider/provider.dart';

class ShowProduct extends StatelessWidget {
  final String src;
  final String nameProduct;
  final double price;

  const ShowProduct({
    super.key,
    required this.src,
    required this.nameProduct,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<DardboadViewModel>(
      builder: (context, dardboadViewModel, child) {
        return Column(
          children: [
            Image.network(src, fit: BoxFit.cover, width: double.infinity),
            Text(nameProduct, style: TextStyle(fontSize: AppSize.lg)),
            Text('${price} đ'),
          ],
        );
      },
    );
  }
}
