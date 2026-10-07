import 'package:flutter/material.dart';
import 'package:mvvm/dardboard/viewmodel/dardboad_view_model.dart';
import 'package:mvvm/dardboard/widget/product_card.dart';
import 'package:provider/provider.dart';

class DartProduct extends StatelessWidget {
  const DartProduct({super.key});

  @override
  Widget build(BuildContext context) {
    double model = MediaQuery.of(context).size.height;
    double modelS = MediaQuery.of(context).size.width;
    return Consumer<DardboadViewModel>(
      builder: (context, dardboadViewModel, child) {
        return SizedBox(
          height: model * 0.4,
          child: Column(
            children: [
              Text('Công tắc Homegy ${model} ${modelS}'),
              SizedBox(
                height: model * 0.3,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: dardboadViewModel.fill.length,
                  itemBuilder: (context, index) {
                    final product = dardboadViewModel.fill[index];
                    return SizedBox(
                      width: 200,
                      child: ProductCard(
                        imageProduct: product.imageUrl,
                        textProduct: product.name,
                        price: product.price,
                        originalPrice: product.originalPrice,
                        quantitySold: product.quantitySold,
                        ontap: () {},
                        remove: () {},
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
  }
}
