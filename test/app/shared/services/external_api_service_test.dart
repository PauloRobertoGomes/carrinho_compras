import 'package:flutter_test/flutter_test.dart';

import 'package:carrinho_compras/app/shared/services/external_api_service.dart';

void main() {
  ExternalApiService service;

  setUp(() {
    service = ExternalApiService();
  });

  group('ExternalApiService Test', () {
    test("First Test", () async {
      ExternalApiService.getInstance(header: {"Teste": "teste"});
      print(ExternalApiService.headers);
      expect(service, isInstanceOf<ExternalApiService>());
    });
  });
}
