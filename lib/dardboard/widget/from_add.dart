import 'package:flutter/material.dart';
import 'package:mvvm/core/constain/app_color.dart';
import 'package:mvvm/core/constain/app_size.dart';

class FromAdd extends StatelessWidget {
  final String title;
  final TextEditingController nameProduct;
  final String hinttext;
  final Color colorBorder;
  final TextInputType type;
  final String? errorMessage;
  final ValueChanged<String>? onChanged;
  final int maxLines;

  const FromAdd({
    super.key,
    required this.nameProduct,
    required this.hinttext,
    required this.title,
    required this.colorBorder,
    required this.type,
    this.errorMessage,
    this.onChanged,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    final hasError = errorMessage != null && errorMessage!.isNotEmpty;
    final effectiveBorderColor = hasError ? AppColor.red : colorBorder;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: AppSize.md,
                color: AppColor.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: AppSize.xs),
              child: Icon(Icons.star, color: AppColor.red, size: AppSize.sm),
            ),
          ],
        ),
        SizedBox(height: AppSize.xs),
        Container(
          padding: EdgeInsets.symmetric(horizontal: AppSize.distance),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.md),
            border: Border.all(width: 1, color: effectiveBorderColor),
          ),
          child: TextField(
            controller: nameProduct,
            autofocus: false,
            keyboardType: type,
            maxLines: maxLines,
            onChanged: onChanged,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hinttext,
              hintStyle: TextStyle(color: AppColor.grey8, fontSize: AppSize.md),
            ),
          ),
        ),
        if (hasError)
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 4),
            child: Row(
              children: [
                Icon(Icons.error_outline, size: 14, color: AppColor.red),
                SizedBox(width: 4),
                Expanded(
                  child: Text(
                    errorMessage!,
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
    );
  }
}
