import 'package:flutter/material.dart';
import 'package:mvvm/dardboard/viewmodel/dardboad_view_model.dart';
import 'package:provider/provider.dart';

class ProviderTypder extends StatelessWidget {
  const ProviderTypder({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DardboadViewModel>(
      builder: (context, dardboadViewModel, child) {
        return Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                onTap: dardboadViewModel.changeproductTyper,
                child: Container(color: Colors.black54),
              ),
            ),
            if (dardboadViewModel.productTyper == true)
              Positioned(
                top: -20,
                right: -20,

                child: Stack(
                  children: [
                    Positioned(
                      right: 45,
                      top: 25,
                      child: Transform.rotate(
                        angle: 45 * 3.1415926535 / 180,
                        child: Container(
                          width: 15,
                          height: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      width: 350,
                      constraints: const BoxConstraints(maxHeight: 450),
                      padding: const EdgeInsets.all(30),
                      margin: EdgeInsets.all(30),
                      decoration: BoxDecoration(color: Colors.white),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Làm lại cuộc đời ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}
