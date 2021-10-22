import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:carrinho_compras/app/modules/login/login_controller.dart';
import 'package:carrinho_compras/app/modules/login/login_module.dart';

void main() {
  initModule(LoginModule());
  LoginController login;
  //
  setUp(() {
    login = LoginModule.to.get<LoginController>();
  });

  group('LoginController Test', () {
    test("First Test", () async {
      var response = await login.login(id: "a");
      expect(response.isEmpty, true);
    });
  });
}
