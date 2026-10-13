import 'package:mvvm/login/model/type_role.dart';

class Loginmodel {
  int id;
  String userName;
  String passWord;
  TypeRole typeRole;
  Loginmodel({
    required this.id,
    required this.userName,
    required this.passWord,
    required this.typeRole,
  });
}
