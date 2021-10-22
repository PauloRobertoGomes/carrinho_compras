import 'package:carrinho_compras/app/shared/services/external_api_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

part 'home_service.g.dart';

@Injectable()
class HomeService extends Disposable {
  static Future<List<dynamic>> getProductsFromServer() async {
    final HasuraConnect hasura = ExternalApiService.getInstance();
    dynamic response;
    final String query = """
      query{
        products (order_by: {id: asc}) {
          category {
            title
          }
          id
          title
          value
          amount
          image
        }
      }
    """;

    try {
      response = await hasura.query(query);
      return response["data"]["products"];
    } catch (e) {
      response = "error";
      return [];
    }
  }

  @override
  void dispose() {}
}
