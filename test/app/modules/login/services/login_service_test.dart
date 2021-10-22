import 'package:flutter_test/flutter_test.dart';

import 'package:carrinho_compras/app/modules/login/services/login_service.dart';

void main() {
  LoginService service;

  setUp(() {
    service = LoginService();
  });
//
  group('LoginService Test', () {
    test("First Test", () async {
      var response =
          await LoginService.loginUserOnBackEnd(identification: "Paulo");
      print(response);
      expect(service, isInstanceOf<LoginService>());
    });
//
  });
}
