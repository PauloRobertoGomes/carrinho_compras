import 'package:flutter_test/flutter_test.dart';

import 'package:carrinho_compras/app/modules/home/services/home_service.dart';

void main() {
  HomeService service;

  setUp(() {
    service = HomeService();
  });
//
  group('HomeService Test', () {
    test("First Test", () async {
      final products = await HomeService.getProductsFromServer();
      print(products);
      expect(service, isInstanceOf<HomeService>());
    });
  });
}
