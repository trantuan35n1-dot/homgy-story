import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mvvm/core/constain/app_color.dart';
import 'package:mvvm/core/constain/app_size.dart';
import 'package:mvvm/dardboard/viewmodel/dardboad_view_model.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController username = TextEditingController();
    final TextEditingController password = TextEditingController();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Đăng nhập : '),
          Container(
            margin: EdgeInsets.symmetric(horizontal: AppSize.distance),
            padding: EdgeInsets.symmetric(horizontal: AppSize.distance),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: context.watch<DardboadViewModel>().isName == true
                    ? AppColor.greyE8
                    : AppColor.red,
              ),
              borderRadius: BorderRadius.circular(AppSize.distance),
            ),
            child: TextField(
              controller: username,
              decoration: InputDecoration(
                errorText: context.watch<DardboadViewModel>().isName
                    ? null
                    : 'vui long nhap tai khoan ',
                border: InputBorder.none,
                hint: Text('Nhập tài khoản '),
                hintStyle: TextStyle(color: AppColor.greyE8),
              ),
            ),
          ),
          if (context.watch<DardboadViewModel>().isName == false)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.distance),
              child: Row(
                children: [
                  Icon(Icons.error, color: AppColor.red, size: AppSize.m),
                  Text(
                    'sai tai khoan',
                    style: TextStyle(color: AppColor.red, fontSize: AppSize.m),
                  ),
                ],
              ),
            ),
          Text('Mật khẩu : '),
          Container(
            margin: EdgeInsets.symmetric(horizontal: AppSize.distance),
            padding: EdgeInsets.symmetric(horizontal: AppSize.distance),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: context.watch<DardboadViewModel>().isPassword == true
                    ? AppColor.greyE8
                    : AppColor.red,
              ),
              borderRadius: BorderRadius.circular(AppSize.distance),
            ),
            child: TextField(
              obscureText: true,
              controller: password,
              decoration: InputDecoration(
                errorText: context.watch<DardboadViewModel>().isName
                    ? null
                    : 'vui long nhap mat khau',
                border: InputBorder.none,
                hint: Text('Nhập mật khấu '),
                hintStyle: TextStyle(color: AppColor.greyE8),
              ),
            ),
          ),
          if (context.watch<DardboadViewModel>().isPassword == false)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.distance),
              child: Row(
                children: [
                  Icon(Icons.error, color: AppColor.red, size: AppSize.m),
                  Text(
                    'sai mat khau',
                    style: TextStyle(color: AppColor.red, fontSize: AppSize.m),
                  ),
                ],
              ),
            ),
          SizedBox(height: AppSize.distance),
          GestureDetector(
            onTap: () {
              final viewmodel = context.read<DardboadViewModel>();
              context.read<DardboadViewModel>().valisted(
                name: username.text,
                password: password.text,
              );
              final result = context.read<DardboadViewModel>().loginFind(
                username.text,
                password.text,
              );
              final succes = viewmodel.Login(username.text, password.text);
              if (result != null) {
                context.push('/dartboadfirst');
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Sai tai khoan mat khau'),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 1),
                  ),
                );
              }
              context.read<DardboadViewModel>().resetValition();
            },
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: AppSize.distance,
                vertical: AppSize.distance,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.distance,
                vertical: AppSize.distance,
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColor.amberS,
                borderRadius: BorderRadius.circular(AppSize.borderRadius),
              ),
              child: Text('Đăng nhập '),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                final viewmodel = context.read<DardboadViewModel>();
                final result = viewmodel.valisted(
                  name: username.text,
                  password: password.text,
                );
                if (!result) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('nhap tai khoa mat khau'),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }
                context.read<DardboadViewModel>().adddUser(
                  username.text.trim(),
                  password.text.trim(),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Dang ky thanh cong '),
                    backgroundColor: Colors.white,
                  ),
                );
                viewmodel.resetValition();
              },
              child: Text('Đăng ký'),
            ),
          ),
        ],
      ),
    );
  }
}
